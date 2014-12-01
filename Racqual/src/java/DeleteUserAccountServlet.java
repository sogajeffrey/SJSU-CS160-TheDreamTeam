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
import java.util.Properties;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jay Patel & Srikanth Narahari 
 * @version 2014/11/29
 */
@WebServlet(name = "DeleteUserAccountServlet", urlPatterns = {"/DeleteUserAccountServlet"})
public class DeleteUserAccountServlet extends HttpServlet {

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
        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("build.properties"));
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String pass = prop.getProperty("pass");
            String user = prop.getProperty("username");
            String url = prop.getProperty("url") + "racqual";

            conn = DriverManager.getConnection(url, user, pass);

            HttpSession session = request.getSession(true);

            String sql = "SELECT listingID,racquetID FROM listinginfo WHERE username=?";
            PreparedStatement stmt = conn.prepareStatement(sql, new String[]{"listingID"});
            String username = ((Users) session.getAttribute("currentSessionUser")).getUserName();
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                final int RACQUET_ID = rs.getInt("racquetID");
                               
                sql = "DELETE FROM listingInfo where racquetID=?";
                   
                PreparedStatement stmt1 = conn.prepareStatement(sql);
                stmt1.setInt(1, RACQUET_ID);
                stmt1.executeUpdate();
                stmt1.close();

                sql = "DELETE FROM racquetinfo where racquetID=?";

                PreparedStatement stmt2 = conn.prepareStatement(sql);
                stmt2.setInt(1, RACQUET_ID);
                stmt2.executeUpdate();
            }
            
            sql = "DELETE FROM userinfo where username=?";
            
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.executeUpdate();
            stmt.close();
            
            session.invalidate();
            response.sendRedirect("index.jsp");
            conn.close();

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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    
}
