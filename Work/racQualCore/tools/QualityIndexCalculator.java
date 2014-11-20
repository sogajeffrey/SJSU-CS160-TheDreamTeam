package racQualCore.tools;

import racQualCore.TennisRacquet;

/**
 * This class implements a static method that calculates the quality index of a
 * tennis racquet.
 * 
 * @author Srikanth Narahari
 * 
 */
public class QualityIndexCalculator
{
	/**
	 * Computes the quality index of a tennis racquet.
	 * 
	 * @param racquet a reference to a tennis racquet object
	 * @return the quality index of the racquet
	 */
	public static double qualityIndexOf(TennisRacquet racquet)
	{
		// First, let us figure out M, the mass of the racquet in KGs.
		final double M = (racquet.getMass() // in ounces
				/ OZ_PER_LB)
				/ LBS_PER_KG;

		/* 
		 * Next, let us figure out R, the distance of the balance point from
		 * butt cap, in CMs.
		 */
		final double MP = racquet.getLength() * 0.5; // midpoint of racquet
		final double OFFSET = racquet.getBalancePoint() / PTS_PER_IN;

		final double R = (MP + OFFSET) * CM_PER_IN;

		/*
		 * Finally, we need the swingweight, for which the tennis racquet class
		 * has a getter. 
		 * 
		 * Now we can calculate Q, the quality index of the racquet.
		 * Q = MR^2/I, where I is the swingweight.
		 */
		final double Q = M * Math.pow(R, 2) / racquet.getSwingweight();
		return Q;
	}

	private static final double OZ_PER_LB = 16.0;
	private static final double LBS_PER_KG = 2.2;

	private static final double PTS_PER_IN = 8.0;
	private static final double CM_PER_IN = 2.54;
}
