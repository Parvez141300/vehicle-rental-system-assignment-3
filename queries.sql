-- Query 1: JOIN Retrieve booking information along with:
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

solution:
booking_id  customer_name   vehicle_name    start_date  end_date    status 
1       	Parvez Hossain	Toyota Corolla	2025-01-01	2025-01-06	confirmed
2       	Rahim Uddin	    Honda Civic	    2025-02-10	2025-02-13	pending
3       	Karim Ahmed	    Yamaha R15	    2025-03-05	2025-03-12	confirmed
4       	Nusrat Jahan	Ford F-150	    2025-04-01	2025-04-03	pending
5       	Parvez Hossain	Yamaha R15	    2025-01-01	2025-01-06	confirmed
6       	Parvez Hossain	Honda Civic	    2025-01-01	2025-01-06	confirmed
7       	Nusrat Jahan	Honda Civic	    2025-04-01	2025-04-03	pending


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

solution:
vehicle_id  name        model       registration_number     rental_price    status
5	        BMW	        2015	    DHA-2244	            150.00	        available
6	        Nissan GTR	2011	    DHA-1144	            150.00	        available


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

solution:
vehicle_id  name            type    model   registration_number     rental_price    status
1	        Toyota Corolla	car	    2022	DHA-1234	            50.00	        available
5	        BMW	            car	    2015	DHA-2244	            150.00	        available
6	        Nissan GTR	    car	    2011	DHA-1144	            150.00	        available


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

solution:
booking_count
3