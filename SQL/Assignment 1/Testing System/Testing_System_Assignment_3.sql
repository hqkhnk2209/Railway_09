
-- ****** Quesion 2 ******

SELECT			*
FROM			Department;
-- ****** Quesion 3 ******

SELECT			DepartmentID
FROM			Department
WHERE			DepartmentName='sale';
-- ****** Quesion 4 ******

SELECT			FullName
FROM			`Account`
WHERE			LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`);
-- ****** Quesion 5 *****

WITH cte_dep3 AS
(
SELECT * FROM `Account` WHERE DepartmentID =3
)
SELECT * FROM `cte_dep3`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `cte_dep3`)
ORDER BY Fullname ASC;

-- ****** Quesion 6 *****
SELECT			GroupName
FROM			`Group`
WHERE			CreateDate < 2019-12-20;

-- ****** Quesion 7 *****
SELECT			a.QuestionID,count(a.QuestionID)
FROM			answer a
GROUP BY		a.QuestionID
HAVING			count(a.QuestionID) >=4;

-- ****** Quesion 8 *****
SELECT			`Code`
FROM			exam
WHERE			Duration>60 
AND				CreateDate<2019-12-20;

-- ****** Quesion 9 *****
SELECT			*
FROM			`Group`
ORDER BY		CreateDate DESC
LIMIT			5;

-- ****** Quesion 10 *****
SELECT			DepartmentID,count(DepartmentID)
FROM			`account`
WHERE			DepartmentID=2;

-- ****** Quesion 11 *****
SELECT			FullName
FROM			`account`
WHERE			FullName 
LIKE			('D%o');

-- ****** Quesion 12 *****
DELETE	
FROM			exam
WHERE			CreateDate < 2019-12-20;

-- ****** Quesion 13 *****
DELETE
FROM			Question
WHERE			(SUBSTRING_INDEX(Content,' ',2)) ='câu hỏi';

-- ****** Quesion 14 *****
UPDATE			`account`
SET				Email ='loc.nguyenba@vti.com.vn',
				FullName ='Nguyễn Bá Lộc'
WHERE			AccountID=5;

-- ****** Quesion 15 *****
UPDATE 			`GroupAccount` 
SET 			AccountID = 5
WHERE 			GroupID = 4;

-- **** ********************


