Author:
 Liliann Ulysse - liliann.ulysse@bison.howard.edu 
 Tolulope Oluyadi - Tolulope.Oluyadi@bison.howard.edu
 Asis Johnson - Asis.Johnson@bison.howard.edu

Instructions to Compile and Execute:
1. Download and install the MySQL Community Server found https://dev.mysql.com/downloads/mysql/
2. When you installed MySQL, you had the option to create a password for the root user. To connect to MySQL, type the following command into your terminal:
/usr/local/mysql/bin/mysql -u root -p
and type in the password.

If that does not work, try connecting from localhost. Type the following command into
your terminal:
/usr/local/mysql/bin/mysql -u root
3. Once you are connected to the MySQL Community server, type the source command followed by the pathway to db_project.sql. It should look something like this:
source /Users/admin/Documents/DB_project/db_project.sql

The tables of my database and the status of the query’s should appear in the terminal.



Test Cases:

1. Compute the grade for Student 1 in CRS 456
Expected: 92.21
Result: 92.0588235
Status: Passed

2. Compute the grade for Student 1 in CRS 456, where the lowest test score is dropped.
Expected: 93.00
Result: 93.0000000
Status: Passed

3. Add 2 points just to those students whose last name contains a ‘Q’. One of the student’s last name is ‘Queen’
Expected: Increase Stephen Queen’s (STU_ID = 4) points by 2
Result: Increased Stephen Queen’s points by 2
Status: Passed


4. Add 2 points to the score of each student on their CRS 456 Final Exam
Expected: Increase Final Exam points by 2
Result: Increased Final Exam points by 2
Status: Passed


5. Add a new assignment (HW3) to CRS 456
Expected: Add HW3 to CRS 456 assignment list 
Result: Added HW3 to CRS 456 assignment list 
Status: Passed

6. Change the percentages of the categories for a CRS 456
Expected: Participation = 5, HW = 25, Tests = 45, Projects = 25
Result: Participation = 5, HW = 25, Tests = 45, Projects = 25
Status: Passed

7. Compute the average/highest/lowest score of ASSIGNMENT_ID = 3 for CRS 456
Expected: AVG = 85, MAX = 100, MIN = 70
Result: AVG = 85.0000, MAX = 100, MIN = 70
Status: Passed

8. Insert a non-unique field as a unique key into tables. Tested on Course, Student and Category tables.
Expected: Throws an error
Result: Throws an error
Status: Passed

9. Query a table that does not exist.
Expected: Throws an error
Result: Throws an error
Status: Passed

10. Query a key that does not exist. Tested on Course, Student, Assignment, Scores, Category
Expected: Throws an error
Result: Throws an error
Status: Passed

11. Select column from a table that does not exist. Tested on Student, Assignment, and Category
Expected: Throws an error
Result: Throws an error
Status: Passed

12. Select row from a table that does not exist. Tested on Student, Assignment, and Category
Expected: Throws an error
Result: Throws an error
Status: Passed

