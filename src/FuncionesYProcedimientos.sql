/* Funciones */
DELIMITER $$
CREATE FUNCTION fcNamesEmployee(p_id_employee int)
RETURNS varchar(60)
BEGIN
DECLARE names_employee varchar(60);
SELECT CONCAT(first_name, ' ', last_name)
INTO names_employee FROM employees
WHERE employee_id = p_id_employee;
RETURN names_employee;
END $$
DELIMITER ;

SELECT fcNamesEmployee(100) AS employee;
DROP FUNCTION fcNamesEmployee;

/* Procedimientos Almacenados */
DELIMITER $$
CREATE PROCEDURE pcSearchRegionByCountry(p_name_country varchar(60))
BEGIN
SELECT r.region_id, r.region_name, c.country_name
FROM regions AS r INNER JOIN countries AS c
ON r.region_id = c.region_id
WHERE c.country_name = p_name_country;
END $$
DELIMITER ;

CALL pcSearchRegionByCountry('Switzerland');
DROP PROCEDURE IF EXISTS pcSearchRegionByCountry;

/* CASE */
DELIMITER $$
CREATE PROCEDURE pcCaseJobSalary(p_id_job int)
BEGIN
DECLARE salary decimal(8,2);

SELECT min_salary into salary FROM jobs WHERE job_id = p_id_job;

CASE
WHEN salary >= 6000 THEN
	SELECT job_title, min_salary, 'GOOD JOB'
    FROM jobs WHERE job_id = p_id_job;
ELSE
	SELECT job_title, min_salary, 'BAD JOB'
    FROM jobs WHERE job_id = p_id_job;
END CASE;

END $$
DELIMITER ;

CALL pcCaseJobSalary(17);
DROP PROCEDURE IF EXISTS pcCaseJobSalary;