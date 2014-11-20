select c.username, c.rating, a.modelName, a.brand, a.qualityIndex, b.dateListed
from racquetInfo as a, listingInfo as b, userInfo as c
where a.racquetID = b.racquetID
and b.username = c.username
and a.qualityIndex > 1.079;
