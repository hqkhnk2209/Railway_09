DROP DATABASE IF EXISTS fresher;
CREATE DATABASE fresher;
USE fresher;
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
	TraineeID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Full_Name 				NVARCHAR(50) NOT NULL ,
	Birth_Date				DATE ,
    Gender					ENUM('MALE','FEMALE','UNKNOWN'),					
	ET_IQ					TINYINT UNSIGNED CHECK (ET_IQ<=20),
	ET_Gmath				TINYINT UNSIGNED CHECK (ET_Gmath<=20),
	ET_English				TINYINT	UNSIGNED CHECK (ET_English<=50),
	Training_Class			NVARCHAR(50) NOT NULL ,
    Evaluation_Notes		NVARCHAR(50) NOT NULL
);
-- ****** Tạo bảng INSERT ******

SELECT * FROM fresher.trainee;
INSERT INTO trainee (Full_Name			,		Birth_Date		,			Gender	,			ET_IQ	,			ET_Gmath,			ET_English	,			Training_Class	,			Evaluation_Notes)	
VALUES				('Full_Name1'		,		'1997-10-10'	,			'MALE'	,				15	,				15	,					20	,					'VTI001',				'DHQGHN'	),
					('mai_van_cuong'	,		'1992-12-11'	,			'FEMALE',				12	,				14	,					40	,					'VTI002',				'DHQGHN'	),
                    ('nguyen_van_tu'	,		'1997-07-10'	,			'FEMALE',				19	,				20	,					31	,					'VTI002',				'DHBKHN'	),
                    ('bui_phuong_anh'	,		'1999-11-08'	,			'MALE'	,				20	,				08	,					36	,					'VTI003',				'HVNN'		),
                    ('nguyen_duc_anh'	,		'1978-12-08'	,			'FEMALE',				1	,				1	,					1	,					'VTI004',				'DHQGHN'	),
                    ('nguyen_van_anh'	,		'2001-1-12'		,			'MALE'	,				12	,				14	,					49	,					'VTI001',				'DHBKHN'	),
                    ('bui_thu_phuong'	,		'2021-1-11'		,			'FEMALE',				20	,				19	,					13	,					'VTI003',				'DHQGHN'	),
                    ('phung_duc_nam'	,		'1965-01-01'	,			'MALE'	,				15	,				20	,					39	,					'VTI005',				'DHHN'		),
                    ('ngo_van_thang'	,		'1993-8-10'		,			'MALE'	,				2	,				12	,					6	,					'VTI002',				'HVNT'		),
                    ('cu_minh_nam'		,		'1999-04-10'	,			'MALE'	,				16	,				11	,					29	,					'VTI003',				'HVNN'		),
                    ('ngo_duc_thang'	,		'1993-8-10'		,		'UNKNOWN'	,				2	,				12	,					6	,					'VTI002',				'HVNT'		);
                    
-- ***** Question 4 *******
SELECT				*
FROM				trainee
WHERE				ET_IQ >=12 
AND					ET_Gmath>=12
AND					ET_English>=20
ORDER BY			Birth_Date DESC;

-- ***** Question 5 *******
SELECT				Full_Name
FROM				trainee
WHERE				Full_Name 
LIKE				('N%C');

-- ***** Question 6 *******
SELECT				Full_Name
FROM				trainee
WHERE				Full_Name
LIKE				('_G%');

-- ***** Question 7 *******
SELECT				*
FROM				trainee t
WHERE				length(t.Full_Name) = 10
AND					Full_Name
LIKE				('%C');

-- ***** Question 8 *******
SELECT DISTINCT		Full_Name
FROM				trainee ;

-- ***** Question 9 *******
SELECT 				Full_Name
FROM				trainee
ORDER BY			Full_Name ASC;

-- ***** Question 10 *******
SELECT 				t.Full_Name,length(t.Full_Name)
FROM				trainee t
WHERE				length(t.Full_Name) = (
SELECT				max(length(t.Full_Name)) 
FROM				trainee t
);
-- ***** Question 11 *******
SELECT 				a.TraineeID, a.Full_Name, a.Birth_Date
FROM				trainee a
WHERE				length(a.Full_Name) = (
SELECT				max(length(a.Full_Name)) 
FROM				trainee a
);

-- ***** Question 12 *******
SELECT 				a.Full_Name, a.ET_IQ, a.ET_Gmath, a.ET_English
FROM				trainee a
WHERE				length(a.Full_Name) = (
SELECT				max(length(a.Full_Name)) 
FROM				trainee a
);

-- ***** Question 13 *******
SELECT				Full_Name,Birth_Date
FROM				trainee
ORDER BY			Birth_Date DESC
LIMIT				5;

-- ***** Question 14 *******

-- ***** Question 15 *******
DELETE	
FROM				Trainee
WHERE				TraineeID =5;

-- ***** Question 16 *******

-- ***** Question 17 *******
SELECT				year(now()),(Birth_Date)
FROM				Trainee
WHERE				year(now()) - (Birth_Date) <=30;

-- ***** Question 18 *******
UPDATE				Trainee
SET					Training_Class = 'VTI003'
WHERE				TraineeID =3;

-- ***** Question 19 *******
UPDATE				Trainee
SET					Full_Name 	='LeVanA',
					ET_IQ 		=10,
                    ET_Gmath 	=15,
                    ET_English 	=30
WHERE				TraineeID 	=10;

-- ***** Question 20 *******
SELECT				t.Training_Class,count(t.Training_Class) as so_thuc_tap_sinh
FROM				Trainee t
WHERE				t.Training_Class = 'VTI001';

-- ***** Question 22 *******

-- ***** Question 23 *******
SELECT				t.Gender,count(t.Gender)
FROM				Trainee t
GROUP BY			t.Gender;

-- ***** Question 24 *******
SELECT				a.Full_Name,a.Training_Class,count(a.Training_Class)
FROM				Trainee a
GROUP BY			a.Training_Class
HAVING				count(a.Training_Class)>5;

-- ***** Question 26 *******
SELECT				a.Full_Name,a.Evaluation_Notes,count(a.Evaluation_Notes)
FROM				Trainee a
GROUP BY			a.Evaluation_Notes
HAVING				count(a.Evaluation_Notes) <4;
