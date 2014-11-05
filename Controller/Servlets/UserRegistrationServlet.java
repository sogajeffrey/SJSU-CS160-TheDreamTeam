package Controller.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
This is the servlet for creating a user account.
@author Srikanth
*/
@WebServlet(urlPatterns = {"/RegisterUser"})
public class UserRegistrationServlet extends HttpServlet
{
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        double rating = Double.parseDouble(request.getParameter("rating"));
        
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dreamteam", "root", "secret123");
            
            String sql = "INSERT INTO userinfo(username, password, firstName, lastName, email, phoneNumber, city, state, rating)"
                       + "VALUES('+username+','+password+','+firstName+','+lastName+','+email+','+phoneNumber+','+city+','+state+','+rating+')";
            
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
        return "This Servlet adds Users into Persistent Storage.";
    }
}
