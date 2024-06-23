CREATE DATABASE StudentManagement;
USE StudentManagement;
--1
CREATE TABLE Department(
	ID INT PRIMARY KEY,
	Name NVARCHAR(35) NOT NULL,
	Phone VARCHAR(15)
);
--2
CREATE TABLE Student(
	S_ID INT NOT NULL,
	S_FirstName NVARCHAR(35) NOT NULL,
	S_LastName NVARCHAR(35) NOT NULL,
	S_Gender NVARCHAR(3) CHECK (S_Gender IN ('Nam', 'Nữ')) NOT NULL,
	S_Phone VARCHAR(20),
	S_Email VARCHAR(25),
	S_GPA FLOAT CHECK (S_GPA > 0 ),
	S_Address VARCHAR(25) DEFAULT 'Đà Nẵng',
);
--3
INSERT INTO Department (ID, Name, Phone) VALUES
(1, 'Khoa', '013456789'),
(2, 'T', '098764321'),
(3, 'Đ', '09345678'),
(4, 'H', '093467890'),
(5, 'Si', '09458901');

--4
INSERT INTO Student (S_FirstName, S_LastName, S_Gender, S_Phone, S_Email, S_GPA, S_Address) VALUES
('Nguyễn', 'Văn', 'Nam', '0234567', 'a@ex.com', 3.5, 'Hà Nội'),
('Trần', 'Thị', 'Nữ', '012345678', 'b@e.com', 3.8, 'Đà Nẵng'),
('Lê', 'Văn', 'Nam', '09345789', 'c@exle.com', 2.9, 'Hồ Chí Minh'),
('Phạm', 'Thị ', 'Nữ', '094567890', 'd@le.com', 3.7, 'Đà Nẵng'),
('Hoàng', 'Văn ', 'Nam', '09568901', 'e@le.com', 3.2, 'Huế');

--5
SELECT * FROM Student WHERE S_Gender = 'Nữ';
--6
SELECT * FROM Student WHERE S_Gender = 'Nữ' OR S_Address = 'Đà Nẵng';
--7
ALTER TABLE Student ADD S_Birthday DATE

UPDATE Student SET S_Birthday = '2000-06-01' WHERE ID = 1002;
--8
ALTER TABLE Student ADD DepartmentID INT;
ALTER TABLE Student ADD CONSTRAINT FK_Department
FOREIGN KEY (DepartmentID) REFERENCES Department(ID)
ON UPDATE CASCADE;
--9
UPDATE Student SET DepartmentID = 1 WHERE S_ID = 1;
UPDATE Student SET DepartmentID = 2 WHERE S_ID = 2;
UPDATE Student SET DepartmentID = 3 WHERE S_ID = 3;
UPDATE Student SET DepartmentID = 4 WHERE S_ID = 4;
UPDATE Student SET DepartmentID = 5 WHERE S_ID = 5;
--10
UPDATE Department SET ID = 100 WHERE ID = 1;

SELECT * FROM Student WHERE DepartmentID = 100;






