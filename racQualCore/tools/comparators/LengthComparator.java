package racQualCore.tools.comparators;

import java.util.Comparator;

import racQualCore.TennisRacquet;

/**
 * This class is a comparator for tennis racquets. The criterion for comparison
 * of two racquets is length. This class enables sorting of tennis racquets
 * based on length.
 * 
 * @author Srikanth Narahari
 * 
 */
public class LengthComparator implements Comparator<TennisRacquet>
{

	@Override
	public int compare(TennisRacquet racquet1, TennisRacquet racquet2)
	{
		return Double.compare(racquet1.getLength(), racquet2.getLength());
	}

}
