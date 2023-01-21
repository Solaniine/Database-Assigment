DELIMITER $$
CREATE TRIGGER MaintenanceLogss
AFTER INSERT ON MaintenanceLogs
FOR EACH ROW
BEGIN
    IF (NEW.LogEndDate < NOW()) THEN
        UPDATE Vehicles SET CurrentStatus = 'available' WHERE VehicleID = NEW.VehicleID;
    ELSE
        UPDATE Vehicles SET CurrentStatus = 'maintenance' WHERE VehicleID = NEW.VehicleID;
    END IF;
END$$
DELIMITER ;