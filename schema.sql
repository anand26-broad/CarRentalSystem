CREATE TABLE Vehicle (
    vehicleID INT PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT CHECK (year > 1885), -- The first car was invented in 1886
    dailyRate DECIMAL(10, 2) CHECK (dailyRate > 0), -- Rate must be positive
    status ENUM('available', 'notAvailable') NOT NULL,
    passengerCapacity INT CHECK (passengerCapacity > 0),
    engineCapacity INT CHECK (engineCapacity > 0) -- Engine capacity must be positive
);CREATE TABLE Customer (
    customerID INT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE, -- Ensuring unique emails
    phoneNumber VARCHAR(15) NOT NULL
);CREATE TABLE Lease (
    leaseID INT PRIMARY KEY,
    vehicleID INT,
    customerID INT,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    leaseType ENUM('Daily', 'Monthly') NOT NULL,
    FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID) ON DELETE CASCADE,
    FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON DELETE CASCADE
);CREATE TABLE Payment (
    paymentID INT PRIMARY KEY,
    leaseID INT,
    paymentDate DATE NOT NULL,
    amount DECIMAL(10, 2) CHECK (amount > 0), -- Amount must be positive
    FOREIGN KEY (leaseID) REFERENCES Lease(leaseID) ON DELETE CASCADE
);
