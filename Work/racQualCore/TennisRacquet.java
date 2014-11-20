package racQualCore;

/**
 * A tennis racquet has many technical specifications. However, in our
 * application, we give importance to the four parameters that are necessary for
 * calculating a racquet's quality index: --> Mass --> Length --> Balance Point
 * --> Swingweight
 * 
 * @author Srikanth Narahari
 * 
 */
public class TennisRacquet
{
	/**
	 * Constructs a tennis racquet object.
	 * 
	 * @param mass mass in ounces
	 * @param length length in inches
	 * @param balancePoint balance point in points (-ve means head-light, +ve
	 *            means head-heavy, 0 means even-balanced)
	 * @param swingweight
	 */
	public TennisRacquet(double mass, double length, int balancePoint,
			double swingweight)
	{
		this.mass = mass;
		this.length = length;
		this.balancePoint = balancePoint;
		this.swingweight = swingweight;
	}

	/**
	 * Returns the mass of this tennis racquet.
	 * 
	 * @return the mass, in ounces
	 */
	public double getMass()
	{
		return mass;
	}

	/**
	 * Returns the length of this tennis racquet.
	 * 
	 * @return the length, in inches
	 */
	public double getLength()
	{
		return length;
	}

	/**
	 * Returns the balance point of this tennis racquet.
	 * 
	 * @return the balance point, in points (-ve means head-light, +ve means head-heavy,
	 *         0 means even-balanced)
	 */
	public int getBalancePoint()
	{
		return balancePoint;
	}

	/**
	 * Returns the length of this tennis racquet.
	 * 
	 * @return the length, in inches
	 */
	public double getSwingweight()
	{
		return swingweight;
	}

	private double mass;
	private double length;
	private int balancePoint;
	private double swingweight;
}
