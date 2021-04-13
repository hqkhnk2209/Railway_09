DROP DATABASE IF EXISTS VTI_Mark_Management;
CREATE DATABASE VTI_Mark_Management;
USE VTI_Mark_Management;
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
Trainee_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
First_Name				VARCHAR(50) NOT NULL ,
Last_Name				VARCHAR(50) NOT NULL ,
Age						TINYINT UNSIGNED	,
Gender					ENUM('Male','Female','Unknown')
);
DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject`(
Subject_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Subject_Name			VARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Trainee_Subject;
CREATE TABLE Trainee_Subject(
Trainee_ID				TINYINT UNSIGNED,
Subject_ID				TINYINT UNSIGNED,
Mark					TINYINT UNSIGNED,
Exam_Day				DATETIME DEFAULT now(),
PRIMARY KEY				(Trainee_ID,Subject_ID),
CONSTRAINT fk_Trainee_Subject_Trainee_1 	FOREIGN KEY (Trainee_ID)	REFERENCES Trainee (Trainee_ID) ,
CONSTRAINT fk_Trainee_Subject_Trainee_2		FOREIGN KEY (Subject_ID)	REFERENCES `Subject` (Subject_ID)
);
-- insert du lieu bang --

SELECT 	*	FROM	Trainee;
INSERT INTO	Trainee (First_Name				,Last_Name				,Age			,Gender				)
VALUES				('First_Name1'			,'Last_Name1'			,20				,'Female'			),
					('First_Name2'			,'Last_Name2'			,21				,'Female'			),
                    ('First_Name3'			,'Last_Name3'			,22				,'Male'				),
                    ('First_Name4'			,'Last_Name4'			,18				,'Unknown'			),
                    ('First_Name5'			,'Last_Name5'			,30				,'Unknown'			),
                    ('First_Name6'			,'Last_Name6'			,25				,'Male'				),
					('First_Name7'			,'Last_Name7'			,59				,'Unknown'			),
                    ('First_Name8'			,'Last_Name8'			,37				,'Male'				),
                    ('First_Name9'			,'Last_Name9'			,99				,'Female'			),
                    ('First_Name10'			,'Last_Name10'			,60				,'Unknown'			);

    SELECT 	*	FROM	`Subject`;
INSERT INTO	`Subject`(Subject_Name			)
VALUES				 ('MySQL'				),             
					 ('JavaCore'			),
                     ('FrontEnd Basic'		),
					 ('Spring Framwork'		),
                     ('FrontEnd Advance'	),
                     ('Mock Project'		),
                     ('Python'				),
                     ('Ruby'				),
                     ('C++'					),
                     ('Abcefgh'				);

INSERT INTO `trainee_subject` (`Trainee_ID`, `Subject_ID`, `Mark`) VALUES ('1', '1', '43');
INSERT INTO `trainee_subject` (`Trainee_ID`, `Subject_ID`, `Mark`) VALUES ('3', '2', '46');
INSERT INTO `trainee_subject` (`Trainee_ID`, `Subject_ID`, `Mark`) VALUES ('4', '6', '19');
INSERT INTO `trainee_subject` (`Trainee_ID`, `Subject_ID`, `Mark`) VALUES ('5', '6', '30');
INSERT INTO `trainee_subject` (`Trainee_ID`, `Subject_ID`, `Mark`) VALUES ('6', '10', '70');
INSERT INTO `trainee_subject` (`Trainee_ID`, `Subject_ID`, `Mark`) VALUES ('7', '9', '12');
INSERT INTO `trainee_subject` (`Trainee_ID`, `Subject_ID`, `Mark`) VALUES ('8', '1', '45');
INSERT INTO `trainee_subject` (`Trainee_ID`, `Subject_ID`, `Mark`) VALUES ('9', '9', '29');
INSERT INTO `trainee_subject` (`Trainee_ID`, `Subject_ID`, `Mark`) VALUES ('10', '10', '38');

-- Ques2a :Lấy tất cả các môn học không có bất kì điểm nào
SELECT						ts.Subject_ID,ts.Mark,s.Subject_Name
FROM						`Subject` s
LEFT JOIN					Trainee_Subject ts ON s.Subject_ID = ts.Subject_ID
WHERE						ts.Subject_ID IS NULL ;

-- Ques2b :Lấy danh sách các môn học có ít nhất 2 điểm
SELECT						ts.Subject_ID,ts.Mark,count(ts.Subject_ID),s.Subject_Name
FROM						Trainee_Subject ts
INNER JOIN					`Subject` s ON s.Subject_ID = ts.Subject_ID
GROUP BY					ts.Subject_ID
HAVING						count(ts.Subject_ID)>=2;

-- Ques3. Tạo view có tên là " TraineeInfo" lấy các thông tin về học sinh bao gồm: 
-- Trainee_ID, FullName, Age, Gender, Subject_ID, Subject_Name, Mark, Exam_Day
DROP VIEW IF EXISTS TraineeInfo;
CREATE VIEW TraineeInfo AS
SELECT						t.Trainee_ID,concat(t.First_Name,t.Last_Name) AS FullName ,t.Age,t.Gender,s.Subject_ID,s.Subject_Name,ts.Mark,ts.Exam_Day
FROM						Trainee_Subject ts 
INNER JOIN					`Subject` s 		ON s.Subject_ID = ts.Trainee_ID
INNER JOIN					Trainee t  			ON ts.Trainee_ID = t.Trainee_ID;
SELECT						*
FROM						TraineeInfo;

-- Ques4. Không sử dụng On Update Cascade & On Delete Cascade
-- a) Tạo trigger cho table Subject có tên là SubjectUpdateID:Khi thay đổi data của cột ID của 
-- table Subject, thì giá trị tương ứng với cột Subject_ID của table trainee_subject cũng thay đổi theo
DROP TRIGGER IF EXISTS Trg_SubjectUpdateID;
DELIMITER $$
CREATE TRIGGER Trg_SubjectUpdateID
BEFORE UPDATE ON `Subject`
FOR EACH ROW
BEGIN
UPDATE Trainee_Subject SET Subject_ID =NEW.Subject_ID WHERE (Subject_ID = OLD.Subject_ID);
END $$
DELIMITER ;
ALTER TABLE Trainee_Subject DROP FOREIGN KEY fk_Trainee_Subject_Trainee_1;
ALTER TABLE Trainee_Subject DROP FOREIGN KEY fk_Trainee_Subject_Trainee_2;
UPDATE `Subject` SET Subject_ID = 12 WHERE Subject_ID = 1;
-- b) Tạo trigger cho table trainee có tên là StudentDeleteID:
-- Khi xóa data của cột ID của table trainee, thì giá trị tương ứng với cột SubjectID của table trainee_subject cũng bị xóa theo.

DROP PROCEDURE IF EXISTS delete_student ;
DELIMITER $$ 
CREATE PROCEDURE delete_student ( IN trainee_name VARCHAR(20) )
BEGIN
	
		IF ( trainee_name = '"*"' ) THEN 
        DELETE FROM trainee;
		DELETE FROM trainee_subject;
ELSE
 DELETE FROM trainee t WHERE  t.Trainee_ID = trainee_name ;

END IF ;
END $$
ALTER TABLE trainee_subject DROP FOREIGN KEY fk_Trainee_Subject_Trainee_Trainee_ID
DELIMITER ;






DROP PROCEDURE IF EXISTS SP_DeleteTraineeByName;
DELIMITER $$
CREATE PROCEDURE SP_DeleteTraineeByName(IN Trainee_Name VARCHAR(50) )
BEGIN
DECLARE v_Trainee_ID SMALLINT;
IF Trainee_Name = '*' THEN
DELETE FROM trainee_subject;
DELETE FROM trainee;
ELSE
SELECT t.Trainee_ID INTO v_Trainee_ID FROM trainee t WHERE t.First_Name = Trainee_Name;
DELETE FROM trainee_subject WHERE (Trainee_ID = v_Trainee_ID);
DELETE FROM trainee WHERE (Trainee_ID = v_Trainee_ID);
END IF;
END $$
CALL SP_DeleteTraineeByName('*');