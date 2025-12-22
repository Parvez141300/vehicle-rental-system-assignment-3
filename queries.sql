-- Query 1: JOIN
-- Retrieve booking information along with:
-- 1) Customer name
-- 2) Vehicle name
select
  b.booking_id,
  u.name as "customer_name",
  v.name as "vehicle_name",
  b.start_date,
  b.end_date,
  b.status
from
  Bookings b
  inner join Users u on u.user_id = b.user_id
  inner join Vehicles v on v.vehicle_id = b.vehicle_id;

-- Query 2: EXISTS
-- Find all vehicles that have never been booked.
-- Concepts used: NOT EXISTS
select
  v.vehicle_id,
  v.name,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
from
  Vehicles v
where
  not exists (
    select
      *
    from
      Bookings b
    where
      b.vehicle_id = v.vehicle_id
  );

-- Query 3: WHERE
-- Retrieve all available vehicles of a specific type (e.g. cars).
-- Concepts used: SELECT, WHERE
select
  *
from
  Vehicles
where
type
  = 'car'
  and status = 'available';

-- Query 4: GROUP BY and HAVING
-- Find the total number of bookings for each vehicle and 
-- display only those vehicles that have more than 2 bookings.
-- Concepts used: GROUP BY, HAVING, COUNT
select
  count(vehicle_id) as booking_count
from
  Bookings
group by
  vehicle_id
having
  count(vehicle_id) > 2;