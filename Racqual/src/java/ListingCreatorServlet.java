import Model.Users;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * This Servlet is designed to create a racquet listing.
 *
 * @author Srikanth Narahari & Jay Patel
 * @version 2014/11/18
 */
@WebServlet(urlPatterns = {"/ListingCreatorServlet"})
public class ListingCreatorServlet extends HttpServlet {

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
            throws ServletException, IOException {
        //Get Parameters from the form.
        HttpSession session = request.getSession(false);
        Users currentUsers = (Users) session.getAttribute("currentSessionUser");
        String username = currentUsers.getUserName();
        String model = request.getParameter("model");
        String brand = request.getParameter("brand");

        double mass = Double.parseDouble(request.getParameter("mass"));
        double length = Double.parseDouble(request.getParameter("length"));
        int swingWeight = Integer.parseInt(request.getParameter("swing"));
        double balancePoint = Double.parseDouble(
                request.getParameter("balance"));

        double qualityIndex = qualityIndex(mass, length, swingWeight,
                balancePoint);

        int racquetID = addRacquet(model, brand, mass, length, swingWeight,
                balancePoint, qualityIndex);

        if (racquetID > 0) // i.e. if racquet was successfully added to DB
        {
            double price = Double.parseDouble(request.getParameter("price"));
            String newOrUsed = request.getParameter("newused");

            java.sql.Date dateListed = new java.sql.Date(new Date(System.currentTimeMillis()).getTime());
            // dateSold, usernameBuyer, and sellerRating will be null

            String description = request.getParameter("desc");
            String picture = request.getParameter("upload");
            
            System.out.println("User name" + username);
            System.out.println("Racquet ID " + racquetID);
            System.out.println("Price " + price);
            System.out.println("neworused " + newOrUsed);
            System.out.println("Date Listed " + dateListed);
            System.out.println("Date Description " + description);
            System.out.println("Picture " + picture);
            
            
            int listingID = createListing(username, racquetID, price,
                    newOrUsed, dateListed, description, picture);
            if (listingID > 0) // listing was successfully created
            {
                response.sendRedirect("index.jsp");
            } else // listing was not successfully created
            {
                System.out.println("LISTING ID NEVER CAME! ");
                response.sendRedirect("notregistered.jsp");
            }
        } else // for some reason, racquet was not successfully added
        {
            System.out.println("RACKET ID NEVER CAME! ");
            response.sendRedirect("notregistered.jsp");
        }
    }

    /**
     * Creates a listing in the DB table listingInfo.
     *
     * @param username the seller's username
     * @param racquetID the primary key of the racquet in the table racquetInfo
     * @param price the price
     * @param newOrUsed "new" or "used"
     * @param dateListed the date of the listing
     * @param description the seller's description of the racquet
     * @param picture image URL
     *
     * @return the primary key for the newly added row, 0 if unsuccessful
     */
    public int createListing(String username, int racquetID, double price,
            String newOrUsed, Date dateListed, String description,
            String picture)
            throws ServletException, IOException {
        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader()
                .getResourceAsStream("build.properties"));
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            String sqlPassword = prop.getProperty("pass");
            String sqlUsername = prop.getProperty("username");
            String sqlURL = prop.getProperty("url") + "racqual";

            conn = DriverManager.getConnection(sqlURL, sqlUsername, sqlPassword);
            
            System.out.println("INSIDE OF CREATE LISTING METHOD BEFORE SQL CALL");
            
            String sql = "INSERT INTO listinginfo(username, racquetID, price, "
                    + "neworUsed, dateListed, dateSold, usernameBuyer, "
                    + "sellerRating, description, picture)"
                    + "VALUES(?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement stmt = conn.prepareStatement(sql, new String[]{"listingID"});
            stmt.setString(1, username);
            stmt.setInt(2, racquetID);
            stmt.setDouble(3, price);
            stmt.setString(4, newOrUsed);
            stmt.setDate(5, dateListed);
            stmt.setDate(6, null);
            stmt.setString(7, null);
            stmt.setString(8, null);
            stmt.setString(9, description);
            stmt.setString(10, picture);
            
            System.out.println(" Inside of a create listing method! ");
            
            int i = stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            
            
            System.out.println("I is " + i);
            System.out.println("User name" + username);
            System.out.println("Racquet ID " + racquetID);
            System.out.println("Price " + price);
            System.out.println("neworused " + newOrUsed);
            System.out.println("Date Listed " + dateListed);
            System.out.println("Date Description " + description);
            System.out.println("Picture " + picture);
            
            if (rs != null && rs.next()) {
                System.out.println("Here is the listing ID: " + rs.getInt(1));
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return 0;
    }

    /**
     * Adds a racquet to the DB table racquetInfo.
     *
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
    private int addRacquet(String mName, String brand, double mass,
            double length, int swingWeight, double balancePoint,
            double qualityIndex)
            throws ServletException, IOException {
        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader()
                .getResourceAsStream("build.properties"));

        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            String sqlPassword = prop.getProperty("pass");
            String sqlUsername = prop.getProperty("username");
            String sqlURL = prop.getProperty("url") + "racqual";

            conn = DriverManager.getConnection(sqlURL, sqlUsername, sqlPassword);

            String sql = "INSERT INTO racquetinfo(modelName, brand, mass, "
                    + "length, swingweight, balancePoint, qualityIndex)"
                    + "VALUES(?,?,?,?,?,?,?)";

            PreparedStatement stmt = conn.prepareStatement(sql,
                    new String[]{"racquetID"});
            stmt.setString(1, mName);
            stmt.setString(2, brand);
            stmt.setDouble(3, mass);
            stmt.setDouble(4, length);
            stmt.setInt(5, swingWeight);
            stmt.setDouble(6, balancePoint);
            stmt.setDouble(7, qualityIndex);

            int i = stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();

            if (i != 0 && rs != null && rs.next()) {
                int id = rs.getInt(1);
                stmt.close();
                rs.close();
                conn.close();
                return id;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return 0;
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
    private double qualityIndex(double length, double mass, int swingWeight,
            double balancePoint) {
        // Q = MR^2/I
        // where M = mass in kilograms,
        // r = cms from balance point to butt cap,
        // and I = swingweight.
        final double M = (mass // ounces
                / OZ_PER_LB) / LBS_PER_KG;
        final double R = ((length / 2) // inches
                + (balancePoint /* points */ / PTS_PER_IN)) / CM_PER_IN;
        final double I = swingWeight;

        // This is the quantitative quality index:
        final double QUALITY_INDEX = M * R * R / I;
        return QUALITY_INDEX;
    }

    private static final double OZ_PER_LB = 16.0;
    private static final double LBS_PER_KG = 2.2;
    private static final double PTS_PER_IN = 8.0;
    private static final double CM_PER_IN = 2.54;
}
