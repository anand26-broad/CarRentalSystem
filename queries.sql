UPDATE Vehicle 
SET dailyRate = 68 
WHERE make = 'Mercedes';
DELETE FROM Customer 
WHERE customerID = 1; -- Replace 1 with the specific customer ID you want to delete
ALTER TABLE Payment 
RENAME COLUMN paymentDate TO transactionDate;
SELECT * FROM Customer 
WHERE email = 'johndoe@example.com'; -- Replace with the specific email
SELECT * FROM Lease 
WHERE customerID = 1 AND endDate > CURRENT_DATE; -- Replace 1 with the specific customer ID
SELECT P.* FROM Payment P 
JOIN Lease L ON P.leaseID = L.leaseID 
JOIN Customer C ON L.customerID = C.customerID 
WHERE C.phoneNumber = '555-555-5555'; -- Replace with the specific phone number
SELECT AVG(dailyRate) AS AverageDailyRate 
FROM Vehicle 
WHERE status = 'available';
SELECT * FROM Vehicle 
ORDER BY dailyRate DESC 
LIMIT 1;
SELECT V.* FROM Vehicle V 
JOIN Lease L ON V.vehicleID = L.vehicleID 
WHERE L.customerID = 1; -- Replace 1 with the specific customer ID
SELECT * FROM Lease 
ORDER BY startDate DESC 
LIMIT 1;
SELECT * FROM Payment 
WHERE YEAR(transactionDate) = 2023;
SELECT * FROM Customer 
WHERE customerID NOT IN (SELECT DISTINCT customerID FROM Lease)
SELECT V.*, SUM(P.amount) AS TotalPayments 
FROM Vehicle V 
JOIN Lease L ON V.vehicleID = L.vehicleID 
JOIN Payment P ON L.leaseID = P.leaseID 
GROUP BY V.vehicleID;
SELECT C.*, SUM(P.amount) AS TotalPayments 
FROM Customer C 
LEFT JOIN Lease L ON C.customerID = L.customerID 
LEFT JOIN Payment P ON L.leaseID = P.leaseID 
GROUP BY C.customerID;
SELECT C., V., L.* 
FROM Lease L 
JOIN Customer C ON L.customerID = C.customerID 
JOIN Vehicle V ON L.vehicleID = V.vehicleID 
WHERE L.endDate > CURRENT_DATE;
SELECT C.*, SUM(P.amount) AS TotalSpent 
FROM Customer C 
JOIN Lease L ON C.customerID = L.customerID 
JOIN Payment P ON L.leaseID = P.leaseID 
GROUP BY C.customerID 
ORDER BY TotalSpent DESC 
LIMIT 1;
SELECT V., L. 
FROM Vehicle V 
LEFT JOIN Lease L ON V.vehicleID = L.vehicleID 
WHERE L.endDate > CURRENT_DATE;