import java.io.IOException;
import java.io.PrintWriter;
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
 *
 * @author Bob
 */
@WebServlet(name = "UserRegistrationServlet", urlPatterns = {"/UserRegistrationServlet"})
public class UserRegistrationServlet extends HttpServlet {

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        final double RATING = 0.0;//Double.parseDouble(request.getParameter("rating"));

        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/the-dream-team", "root", "");

            String usernameCheck = "Select count(userinfo.username) FROM userinfo WHERE userinfo.username = ?";
            PreparedStatement st = conn.prepareStatement(usernameCheck);
            st.setString(1, username);

            ResultSet set = st.executeQuery();
            boolean exist = set.next();

            int userExist = 0;
            if (exist) {
                userExist = set.getInt(1);
            }

            if (userExist > 0) {
                javax.swing.JOptionPane.showMessageDialog(null, "USER EXIST ALREADY");
                response.sendRedirect("notregistered.jsp");
            }

            String sql = "INSERT INTO userinfo(username, password, firstName, lastName, email, phoneNumber, city, state, rating)"
                    + "VALUES(?,?,?,?,?,?,?,?,?)";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, firstName);
            stmt.setString(4, lastName);
            stmt.setString(5, email);
            stmt.setString(6, phoneNumber);
            stmt.setString(7, city);
            stmt.setString(8, state);
            stmt.setDouble(9, RATING);

            /*
             javax.swing.JOptionPane.showMessageDialog(null, "User Name: " + username);
             javax.swing.JOptionPane.showMessageDialog(null, "Password: " + password);
             javax.swing.JOptionPane.showMessageDialog(null, "first name: " + firstName);
             javax.swing.JOptionPane.showMessageDialog(null, "last name: " + lastName);
             javax.swing.JOptionPane.showMessageDialog(null, "email: " + email);
             javax.swing.JOptionPane.showMessageDialog(null, "city: " + city);
             javax.swing.JOptionPane.showMessageDialog(null, "state: " + state);
             javax.swing.JOptionPane.showMessageDialog(null, "phone: " + phoneNumber);
             */
            int i = stmt.executeUpdate();

            if (i != 0) {
                javax.swing.JOptionPane.showMessageDialog(null, "Inside the Final If condition, before index is called");
                //response.sendRedirect("registered.jsp");
                response.sendRedirect("index.jsp");
            } else {
                javax.swing.JOptionPane.showMessageDialog(null, "gets in else part: value of i is : " + i);
                response.sendRedirect("notregistered.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
