package Controller.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
This is the servlet for logging in.
@author Srikanth Narahari
@version 2014/11/5
*/
@WebServlet(urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet
{
    /**
    Handles the HTTP <code>POST</code> method.
    @param request servlet request
    @param response servlet response
    @throws ServletException if a servlet-specific error occurs
    @throws IOException if an I/O error occurs
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get Parameters from the form. 
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (isValid(username, password))
        {
            // TODO: log user in
        }
        else
        {
            // TODO: handle invalid credentials
        }
        
    }

    /**
    Returns a short description of the Servlet.
    @return a String containing Servlet description
    */
    @Override
    public String getServletInfo() {
        return "This Servlet logs a user in.";
    }
    
    private boolean isValid(String username, String password)
    {
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dreamteam", "root", "secret123");
            
            String sql = "SELECT password from userinfo where username='+username+'";
            PreparedStatement stmt = conn.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            return rs.next() // username was found
                    || rs.getObject(0).equals(password); // password is correct
            
            } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
