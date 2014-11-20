<<<<<<< Updated upstream
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
      
	// This is the quantitative quality index:
	final double QI = M * R * R / I;
	
	// This is the qualitative quality index:
	final String EVAL;
	if (Double.compare(QI, MEDIOCRE_THRESHOLD) <= 0)
	   {
	   EVAL = "Good";
	   }
	else
	   {
	   if (Double.compare(QI, BAD_THRESHOLD) <= 0)
		{
		EVAL = "MEDIOCRE";
		}
	   else
		{
		EVAL = "BAD";
		}
	   }

	// TODO: pass QI and EVAL on to correct JSP
   }
   
   private static final double OZS_PER_LB = 16.0;
   private static final double LBS_PER_KG = 2.2;
    
   private static final double CMS_PER_IN = 2.54;
   private static final double PTS_PER_IN = 2.2;
   
   private static final double MEDIOCRE_THRESHOLD = 1.10;
   private static final double BAD_THRESHOLD = 1.17;
}
=======
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
      
	// This is the quantitative quality index:
	final double QI = M * R * R / I;
	
	// This is the qualitative quality index:
	final String EVAL;
	if (Double.compare(QI, MEDIOCRE_THRESHOLD) <= 0)
	   {
	   EVAL = "Good";
	   }
	else
	   {
	   if (Double.compare(QI, BAD_THRESHOLD) <= 0)
		{
		EVAL = "MEDIOCRE";
		}
	   else
		{
		EVAL = "BAD";
		}
	   }

	// TODO: correctly write QI and EVAL to response
	final String[] QI_WRAPPER = { "" + QI };
	final String[] EVAL_WRAPPER = { EVAL };

	request.getParameterMap().put("qualityIndex", QI_WRAPPER);
	request.getParameterMap().put("evaluation", EVAL_WRAPPER);
	
	// lol
   }
   
   private static final double OZS_PER_LB = 16.0;
   private static final double LBS_PER_KG = 2.2;
    
   private static final double CMS_PER_IN = 2.54;
   private static final double PTS_PER_IN = 2.2;
   
   private static final double MEDIOCRE_THRESHOLD = 1.10;
   private static final double BAD_THRESHOLD = 1.17;
}
>>>>>>> Stashed changes
