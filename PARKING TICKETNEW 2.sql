

CREATE TABLE Vehicle ( VehicleID INT IDENTITY(200, 1), VehicleNoPlate VARCHAR(50), OwnerName VARCHAR(50),ContactNo VARCHAR(10), CreatedOn DATETIME DEFAULT GETDATE());
CREATE TABLE ParkingSpace ( SpaceID INT IDENTITY(400, 1),lotname varchar(50),NOOFSPACE INT,CreatedOn DATETIME DEFAULT GETDATE());
CREATE TABLE ParkingTicket (TicketID INT IDENTITY(300, 1),VehicleID int,SpaceID INT,EntryDateTime DATETIME, ExitDateTime DATETIME, CreatedOn DATETIME DEFAULT GETDATE());
create table Totalamount (amountid int identity(500,1),VehicleID int,TicketID int,vehiclename varchar(50),amount int,parkingduration float,)


drop table Totalamount
exec Vehicle1 0,'MH34 GD 0009','SHUBHAM','8668582779','I'
exec Vehicle1 0,'MH01 FD 0007','AKSHAY','9868582779','I'
exec Vehicle1 0,'MH12 SD 8855','RAHUL','6668582779','I'
exec Vehicle1 0,'GJ YD 9999','GUNJAN','7668582779','I'
exec Vehicle1 0,'GJ QD 0001','ROHIT','8468582779','I'
exec Vehicle1 0,'MH34 JH 5555','DIPAK','7068582779','I'


exec ParkingSpace1 0,'Lot-A',100,'I'
exec ParkingSpace1 0,'Lot-B',50,'I'


exec ParkingTicket12 0,200,400,'2023-08-21','2023-08-21','I'
exec ParkingTicket12 0,201,400,'2023-08-21','2023-08-21','I'
exec ParkingTicket12 0,202,401,'2023-08-20','2023-08-20','I'
exec ParkingTicket12 0,203,401,'2023-08-22','2023-08-22','I'
exec ParkingTicket12 0,204,400,'2023-08-21','2023-08-21','I'
exec ParkingTicket12 0,205,400,'2023-08-25','2023-08-26','I'




exec Totalamount1 0,200,300,'THAR',50,3.0,'I'
exec Totalamount 0,201,301,'THAR',50,4.0,'I'
exec Totalamount 0,201,302,'FORTUNER',50,6.0,'I'
exec Totalamount 0,202,303,'BMW',50,2.0,'I'
exec Totalamount 0,203,304,'BENTLY',50,8.0,'I'
exec Totalamount 0,204,305,'AUDI',50,5.0,'I'
exec Totalamount 0,205,306,'MINI COPPER',50,1.0,'I'


select *from Vehicle
select *from ParkingSpace
select *from ParkingTicket
select *from Totalamount



  create TRIGGER updateAmountOnTotal
ON Totalamount
AFTER INSERT
AS
BEGIN
    DECLARE @newAmountId INT, @newParkingDuration FLOAT;

    SELECT @newAmountId = amountid, @newParkingDuration = parkingduration FROM inserted;

    DECLARE @newAmount DECIMAL(6, 2);
    SET @newAmount = @newParkingDuration;

    UPDATE Totalamount
    SET amount = amount * @newAmount
    WHERE amountid = @newAmountId;
END;





CREATE TRIGGER UpdateParkingSpaceOnEntry
ON ParkingTicket
AFTER INSERT
AS
BEGIN
    DECLARE @SpaceID INT, @EntryDateTime DATETIME;

    SELECT @SpaceID = SpaceID, @EntryDateTime = EntryDateTime
    FROM inserted;

    UPDATE ParkingSpace
    SET NOOFSPACE = NOOFSPACE - 1
    WHERE SpaceID = @SpaceID;
END;




CREATE TRIGGER UpdateParkingSpaceOnExit
ON ParkingTicket
AFTER UPDATE
AS
BEGIN
    DECLARE @SpaceID INT, @ExitDateTime DATETIME;

    SELECT @SpaceID = i.SpaceID, @ExitDateTime = i.ExitDateTime
    FROM inserted i
    JOIN deleted d ON i.TicketID = d.TicketID;

    UPDATE ParkingSpace
    SET NOOFSPACE = NOOFSPACE + 1
    WHERE SpaceID = @SpaceID;
END;

