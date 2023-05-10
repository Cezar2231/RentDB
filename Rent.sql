CREATE DATABASE Rent;
USE Rent;

CREATE TABLE Owner(
OwnerID INT NOT NULL IDENTITY PRIMARY KEY,
FirstName NVARCHAR(30) NOT NULL,
LastName NVARCHAR(30) NOT NULL,
Address NVARCHAR(30) NOT NULL,
Phone CHAR(10) NOT NULL,
ClientScore NVARCHAR(30) NOT NULL,
BankAccount NVARCHAR(20) NOT NULL
);

INSERT INTO Owner(FirstName,LastName,Address,Phone,ClientScore,BankAccount) VALUES ('Ivan','Petrov','Izgrev bl.15',0898214241,'Dobur','IBAN1231241');

CREATE TABLE Tenant(
TenID INT NOT NULL IDENTITY PRIMARY KEY,
FirstName NVARCHAR(30) NOT NULL,
LastName NVARCHAR(30) NOT NULL,
Fromm NVARCHAR(50) NOT NULL,
Phone CHAR(10) NOT NULL,
EGN CHAR(10) NOT NULL,
BankAccount NVARCHAR(20) NOT NULL
);

INSERT INTO Tenant(FirstName,LastName,Fromm,Phone,EGN,BankAccount) VALUES ('Dragomir','Ivanov','Dobrich',0999891281,919123112,'IBAN123123')

CREATE TABLE TwoBedroom(
TwoBID INT NOT NULL IDENTITY PRIMARY KEY,
TwoLocation NVARCHAR(70) NOT NULL,
TwoQuadrature NVARCHAR(20) NOT NULL,
TwoPricePerMonth FLOAT NOT NULL,
TwoisFree NVARCHAR(5) NOT NULL,
TwoFurniture NVARCHAR(100) NOT NULL,
TwoPremises NVARCHAR(50) NOT NULL,
TwoFreeDate DATE,
TwoTenantID INT,
FOREIGN KEY (TwoTenantID) REFERENCES Tenant(TenID),
TwoOwnID INT NOT NULL,
FOREIGN KEY(TwoOwnID) REFERENCES Owner(OwnerID),
TwoTakenDate DATE 
);

INSERT INTO TwoBedroom(TwoLocation,TwoQuadrature,TwoPricePerMonth,TwoisFree,TwoFurniture,TwoPremises,TwoTenantID,TwoOwnID,TwoTakenDate) VALUES ('Burgas zhk Izgrev','65E,35N',650,'False','Fully furnished','No',1,1,'2022-10-10');
INSERT INTO TwoBedroom(TwoLocation,TwoQuadrature,TwoPricePerMonth,TwoisFree,TwoFurniture,TwoPremises,TwoFreeDate,TwoOwnID) VALUES ('Varna zhk Izgrev','64E,32N',550,'True','No','Yes,Basement','2022-10-10',1);
INSERT INTO TwoBedroom(TwoLocation,TwoQuadrature,TwoPricePerMonth,TwoisFree,TwoFurniture,TwoPremises,TwoTenantID,TwoOwnID,TwoTakenDate) VALUES ('Burgas zhk Meden Rudnik','65E,30N',670,'False','Partly furnished','No',1,1,'2022-10-10');

SELECT * FROM TwoBedroom

CREATE TABLE ThreeBedrooms(
ThreeBID INT NOT NULL IDENTITY PRIMARY KEY,
Location NVARCHAR(70) NOT NULL,
Quadrature NVARCHAR(20) NOT NULL,
PricePerMonth FLOAT NOT NULL,
isFree NVARCHAR(5) NOT NULL,
Furniture NVARCHAR(100) NOT NULL,
Premises NVARCHAR(50) NOT NULL,
FreeDate DATE ,
TenantID INT,
FOREIGN KEY (TenantID) REFERENCES Tenant(TenID),
OwnID INT NOT NULL,
FOREIGN KEY(OwnID) REFERENCES Owner(OwnerID),
TakenDate DATE 
);


INSERT INTO ThreeBedrooms(Location,Quadrature,PricePerMonth,isFree,Furniture,Premises,TenantID,OwnID,TakenDate) VALUES ('Burgas zhk slaveykov','54E',600,'True','Partly furnished','No',1,1,'2022-10-02');
INSERT INTO ThreeBedrooms(Location,Quadrature,PricePerMonth,isFree,Furniture,Premises,FreeDate,OwnID) VALUES ('Burgas zhk Lazur','53E',400,'False','No','No','2022-10-10',1);
INSERT INTO ThreeBedrooms(Location,Quadrature,PricePerMonth,isFree,Furniture,Premises,TenantID,OwnID,TakenDate) VALUES ('Burgas zhk Zornica','52E',600,'True','Fully furnished','Yes(Garage)',1,1,'2022-10-02');



SELECT * FROM TwoBedroom
SELECT * FROM ThreeBedrooms


SELECT * FROM TwoBedroom
ORDER BY TwoPricePerMonth
SELECT * FROM ThreeBedrooms
ORDER BY PricePerMonth


SELECT * FROM TwoBedroom
UPDATE TwoBedroom
SET TwoPricePerMonth=TwoPricePerMonth-TwoPricePerMonth*20/100
WHERE TwoFreeDate BETWEEN '2022-10-27' AND '2022-11-27'

SELECT * FROM ThreeBedrooms
UPDATE ThreeBedrooms
SET PricePerMonth=PricePerMonth-PricePerMonth*20/100
WHERE FreeDate BETWEEN '2022-10-27' AND '2022-11-27'


SELECT * FROM TwoBedroom INNER JOIN Tenant ON TwoBedroom.TwoTenantID=Tenant.TenID
WHERE TwoisFree='True'

SELECT * FROM ThreeBedrooms INNER JOIN Tenant ON ThreeBedrooms.TenantID=Tenant.TenID
WHERE isFree='True'


SELECT * FROM ThreeBedrooms
WHERE Furniture NOT LIKE 'No'

SELECT * FROM TwoBedroom
WHERE TwoFurniture NOT LIKE 'No'


SELECT * FROM ThreeBedrooms
WHERE Premises NOT LIKE 'No'

SELECT * FROM TwoBedroom
WHERE TwoPremises NOT LIKE 'No'


SELECT * FROM TwoBedroom
WHERE TwoisFree='True'

UPDATE TwoBedroom
SET TwoisFree = 'False' , TwoFreeDate = NULL , TwoTenantID=1, TwoTakenDate=GETDATE()
WHERE TwoBID=2

UPDATE TwoBedroom
SET TwoisFree = 'True' , TwoFreeDate = '2022-10-10' , TwoTenantID=NULL, TwoTakenDate=NULL 
WHERE TwoBID=2

SELECT * FROM ThreeBedrooms
WHERE isFree='True'


SELECT * FROM TwoBedroom
UPDATE TwoBedroom 
SET TwoQuadrature ='63E,32N'
WHERE TwoBID = 2


DELETE FROM Tenant
WHERE TenID=1;
