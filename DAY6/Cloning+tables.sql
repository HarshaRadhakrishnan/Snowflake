SELECT * FROM OUR_FIRST_DB.PUBLIC.CUSTOMERS;

CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.CUSTOMERS (
    CUSTOMER_ID INT AUTOINCREMENT,
    FIRST_NAME STRING,
    LAST_NAME STRING,
    EMAIL STRING,
    PHONE STRING,
    CITY STRING,
    COUNTRY STRING,
    CREATED_AT TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

INSERT INTO OUR_FIRST_DB.PUBLIC.CUSTOMERS 
(FIRST_NAME, LAST_NAME, EMAIL, PHONE, CITY, COUNTRY)
VALUES
('Aarav', 'Patel', 'aarav.patel@example.com', '9876543210', 'Mumbai', 'India'),
('Diya', 'Sharma', 'diya.sharma@example.com', '9123456789', 'Delhi', 'India'),
('Raj', 'Kumar', 'raj.kumar@example.com', '9988776655', 'Chennai', 'India'),
('Meera', 'Nair', 'meera.nair@example.com', '9876501234', 'Bangalore', 'India'),
('Karan', 'Singh', 'karan.singh@example.com', '9876123456', 'Hyderabad', 'India'),
('Ananya', 'Reddy', 'ananya.reddy@example.com', '9944332211', 'Pune', 'India'),
('Rohit', 'Mehta', 'rohit.mehta@example.com', '9812345678', 'Ahmedabad', 'India'),
('Sneha', 'Pillai', 'sneha.pillai@example.com', '9900123456', 'Kochi', 'India'),
('Vikram', 'Das', 'vikram.das@example.com', '9887766554', 'Kolkata', 'India'),
('Priya', 'Iyer', 'priya.iyer@example.com', '9797979797', 'Coimbatore', 'India');

CREATE TABLE OUR_FIRST_DB.PUBLIC.CUSTOMERS_CLONE
CLONE OUR_FIRST_DB.PUBLIC.CUSTOMERS;


// Validate the data
SELECT * FROM OUR_FIRST_DB.PUBLIC.CUSTOMERS_CLONE;


// Update cloned table

UPDATE OUR_FIRST_DB.public.CUSTOMERS_CLONE
SET LAST_NAME = NULL;

SELECT * FROM OUR_FIRST_DB.PUBLIC.CUSTOMERS ;

SELECT * FROM OUR_FIRST_DB.PUBLIC.CUSTOMERS_CLONE;






// Cloning a temporary table is not possible
CREATE OR REPLACE TEMPORARY TABLE OUR_FIRST_DB.PUBLIC.TEMP_TABLE(
  id int);

CREATE TEMPORARY TABLE OUR_FIRST_DB.PUBLIC.TABLE_COPY
CLONE OUR_FIRST_DB.PUBLIC.TEMP_TABLE;

SELECT * FROM OUR_FIRST_DB.PUBLIC.TABLE_COPY;

