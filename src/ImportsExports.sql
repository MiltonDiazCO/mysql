/* IMPORTS */
SELECT * INTO OUTFILE 'C:/Users/00345/Desktop/export_jobs.txt'
FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n' FROM employees;

/* EXPORTS */
load data local infile 'C:/Users/00345/Escritorio/import_jobs.txt'
into table employees fields terminated by '|' lines terminated by '\r\n'
ignore 1 lines; /* Headers (OPTIONAL) */