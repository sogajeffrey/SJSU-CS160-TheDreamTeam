package Controller;

import Model.Users;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
 * This servlet is used to process login requests.
 *
 * @author The Dream Team
 * @version 2014/12/5
 */
@WebServlet(urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    private PreparedStatement stmt;
    private Connection conn;

    /**
     * This constructor creates a login servlet. It initializes instance fields
     * for a java.sql.Connection object reference and a
     * java.sql.PreparedStatement object reference.
     *
     * @throws IOException
     */
    public LoginServlet() throws IOException {
        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("build.properties"));

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String pass = prop.getProperty("pass");
            String user = prop.getProperty("username");
            String url = prop.getProperty("url");// + "racqual";
            conn = DriverManager.getConnection(url, user, pass);

            String sql = "SELECT * from userinfo where username = ? and passwordMD5 = ?";
            stmt = conn.prepareStatement(sql, new String[]{
                "username", "passwordMD5", "firstName", "lastName", "email", "phoneNumber", "city", "state"
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
            String pwMD5 = sb.toString();

            Users user = isValid(uname, pwMD5);
            if (user != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);

                // Draw the user's listings into the session data by invoking the
                // servlet that has been made for this purpose.
                new GetUsersListingsBeansServlet().updateListingBeansInSessions(request, response, session);

                if (Integer.parseInt(request.getParameter("newlisting")) == 1) {
                    response.sendRedirect("newlisting.jsp");
                } else {
                    response.sendRedirect("user.jsp");
                }
            } else {
                response.sendRedirect("loginfailed.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * This is a helper method for validating the user credentials retrieved
     * from the login form in login.jsp.
     *
     * @param username the supplied username
     * @param passwordMD5 the md5 hash of the supplied password
     * @return true iff the supplied credentials are consistent with our
     * database
     * @throws SQLException
     */
    private Users isValid(String username, String passwordMD5) throws SQLException {
        stmt.setString(1, username);
        stmt.setString(2, passwordMD5);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            Users user = new Users();
            user.setFirstName(rs.getString("firstname"));
            user.setLastName(rs.getString("lastname"));
            user.setUserName(username);
            user.setPasswordMD5(passwordMD5);
            user.setEmail(rs.getString("email"));
            user.setPhoneNumber(rs.getString("phoneNumber"));
            user.setCity(rs.getString("city"));
            user.setState(rs.getString("state"));

            return user;
        } else {

            return null;
        }
    }
}
