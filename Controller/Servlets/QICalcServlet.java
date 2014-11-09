package controller.servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
This class does the under-the-hood work for the quality index calculator JSP.

@author Srikanth
@version 2014/11/5
*/
public class QICalcServlet extends HttpServlet {
   /**
    Handles the HTTP <code>POST</code> method.
    @param request servlet request
    @param response servlet response
    @throws ServletException if a servlet-specific error occurs
    @throws IOException if an I/O error occurs
    */
   @Override
   protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
	// Get parameters.
	final double MASS = Double.parseDouble(request.getParameter("mass"));
	final double LENGTH = Double.parseDouble(request.getParameter("length"));
	final double SWING_WEIGHT
		= Double.parseDouble(request.getParameter("swingWeight"));
	final double BALANCE_POINT
		= Double.parseDouble(request.getParameter("balancePoint"));
	
	// Q = MR^2/I
	   // where M = mass in kilograms,
	   // r = cms from balance point to butt cap,
	   // and I = swingweight.
	final double M = (MASS // ounces
		   / OZS_PER_LB) / LBS_PER_KG;
	final double R = ((LENGTH / 2) // inches
		+ (BALANCE_POINT /* points */ / PTS_PER_IN)) / CMS_PER_IN;
	final double I = SWING_WEIGHT;
      
	final Double Q = M * R * R / I;

	// TODO: write to response
   }
   
   private static final double OZS_PER_LB = 16.0;
   private static final double LBS_PER_KG = 2.2;
    
   private static final double CMS_PER_IN = 2.54;
   private static final double PTS_PER_IN = 2.2;
}
