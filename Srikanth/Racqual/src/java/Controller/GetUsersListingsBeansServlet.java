package Controller;

import Model.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Srikanth Narahari
 * @version 2014/11/29
 */
@WebServlet(name = "GetUsersListingsServlet", urlPatterns = {"/GetUsersListings"})
public class GetUsersListingsBeansServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    @SuppressWarnings("CallToPrintStackTrace")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        updateListingBeansInSessions(request, response, null);
    }

    /**
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException
     * @throws IOException
     */
    public void updateListingBeansInSessions(HttpServletRequest request,
            HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {
        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("build.properties"));
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String pass = prop.getProperty("pass");
            String user = prop.getProperty("username");
            String url = prop.getProperty("url");// + "dreamteam";

            conn = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT * FROM listingInfo";

            PreparedStatement stmt
                    = conn.prepareStatement(sql, new String[]{
                        "listingID", "username", "neworUsed", "price", "dateListed", "description"});

            String username = request.getParameter("username");
            if (username == null) // servlet has been invoked by another servlet
            {
                if (session == null) {
                    session = request.getSession(true);
                }
                Object currentUsersUncasted = session.getAttribute("currentSessionUser");
                if (currentUsersUncasted != null) {
                    Users currentUsers = (Users) currentUsersUncasted;
                    username = currentUsers.getUserName();
                }
            }

            ResultSet set = stmt.executeQuery();
            PreparedStatement origStmt = stmt;

            ArrayList<Listing> currentUsersListingBeans = new ArrayList<Listing>();
            ArrayList<Listing> allListingBeans = new ArrayList<Listing>();

            while (set.next()) {
                Listing listingBean = new Listing();
                allListingBeans.add(listingBean);

                listingBean.setListingID(set.getInt("listingID"));
                
                listingBean.setUserName(set.getString("username"));
                if (username != null && listingBean.getUserName().equals(username)) {
                    currentUsersListingBeans.add(listingBean);
                }

                Users userBean = new Users();
                listingBean.setUsers(userBean);
                listingBean.setNewOrUsed(set.getString("neworUsed"));
                listingBean.setPrice(set.getDouble("price"));
                listingBean.setDateListed(set.getDate("dateListed"));
                listingBean.setDescription(set.getString("description"));

                /* Prepare the user bean. */
                sql = "SELECT * FROM userinfo WHERE username=?";

                stmt = conn.prepareStatement(sql);
                stmt.setString(1, listingBean.getUserName());

                ResultSet set2 = stmt.executeQuery();

                set2.next();

                userBean.setUserName(listingBean.getUserName());
                userBean.setPassWord(set2.getString("password"));
                userBean.setFirstName(set2.getString("firstName"));
                userBean.setLastName(set2.getString("lastName"));
                userBean.setEmail(set2.getString("email"));
                userBean.setPhoneNumber(set2.getString("phoneNumber"));
                userBean.setCity(set2.getString("city"));
                userBean.setState(set2.getString("state"));
                /* Done preparing the user bean. */

                listingBean.setRacquetID(set.getInt("racquetID"));

                Racquet racquetBean = new Racquet();
                listingBean.setRacket(racquetBean);

                /* Prepare the racquet bean and put it in the listing bean. */
                sql = "SELECT * FROM racquetinfo WHERE racquetID = ?";

                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, listingBean.getRacquetID());

                set2 = stmt.executeQuery();

                set2.next();

                racquetBean.setUserName(listingBean.getUserName());
                racquetBean.setModelName(set2.getString("modelName"));
                racquetBean.setBrand(set2.getString("brand"));
                racquetBean.setMass(set2.getDouble("mass"));
                racquetBean.setLength(set2.getDouble("length"));
                racquetBean.setSwingWeight(set2.getInt("swingweight"));
                racquetBean.setBalancePoint(set2.getDouble("balancePoint"));
                racquetBean.setQualityIndex(set2.getDouble("qualityIndex"));
                /* Done preparing the racquet bean. */

            }

            origStmt.close();

            // Put the listing beans array list in the session data
            if (session == null) {
                session = request.getSession(true);
            }
            session.setAttribute("currentSessionUsersListingBeans", currentUsersListingBeans);
            session.setAttribute("allListingBeans", allListingBeans);

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (InstantiationException ex) {
            ex.printStackTrace();
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        }

    }

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
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
