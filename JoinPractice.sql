CREATE TABLE Food_3 (
	ID_F INT PRIMARY KEY NOT NULL IDENTITY,
	Food VARCHAR(10)
);

CREATE TABLE Colors_2 (
	ID_C INT PRIMARY KEY NOT NULL IDENTITY,
	Color varchar(10)
);

CREATE TABLE People_1 (
	ID_P INT PRIMARY KEY NOT NULL IDENTITY,
	Name varchar(20) NOT NULL,
	Food_ID INT CONSTRAINT fk_ID_F FOREIGN KEY REFERENCES Food_3(ID_F) ON UPDATE CASCADE ON DELETE CASCADE,
	Color_ID INT CONSTRAINT fk_ID_C FOREIGN KEY REFERENCES Colors_2(ID_C) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Food_3
	(Food)
	VALUES
	('Pizza'),
	('Burger'),
	('Sushi')
;

INSERT INTO Colors_2
	(Color)
	values
	('red'),
	('green'),
	('blue'),
	('pink'),
	('purple'),
	('mauve'),
	('orange'),
	('yellow'),
	('indigo')
;

INSERT INTO People_1
	(Name, Color_ID, Food_ID)
	VALUES
	('Steve', 1, NULL),
	('Aaron', 3, NULL),
	('Mary', 2, NULL),
	('Fred', 1, NULL),
	('Anne', 5, NULL),
	('Beth', 8, 1),
	('Johnny', NULL, 1),
	('Karen', NULL, 2)
;

--SELECT from two tables
select * from People_1
select * from Colors_2

-- INNER JOIN
SELECT * FROM People_1 P1
INNER JOIN Colors_2 C2
ON P1.Color_ID = C2.ID_C

-- LEFT OUTER JOIN
SELECT * FROM People_1 P1
LEFT OUTER JOIN Colors_2 C2
ON P1.Color_ID = C2.ID_C

-- RIGHT OUTER JOIN
SELECT * FROM People_1 P1
RIGHT OUTER JOIN Colors_2 C2
ON P1.Color_ID = C2.ID_C

-- SEMI JOIN
SELECT * FROM People_1 P1
WHERE EXISTS (SELECT 1 
				FROM Colors_2 C2
				WHERE P1.Color_ID = C2.ID_C
			);

-- ANTI SEMI JOIN
SELECT * FROM People_1 P1
WHERE NOT EXISTS (SELECT 1
					FROM Colors_2 C2
					WHERE P1.Color_ID = C2.ID_C
					);

-- LEFT OUTER JOIN WITH EXCLUSION
SELECT * FROM People_1 P1
LEFT OUTER JOIN Colors_2 C2
ON C2.ID_C = P1.Color_ID
WHERE C2.ID_C IS NULL;

-- FULL OUTER JOIN
SELECT * FROM People_1 P1
FULL OUTER JOIN Colors_2 C2
ON P1.Color_ID = C2.ID_C

-- CROSS JOIN
SELECT * FROM People_1 P1
CROSS JOIN Colors_2 C2;

-- FULL OUTER JOIN WITH EXCLUSION
SELECT * FROM People_1 P1
FULL OUTER JOIN Colors_2 C2
ON P1.Color_ID = C2.ID_C
WHERE P1.Color_ID IS NULL
OR C2.ID_C IS NULL;

-- NON-EQUI INNER JOIN
SELECT * FROM People_1 P1
INNER JOIN Colors_2 C2
ON P1.Color_ID >= C2.ID_C;





-- TWO FULL OUTER JOINS
SELECT * FROM People_1 P1
FULL OUTER JOIN Colors_2 C2
	ON P1.Color_ID = C2.ID_C
FULL OUTER JOIN Food_3 F3
	ON P1.Food_ID = F3.ID_F;

-- TWO INNER JOINS
SELECT * FROM People_1 P1
INNER JOIN Colors_2 C2 ON P1.Color_ID = C2.ID_C
INNER JOIN Food_3 F3 ON P1.Food_ID = F3.ID_F;

-- TWO LEFT OUTER JOINS
SELECT * FROM People_1 P1
LEFT OUTER JOIN Colors_2 C2 ON P1.Color_ID = C2.ID_C
LEFT OUTER JOIN Food_3 F3 ON P1.Food_ID = F3.ID_F;

-- INNER JOIN AND A LEFT OUTER JOIN
SELECT * FROM People_1 P1
INNER JOIN Colors_2 C2 ON P1.Color_ID = C2.ID_C
LEFT OUTER JOIN Food_3 F3 ON P1.Food_ID = F3.ID_F;

