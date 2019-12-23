-- list entries in reservation that violate the condition: one car object cannot
-- be rented multiple times within overlapping time periods.

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
