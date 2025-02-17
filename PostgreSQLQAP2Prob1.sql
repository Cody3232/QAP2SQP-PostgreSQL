/*
-- Table creation for students
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    school_enrollment_date DATE
);

-- Table creation for professors
CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(100)
);

-- Table creation for courses
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    course_description VARCHAR(200),
    professor_id INT REFERENCES professors(id)
);

-- Table creation for enrollments (composite primary key)
CREATE TABLE enrollments (
    student_id INT REFERENCES students(id),
    course_id INT REFERENCES courses.id,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id)
);

-- Data insertion for students
INSERT INTO students (first_name, last_name, email, school_enrollment_date) 
VALUES 
('John', 'Lennon', 'john@example.com', '2022-09-05'),
('Freddie', 'Mercury', 'freddie@example.com', '2021-11-18'),
('Elton', 'John', 'elton@example.com', '2023-04-25'),
('Aretha', 'Franklin', 'aretha@example.com', '2023-06-12'),
('David', 'Bowie', 'david@example.com', '2022-12-28');

-- Data insertion for professors
INSERT INTO professors (first_name, last_name, department) 
VALUES 
('John', 'Lennon', 'Music'),
('Freddie', 'Mercury', 'Music'),
('Elton', 'John', 'Music'),
('Aretha', 'Franklin', 'Music');

-- Data insertion for courses
INSERT INTO courses (course_name, course_description, professor_id) 
VALUES 
('Rock History 101', 'A deep dive into the history of rock and roll music', 1),
('Vocal Performance 101', 'Mastering the art of singing and vocal techniques', 2),
('Experimental Sound 101', 'Exploring non-traditional approaches to music production', 3);

--  Fixed enrollments (removed incorrect Freddie Mercury entry and duplicate John Lennon)
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES 
(1, 1, '2022-09-05'),  -- John Lennon enrolled in Rock History 101
(2, 2, '2021-11-18'),  -- Freddie Mercury enrolled in Vocal Performance 101
(3, 3, '2023-04-25');  -- Elton John enrolled in Experimental Sound 101

-- Query to retrieve the full names of all students enrolled in "Rock History 101"
SELECT CONCAT(students.first_name, ' ', students.last_name) AS student_full_name
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.id
WHERE courses.course_name = 'Rock History 101';

-- Query to retrieve the course names and corresponding professors' full names
SELECT courses.course_name, CONCAT(professors.first_name, ' ', professors.last_name) AS professor_full_name
FROM courses
JOIN professors ON courses.professor_id = professors.id;

-- Query to retrieve all courses that have students enrolled
SELECT DISTINCT courses.course_name
FROM courses
JOIN enrollments ON courses.id = enrollments.course_id;

-- Update query to update a student's email (example: student with ID 1)
UPDATE students
SET email = 'newemail@example.com'
WHERE id = 1;

-- Delete query to remove a student from a course (example: student with ID 1 from course with ID 1)
DELETE FROM enrollments
WHERE student_id = 1 AND course_id = 1;
*/

-- Retrieve names from "Rock History 101"
SELECT students.first_name || ' ' || students.last_name AS full_name
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.id
WHERE courses.course_name = 'Rock History 101';

