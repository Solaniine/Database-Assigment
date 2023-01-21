DELIMITER $$
CREATE TRIGGER Reservationss
AFTER INSERT ON Reservations
FOR EACH ROW
BEGIN
   UPDATE Vehicles SET CurrentMileage = NEW.EndOdometer, FuelPurchased = NEW.FuelPurchased WHERE VehicleID = (SELECT VehicleID FROM HiredVehicles WHERE HireVehiclesID = NEW.HireVehiclesID);
    IF (NEW.StartDate <= NOW() AND NEW.EndDate >= NOW()) THEN
        UPDATE Vehicles SET CurrentStatus = 'reserved' WHERE VehicleID = NEW.VehicleID;
    ELSE
        UPDATE Vehicles SET CurrentStatus = 'available' WHERE VehicleID = NEW.VehicleID;
    END IF;
END$$
DELIMITER ;