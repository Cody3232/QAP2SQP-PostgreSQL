/*
In order to show all of my code, I just comented out the entire code in order to be able to display it all at once. It seemed like
in lectures we would just delete the current query and go from there. But I was unsure how that would work when handing in the QAP as that way you
might not be able to see my work? I am sure I am just having a brain fog type moment, it's totally fine, and I just made more work for myself. 
But i was unsure

-- Table creation for athletes
CREATE TABLE athletes (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Table creation for sports equipment
CREATE TABLE equipment (
    id SERIAL PRIMARY KEY,
    equipment_name VARCHAR(50),
    equipment_type VARCHAR(50)
);

-- Table creation for orders
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    athlete_id INT REFERENCES athletes(id),
    equipment_id INT REFERENCES equipment(id),
    order_date DATE
);

-- Data insertion for athletes
INSERT INTO athletes (first_name, last_name, email) 
VALUES 
('Tom', 'Brady', 'tom@example.com'),
('Sidney', 'Crosby', 'sidney@example.com'),
('Mike', 'Trout', 'mike@example.com'),
('LeBron', 'James', 'lebron@example.com'),
('Stephen', 'Curry', 'stephen@example.com');

-- Data insertion for equipment
INSERT INTO equipment (equipment_name, equipment_type) 
VALUES 
('Football', 'Ball'),
('Hockey Stick', 'Stick'),
('Baseball Bat', 'Bat');

-- Data insertion for orders
INSERT INTO orders (athlete_id, equipment_id, order_date)
VALUES 
(1, 1, '2023-09-10'),  -- Brady orders a football
(2, 2, '2023-11-15'),  -- Crosby orders a hockey stick
(3, 3, '2023-08-20');  -- Trout orders a baseball bat

-- Query to retrieve the full names of athletes who ordered a "Football"
SELECT athletes.first_name || ' ' || athletes.last_name AS athlete_full_name
FROM athletes
JOIN orders ON athletes.id = orders.athlete_id
JOIN equipment ON orders.equipment_id = equipment.id
WHERE equipment.equipment_name = 'Football';

-- Query to retrieve the equipment names and corresponding athletes' full names
SELECT equipment.equipment_name, athletes.first_name || ' ' || athletes.last_name AS athlete_full_name
FROM equipment
JOIN orders ON equipment.id = orders.equipment_id
JOIN athletes ON orders.athlete_id = athletes.id;

-- Query to retrieve all equipment ordered by athletes
SELECT DISTINCT equipment.equipment_name
FROM equipment
JOIN orders ON equipment.id = orders.equipment_id;

-- Update query to update an athlete's email
UPDATE athletes
SET email = 'newtomemail@example.com'
WHERE id = 1;

-- Delete query to remove an athlete's order for equipment
DELETE FROM orders
WHERE athlete_id = 1 AND equipment_id = 1;



