package Controller;

import Model.RacquetBean;
import javax.servlet.*;
import javax.servlet.http.*;

/**
This class does the under-the-hood work for the quality index calculator JSP.

@author Srikanth
@version 2014/11/5
*/
public class QICalcServlet extends HttpServlet {
    /**
    Calculates the quality index of a racquet.
        Q = MR^2/I
            where M = mass in kilograms,
            r = cms from balance point to butt cap,
            and I = swingweight.
    @param racquet a Racquet object
    @return the quality index of the racquet
    */
    public double getQualityIndex (RacquetBean racquet)
    {
        // Q = MR^2/I
            // where M = mass in kilograms,
            // r = cms from balance point to butt cap,
            // and I = swingweight.
        final double M = (racquet.getMass() // ounces
                / OZS_PER_LB) / LBS_PER_KG;
        final double R = ((racquet.getLength() / 2) // inches
                + (racquet.getBalancePoint() /* points */ / PTS_PER_IN))
                / CMS_PER_IN;
        final double I = racquet.getSwingweight();
        
        final double Q = M * R * R / I;
        return Q;
    }
    
    private static final double OZS_PER_LB = 16.0;
    private static final double LBS_PER_KG = 2.2;
    
    private static final double CMS_PER_IN = 2.54;
    private static final double PTS_PER_IN = 2.2;
}
