DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;
-- *********** **
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	Department_ID		INT,
	Departmentname		VARCHAR(50)
);
-- ** *******************
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
	PositionID			INT,
	Positionname		VARCHAR(50)
);
-- ** ***************
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	Account_ID			INT,
	Email 				VARCHAR(50),
	Username			VARCHAR(50),
	Department_ID		INT,
	Posittion_ID		INT,
	CreateDate			DATE
);
    
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	Group_ID			INT,
	GroupName			VARCHAR(50),
    CreatorID			INT,
    CreateDate			DATE
    );
    
DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount`(
	GroupID				INT,
	AccountID			INT,
    JoinDate			DATE
    );
    
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
TypeID					INT,
TypeName				VARCHAR(50)
);

DROP TABLE IF EXISTS CategoryQuestiont;
CREATE TABLE CategoryQuestiont(
CategoryID				INT,
CategoryName			VARCHAR(50)
);

DROP TABLE IF EXISTS Questiont;
CREATE TABLE Questiont(
QuesiontID				INT,
Content					VARCHAR(50),
CategoryID				INT,
TypeID					INT,
CreatorID				INT,
CreateDate				DATE
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID				INT,
Content					VARCHAR(50),
QuestiontID				INT,
IsCorrect 				BIT
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
ExamID					INT,
`Code`					VARCHAR(50),
Title					VARCHAR(50),
CategoryID				INT,
Duration				INT,
CreatorID				INT,
CreateDate				DATE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID					INT,
QuestionID				INT
);









  
    
	
    