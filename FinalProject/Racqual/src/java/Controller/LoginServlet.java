package Controller;

import Model.Users;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * This is the servlet for logging in.
 *
 * @author Jay Patel & Srikanth Narahari
 * @version 11/18/2014
 */
@WebServlet(urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    private PreparedStatement stmt;
    private Connection conn;

    public LoginServlet() throws IOException {
        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("build.properties"));

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String pass = prop.getProperty("pass");
            String user = prop.getProperty("username");
            String url = prop.getProperty("url");// + "racqual";
            conn = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT * from userinfo where username = ? and password = ?";
            stmt = conn.prepareStatement(sql, new String[]{
                "username", "password", "firstName", "lastName", "email", "phoneNumber", "city", "state"
            });
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
        try {

            String uname = request.getParameter("username");
            String pw = request.getParameter("password");
            System.out.printf("username: %s\npassword: %s\n", uname, pw);

            Users user = isValid(uname, pw);
            if (user != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);
                
                // Draw the user's listings into the session data by invoking the
                // servlet that has been made for this purpose.
                new GetUsersListingsBeansServlet().updateListingBeansInSessions(request, response, session);
                
                response.sendRedirect("user.jsp");
            } else {
                response.sendRedirect("notregistered.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private Users isValid(String username, String password) throws SQLException {
        stmt.setString(1, username);
        stmt.setString(2, password);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            Users user = new Users();
            user.setFirstName(rs.getString("firstname"));
            user.setLastName(rs.getString("lastname"));
            user.setUserName(username);
            user.setPassWord(password);
            user.setEmail(rs.getString("email"));
            user.setPhoneNumber(rs.getString("phoneNumber"));
            user.setCity(rs.getString("city"));
            user.setState(rs.getString("state"));

//            stmt.close();
//            rs.close();
//            conn.close();
            return user;
        } else {
//            stmt.close();
//            rs.close();
//            conn.close();

            return null;
        }
    }
}
