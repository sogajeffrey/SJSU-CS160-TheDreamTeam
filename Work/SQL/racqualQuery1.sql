select a.username, b.city, b.state, a.dateListed, a.price
from listinginfo as a
join userinfo as b
on a.username = b.username
where a.username = "srkanth";