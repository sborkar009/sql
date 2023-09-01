create database parkdb
use parkdb

create table vehicletype(
vehicletypeid int identity(100,1),
typeofvehicle varchar(50),
noofspace int,
rateperhour decimal(10,2))

CREATE TABLE Vehicle ( 
VehicleID INT IDENTITY(200, 1),
vehicletypeid int,
VehicleNoPlate VARCHAR(50), 
vehiclename varchar(50),
OwnerName VARCHAR(50),
ContactNo VARCHAR(10), 
CreatedOn DATETIME DEFAULT GETDATE())


CREATE TABLE ParkingTicket (
TicketID INT IDENTITY(300, 1),
VehicleID int,
EntryDate  date, 
ExitDate date,
TicketAmount decimal (10,2),
parkingduration decimal(10,2),
CreatedOn DATETIME DEFAULT GETDATE())

create table adminlogin(
adminloginid int identity(400,1),
username varchar(50),
password varchar(50)
)



drop table ParkingTicket

exec vehicletype1 0,'Four wheeler',50,30,'I'
exec vehicletype1 0,'Two wheeler',50,15,'I'



exec Vehicle1 0,100,'MH34 HG 0007','SWIFT','SHUBHAM','8668582779','I'
exec Vehicle1 0,101,'MH34 HG 0008','SPLENDER','SHUBHAM','8668582779','I'


EXEC ParkingTicket1 0,200,'2023-08-30','2023-08-30',50,4,'I'
EXEC ParkingTicket1 0,201,'2023-08-30','2023-08-30',50,4,'I'



exec adminlogin1 0,'sborkar009@gmail.com','shubham@1','I'

delete from Vehicle where VehicleID=203


select * from vehicletype
select* from Vehicle
select *from ParkingTicket
select * from adminlogin



create TRIGGER totalAmount
ON ParkingTicket 
AFTER INSERT
AS 
BEGIN
    -- Update ticketamount for the newly inserted records
    UPDATE pt
    SET pt.TicketAmount = pt.parkingduration * vt.rateperhour
    FROM ParkingTicket pt
    INNER JOIN inserted i ON pt.TicketID = i.TicketID
    INNER JOIN vehicle v ON pt.VehicleID = v.VehicleID
    INNER JOIN vehicletype vt ON v.vehicletypeid = vt.vehicletypeid;
END;



CREATE TRIGGER VehicleEntry
ON Vehicle
AFTER INSERT
AS
BEGIN
    DECLARE @VehicleTypeID INT

 
     -- Get the VehicleTypeID of the newly inserted vehicle
    SELECT @VehicleTypeID = vehicletypeid
    FROM inserted
  -- Update the noofspace column in vehicletype
    UPDATE vehicletype
    SET noofspace = noofspace - 1
    WHERE vehicletypeid = @VehicleTypeID
END;




CREATE TRIGGER VehicleExit
ON Vehicle
AFTER DELETE
AS
BEGIN
    DECLARE @VehicleTypeID INT

    -- Get the VehicleTypeID of the deleted vehicle
    SELECT @VehicleTypeID = vehicletypeid
    FROM deleted

    -- Update the noofspace column in vehicletype
    UPDATE vehicletype
    SET noofspace = noofspace + 1
    WHERE vehicletypeid = @VehicleTypeID
END;
