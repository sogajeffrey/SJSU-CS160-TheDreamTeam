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
 * This servlet is used to delete a racquet listing in our database.
 *
 * @author The Dream Team
 * @version 2014/12/5
 */
@WebServlet(name = "DeleteListingServlet", urlPatterns
        = {
            "/DeleteListingServlet"
        })
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
            String url = prop.getProperty("url");

            conn = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT racquetID FROM listinginfo WHERE listingID=?";

            final int LISTING_ID = Integer.parseInt(request.getParameter("listingID"));

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, LISTING_ID);

            ResultSet set = stmt.executeQuery();
            PreparedStatement origStmt = stmt;

            set.next();
            final int RACQUET_ID = set.getInt("racquetID");

            sql = "DELETE FROM listinginfo where listingID=?;";
            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, RACQUET_ID);

            stmt.executeUpdate();

            sql = "DELETE FROM racquetinfo where racquetID=?";
            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, LISTING_ID);

            stmt.executeUpdate();

            conn.close();

            // Update the user's listings in the session data by invoking the
            // servlet that has been made for this purpose.
            new GetUsersListingsBeansServlet().doGet(request, response);

            response.sendRedirect("user.jsp");
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
