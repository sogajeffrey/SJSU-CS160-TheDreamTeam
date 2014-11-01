package racQualCore.tools.comparators;

import java.util.Comparator;

import racQualCore.TennisRacquet;
import racQualCore.tools.QualityIndexCalculator;

/**
 * This class is a comparator for tennis racquets. The criterion for comparison
 * of two racquets is quality index. This class enables sorting of tennis
 * racquets based on quality index.
 * 
 * @author Srikanth Narahari
 * 
 */
public class QualityIndexComparator implements Comparator<TennisRacquet>
{

	@Override
	public int compare(TennisRacquet racquet1, TennisRacquet racquet2)
	{
		return Double.compare(QualityIndexCalculator.qualityIndexOf(racquet1),
				QualityIndexCalculator.qualityIndexOf(racquet2));
	}

}
