CREATE TABLE Vehicles(
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    MaintenanceType VARCHAR(255) NOT NULL,
    LogStartDate DATE NOT NULL,
    LogEndDate DATE NOT NULL,
    MechanicAuthorization INT NOT NULL
);
CREATE TABLE FacultyMembers (
    FacultyID INT PRIMARY KEY AUTO_INCREMENT,
    Membername VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    UNIQUE (Email),
    Department VARCHAR(255) NOT NULL
);
CREATE TABLE HiredVehicles (
    HireVehiclesID INT PRIMARY KEY AUTO_INCREMENT,
    FacultyID INT NOT NULL,
    VehicleID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES FacultyMembers(FacultyID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);
CREATE TABLE Fuel (
    FuelID INT PRIMARY KEY AUTO_INCREMENT,
    VehicleID INT NOT NULL,
    FuelDate DATE NOT NULL,
    FuelType VARCHAR(255) NOT NULL,
    FuelCost FLOAT NOT NULL,
    CreditCardNumber VARCHAR(255) NOT NULL,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

CREATE TABLE MileageReports (
    ReportID INT PRIMARY KEY AUTO_INCREMENT,
    VehicleID INT NOT NULL,
    Month INT NOT NULL,
    Year INT NOT NULL,
    Mileage INT NOT NULL,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    FacultyID INT NOT NULL,
    VehicleID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Purpose VARCHAR(255) NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES FacultyMembers(FacultyID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);
CREATE TABLE MaintenanceLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    VehicleID INT NOT NULL,
    MaintenanceType VARCHAR(255) NOT NULL,
    LogStartDate DATE NOT NULL,
    LogEndDate DATE NOT NULL,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);