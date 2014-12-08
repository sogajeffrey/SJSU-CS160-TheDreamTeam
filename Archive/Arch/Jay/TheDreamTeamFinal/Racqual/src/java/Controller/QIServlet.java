package Controller;

import java.io.IOException;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This servlet is used to produce qualitative and quantitative evaluations of
 * tennis racquets.
 *
 * @author The Dream Team
 * @version 2014/12/5
 */
@WebServlet(urlPatterns = {"/QIServlet"})
public class QIServlet extends HttpServlet {

    private static final double OZS_PER_LB = 16.0;
    private static final double LBS_PER_KG = 2.2;

    private static final double CMS_PER_IN = 2.54;
    private static final double PTS_PER_IN = 8.0;

    private static final double MEDIOCRE_THRESHOLD = 1.10;
    private static final double BAD_THRESHOLD = 1.17;

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
        // Get parameters.
        final double MASS = Double.parseDouble(request.getParameter("mass"));
        final double LENGTH = Double.parseDouble(request.getParameter("length"));
        final double SWING_WEIGHT = Double.parseDouble(request.getParameter("swing"));
        final double BALANCE_POINT = Double.parseDouble(request.getParameter("balance"));

        // Q = MR^2/I
        // where M = mass in kilograms,
        // r = cms from balance point to butt cap,
        // and I = swingweight.
        final double M = (MASS // ounces
                / OZS_PER_LB) / LBS_PER_KG;

        final double R = ((LENGTH / 2) // inches
                + (BALANCE_POINT /* points */ / PTS_PER_IN)) * CMS_PER_IN;

        final double I = SWING_WEIGHT;

        // This is the quantitative quality index:
        double QI = M * R * R / I;

        // This is the qualitative quality index:
        final String EVAL;
        if (Double.compare(QI, MEDIOCRE_THRESHOLD) <= 0) {
            EVAL = "Good";
        } else {
            if (Double.compare(QI, BAD_THRESHOLD) <= 0) {
                EVAL = "MEDIOCRE";
            } else {
                EVAL = "BAD";
            }
        }
        DecimalFormat df = new DecimalFormat("#.###");
        QI = Double.valueOf(df.format(QI));

        request.setAttribute("grade", EVAL);
        request.setAttribute("QIvalue", QI);

        request.getRequestDispatcher("/qicalcresult.jsp").forward(request, response);
    }
}
