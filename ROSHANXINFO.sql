CREATE DATABASE RoshanXInfo;
USE  RoshanXInfo;


CREATE SCHEMA XInfo;


CREATE TABLE XInfo.Department (
    DeptId INT IDENTITY(1,1) PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL
);


CREATE TABLE XInfo.CostCentre (
    CCId INT IDENTITY(1,1) PRIMARY KEY,
    CCName VARCHAR(100) NOT NULL
);


CREATE TABLE XInfo.Employees (
    EmpId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    DeptId INT,
    CCId INT,
    DOJ DATE,
    Salary DECIMAL(10,2),

    CONSTRAINT FK_Employees_Department FOREIGN KEY (DeptId) 
        REFERENCES XInfo.Department(DeptId),

    CONSTRAINT FK_Employees_CostCentre FOREIGN KEY (CCId) 
        REFERENCES XInfo.CostCentre(CCId)
);


INSERT INTO XInfo.Department (DeptName) VALUES
('IT'),
('HR'),
('Finance'),
('Operations');



INSERT INTO XInfo.CostCentre (CCName) VALUES
('CC-IT-001'),
('CC-HR-002'),
('CC-FIN-003'),
('CC-OPS-004');


INSERT INTO XInfo.Employees 
(FirstName, LastName, Email, Phone, DeptId, CCId, DOJ, Salary)
VALUES
('Roshan', 'Patil', 'roshan.patil@example.com', '9876543210', 1, 1, '2024-01-10', 45000.00),
('Vatsal', 'Shah', 'vatsal.shah@example.com', '9988776655', 1, 1, '2023-07-22', 52000.00),
('Riya', 'Mehta', 'riya.mehta@example.com', '9090909090', 2, 2, '2022-06-15', 40000.00),
('Amit', 'Desai', 'amit.desai@example.com', '9123456780', 3, 3, '2021-09-01', 62000.00);

SELECT * FROM XInfo.Employees 