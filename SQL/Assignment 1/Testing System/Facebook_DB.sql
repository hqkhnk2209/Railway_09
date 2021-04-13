DROP DATABASE IF EXISTS Facebook_DB;
CREATE DATABASE Facebook_DB;
USE Facebook_DB;
DROP TABLE IF EXISTS `National`;
CREATE TABLE `National`(
National_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
National_Name				VARCHAR(50) NOT NULL UNIQUE KEY,
Language_Main				VARCHAR(50) NOT NULL 
);
DROP TABLE IF EXISTS Office_id;
CREATE TABLE Office_id(
Office_id					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Street_Address				VARCHAR(50) NOT NULL ,
National_id					TINYINT UNSIGNED ,
FOREIGN KEY (National_id)	REFERENCES `National` (National_id)
);

DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff(
	Staff_id				MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    First_Name				VARCHAR(50) NOT NULL ,
    Last_Name				VARCHAR(50) NOT NULL ,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY,
    Office_id				SMALLINT UNSIGNED ,
FOREIGN KEY (Office_id) 	REFERENCES Office_id (Office_id)
);


-- insert du lieu --
SELECT 	*	FROM	Facebook_DB.`National`;
INSERT INTO	`National` (National_Name					,Language_Main					)
VALUES				   ('Indo'							,'Indo'							),
					   ('UK'							,'Eng'							),
                       ('Canada'						,'Eng'							),
                       ('Vietnam'						,'Vietnam'						),
                       ('Paris'							,'Eng'							),
                       ('Japan'							,'Japanese'						),
                       ('China'							,'Chinese'						),
                       ('Singapo'						,'Eng'							),
                       ('Laos'							,'Laos'							),
                       ('Campuchia'						,'Campuchia'					),
                       ('NA'							,'NA'							),
                       ('France'						,'France'						),
                       ('US'							,'US'							);
 INSERT INTO Office_id ( Street_Address   				, National_id   				)
 VALUES				   ('Street_Address2'				,2								),
					   ('Street_Address3'				,3								),
					   ('Street_Address4'				,4								),
                       ('Street_Address5'				,5								),
                       ('Street_Address6'				,6								),
                       ('Street_Address7'				,7								),
                       ('Street_Address8'				,8								),
                       ('Street_Address9'				,9								),
                       ('Street_Address10'				,10								),
                       ('Street_Address11'				,11								),
                       ('Street_Address12'				,12								);
INSERT INTO Staff	   ( First_Name 					,Last_Name				,Email					,Office_id				)
VALUES				   ('First_NameUK'					,'Last_NameUK'			,'Email2@gmail.com'		,2						),
                       ('First_NameIndo'				,'Last_NameIndo'		,'Email3@gmail.com'		,3						),
                       ('First_NameCanada'				,'Last_NameCanada'		,'Email4@gmail.com'		,4						),
                       ('First_NameVietnam'				,'Last_NameVietnam'		,'Email5@gmail.com'		,5						),
                       ('First_NameParis'				,'Last_NameParis'		,'Email6@gmail.com'		,6						),
                       ('First_NameJapan'				,'Last_NameJapan'		,'Email7@gmail.com'		,7						),
                       ('First_NameChina'				,'Last_NameChina'		,'Email8@gmail.com'		,8						),
                       ('First_NameSingapo'				,'Last_NameSingapo'		,'Email9@gmail.com'		,9						),
                       ('First_NameLaos'				,'Last_NameLaos'		,'Email10@gmail.com'	,10						),
                       ('First_NameCampuchia'			,'Last_NameCampuchia'	,'Email11@gmail.com'	,11						);
                       
-- Ques3: Bạn hãy lấy dữ liệu của tất cả nhân viên đang làm việc tại Vietnam.
SELECT				S.First_Name,S.Last_Name,S.Office_id
FROM				Staff S
INNER JOIN			Office_id O  	ON O.Office_id =S.Office_id 
	  JOIN			`National` N	ON N.National_id = O.Office_id
