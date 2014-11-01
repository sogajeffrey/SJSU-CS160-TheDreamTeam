package racQualCore.tools.comparators;

import java.util.Comparator;

import racQualCore.TennisRacquet;

/**
 * This class is a comparator for tennis racquets. The criterion for comparison
 * of two racquets is balance point. This class enables sorting of tennis
 * racquets based on balance point.
 * 
 * @author Srikanth Narahari
 * 
 */
public class BalancePointComparator implements Comparator<TennisRacquet>
{

	@Override
	public int compare(TennisRacquet racquet1, TennisRacquet racquet2)
	{
		return Integer.compare(racquet1.getBalancePoint(),
				racquet2.getBalancePoint());
	}

}
