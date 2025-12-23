Project Name: Vehicle Rental System

Procedure:

1) select
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

  To query the booking info with customer name and vehicle name must be included. So that's why I used inner join for both table like Users and Vehicles. Which are connected by foreign key like user_id and vehicle_id in booing table. And show the matched user and vehicle info where id's are in the booking table.

  2) select
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

  In this query statement well have found all the vehicles that have never been booked. To do so we have done a sub query in the Vehicles table in where keyword and added a also a not exists clause to find the table row which is not booked by matching b.vehicle_id = v.vehicle_id this condition. 

  3) select *
from
  Vehicles
where
type
  = 'car'
  and status = 'available';

  By this sql statement we find the vehicles where there type should be car and it's status should be available. This two condition must be full filled for this I used and operator in where keyword condition area. So we may find the data which must match the condition like type must be car and it's status must be available

  4) select
  count(vehicle_id) as booking_count
from
  Bookings
group by
  vehicle_id
having
  count(vehicle_id) > 2;

  By this query statement have to display only those vehicles that have more than 2 bookings. For this I have used a aggregate function like count to count the vehicles. And for grouping the vehicles used group by clause. The vehicle booking must be more than 2. So that's why I used condition like having keyword and said that the booking count should be greater than 2.