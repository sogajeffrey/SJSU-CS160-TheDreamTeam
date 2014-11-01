package racQualCore.tools.comparators;

import java.util.Comparator;

import racQualCore.TennisRacquet;

/**
 * This class is a comparator for tennis racquets. The criterion for comparison
 * of two racquets is swingweight. This class enables sorting of tennis racquets
 * based on swingweight.
 * 
 * @author Srikanth Narahari
 * 
 */
public class SwingweightComparator implements Comparator<TennisRacquet>
{

	@Override
	public int compare(TennisRacquet racquet1, TennisRacquet racquet2)
	{
		return Double.compare(racquet1.getSwingweight(),
				racquet2.getSwingweight());
	}

}
