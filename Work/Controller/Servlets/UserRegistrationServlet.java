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
@author Jay Patel & Srikanth
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
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dreamteam", "root", "");
            
            String sql = "INSERT INTO userinfo(username, password, firstName, lastName, email, phoneNumber, city, state, rating)"
                       + "VALUES(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, "userName");
            stmt.setString(2, "password");
            stmt.setString(3, "firstName");
            stmt.setString(4, "lastName");
            stmt.setString(5, "email");
            stmt.setString(6, "phoneNumber");
            stmt.setString(7, "city");
            stmt.setString(8, "state");
            stmt.setDouble(10, 0);

            int i = stmt.executeUpdate();
            
            if(i != 0) {
                response.sendRedirect("index.html");
            } else {
                response.sendRedirect("signup.html");
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
        return "This Servlet adds Users into Persistent Storage.";
    }
}
