package Controller;

import Model.Users;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.http.HttpSession;

/**
 * Servlet to Register Users.
 *
 * @author Jay Patel
 * @version 11/15/2014
 */
@WebServlet(name = "UserRegistrationServlet", urlPatterns
        = {
            "/UserRegistrationServlet"
        })
public class UserRegistrationServlet extends HttpServlet {

    private PreparedStatement stmt;
    private Connection conn;

    public UserRegistrationServlet() throws IOException {
        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("build.properties"));
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String pass = prop.getProperty("pass");
            String user = prop.getProperty("username");
            String url = prop.getProperty("url"); //+ "racqual";
            conn = DriverManager.getConnection(url, user, pass);

            String sql = "INSERT INTO userinfo(username, passwordMD5, firstName, lastName, email, phoneNumber, city, state)"
                    + "VALUES(?,?,?,?,?,?,?,?)";

            stmt = conn.prepareStatement(sql);
        } catch (Exception ex) {
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
        //Get Parameters from the form.
        String username = request.getParameter("username");

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String city = request.getParameter("city");
        String state = request.getParameter("state");

        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(request.getParameter("password").getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            String passwordMD5 = sb.toString();

            stmt.setString(1, username);
            stmt.setString(2, passwordMD5);
            stmt.setString(3, firstName);
            stmt.setString(4, lastName);
            stmt.setString(5, email);
            stmt.setString(6, phoneNumber);
            stmt.setString(7, city);
            stmt.setString(8, state);

            stmt.executeUpdate();

            Users user = new Users();
            user.setUserName(username);
            user.setPasswordMD5(passwordMD5);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setCity(city);
            user.setState(state);

            HttpSession session = request.getSession(true);
            session.setAttribute("currentSessionUser", user);

            // Draw the user's listings into the session data by invoking the
            // servlet that has been made for this purpose.
            new GetUsersListingsBeansServlet().doGet(request, response);

            stmt.close();
            conn.close();

            response.sendRedirect("user.jsp");

        } catch (SQLException ex) {
            response.sendRedirect("notregistered.jsp");
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        } catch (ServletException ex) {
            ex.printStackTrace();
        }
    }
}
