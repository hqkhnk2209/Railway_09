DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	DepartmentID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Departmentname		NVARCHAR(50) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
	PositionID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	PositionName		ENUM ('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
    );

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Email 				VARCHAR(50) NOT NULL UNIQUE KEY,
	Username			VARCHAR(50) NOT NULL UNIQUE KEY,
    fullname			NVARCHAR(50) NOT NULL,
	DepartmentID		TINYINT UNSIGNED NOT NULL,
	PositionID			TINYINT UNSIGNED NOT NULL,
	CreateDate			DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	GroupName			NVARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID			TINYINT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
    );
    
    DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount`(
	GroupID				TINYINT UNSIGNED NOT NULL,
	AccountID			TINYINT UNSIGNED NOT NULL,
    JoinDate			DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
    );
    
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
TypeID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName				ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName			NVARCHAR(50) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content					NVARCHAR(100) NOT NULL,
CategoryID				TINYINT UNSIGNED NOT NULL,
TypeID					TINYINT UNSIGNED NOT NULL,
CreatorID				TINYINT UNSIGNED NOT NULL,
CreateDate				DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(TypeID) 	REFERENCES TypeQuestion(TypeID),
FOREIGN KEY(CreatorID) 	REFERENCES Account(AccountID)
);
    
 DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content					NVARCHAR(100) NOT NULL,
QuestionID				TINYINT UNSIGNED NOT NULL,
IsCorrect 				BIT DEFAULT 1,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);   

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`					CHAR(10) NOT NULL,
    Title					NVARCHAR(50) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    Duration				TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID				TINYINT UNSIGNED NOT NULL,
	QuestionID			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
    PRIMARY KEY (ExamID,QuestionID)
);
-- ********** tao bang insert **********
SELECT * FROM testingsystem.department;
INSERT INTO Department(Departmentname)
VALUES         			('Marketing'),
						('Sale'),
						('Bảo Vệ'),
                        ('Giám Đốc'),
                        ('Tài Chính');

SELECT * FROM testingsystem.position;
INSERT INTO Position (PositionName)
VALUES 				 ('Dev'),
					 ('Test'),
                     ('Scrum Master'),
					 ('PM');      

SELECT * FROM testingsystem.account;
INSERT INTO `Account` (Email,				Username,			fullname,				DepartmentID,			PositionID,				CreateDate)
VALUES 				  ('Email10@gmail.com'	,'Username10'		,'fullname10'				,'3'						,'1',							'2020-01-01'	  ),
					  ('Email2@gmail.com'	,'Username2'		,'fullname2'				,'4'						,'3',							'2021-03-28'	  ),
                      ('Email3@gmail.com'	,'Username3'		,'fullname3'				,'1'						,'4',							'2020-01-01' 	  ),
                      ('Email4@gmail.com'	,'Username4'		,'fullname4'				,'2'						,'2',							'2020-01-01'	  ),
                      ('Email5@gmail.com'	,'Username5'		,'fullname5'				,'3'						,'3',							'2020-01-01'	  );                   
                        
SELECT * FROM testingsystem.group;
INSERT INTO `Group` (GroupName,					CreatorID,					CreateDate)
VALUES				('GroupA',					1,							'2020-01-01'),
					('GroupB',					2,							'2020-01-01'),
                    ('GroupC',					3,							'2020-01-01'),
                    ('GroupD',					4,							'2020-01-01'),
                    ('GroupE',					5,							'2020-01-01');
                    
SELECT * FROM testingsystem.groupaccount;
INSERT INTO `GroupAccount`(GroupID,					AccountID,					JoinDate)
VALUES					  (11,						2,							'2020-01-01'),
						  (12,						1,							'2020-01-01'),
						  (13,						3,							'2020-01-01'),
						  (14,						4,							'2020-01-01'),
						  (15,						5,							'2020-01-01');
                       
SELECT * FROM testingsystem.typequestion;
INSERT INTO TypeQuestion (TypeName)
VALUES 					 ('Essay'),
						 ('Multiple-Choice');
                         
SELECT * FROM testingsystem.categoryquestion;
INSERT INTO CategoryQuestion (CategoryName)
VALUES						 ('Java'),
							 ('.NET'),
                             ('Ruby'),
                             ('SQL'),
                             ('Postman'),
                             ('PHP');

SELECT * FROM testingsystem.question;
INSERT INTO Question (Content,					CategoryID,					TypeID,					CreatorID,					CreateDate)
VALUES				 ('ContentA',				1,							2,						1,						  '2020-01-03'),
					 ('ContentB',				2,							1,						2,						  '2020-01-03'),
                     ('ContentC',				3,							2,						3,						  '2020-01-03'),
                     ('ContentD',				4,							1,						4,						  '2020-01-03'),
                     ('ContentE',				5,							2,						5,						  '2020-01-03');
                     
SELECT * FROM testingsystem.answer;
INSERT INTO Answer (Content,				QuestionID,					IsCorrect)
VALUES			   ('ContentA',				6,								1),
				   ('ContentB',				7,								1),
                   ('ContentC',				8,								1),
                   ('ContentD',				9,								1),
                   ('ContentE',				10,								1);
                   
SELECT * FROM testingsystem.exam;
INSERT INTO Exam (`Code`,			Title,			CategoryID,				Duration,			CreatorID,				CreateDate)
VALUES			 ('Code1',			'Title1',		1,						120,				1,						'2020-03-04'),
				 ('Code2',			'Title2',		2,						120,				2,						'2020-03-04'),
                 ('Code3',			'Title3',		3,						120,				3,						'2020-03-04'),
                 ('Code4',			'Title4',		4,						120,				4,						'2020-03-04'),
                 ('Code5',			'Title5',		5,						120,				5,						'2020-03-04');
                 
SELECT * FROM testingsystem.examquestion;
INSERT INTO ExamQuestion (ExamID,				QuestionID)
VALUES					 (1,					6),
						 (2,					7),
                         (3,					8),
                         (4,					9),
                         (5,					10);

-- **************--
SELECT DepartmentID FROM `Department` where DepartmentName='sale';
SELECT * FROM `Position`;
SELECT * FROM `Account`;
SELECT * FROM `Group`;
SELECT * FROM `GroupAccount`;
SELECT * FROM TypeQuestion;
SELECT * FROM CategoryQuestion;
SELECT * FROM Question;
SELECT * FROM Answer;
SELECT * FROM Exam;
SELECT * FROM ExamQuestion;

