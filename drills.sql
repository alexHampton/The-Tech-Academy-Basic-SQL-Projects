
/* DRILL 1: Compose a SELECT staement that queries for 
 * all information from the habitat table */

SELECT * FROM tbl_habitat;

/* DRILL 2: Retrieve all names from the species_name 
 * column that have a species_order value of 3 */

SELECT species_name FROM tbl_species WHERE species_order = 3;

/* DRILL 3: Retrieve only the nutrition_type from the 
 * nutrition table that have a nutrition_cost of 600.00 or less */

SELECT nutrition_type, * FROM tbl_nutrition WHERE nutrition_cost <= 600;

/* DRILL 4: Retrieve all species_names with the nutrition_id between 
 * 2202 and 2206 from the nutrition table. *NOTE* This could have been 
 * done without a join by using the species_nutrition column */

SELECT species_name FROM tbl_species t1 
INNER JOIN tbl_nutrition t2 ON t2.nutrition_id = t1.species_nutrition
WHERE t2.nutrition_id BETWEEN 2202 AND 2206;

/* DRILL 5: Retrieve all names within the species_name column useing the 
 * alias "Species Name:" from the species table and their corresponding 
 * nutrition_type under the alias "Nutrition Type:" from the nutrition table. */

SELECT species_name 'Species Name:', species_nutrition AS 'Nutrition Type:' FROM tbl_species;

/* DRILL 6: From the specialist table, retieve the first and last name and 
contact number of those that provide care for the penguins from the species table. */ 

SELECT ts1.specialist_fname, ts1.specialist_lname, ts1.specialist_contact  FROM tbl_care tc
LEFT JOIN tbl_specialist ts1 ON ts1.specialist_id = tc.care_specialist
INNER JOIN tbl_species ts2 ON ts2.species_care = tc.care_id
WHERE ts2.species_name = 'penguin';

/* DRILL 7: Create a database with two tables
 * assign a FOREIGN KEY CONSTRAINT on one table that shares related data with the PRIMARY KEY on the second table
 * Create a statement that queries data from both tables. */

CREATE TABLE tbl_regions (
	regions_id INT PRIMARY KEY NOT NULL IDENTITY (1, 1),
	regions_name VARCHAR(20) NOT NULL,
	regions_hq VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_employees (
	employee_id INT PRIMARY KEY NOT NULL IDENTITY (1001, 1),
	employee_fname VARCHAR(50) NOT NULL,
	employee_lname VARCHAR(50) NOT NULL,
	employee_region INT NOT NULL CONSTRAINT fk_region_id FOREIGN KEY REFERENCES tbl_regions(regions_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_regions
	(regions_name, regions_hq)
	VALUES
	('Southwest', 'Los Angeles'),
	('Northwest','Seattle'),
	('Midwest', 'Tulsa'),
	('Northeast', 'Philadelphia'),
	('Southeast', 'Jacksonville')
;

INSERT INTO tbl_employees
	(employee_fname, employee_lname, employee_region)
	VALUES
	('Charles', 'Washington', 2),
	('Allie', 'Arizona', 1),
	('Faye', 'Florida', 5),
	('Oscar', 'Oklahoma', 3),
	('Phil', 'Penn', 4),
	('One', 'More', 3)
;

select * from tbl_regions;
select * from tbl_employees;

SELECT e.employee_id, e.employee_lname, r.regions_hq FROM tbl_employees e
INNER JOIN tbl_regions r ON r.regions_id = e.employee_region;