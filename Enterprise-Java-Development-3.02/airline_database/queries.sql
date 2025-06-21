-- Total number of flights
SELECT COUNT(*) AS total_flights FROM Flight;

-- Average flight distance
SELECT AVG(mileage) AS average_mileage FROM Flight;

-- Average number of seats
SELECT AVG(total_seats) AS average_seats FROM Aircraft;

-- Average miles by customer status
SELECT cs.status_name, AVG(c.total_miles) AS average_miles
FROM Customer c
JOIN CustomerStatus cs ON c.status_id = cs.status_id
GROUP BY cs.status_name;

-- Max miles by customer status
SELECT cs.status_name, MAX(c.total_miles) AS max_miles
FROM Customer c
JOIN CustomerStatus cs ON c.status_id = cs.status_id
GROUP BY cs.status_name;

-- Total Boeing aircrafts
SELECT COUNT(*) AS boeing_aircraft_count
FROM Aircraft
WHERE name LIKE '%Boeing%';

-- Flights between 300 and 2000 miles
SELECT *
FROM Flight
WHERE mileage BETWEEN 300 AND 2000;

-- Average flight distance booked grouped by status
SELECT cs.status_name, AVG(f.mileage) AS average_flight_mileage
FROM FlightBooking fb
JOIN Customer c ON fb.customer_id = c.customer_id
JOIN CustomerStatus cs ON c.status_id = cs.status_id
JOIN Flight f ON fb.flight_id = f.flight_id
GROUP BY cs.status_name;

-- Most often booked aircraft by Gold members
SELECT a.name, COUNT(*) AS booking_count
FROM FlightBooking fb
JOIN Customer c ON fb.customer_id = c.customer_id
JOIN CustomerStatus cs ON c.status_id = cs.status_id
JOIN Flight f ON fb.flight_id = f.flight_id
JOIN Aircraft a ON f.aircraft_id = a.aircraft_id
WHERE cs.status_name = 'Gold'
GROUP BY a.name
ORDER BY booking_count DESC
LIMIT 1;
