/* Consulta Multitabla */
SELECT e.first_name, e.last_name, e.email,
d.department_name, j.job_title
FROM jobs j INNER JOIN employees e ON j.job_id = e.job_id
INNER JOIN departments d ON d.department_id = e.department_id
ORDER BY e.first_name;

/* Subconsultas */
SELECT first_name, last_name, email, salary FROM employees
WHERE employee_id IN (SELECT employee_id FROM employees WHERE salary >= 10000);

/* Agrupación de registros */
SELECT d.department_id, d.department_name,
COUNT(e.employee_id) AS number_employees
FROM departments d INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY e.department_id
ORDER BY number_employees DESC;