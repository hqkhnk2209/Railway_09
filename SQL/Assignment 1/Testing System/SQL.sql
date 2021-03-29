SELECT * FROM `Account`;
SELECT AccountID, Email FROM Account;
SELECT * FROM `Account` WHERE AccountID =2;
SELECT * FROM `Account` WHERE DepartmentID =5 OR DepartmentID =4;
SELECT * FROM `Account` WHERE DepartmentID =5 AND PositionID =1 AND CreateDate >'2018-08-25 00:00:00';
SELECT * FROM `Account` WHERE DepartmentID BETWEEN 1 AND 5;
SELECT * FROM `Account` WHERE AccountID NOT IN (1,2,7,9);
SELECT DISTINCT DepartmentID FROM `Account`;
SELECT AccountID,Email,FullName,CreateDate AS Ngàyxemsex FROM `Account`
LIMIT 10 ;
SELECT * FROM `Account` WHERE Username NOT LIKE 'agodly4v';
SELECT * FROM `Account` WHERE FullName LIKE 'F%';
SELECT * FROM `Account` WHERE FullName LIKE 'F%';
SELECT * FROM `Account` WHERE CreateDate IS NULL;
SELECT * FROM `Account` WHERE CreateDate IS NOT NULL;
SELECT * FROM `Account` WHERE CreateDate <>'2018-08-25 00:00:00';







