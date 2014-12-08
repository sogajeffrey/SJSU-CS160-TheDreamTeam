package Controller;

import Model.Users;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.servlet.http.HttpSession;

/**
 * This servlet is used to update user account information in our database.
 *
 * @author The Dream Team
 * @version 2014/12/5
 */
@WebServlet(name = "UserUpdateServlet", urlPatterns = {"/UserUpdateServlet"})
public class UserUpdateServlet extends HttpServlet {

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
        //Get Parameters from the form.
        HttpSession session = request.getSession(true);
        Users oldUser = (Users) session.getAttribute("currentSessionUser");
        String uname = oldUser.getUserName();
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String city = request.getParameter("city");
        String state = request.getParameter("state");

        Properties prop = new Properties();
        prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("build.properties"));
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String pass = prop.getProperty("pass");
            String user = prop.getProperty("username");
            String url = prop.getProperty("url");
            conn = DriverManager.getConnection(url, user, pass);

            String update, passwordMD5;
            PreparedStatement stmt;

            int updateReturnValue;
            if (request.getParameter("changePassword") != null) // checkbox was checked
            {
                update = "UPDATE userInfo SET passwordMD5 = ?, firstName = ?, lastName = ?, email = ?, phoneNumber = ?, city = ?, state = ? "
                        + "WHERE username = ?";
                stmt = conn.prepareStatement(update);

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
                passwordMD5 = sb.toString();

                stmt.setString(1, passwordMD5);
                stmt.setString(2, firstName);
                stmt.setString(3, lastName);
                stmt.setString(4, email);
                stmt.setString(5, phoneNumber);
                stmt.setString(6, city);
                stmt.setString(7, state);
                stmt.setString(8, uname);

                updateReturnValue = stmt.executeUpdate();
            } else {
                update = "UPDATE userInfo SET firstName = ?, lastName = ?, email = ?, phoneNumber = ?, city = ?, state = ? "
                        + "WHERE username = ?";
                stmt = conn.prepareStatement(update);
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, email);
                stmt.setString(4, phoneNumber);
                stmt.setString(5, city);
                stmt.setString(6, state);
                stmt.setString(7, uname);

                updateReturnValue = stmt.executeUpdate();

                String sql = "SELECT passwordMD5 FROM userInfo WHERE username = ?";

                stmt = conn.prepareStatement(sql, new String[]{"passwordMD5"});
                stmt.setString(1, uname);

                ResultSet rs = stmt.executeQuery();
                rs.next();

                passwordMD5 = rs.getString("passwordMD5");

            }

            if (updateReturnValue != 0) {
                conn.close();

                Users newuser = new Users();
                newuser.setFirstName(firstName);
                newuser.setLastName(lastName);
                newuser.setUserName(uname);

                newuser.setPasswordMD5(passwordMD5);

                newuser.setEmail(email);
                newuser.setPhoneNumber(phoneNumber);
                newuser.setCity(city);
                newuser.setState(state);

                session.setAttribute("currentSessionUser", newuser);
                response.sendRedirect("user.jsp");
            } else {
                request.setAttribute("message", "SOMETHING WENT WRONG WHILE PROCESSING YOUR REQUEST.... PLEASE TRY AGAIN");
                response.sendRedirect("changeusersetting.jsp");
            }

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (InstantiationException ex) {
            ex.printStackTrace();
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
    
}
