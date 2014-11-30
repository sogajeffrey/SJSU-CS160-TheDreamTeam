
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Driver;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Properties;

/**
 *
 * @author Jay Patel
 * @version 2014/11/15
 */
@WebServlet(name = "UserUpdateServlet", urlPatterns = {"/UserUpdateServlet"})
public class UserUpdateServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
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
            String url = prop.getProperty("url") + "racqual";
            conn = DriverManager.getConnection(url, user, pass);
            String update = "UPDATE userInfo SET ";

            if (newpassword != "" || newpassword != null) {
                String sql = "SELECT * FROM userInfo WHERE username= '" + username + "'";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                if (oldpassword != "" || oldpassword != null) {
                    request.setAttribute("message", "Please insert current password");
                    rs.close();
                    stmt.close();
                    conn.close();
                    Enumeration<Driver> drivers = DriverManager.getDrivers();
                    while (drivers.hasMoreElements()) {
                        Driver driver = drivers.nextElement();
                        DriverManager.deregisterDriver(driver);
                    }
                    request.getRequestDispatcher("userupdate.jsp").forward(request, response);
                    return;
                }
                rs.next();
                if (rs.getString(2).equals(oldpassword)) {
                    update = update + "password = '" + newpassword + "', ";
                } else {
                    request.setAttribute("message", "Current password is wrong");
                    rs.close();
                    stmt.close();
                    conn.close();
                    Enumeration<Driver> drivers = DriverManager.getDrivers();
                    while (drivers.hasMoreElements()) {
                        Driver driver = drivers.nextElement();
                        DriverManager.deregisterDriver(driver);
                    }
                    request.getRequestDispatcher("userupdate.jsp").forward(request, response);
                    return;
                }
                rs.close();
                stmt.close();
            }
            if (firstName != "" || firstName != null) {
                update = update + "firstName = '" + firstName + "', ";
            }
            if (lastName != "" || lastName != null) {
                update = update + "lastName = '" + lastName + "', ";
            }
            if (email != "" || email != null) {
                update = update + "email = '" + email + "', ";
            }
            if (phoneNumber != "" || phoneNumber != null) {
                update = update + "phoneNumber = '" + firstName + "', ";
            }
            if (city != "" || city != null) {
                update = update + "city = '" + city + "', ";
            }
            if (state != "" || state != null) {
                update = update + "state = '" + state + "', ";
            }
            update = update.substring(0, update.length() - 2);
            update = update + " WHERE username = '" + username + "';";
            Statement stmt = conn.createStatement();
            stmt.executeQuery(update).close();
            stmt.close();
            conn.close();
            Enumeration<Driver> drivers = DriverManager.getDrivers();
            while (drivers.hasMoreElements()) {
                Driver driver = drivers.nextElement();
                DriverManager.deregisterDriver(driver);
            }
            request.setAttribute("message", "User Information Updated");
            request.getRequestDispatcher("userupdate.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
