package Controller;

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
import java.util.Properties;

/**
 *
 * @author Srikanth Narahari
 * @version 2014/11/29
 */
@WebServlet(name = "DeleteListingServlet", urlPatterns = {"/deletelistingservlet"})
public class DeleteListingServlet extends HttpServlet {

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
        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("build.properties"));
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String pass = prop.getProperty("pass");
            String user = prop.getProperty("username");
            String url = prop.getProperty("url") + "racqual";

            conn = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT racquetID FROM listingInfo WHERE listingID=?";

            final int LISTING_ID = Integer.parseInt(request.getParameter("listingID"));
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, LISTING_ID);

            ResultSet set = stmt.executeQuery();
            PreparedStatement origStmt = stmt;
            
            set.next();
            final int RACQUET_ID = set.getInt("racquetID");
            
            sql = "DELETE FROM racquetID where racquetID=?;"
                    + "DELETE FROM listingID where listingID=?";
            stmt = conn.prepareStatement(sql);
            
            stmt.setInt(1, RACQUET_ID);
            stmt.setInt(2, LISTING_ID);

            stmt.executeUpdate();
            
            stmt.close();
            origStmt.close();
            
            conn.close();
            
            // Update the user's listings in the session data by invoking the
            // servlet that has been made for this purpose.
            new GetUsersListingsBeansServlet().doGet(request, response);

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
