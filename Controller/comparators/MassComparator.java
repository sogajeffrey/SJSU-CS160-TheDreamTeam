package racQualCore.tools.comparators;

import java.util.Comparator;

import racQualCore.TennisRacquet;

/**
 * This class is a comparator for tennis racquets. The criterion for comparison
 * of two racquets is mass. This class enables sorting of tennis racquets based
 * on mass.
 * 
 * @author Srikanth Narahari
 * 
 */
public class MassComparator implements Comparator<TennisRacquet>
{

	@Override
	public int compare(TennisRacquet racquet1, TennisRacquet racquet2)
	{
		return Double.compare(racquet1.getMass(), racquet2.getMass());
	}

}
