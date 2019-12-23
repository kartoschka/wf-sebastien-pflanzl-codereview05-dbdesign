-- list reservations for the same car object where there is an overlap in rental
-- periods
select *
from reservation r1
where exists (
  select *
  from reservation r2
  where r1.id <> r2.id
    and r1.object_id = r2.object_id
    and ((r1.from_date  between r2.from_date and r2.to_date)
         or (r1.to_date between r2.from_date and r2.to_date))
);

-- to reservations, append concatenated lists of the IDs of employees that work
-- at the shop for which the reservation was made
select r.id, r.customer_id, r.shop_id, empids
from reservation r
  join (select e.shop_id, group_concat(e.id) empids
        from employee e group by e.shop_id) t
  on r.shop_id = t.shop_id;

-- display all reservations with customer names
select first_name, last_name, r.id resv_id, from_date
from reservation r
  join customer c
  on customer_id = c.id;

-- display reservations with names where a check_in but no check_out was
-- registered (i.e. customers did not return the car (wtf!))
select first_name, last_name, r.id resv_id, from_date
from reservation r
  join customer c
  on customer_id = c.id
  where not exists (select * from check_out c where r.id = c.id)
        and exists (select * from check_in i where r.id = i.id);

-- show in 3 rows the number of reservations, of check-ins and of check-outs
select count(*) from reservation
union select count(*) from reservation join check_in using (id)
union select count(*) from check_in join check_out using (id);

-- show number of cases where cars were returned later than the agreed date
select count(*) late_returns
from reservation r join check_out co using (id) where co.date > r.to_date;

-- show customers that have no web_user associated with them
select id, first_name, last_name
from customer
where not exists (select 1 from web_user where customer.id = customer_id);

-- show ids of reservations where the car was returned earlier than the agreed
-- date and if it was a flexible return fee or not
select id,
  (r.to_date - co.date) days_returned_early,
  if(flexible_return, 'yes', 'no') is_flex
from reservation r join check_out co using (id) where r.to_date > co.date;

-- show the names of all employees working there for each shop location
select street shop_location, employees
from shop
  join (select shop_id, group_concat(concat(first_name, ' ', last_name)) employees
        from employee group by shop_id) t
  on shop.id = shop_id;

-- amount of fee collected from all reservations that were checked in
select sum(fee) from reservation join check_in using (id);
