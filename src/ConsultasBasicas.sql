/* Consultas Basicas */
SELECT * FROM employees;
SELECT * FROM jobs;
SELECT * FROM dependents WHERE employee_id = 206;
SELECT * FROM locations WHERE location_id = 1700;

/* Having */
SELECT street_address, city, state_province,
country_id FROM locations
HAVING country_id = 'UK';

/* Wildcard: % */
SELECT * FROM employees WHERE first_name LIKE '%hn';
SELECT * FROM employees WHERE first_name LIKE '%an%';
SELECT * FROM employees WHERE first_name NOT LIKE 'Ma%';

/* Wildcard: _ */
SELECT * FROM employees WHERE first_name LIKE '____a';
SELECT * FROM employees WHERE first_name LIKE '__am';