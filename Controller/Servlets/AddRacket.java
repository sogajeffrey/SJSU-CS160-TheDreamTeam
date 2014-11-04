
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This Servlet is designed to add Rackets to the persistent storage. 
 * @author Jay Patel
 */
@WebServlet(urlPatterns = {"/AddRacket"})
public class AddRacket extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get Parameters from the form. 
        String modelName = request.getParameter("mName");
        String brand = request.getParameter("brand");
        double mass = Double.parseDouble(request.getParameter("mass"));
        double length = Double.parseDouble(request.getParameter("length"));
        int swingWeight = Integer.parseInt(request.getParameter("swingWeight"));
        double balancePoint = Double.parseDouble(request.getParameter("balancePoint"));
        double qualityIndex = Double.parseDouble(request.getParameter("qualityIndex"));
        
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dreamteam", "root", "secret123");
            
            String sql = "INSERT INTO racquetinfo(modelName, brand, mass, length, swingweight, balancePoint, qualityIndex)"
                       + "VALUES('+modelName+','+brand+','+mass+','+length+','+swingWeight+','+balancePoint+','+qualityIndex+')";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            int i = stmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Returns a short description of the Servlet.
     * @return a String containing Servlet description
     */
    @Override
    public String getServletInfo() {
        return "This Servlet adds Rackets into Persistent Storage.";
    }
}