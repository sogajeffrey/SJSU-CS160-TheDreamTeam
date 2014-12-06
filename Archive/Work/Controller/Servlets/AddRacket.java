
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
        String mName = "Another value";//request.getParameter("mName");
        String brand = "jay test #2";//request.getParameter("brand");
        double mass = 0.5;//Double.parseDouble(request.getParameter("mass"));
        double length = 68.88;//Double.parseDouble(request.getParameter("length"));
        int swingWeight = 300;//Integer.parseInt(request.getParameter("swingWeight"));
        double balancePoint = 31.0;//Double.parseDouble(request.getParameter("balancePoint"));
        double qualityIndex = 1.03;//Double.parseDouble(request.getParameter("qualityIndex"));
        
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dreamteam", "root", "");
            
            String sql = "INSERT INTO racquetinfo(modelName, brand, mass, length, swingweight, balancePoint, qualityIndex)"
                       + "VALUES(?,?,?,?,?,?,?)";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,mName);
            stmt.setString(2,brand);
            stmt.setDouble(3,mass);
            stmt.setDouble(4,length);
            stmt.setInt(5, swingWeight);
            stmt.setDouble(6,balancePoint);
            stmt.setDouble(7,qualityIndex);
            
            int i = stmt.executeUpdate();
                        
            if(i > 0) {
                response.sendRedirect("AllGood.jsp");
            } else {
                response.sendRedirect("BadInsert.jsp");
            }
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