package Controller;

import Model.Users;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpSession;

/**
 * Servlet to Register Users.
 *
 * @author Jay Patel
 * @version 11/15/2014
 */
@WebServlet(name = "UserRegistrationServlet", urlPatterns = {"/UserRegistrationServlet"})
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

            String sql = "INSERT INTO userinfo(username, password, firstName, lastName, email, phoneNumber, city, state)"
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
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String city = request.getParameter("city");
        String state = request.getParameter("state");

        try {
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, firstName);
            stmt.setString(4, lastName);
            stmt.setString(5, email);
            stmt.setString(6, phoneNumber);
            stmt.setString(7, city);
            stmt.setString(8, state);

            int i = stmt.executeUpdate();

            if (i != 0) {
                Users user = new Users();
                user.setUserName(username);
                user.setPassWord(password);
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
            } else {

                stmt.close();
                conn.close();

                response.sendRedirect("notregistered.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
