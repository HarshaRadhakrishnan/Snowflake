CREATE OR REPLACE TABLE students_details (
    student_id INT,
    student_name STRING,
    department STRING,
    marks INT,
    city STRING
);

INSERT INTO students_details (student_id, student_name, department, marks, city) VALUES
(1, 'Harsha', 'CSE', 85, 'Chennai'),
(2, 'Dhanushika', 'ECE', 78, 'Coimbatore'),
(3, 'Sakthi', 'IT', 92, 'Madurai'),
(4, 'Tanushmitha', 'EEE', 68, 'Trichy'),
(5, 'Kavin', 'CSE', 74, 'Salem'),
(6, 'Ananya', 'IT', 88, 'Chennai'),
(7, 'Vignesh', 'ECE', 95, 'Madurai'),
(8, 'Priya', 'EEE', 80, 'Trichy');

select * from students_details;
select * from students_details_with_grade;
select * from students_grade_count;

