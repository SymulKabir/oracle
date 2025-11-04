-- Create the tables
CREATE TABLE taken (
  id NUMBER(30, 2) PRIMARY KEY,
  student VARCHAR2(100) NOT NULL,
  course VARCHAR2(100) NOT NULL
);

CREATE TABLE required (
  id NUMBER(30, 2) PRIMARY KEY,
  course VARCHAR2(100) NOT NULL
);

-- Insert data into taken table
INSERT INTO taken VALUES (1, 'Robert', 'Databases');
INSERT INTO taken VALUES (2, 'Robert', 'Programming Languages');
INSERT INTO taken VALUES (3, 'Susie', 'Databases');
INSERT INTO taken VALUES (4, 'Susie', 'Operating System');
INSERT INTO taken VALUES (5, 'Julie', 'Programming Languages');
INSERT INTO taken VALUES (6, 'Julie', 'Machine Learning');
INSERT INTO taken VALUES (7, 'Emilie', 'Operating System');

-- Insert data into required table
INSERT INTO required VALUES (1, 'Databases');
INSERT INTO required VALUES (2, 'Programming Languages');


-- Set width for columns for better display
COLUMN STUDENT FORMAT A15
COLUMN COURSE  FORMAT A25

-- Query to find students who have taken all required subjects
SELECT student 
FROM taken
MINUS
SELECT student 
FROM (
  SELECT student, course 
  FROM (SELECT student FROM taken), required
  MINUS
  SELECT student, course 
  FROM taken
);

-- Optimized query: find students who have taken all required courses
SELECT student
FROM taken
WHERE course IN (SELECT course FROM required)
GROUP BY student
HAVING COUNT(DISTINCT course) = (SELECT COUNT(*) FROM required);
