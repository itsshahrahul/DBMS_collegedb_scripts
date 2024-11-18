/* @author: Rahul Shah 
     @date: 2024/07/10 
     @rollNumber: 1225
     @courseCode: 225
*/

-Data Definition Language(DDL)

CREATE DATABASE collegedb;

use collegedb;

 CREATE TABLE Course(c_code INT(5), c_name VARCHAR(25), c_credit INT(3), c_duration INT(2));

RENAME TABLE Course to Courses;

SHOW TABLES;

DESC TABLES;

ALTER TABLE Course to Courses; 

SHOW TABLES;

DESC Courses;

ALTER TABLE Courses ADD PRIMARY KEY (c_code);

ALTER TABLE Courses ADD total_fee INT(10);

---does not work--
ALTER TABLE Courses RENAME COLUMN total_fee TO c_fee;

ALTER TABLE Courses CHANGE COLUMN `total_fee` `c_fee`  INT(10);

CREATE TABLE Students (roll_number INT(5) PRIMARY KEY, name VARCHAR(30) NOT NULL, email VARCHAR(30) UNIQUE, course_code INT(5) NOT NULL, FOREIGN KEY (course_code) REFERENCES Courses (c_code));

CREATE TABLE Subjects (s_code INT(5) PRIMARY KEY, s_name VARCHAR(25) , s_credit INT(3));
ALTER TABLE Subjects ALTER s_credit SET DEFAULT 3;

CREATE TABLE Course_Subjects (course_code INT(5), subject_code INT(5), PRIMARY KEY (course_code, subject_code), FOREIGN KEY (course_code) REFERENCES Courses (c_code), FOREIGN KEY (subject_code) REFERENCES Subjects (s_code));


Data Manipulation Language (DML)
---------------------------------------------------
INSERT INTO courses(c_code,c_name,c_credit,c_duration,c_fee) VALUES(1,"BCA",120,4,170000);

INSERT INTO courses VALUES(2,"BCA",120,4,160000);

 INSERT INTO courses VALUES(3,"BIM",120,4,150000),(4,"BIT",110,4,120000);

INSERT INTO students VALUES(1,"Ram Thapa","ram@gmail.com",1),(2,"Shyam Shrestha","shyam@gmail.com",2),(3,"Sita","sita@gmail.com",2),(4,"Hari Gautam","hari@gmail.com",1),(5,"Krishna Shrestha","krishna@gmail.com",3),(6,"Gita","gita@gmail.com",2);

INSERT INTO Subjects VALUES(1,"DBMS",3),(2,"SE",4),(3,"SL",3),(4,"DL",3);

INSERT INTO course_subjects VALUES(1,1),(1,2),(1,3),(1,4),(2,1),(3,1),(3,2),(3,3);

UPDATE courses SET c_credit=130,c_fee=1000000 WHERE c_code=1;

DELETE FROM courses WHERE c_code='4';

ALTER TABLE subjects ALTER s_credit SET DEFAULT 3;

INSERT INTO subjects(s_code,s_name) VALUES (5,"ABCD");



Data Query Language
------------------------------------------------------
Data Query Language(DQL)

SELECT FROM Courses;

SELECT  c_code,c_name FROM Courses;

SELECT * FROM Courses WHERE c code= 2;

SELECT * FROM Courses WHERE c_name="BCA";

SELECT* FROM Courses WHERE c_fee<1800006;

SELECT * FROM Courses WHERE c_fee<1800000 AND c_duration=3;

SELECT * FROM Students WHERE name LIKE 'a%';

SELECT * FROM Students ORDER BY name DESC;

SELECT COUNT(name) FROM Students;

SELECT AVG(c_fee) FROM Courses;

SELECT MIN(c_fee) FROM Courses;

SELECT FROM Courses WHERE c fee BETWEEN 1000000 AND 2000000;



 SELECT * FROM courses,students WHERE courses.c_code=students.course_code;
 SELECT * FROM courses,subjects,course_subjects WHERE courses.c_code=course_subjects.course_code AND subjects.s_code=course_subjects.subject_code;


SELECT c_name,s_name FROM courses JOIN course_subjects ON courses.c_code=course_subjects.course_code JOIN subjects ON subjects.s_code=course_subjects.subject_code;














