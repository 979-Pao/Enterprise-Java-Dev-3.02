CREATE TABLE CustomerStatus (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status_id INT,
    total_miles INT,
    FOREIGN KEY (status_id) REFERENCES CustomerStatus(status_id)
);

CREATE TABLE Aircraft (
    aircraft_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    total_seats INT NOT NULL
);

CREATE TABLE Flight (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL,
    aircraft_id INT,
    mileage INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

CREATE TABLE FlightBooking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

INSERT INTO CustomerStatus (status_name) VALUES
('None'),
('Silver'),
('Gold');

INSERT INTO Customer (name, status_id, total_miles) VALUES
('Agustine Riviera', (SELECT status_id FROM CustomerStatus WHERE status_name = 'Silver'), 115235),
('Alaina Sepulvida', (SELECT status_id FROM CustomerStatus WHERE status_name = 'None'), 6008),
('Tom Jones', (SELECT status_id FROM CustomerStatus WHERE status_name = 'Gold'), 205767),
('Sam Rio', (SELECT status_id FROM CustomerStatus WHERE status_name = 'None'), 2653),
('Jessica James', (SELECT status_id FROM CustomerStatus WHERE status_name = 'Silver'), 127656),
('Ana Janco', (SELECT status_id FROM CustomerStatus WHERE status_name = 'Silver'), 136773),
('Jennifer Cortez', (SELECT status_id FROM CustomerStatus WHERE status_name = 'Gold'), 300582),
('Christian Janco', (SELECT status_id FROM CustomerStatus WHERE status_name = 'Silver'), 14642);

INSERT INTO Aircraft (name, total_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO Flight (flight_number, aircraft_id, mileage) VALUES
('DL143', (SELECT aircraft_id FROM Aircraft WHERE name = 'Boeing 747'), 135),
('DL122', (SELECT aircraft_id FROM Aircraft WHERE name = 'Airbus A330'), 4370),
('DL53', (SELECT aircraft_id FROM Aircraft WHERE name = 'Boeing 777'), 2078),
('DL222', (SELECT aircraft_id FROM Aircraft WHERE name = 'Boeing 777'), 1765),
('DL37', (SELECT aircraft_id FROM Aircraft WHERE name = 'Boeing 747'), 531);

-- Agustine Riviera
INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Agustine Riviera'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL143')
);

INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Agustine Riviera'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL122')
);

INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Agustine Riviera'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL143')
);

INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Agustine Riviera'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL143')
);

-- Alaina Sepulvida
INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Alaina Sepulvida'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL122')
);

-- Tom Jones
INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Tom Jones'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL122')
);

INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Tom Jones'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL53')
);

INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Tom Jones'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL222')
);

-- Sam Rio
INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Sam Rio'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL143')
);

INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Sam Rio'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL143')
);

INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Sam Rio'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL37')
);

-- Jessica James
INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Jessica James'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL143')
);

INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Jessica James'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL122')
);

-- Ana Janco
INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Ana Janco'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL222')
);

-- Jennifer Cortez
INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Jennifer Cortez'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL222')
);

-- Christian Janco
INSERT INTO FlightBooking (customer_id, flight_id)
VALUES (
    (SELECT customer_id FROM Customer WHERE name = 'Christian Janco'),
    (SELECT flight_id FROM Flight WHERE flight_number = 'DL222')
);