WHERE				N.National_Name = 'Vietnam';

-- Ques4: Lấy ra ID, FullName, Email, National của mỗi nhân viên.
SELECT			 	S.Staff_id,concat(S.First_Name,S.Last_Name) AS Fullname,S.Email,N.National_Name
FROM				Staff S
INNER JOIN			Office_id O  	ON O.Office_id =S.Office_id 
INNER JOIN			`National` N	ON N.National_id = O.Office_id;

-- Ques5: Lấy ra tên nước mà nhân viên có Email: "daonq@viettel.com.vn" đang làm việc.
SELECT			 	O.Office_id ,N.National_Name,N.National_id
FROM				`National` N
INNER JOIN			Office_id O 	ON O.Office_id =N.National_id
INNER JOIN			Staff 	S		ON S.Staff_id  =O.Office_id
WHERE				S.Email = 'daonq@viettel.com.vn';	
      
-- Ques6: Bạn hãy tìm xem trên hệ thống có quốc gia nào có thông tin trên hệ thống nhưng không có nhân viên nào đang làm việc.


-- Ques7: Thống kê xem trên thế giới có bao nhiêu quốc gia mà FB đang hoạt động sử dụng tiếng Anh làm ngôn ngữ chính.					
SELECT				N.National_Name,N.Language_Main
FROM				`National` N
WHERE				N.Language_Main ='Eng';

-- Ques8: Viết lệnh để lấy ra thông tin nhân viên có tên (First_Name) có 10 ký tự, bắt đầu bằng chữ N và kết thúc bằng chữ C
SELECT 				s.First_Name
FROM				Staff s
WHERE				s.First_Name 
LIKE				'N________C';

-- Ques9: Bạn hãy tìm trên hệ thống xem có nhân viên nào đang làm việc nhưng do nhập khi nhập liệu bị lỗi mà nhân viên đó vẫn chưa cho thông tin về trụ sở làm việc(Office).
SELECT				*
FROM				Staff s
WHERE				S.Office_id IS NULL;

-- Ques10: Nhân viên có mã ID =9 hiện tại đã nghỉ việc, bạn hãy xóa thông tin của nhân viên này trên hệ thống
DELETE			
FROM				Staff
WHERE				Staff_id=9;

-- Ques11: FB vì 1 lý do nào đó không còn muốn hoạt động tại Australia nữa, và Mark Zuckerberg muốn bạn xóa tất cả các thông tin trên hệ thống 
-- liên quan đến quốc gia này. Hãy tạo 1 Procedure có đầu vào là tên quốc gia cần xóa thông tin để làm việc này và gửi lại cho anh ấy.

-- Ques14: Bạn hãy viết 1 Procedure để lấy ra tên trụ sở mà có số lượng nhân viên đang làm việc nhiều nhất.
DROP PROCEDURE IF EXISTS	SP_StaffFromOffice;
DELIMITER $$
CREATE PROCEDURE SP_StaffFromOffice()
BEGIN
		WITH 		CTE_GetCountStaff_id AS(
		SELECT		S.Office_id,count(S.Staff_id) AS SL
        FROM		Staff S
        GROUP BY	S.Office_id
)
SELECT 			O.Office_id  ,O.Street_Address,O.National_id,count(S.Staff_id) AS SL
FROM			Staff S
INNER JOIN		Office_id O ON O.Office_id = S.Staff_id
GROUP BY		S.Office_id
HAVING			count(S.Office_id)=(
		SELECT MAX(SL)
        FROM   CTE_GetCountStaff_id
);
END $$

Call SP_StaffFromOffice;

-- Ques17: FB đang vướng vào 1 đạo luật hạn chế hoạt động, FB chỉ có thể hoạt động tối đa trên 100 quốc gia trên thế giới, hãy tạo Trigger để ngăn người nhập liệu nhập vào quốc gia thứ 101 (bạn có thể sử dụng số nước nhỏ hơn để Test VD 11 nước).

