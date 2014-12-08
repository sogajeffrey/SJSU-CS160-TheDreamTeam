package Controller;

import Model.Listing;
import Model.Racquet;
import Model.Users;
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
 * This servlet is used to load a racquet listing from our database into the
 * session data.
 *
 * @author The Dream Team
 * @version 2014/12/5
 */
@WebServlet(urlPatterns
        = {
            "/individuallistingservlet"
        })
public class IndividualListingServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        int listingID = Integer.parseInt(request.getParameter("listingID"));

        Listing listing = fetchListing(listingID);
        session.setAttribute("listing", listing);

        response.sendRedirect("forsale.jsp");
    }

    private Listing fetchListing(int listingID) throws IOException {
        // This listing bean will be returned at the end.
        Listing listing = new Listing();

        // Set listing ID in listing bean.
        listing.setListingID(listingID);

        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("build.properties"));
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String pass = prop.getProperty("pass");
            String user = prop.getProperty("username");
            String url = prop.getProperty("url");// + "dreamteam";

            conn = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT * FROM listingInfo WHERE listingID=?";

            PreparedStatement stmt
                    = conn.prepareStatement(sql, new String[]{
                        "racquetID", "username", "neworUsed", "price",
                        "dateListed", "description"
                    });
            stmt.setInt(1, listingID);

            ResultSet set = stmt.executeQuery();
            set.next();

            // Set fields in listing bean, except listing ID, which has already been set.
            listing.setRacquetID(set.getInt("racquetID"));
            listing.setUserName(set.getString("username"));
            listing.setNewOrUsed(set.getString("neworUsed"));
            listing.setPrice(set.getDouble("price"));
            listing.setDateListed(set.getDate("dateListed"));
            listing.setDescription(set.getString("description"));

            Users userBean = new Users();
            listing.setUsers(userBean);

            Racquet racquetBean = new Racquet();
            listing.setRacquet(racquetBean);

            /* Prepare the user bean. */
            PreparedStatement origStmt = stmt;

            sql = "SELECT * FROM userinfo WHERE username=?";

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, listing.getUserName());

            ResultSet set2 = stmt.executeQuery();

            set2.next();

            userBean.setUserName(listing.getUserName());
            userBean.setPasswordMD5(set2.getString("passwordMD5"));
            userBean.setFirstName(set2.getString("firstName"));
            userBean.setLastName(set2.getString("lastName"));
            userBean.setEmail(set2.getString("email"));
            userBean.setPhoneNumber(set2.getString("phoneNumber"));
            userBean.setCity(set2.getString("city"));
            userBean.setState(set2.getString("state"));
            /* Done preparing the user bean. */

            /* Prepare the racquet bean and put it in the listing bean. */
            sql = "SELECT * FROM racquetinfo WHERE racquetID = ?";

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, listing.getRacquetID());

            set2 = stmt.executeQuery();
            set2.next();

            racquetBean.setUserName(listing.getUserName());
            racquetBean.setModelName(set2.getString("modelName"));
            racquetBean.setBrand(set2.getString("brand"));
            racquetBean.setMass(set2.getDouble("mass"));
            racquetBean.setLength(set2.getDouble("length"));
            racquetBean.setSwingWeight(set2.getInt("swingweight"));
            racquetBean.setBalancePoint(set2.getDouble("balancePoint"));
            racquetBean.setQualityIndex(set2.getDouble("qualityIndex"));
            /* Done preparing the racquet bean. */

            origStmt.close();
            stmt.close();

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (InstantiationException ex) {
            ex.printStackTrace();
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        }

        return listing;
    }

}
