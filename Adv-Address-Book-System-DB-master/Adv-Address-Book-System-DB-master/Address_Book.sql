CREATE DATABASE address_Book;
SHOW DATABASES;
USE address_Book;
CREATE TABLE address_Book (firstName VARCHAR(29) NOT NULL, lastName VARCHAR(20) NOT NULL,       /* TO CREATE TABLE */
		address VARCHAR(60) NOT NULL, city VARCHAR(10) NOT NULL, state VARCHAR(20) NOT NULL, 
        zip INT, phoneNumber VARCHAR(10) );
SELECT * FROM Address_Book_Table;
INSERT INTO Address_Book_Table VALUES ("Shardul","Khapke","Ahmednagar Maharashtra","Ahmednagar","MAharashtra",413710,"8669156360");
UPDATE Address_Book_Table SET firstName = "Naveen", lastName = "Pateker", address = "Ahmednagar Maharashtra", city = "Ahmednagar", zip = 454501 WHERE firstName = "Shardul" ;
ALTER TABLE address_book RENAME TO Address_Book_Table;
SET SQL_SAFE_UPDATES=0;
UPDATE address_Book.Address_Book_Table SET firstName = "Naveen", lastName = "Pateker", address = "Ahmednagar Maharashtra", city = "Ahmednagar", zip = 454501 WHERE firstName = "Shardul" ;
DELETE FROM Address_Book_Table WHERE firstName = "Naveen";
INSERT INTO Address_Book_Table VALUES ("Anil","Bodakhe","Ahmednagar Maharashtra","Ahmednagar","MAharashtra",422030,"9874563210");
SELECT * FROM Address_Book_Table WHERE city = "Pune";
SELECT firstName, lastName FROM Address_Book_Table WHERE city = "Pune";
SELECT count(city or state) FROM Address_Book_Table;
INSERT INTO Address_Book_Table VALUES ("Rao","Dhotre","Pune Maharashtra","Pune","Maharashtra",422030,"9874563210");
SELECT city, firstName FROM Address_Book_Table ORDER BY (firstName);
ALTER TABLE Address_Book_Table ADD COLUMN relation VARCHAR(6) AFTER zip;  
ALTER TABLE Address_Book_Table ADD COLUMN name VARCHAR(6) AFTER zip;  
UPDATE Address_Book_Table SET name = 'Shardul', relation = 'friend' WHERE firstName = 'Anil';
UPDATE Address_Book_Table SET name = 'Shardul', relation = 'family' WHERE firstName = 'Rao';
ALTER TABLE Address_Book_Table CHANGE name name VARCHAR(20); 
ALTER TABLE Address_Book_Table CHANGE relation relation VARCHAR(20);
UPDATE Address_Book_Table SET name = 'Deepak', relation = 'Profession,' WHERE firstName = 'Shardul';
UPDATE Address_Book_Table SET name = 'Deepak', relation = 'Profession' WHERE firstName = 'Shardul';
 SELECT count(relation) FROM Address_Book_Table;
 UPDATE Address_Book_Table SET name = 'sonu' WHERE relation = 'family';  
 UPDATE Address_Book_Table SET name = 'sonu' WHERE relation = 'friend'; 
 
 
CREATE TABLE PersonName( Id INT AUTO_INCREMENT PRIMARY KEY, firstName VARCHAR(10), lastName VARCHAR(10),
			addressId INT);
            
INSERT INTO PersonName VALUES ('1001', 'RAO', 'DHOTRE', '2001');
INSERT INTO PersonName VALUES ('','AJAY', 'DHOTRE', '2001');
INSERT INTO PersonName VALUES ('','NAVEEN', 'PATEKAR', '2003');
INSERT INTO PersonName VALUES ('','ANZER', 'SHAIKH', '2004');
SELECT * FROM PersonName;

CREATE TABLE Address ( Id INT PRIMARY KEY AUTO_INCREMENT , city VARCHAR(10), state VARCHAR(10), zip varchar(6), phoneNo VARCHAR(10), personId INT);
INSERT INTO Address VALUES ('2001', 'SOLAPUR', 'MAHARASHTRA', '413315', '122231', '1001');
INSERT INTO Address VALUES ('', 'INDAPUR', 'MAHARASHTRA', '410615', '9766531', '1001');
INSERT INTO Address VALUES ('', 'PUNE', 'MAHARASHTRA', '413333', '867854', '1003');
INSERT INTO Address VALUES ('', 'HYDERABAAD', 'TELANGANA', '432131', '9874651', '1004');

SELECT * FROM Address;
ALTER TABLE Address ADD FOREIGN KEY (personId) REFERENCES PersonName(Id);
ALTER TABLE PersonName ADD FOREIGN KEY (addressId) REFERENCES Address(Id);

CREATE TABLE Connections(personId INT , relativeName VARCHAR(20), relation VARCHAR(20), FOREIGN KEY (personId) REFERENCES PersonName(Id));
INSERT INTO Connections VALUES ( '1001', 'Shardul', 'FRIEND');
INSERT INTO Connections VALUES ( '1002', 'RAO', 'Family');
INSERT INTO Connections VALUES ( '1003', 'RAO', 'FRIEND');
SELECT * FROM Connections;

SELECT * FROM (PersonName INNER JOIN  Address ON PersonName.Id = Address.personId) 
		INNER JOIN Connections ON Connections.personId = PersonName.Id;
SELECT * FROM PersonName RIGHT JOIN  Address ON PersonName.Id = Address.personId;
SELECT * FROM PersonName LEFT JOIN  Address ON PersonName.Id = Address.personId;