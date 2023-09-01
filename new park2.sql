use parkdb


-- Template generated from Template Explorer using:

-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


		   
create PROCEDURE vehicletype1
@vehicletypeid int,
@typeofvehicle varchar(50),
@noofspace int,
@rateperhour decimal(10,2),
@Type varchar(50)

as begin

	SET NOCOUNT ON;

	if (@vehicletypeid=0 and @Type='I')
	begin
	insert into vehicletype values (@typeofvehicle,@noofspace,@rateperhour)
	end
	else
	begin
	if (@Type='U')
	begin
	update vehicletype set typeofvehicle=@typeofvehicle,noofspace=@noofspace,rateperhour=@rateperhour where vehicletypeid=@vehicletypeid
	end
	else
	begin
	if (@Type='D')
	delete from vehicletype  where  vehicletypeid=@vehicletypeid
	end
	end
END
GO




CREATE PROCEDURE Vehicle1 (
    @VehicleID INT,
    @vehicletypeid INT,
    @VehicleNoPlate VARCHAR(50),
    @vehiclename VARCHAR(50),
    @OwnerName VARCHAR(50),
    @ContactNo VARCHAR(10),
    @Type VARCHAR(1) 
)
AS
BEGIN
    SET NOCOUNT ON;

    IF (@VehicleID = 0 AND @Type = 'I')
    BEGIN
        INSERT INTO Vehicle VALUES (@vehicletypeid, @VehicleNoPlate, @vehiclename, @OwnerName, @ContactNo, GETDATE())
    END
    ELSE
    BEGIN
        IF (@Type = 'U')
        BEGIN
            UPDATE Vehicle SET vehicletypeid = @vehicletypeid, VehicleNoPlate = @VehicleNoPlate, vehiclename = @vehiclename, OwnerName = @OwnerName, ContactNo = @ContactNo WHERE VehicleID = @VehicleID
        END
        ELSE
        BEGIN
            IF (@Type = 'D')
            BEGIN
                DELETE FROM Vehicle WHERE VehicleID = @VehicleID
            END
           END
           END
           END






		   
create PROCEDURE ParkingTicket1
@TicketID INT ,
@VehicleID int,
@EntryDate DATE,
@ExitDate DATE, 
@TicketAmount decimal (10,2),
@parkingduration decimal(10,2),
@Type varchar(50)

as begin

	SET NOCOUNT ON;

	if (@TicketID=0 and @Type='I')
	begin
	insert into ParkingTicket values (@VehicleID,@EntryDate,@ExitDate,@TicketAmount,@parkingduration,GETDATE())
	end
	else
	begin
	if (@Type='U')
	begin
	update ParkingTicket set VehicleID=@VehicleID,EntryDate=@EntryDate,ExitDate=@ExitDate,TicketAmount=@TicketAmount,parkingduration=@parkingduration where TicketID=@TicketID
	end
	else
	begin
	if (@Type='D')
	delete from ParkingTicket where TicketID=@TicketID
	end
	end
END
GO


alter PROCEDURE adminlogin1
@adminloginid int,
@username varchar(50),
@password varchar(50),
@Type varchar(50)

as begin

	SET NOCOUNT ON;

	if (@adminloginid=0 and @Type='I')
	begin
	insert into adminlogin values (@username,@password)
	end
	else
	begin
	if (@Type='U')
	begin
	update adminlogin set username=@username,password=@password where adminloginid=@adminloginid
	end
	else
	begin
	if (@Type='D')
	delete from adminlogin where adminloginid=@adminloginid
	end
	end
END
GO



