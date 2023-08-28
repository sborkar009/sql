-- ================================================
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
create PROCEDURE Vehicle1
@VehicleID INt, 
@VehicleNoPlate VARCHAR(50), 
@OwnerName VARCHAR(50),
@ContactNo VARCHAR(50),
@Type varchar(50)
AS
BEGIN

	SET NOCOUNT ON;
	if (@VehicleID=0 and @Type='I')
	begin
	insert into Vehicle values (@VehicleNoPlate, @OwnerName ,@ContactNo,GETDATE())
	end
	else
	begin
	if (@Type='U')
	begin
	update Vehicle set VehicleNoPlate=@VehicleNoPlate, OwnerName=@OwnerName ,ContactNo=@ContactNo where VehicleID=@VehicleID
	end
	else
	begin
	if (@Type='D')
	delete from Vehicle   where VehicleID=@VehicleID
	end
	end
END
GO





-- ================================================
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
alter PROCEDURE ParkingSpace1
@SpaceID INT,
@lotname varchar(50),
@NOOFSPACE INT,
@Type varchar(50)

as begin

	SET NOCOUNT ON;

	if (@SpaceID=0 and @Type='I')
	begin
	insert into ParkingSpace values (@lotname,@NOOFSPACE,GETDATE())
	end
	else
	begin
	if (@Type='U')
	begin
	update ParkingSpace set lotname=@lotname,NOOFSPACE=@NOOFSPACE where SpaceID=@SpaceID
	end
	else
	begin
	if (@Type='D')
	delete from ParkingSpace  where SpaceID=@SpaceID
	end
	end
END
GO




create PROCEDURE ParkingTicket12
@TicketID INT ,
@VehicleID int,
@SpaceID INT,
@EntryDateTime DATETIME,
@ExitDateTime DATETIME, 
@Type varchar(50)

as begin

	SET NOCOUNT ON;

	if (@TicketID=0 and @Type='I')
	begin
	insert into ParkingTicket values (@VehicleID,@SpaceID,@EntryDateTime,@ExitDateTime,GETDATE())
	end
	else
	begin
	if (@Type='U')
	begin
	update ParkingTicket set VehicleID=@VehicleID,SpaceID=@SpaceID,EntryDateTime=@EntryDateTime,ExitDateTime=@ExitDateTime where SpaceID=@SpaceID
	end
	else
	begin
	if (@Type='D')
	delete from ParkingTicket where SpaceID=@SpaceID
	end
	end
END
GO










alter PROCEDURE TotalAmount1 (
    @amountid int,
    @VehicleID INT,
    @TicketID INT,
    @vehiclename VARCHAR(50),
    @amount INT,
    @parkingduration FLOAT,
    @Type VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF (@amountid=0 and @Type = 'I')
    BEGIN
        INSERT INTO Totalamount VALUES (@VehicleID, @TicketID, @vehiclename, @amount, @parkingduration)
    END
    ELSE IF (@Type = 'U')
    BEGIN
    UPDATE Totalamount SET VehicleID = @VehicleID, TicketID = @TicketID,vehiclename = @vehiclename, amount = @amount,parkingduration = @parkingduration
        WHERE TicketID = @TicketID
    END
    ELSE IF (@Type = 'D')
    BEGIN
        DELETE FROM Totalamount WHERE TicketID = @TicketID;
    END
    END

	go


