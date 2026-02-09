USE db;

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department(
 DeptID INT PRIMARY KEY AUTO_INCREMENT,
 DeptName VARCHAR(50) NOT NULL,
 Location VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE Employees(
 EmpID INT PRIMARY KEY AUTO_INCREMENT,
 FirstName VARCHAR(50) NOT NULL,
 LastName VARCHAR(50) NOT NULL,
 DeptID INT,
 Salary DECIMAL(10,2),
 HireDate DATE,
 JobTitle VARCHAR(50),
 FOREIGN KEY(DeptID) REFERENCES Department(DeptID)
) ENGINE=InnoDB;



SELECT "Part-1";

INSERT INTO Department VALUES (7,'Engineering','San Francisco');
INSERT INTO Department (DeptName,Location) VALUES ('HR','Chicago'),('Sales','London'),('Marketing','Austin'),('Operations','Boston'),('Research','Boston');

INSERT INTO Employees(EmpID,FirstName,LastName,JobTitle,Salary) VALUES (101,'Alice','Johnson','Analyst',65000);

INSERT INTO Employees (FirstName,LastName,DeptID) VALUES ('Rahul','Raj',(SELECT DeptID FROM Department WHERE DeptName='Sales'));

INSERT INTO Employees(FirstName, LastName, Salary) VALUES ('Tarzon','Davis',5000*12);

INSERT INTO Employees(FirstName,LastName,JobTitle) VALUES ('Zohan','Haibin','Trainee'),('Jakes','Samuel','Trainee'),('Alex','Thomas','Trainee');

INSERT INTO Employees(EmpID,FirstName,LastName,Salary) VALUES (201,'Tovino','Thomas',65000);

SELECT * FROM Employees;

CREATE TABLE Emp_Backup AS SELECT * FROM Employees;

SELECT * FROM Emp_Backup;

INSERT INTO Employees (FirstName,LastName,DeptID) VALUES ('Dulqer','Salman',(SELECT DeptID FROM Department WHERE DeptName = 'Marketing'));

INSERT INTO Employees (EmpID,FirstName,LastName) VALUES (101,'Mahesh','Babu');

INSERT INTO Employees (FirstName,LastName,HireDate) VALUES ('Allu','Arjun',CURDATE());

SELECT * FROM Employees;


SELECT "PART-2";

UPDATE Employees SET DeptID=(SELECT DeptID FROM Department WHERE DeptName='Engineering') WHERE Salary IS NOT NULL;

UPDATE Employees SET Salary = Salary*1.10 WHERE DeptID=(SELECT DeptID FROM Department WHERE DeptName='Engineering');

UPDATE Employees SET JobTitle='Senior Analyst' WHERE EmpID=101;

UPDATE Department SET Location='New York' WHERE DeptName='HR';

UPDATE Employees SET Salary=30000 WHERE Salary IS NULL;

UPDATE Employees SET LastName='Smith-West' WHERE EmpID=105;


SELECT * FROM Employees;


UPDATE Employees SET Salary=Salary+5000 WHERE EmpID IN (SELECT EmpID FROM (SELECT * FROM Employees ORDER BY Salary ASC LIMIT 5) AS t);

UPDATE Employees SET DeptID=(SELECT DeptID FROM Department WHERE DeptName='Operations') WHERE JobTitle='Manager';

UPDATE Employees SET Salary=50000, JobTitle='Ex Analyst' WHERE EmpID=101;

UPDATE Employees SET JobTitle = CONCAT('Global', JobTitle) WHERE DeptID = (Select DeptID FROM Department WHERE DeptName='Sales');

UPDATE Employees e SET Salary=(SELECT AVG(Salary) FROM Employees WHERE DeptID = e.DeptID);

SELECT * FROM Employees;


SELECT "Part-3";

DELETE FROM Employees WHERE EmpID=101;

DELETE FROM Employees WHERE HireDate < '2010-01-01';

UPDATE Employees SET DeptID=NULL WHERE DeptID IN( SELECT DeptID FROM Department WHERE Location='Chicago');
DELETE FROM Department WHERE location = 'Chicago';

DELETE FROM Employees WHERE DeptID IS NULL;

SELECT "No Qn-5";

DELETE FROM Department WHERE DeptName='Marketing';

DELETE FROM Employees WHERE Salary < 25000;

DELETE FROM Employees WHERE DeptID=(SELECT DeptID FROM Department WHERE DeptName='Sales');

Truncate Emp_Backup;

DELETE FROM Employees WHERE Salary=(SELECT MAX(Salary) FROM Employees);

SELECT * FROM Employees;
SELECT * FROM Department;

