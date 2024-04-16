CREATE DATABASE IF NOT EXISTS `gradebook` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gradebook`;

-- Task 2: Write the commands for creating tables and inserting values
 CREATE TABLE `Course` (
  `CRS_ID` int NOT NULL,
  `CRS_NAME` varchar(45) NOT NULL,
  `CRS_NUM` int NOT NULL,
  `DEPT_NAME` varchar(45) NOT NULL,
  `SEMESTER_TERM` varchar(45) NOT NULL,
  `YEAR` int NOT NULL,
  PRIMARY KEY (`CRS_ID`),
  UNIQUE KEY `CRS_ID_UNIQUE` (`CRS_ID`),
  UNIQUE KEY `CRS_NUM_UNIQUE` (`CRS_NUM`)

CREATE TABLE `Student` (
  `STU_ID` int NOT NULL AUTO_INCREMENT,
  `STU_LNAME` varchar(45) NOT NULL,
  `STU_FNAME` varchar(45) NOT NULL,
  `STU_EMAIL` varchar(45) NOT NULL,
  PRIMARY KEY (`STU_ID`),
  UNIQUE KEY `STU_ID_UNIQUE` (`STU_ID`),
  UNIQUE KEY `STU_EMAIL_UNIQUE` (`STU_EMAIL`)
);

CREATE TABLE `Enroll` (
  `CRS_ID` int NOT NULL,
  `STU_ID` int NOT NULL,
  PRIMARY KEY (`CRS_ID`,`STU_ID`),
  CONSTRAINT `FK_Enroll_Course_CRS_ID` FOREIGN KEY (`CRS_ID`) REFERENCES `Course` (`CRS_ID`),
  CONSTRAINT `FK_Enroll_Student_STU_ID` FOREIGN KEY (`STU_ID`) REFERENCES `Student` (`STU_ID`)
);

CREATE TABLE `Category` (
  `CATEGORY_ID` int NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(45) NOT NULL,
  `CATEGORY_WEIGHT` int NOT NULL,
  `CRS_ID` int NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  UNIQUE KEY `CATEGORY_ID_UNIQUE` (`CATEGORY_ID`),
  CONSTRAINT `FK_Category_Course_CRS_ID` FOREIGN KEY (`CRS_ID`) REFERENCES `Course` (`CRS_ID`)
);

CREATE TABLE `Assignment` (
    `ASGMT_ID` INT NOT NULL AUTO_INCREMENT,
    `ASGMT_NAME` VARCHAR(45) DEFAULT NULL,
    `ASGMT_TOTAL_PTS` INT NOT NULL,
    `CATEGORY_ID` INT NOT NULL,
    PRIMARY KEY (`ASGMT_ID`),
    UNIQUE KEY `ASGMT_ID_UNIQUE` (`ASGMT_ID`),
    CONSTRAINT `FK_Assignment_Category_CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`)
        REFERENCES `Category` (`CATEGORY_ID`)
);

CREATE TABLE `Scores` (
  `CRS_ID` int NOT NULL,
  `ASGMT_ID` int NOT NULL,
  `STU_ID` int NOT NULL,
  `STU_PTS` int NOT NULL,
  PRIMARY KEY (`CRS_ID`,`ASGMT_ID`, `STU_ID`),
  CONSTRAINT `FK_Scores_Course_ASGMT_ID` FOREIGN KEY (`CRS_ID`) REFERENCES `Course` (`CRS_ID`),
  CONSTRAINT `FK_Scores_Assignment_ASGMT_ID` FOREIGN KEY (`ASGMT_ID`) REFERENCES `Assignment` (`ASGMT_ID`),
  CONSTRAINT `FK_Scores_Student_STU_ID` FOREIGN KEY (`STU_ID`) REFERENCES `Student` (`STU_ID`)
);

INSERT INTO `Course` VALUES(123, 'Database Systems', 401,'Computer Science', 'Spring', 2021);
INSERT INTO `Course` VALUES(102, 'Machine Learning', 402, 'Computer Science','Fall', 2021);

INSERT INTO `Student`(STU_LNAME, STU_FNAME, STU_EMAIL) VALUES('Alvardo', 'Stephanie', ' sa@bison.howard.edu');
INSERT INTO `Student`(STU_LNAME, STU_FNAME, STU_EMAIL) VALUES('Miller', 'Luther', 'lm@bison.howard.edu');
INSERT INTO `Student`(STU_LNAME, STU_FNAME, STU_EMAIL) VALUES('Bell', 'Dana', 'db@bison.howard.edu');
INSERT INTO `Student`(STU_LNAME, STU_FNAME, STU_EMAIL) VALUES('Queen', 'Stephen', 'sq@bison.howard.edu');
INSERT INTO `Student`(STU_LNAME, STU_FNAME, STU_EMAIL) VALUES('Lambert', 'Nina', 'nl@bison.howard.edu');
INSERT INTO `Student`(STU_LNAME, STU_FNAME, STU_EMAIL) VALUES('Washington', 'Dixie', 'dw@bison.howard.edu');
INSERT INTO `Student`(STU_LNAME, STU_FNAME, STU_EMAIL) VALUES('Sapinoso', 'Eric', 'es@bison.howard.edu');

-- Enrollment for CRS 456
INSERT INTO `Enroll` VALUES(456, 1);
INSERT INTO `Enroll` VALUES(456, 2);
INSERT INTO `Enroll` VALUES(456, 3);
INSERT INTO `Enroll` VALUES(456, 4);
INSERT INTO `Enroll` VALUES(456, 5);
INSERT INTO `Enroll` VALUES(456, 6);

-- Enrollment for CRS 123
INSERT INTO `Enroll` VALUES(123, 1);
INSERT INTO `Enroll` VALUES(123, 7);

-- Categories for CRS 456
INSERT INTO `Category`(CATEGORY_NAME, CATEGORY_WEIGHT, CRS_ID) VALUES('Participation', 10, 456);
INSERT INTO `Category`(CATEGORY_NAME, CATEGORY_WEIGHT, CRS_ID) VALUES('Homework', 20, 456);
INSERT INTO `Category`(CATEGORY_NAME, CATEGORY_WEIGHT, CRS_ID) VALUES('Tests', 50, 456);
INSERT INTO `Category`(CATEGORY_NAME, CATEGORY_WEIGHT, CRS_ID) VALUES('Projects', 20, 456);

-- Categories for CRS 123
INSERT INTO `Category`(CATEGORY_NAME, CATEGORY_WEIGHT, CRS_ID) VALUES('Project', 100, 123);

-- Assignments for CRS 456
INSERT INTO `Assignment`(ASGMT_NAME, ASGMT_TOTAL_PTS, CATEGORY_ID) VALUES('HW1', 20, 2);
INSERT INTO `Assignment`(ASGMT_NAME, ASGMT_TOTAL_PTS, CATEGORY_ID) VALUES('HW2', 20, 2);
INSERT INTO `Assignment`(ASGMT_NAME, ASGMT_TOTAL_PTS, CATEGORY_ID) VALUES('Midterm', 100, 3);
INSERT INTO `Assignment`(ASGMT_NAME, ASGMT_TOTAL_PTS, CATEGORY_ID) VALUES('Project 1', 50, 4);
INSERT INTO `Assignment`(ASGMT_NAME, ASGMT_TOTAL_PTS, CATEGORY_ID) VALUES('Semester Participation', 50, 1);
INSERT INTO `Assignment`(ASGMT_NAME, ASGMT_TOTAL_PTS, CATEGORY_ID) VALUES('Final', 100, 3);

-- Assignments for CRS 123
INSERT INTO `Assignment`(ASGMT_NAME, ASGMT_TOTAL_PTS, CATEGORY_ID) VALUES('Final Project', 300, 5);

-- Scores for CRS 456
INSERT INTO `Scores` VALUES(456, 1, 1, 15);
INSERT INTO `Scores` VALUES(456, 2, 1, 20);
INSERT INTO `Scores` VALUES(456, 3, 1, 90);
INSERT INTO `Scores` VALUES(456, 4, 1, 45);
INSERT INTO `Scores` VALUES(456, 5, 1, 50);
INSERT INTO `Scores` VALUES(456, 6, 1, 98);
INSERT INTO `Scores` VALUES(456, 1, 2, 20);
INSERT INTO `Scores` VALUES(456, 2, 2, 17);
INSERT INTO `Scores` VALUES(456, 3, 2, 85);
INSERT INTO `Scores` VALUES(456, 4, 2, 50);
INSERT INTO `Scores` VALUES(456, 5, 2, 45);
INSERT INTO `Scores` VALUES(456, 6, 2, 90);
INSERT INTO `Scores` VALUES(456, 1, 3, 10);
INSERT INTO `Scores` VALUES(456, 2, 3, 12);
INSERT INTO `Scores` VALUES(456, 3, 3, 70);
INSERT INTO `Scores` VALUES(456, 4, 3, 30);
INSERT INTO `Scores` VALUES(456, 5, 3, 40);
INSERT INTO `Scores` VALUES(456, 6, 3, 75);
INSERT INTO `Scores` VALUES(456, 1, 4, 18);
INSERT INTO `Scores` VALUES(456, 2, 4, 19);
INSERT INTO `Scores` VALUES(456, 3, 4, 100);
INSERT INTO `Scores` VALUES(456, 4, 4, 48);
INSERT INTO `Scores` VALUES(456, 5, 4, 50);
INSERT INTO `Scores` VALUES(456, 6, 4, 95);
INSERT INTO `Scores` VALUES(456, 1, 5, 12);
INSERT INTO `Scores` VALUES(456, 2, 5, 18);
INSERT INTO `Scores` VALUES(456, 3, 5, 85);
INSERT INTO `Scores` VALUES(456, 4, 5, 35);
INSERT INTO `Scores` VALUES(456, 5, 5, 50);
INSERT INTO `Scores` VALUES(456, 6, 5, 60);
INSERT INTO `Scores` VALUES(456, 1, 6, 20);
INSERT INTO `Scores` VALUES(456, 2, 6, 15);
INSERT INTO `Scores` VALUES(456, 3, 6, 80);
INSERT INTO `Scores` VALUES(456, 4, 6, 45);
INSERT INTO `Scores` VALUES(456, 5, 6, 50);
INSERT INTO `Scores` VALUES(456, 6, 6, 100);

-- Scores for CRS 123
INSERT INTO `Scores` VALUES(123, 7, 1, 290);
INSERT INTO `Scores` VALUES(123, 7, 7, 280);

-- Task 3: Show the tables with the contents that you have inserted
SELECT * FROM Course;
SELECT * FROM Student;
SELECT * FROM Enroll;
SELECT * FROM Category;
SELECT * FROM Assignment;
SELECT * FROM Scores;

-- Task 4: Compute the average/highest/lowest score of an assignment
SELECT a.ASGMT_ID, AVG(s.STU_PTS), MAX(s.STU_PTS), MIN(s.STU_PTS)
FROM Assignment a JOIN Scores s ON a.ASGMT_ID = s.ASGMT_ID
WHERE s.CRS_ID = 456 AND a.ASGMT_ID = 3;

-- Task 5: List all of the students in a given course
SELECT s.STU_ID, s.STU_FNAME, s.STU_LNAME, s.STU_EMAIL 
FROM Student s JOIN Enroll e ON s.STU_ID = e.STU_ID
WHERE e.CRS_ID = 456;

-- Task 6: List all of the students in a course and all of their scores on every assignment
SELECT s.STU_ID, s.STU_FNAME, s.STU_LNAME, s.STU_EMAIL, sc.ASGMT_ID, sc.STU_PTS 
FROM Student s INNER JOIN Enroll e ON s.STU_ID = e.STU_ID
    INNER JOIN Scores sc ON
        sc.STU_ID = e.STU_ID
WHERE e.CRS_ID = 456;

-- Task 7: Add an assignment to a course
INSERT INTO `Assignment`(ASGMT_NAME, ASGMT_TOTAL_PTS, CATEGORY_ID) VALUES('HW3', 20, 2);

-- Show new Assignment table
SELECT * FROM Assignment;

-- Task 8: Change the percentages of the categories for a course;
UPDATE Category 
SET 
    CATEGORY_WEIGHT = CASE CATEGORY_ID
        WHEN 1 THEN 5
        WHEN 2 THEN 25
        WHEN 3 THEN 45
        WHEN 4 THEN 25
        ELSE CATEGORY_WEIGHT
    END
WHERE
    CRS_ID = 456 AND CATEGORY_ID IN (1 , 2, 3, 4);

-- Show new Category table
SELECT * FROM Category c
WHERE c.CRS_ID = 456;

-- Task 9: Add 2 points to the score of each student on an assignment;
UPDATE Scores 
SET 
    STU_PTS = STU_PTS + 2
WHERE
    CRS_ID = 456 AND ASGMT_ID = 6;
    
-- Show new Scores Table for Assignment 6
SELECT CRS_ID, ASGMT_ID, STU_ID, STU_PTS FROM Scores
WHERE CRS_ID = 456 AND ASGMT_ID = 6;

-- Task 10: Add 2 points just to those students whose last name contains a ‘Q’;
UPDATE Scores sc
        INNER JOIN
    Student st ON sc.STU_ID = st.STU_ID 
SET 
    sc.STU_PTS = sc.STU_PTS + 2
WHERE
	CRS_ID = 456 AND st.STU_LNAME LIKE '%q%';

    
-- Show new Scores Table for STU_ID=4
SELECT 
    CRS_ID, ASGMT_ID, STU_ID, STU_PTS
FROM
    Scores
WHERE
    CRS_ID = 456 AND STU_ID = 4;

-- Task 11: Compute the grade for a student;
SELECT 
    s.CRS_ID,
    s.STU_ID,
    SUM(((s.STU_PTS / a.ASGMT_TOTAL_PTS) * 100) * (ca.CATEGORY_WEIGHT)) / SUM(ca.CATEGORY_WEIGHT) AS Final_Grade
FROM
    Scores s
        LEFT JOIN
    Assignment a ON s.ASGMT_ID = a.ASGMT_ID
        JOIN
    Category ca ON ca.CATEGORY_ID = a.CATEGORY_ID
WHERE
    s.CRS_ID = 456 AND STU_ID = 1;

-- Task 12: Compute the grade for a student, where the lowest score for a given category is dropped.
-- Lowest Test score is dropped
SELECT 
    s.CRS_ID,
    s.STU_ID,
    SUM(((s.STU_PTS / a.ASGMT_TOTAL_PTS) * 100) * (ca.CATEGORY_WEIGHT)) / SUM(ca.CATEGORY_WEIGHT) AS Dropped_Score_Grade
FROM
    Scores s
        LEFT JOIN
    Assignment a ON s.ASGMT_ID = a.ASGMT_ID
        JOIN
    Category ca ON ca.CATEGORY_ID = a.CATEGORY_ID
WHERE
    s.CRS_ID = 456 AND STU_ID = 1
        AND STU_PTS NOT IN (SELECT 
            MIN(s.STU_PTS)
        FROM
            Scores s
                LEFT JOIN
            Assignment a ON s.ASGMT_ID = a.ASGMT_ID
                JOIN
            Category ca ON ca.CATEGORY_ID = a.CATEGORY_ID
        WHERE
            a.CATEGORY_ID = 3 AND s.CRS_ID = 456
                AND STU_ID = 1);
                