package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * This Servlet is designed to edit a racquet listing.
 *
 * @author Srikanth Narahari
 * @version 2014/11/18
 */
@WebServlet(urlPatterns =
{
   "/EditListingServlet"
})
public class EditListingServlet extends HttpServlet
{

   /**
    * Handles the HTTP <code>POST</code> method.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
	   throws ServletException, IOException
   {
	// Get listing ID *from* *attributes*.
	final int LISTING_ID = Integer.parseInt((String) request.getParameter("listingID"));
	
	//Get other parameters from the form.
	HttpSession session = request.getSession(true);
//        Users currentUsers = (Users) session.getAttribute("currentSessionUser");

	String model = request.getParameter("model");
	String brand = request.getParameter("brand");

	double mass = Double.parseDouble(request.getParameter("mass"));
	
	double length = Double.parseDouble(request.getParameter("length"));
	int swingWeight = Integer.parseInt(request.getParameter("swing"));
	double balancePoint = Double.parseDouble(
		request.getParameter("balance"));

	double qualityIndex = qualityIndex(mass, length, swingWeight,
		balancePoint);

	double price = Double.parseDouble(request.getParameter("price"));
	String newOrUsed = request.getParameter("newused");

	// no time to implement dateSold, usernameBuyer, and sellerRating
	String description = request.getParameter("desc");

	updateListing(LISTING_ID, model, brand, mass, length, swingWeight,
		balancePoint, qualityIndex, price, newOrUsed, description);

	// Update the user's listings in the session data by invoking the
	// servlet that has been made for this purpose.
	new GetUsersListingsBeansServlet().doGet(request, response);

	response.sendRedirect("user.jsp");
   }

   /**
    * Updates a listing in the DB table listingInfo.
    *
    * @param listingID the primary key of the racquet in the table listinginfo
    * @param mName the model name
    * @param brand the brand name
    * @param mass the mass
    * @param length the length
    * @param swingWeight the swingweight
    * @param balancePoint the balance point
    * @param qualityIndex the quality index
    *
    * @param price the price
    * @param newOrUsed "new" or "used"
    * @param description the seller's description of the racquet
    */
   @SuppressWarnings("CallToPrintStackTrace")
   public void updateListing(int listingID, String mName, String brand,
	   double mass, double length, int swingWeight, double balancePoint,
	   double qualityIndex, double price, String newOrUsed,
	   String description)
	   throws ServletException, IOException
   {
	Properties prop = new Properties();
	prop.load(Thread.currentThread().getContextClassLoader()
		.getResourceAsStream("build.properties"));
	Connection conn;
	try
	{
	   Class.forName("com.mysql.jdbc.Driver").newInstance();

	   String sqlPassword = prop.getProperty("pass");
	   String sqlUsername = prop.getProperty("username");
	   String sqlURL = prop.getProperty("url");

	   conn = DriverManager.getConnection(sqlURL, sqlUsername, sqlPassword);

	   String sql = "UPDATE listinginfo SET price = ?, neworUsed = ?, description = ? WHERE listingID = ?";

	   PreparedStatement stmt = conn.prepareStatement(sql);
	   stmt.setDouble(1, price);
	   stmt.setString(2, newOrUsed);
	   stmt.setString(3, description);
	   stmt.setInt(4, listingID);

	   stmt.executeUpdate();

	   sql = "SELECT racquetID FROM listinginfo WHERE listingID=?";

	   stmt = conn.prepareStatement(sql, new String[] { "racquetID" });
	   stmt.setInt(1, listingID);
	   
	   ResultSet set = stmt.executeQuery();
	   set.next();

	   final int RACQUET_ID = set.getInt("racquetID");

	   updateRacquet(conn, RACQUET_ID, mName, brand, mass,
		   length, swingWeight, balancePoint,
		   qualityIndex);

	   conn.close();
	} catch (ClassNotFoundException ex)
	{
	   ex.printStackTrace();
	} catch (SQLException ex)
	{
	   ex.printStackTrace();
	} catch (InstantiationException ex)
	{
	   ex.printStackTrace();
	} catch (IllegalAccessException ex)
	{
	   ex.printStackTrace();
	}
   }

   /**
    * Adds a racquet to the DB table racquetInfo.
    *
    * @param conn an SQL connection
    * @param racquetID the primary key in racquetinfo
    * @param mName the model name
    * @param brand the brand name
    * @param mass the mass
    * @param length the length
    * @param swingWeight the swingweight
    * @param balance point the balance point
    * @param quality index the quality index
    *
    * @return the primary key for the newly added row, 0 if unsuccessful
    */
   @SuppressWarnings("CallToPrintStackTrace")
   private void updateRacquet(Connection conn, int racquetID, String mName, String brand, double mass,
	   double length, int swingWeight, double balancePoint,
	   double qualityIndex)
	   throws ServletException, IOException
   {
	try
	{
	   String sql = "UPDATE racquetinfo"
		   + " SET modelName=?,brand=?,mass=?,length=?,swingweight=?,"
		   + "balancePoint=?,qualityIndex=?"
		   + " WHERE racquetID=?";

	   PreparedStatement stmt = conn.prepareStatement(sql);

	   stmt.setString(1, mName);
	   stmt.setString(2, brand);
	   stmt.setDouble(3, mass);
	   stmt.setDouble(4, length);
	   stmt.setInt(5, swingWeight);
	   stmt.setDouble(6, balancePoint);
	   stmt.setDouble(7, qualityIndex);
	   stmt.setInt(8, racquetID);

	   stmt.executeUpdate();
	} catch (SQLException ex)
	{
	   ex.printStackTrace();
	}
   }

   /**
    * Computes the quality index of a racquet.
    *
    * @param length
    * @param mass
    * @param swingWeight
    * @param balancePoint
    *
    * @return the computed quality index of the racquet
    */
   private double qualityIndex(double mass, double length, int swingWeight,
	   double balancePoint)
   {
        // Q = MR^2/I
        // where M = mass in kilograms,
        // r = cms from balance point to butt cap,
        // and I = swingweight.
        final double M = (mass // ounces
                / OZ_PER_LB) / LBS_PER_KG;

        final double R = ((length / 2) // inches
                + (balancePoint /* points */ / PTS_PER_IN)) * CM_PER_IN;

        final double I = swingWeight;

        // This is the quantitative quality index:
        final double QUALITY_INDEX = 
		  Double.parseDouble(String.format("%.3f", M * R * R / I));
	  
        return QUALITY_INDEX;
   }

   private static final double OZ_PER_LB = 16.0;
   private static final double LBS_PER_KG = 2.2;
   private static final double PTS_PER_IN = 8.0;
   private static final double CM_PER_IN = 2.54;
}
