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
                       
-- Ques3: B???n h??y l???y d??? li???u c???a t???t c??? nh??n vi??n ??ang l??m vi???c t???i Vietnam.
SELECT				S.First_Name,S.Last_Name,S.Office_id
FROM				Staff S
INNER JOIN			Office_id O  	ON O.Office_id =S.Office_id 
	  JOIN			`National` N	ON N.National_id = O.Office_id
WHERE				N.National_Name = 'Vietnam';

-- Ques4: L???y ra ID, FullName, Email, National c???a m???i nh??n vi??n.
SELECT			 	S.Staff_id,concat(S.First_Name,S.Last_Name) AS Fullname,S.Email,N.National_Name
FROM				Staff S
INNER JOIN			Office_id O  	ON O.Office_id =S.Office_id 
INNER JOIN			`National` N	ON N.National_id = O.Office_id;

-- Ques5: L???y ra t??n n?????c m?? nh??n vi??n c?? Email: "daonq@viettel.com.vn" ??ang l??m vi???c.
SELECT			 	O.Office_id ,N.National_Name,N.National_id
FROM				`National` N
INNER JOIN			Office_id O 	ON O.Office_id =N.National_id
INNER JOIN			Staff 	S		ON S.Staff_id  =O.Office_id
WHERE				S.Email = 'daonq@viettel.com.vn';	
      
-- Ques6: B???n h??y t??m xem tr??n h??? th???ng c?? qu???c gia n??o c?? th??ng tin tr??n h??? th???ng nh??ng kh??ng c?? nh??n vi??n n??o ??ang l??m vi???c.


-- Ques7: Th???ng k?? xem tr??n th??? gi???i c?? bao nhi??u qu???c gia m?? FB ??ang ho???t ?????ng s??? d???ng ti???ng Anh l??m ng??n ng??? ch??nh.					
SELECT				N.National_Name,N.Language_Main
FROM				`National` N
WHERE				N.Language_Main ='Eng';

-- Ques8: Vi???t l???nh ????? l???y ra th??ng tin nh??n vi??n c?? t??n (First_Name) c?? 10 k?? t???, b???t ?????u b???ng ch??? N v?? k???t th??c b???ng ch??? C
SELECT 				s.First_Name
FROM				Staff s
WHERE				s.First_Name 
LIKE				'N________C';

-- Ques9: B???n h??y t??m tr??n h??? th???ng xem c?? nh??n vi??n n??o ??ang l??m vi???c nh??ng do nh???p khi nh???p li???u b??? l???i m?? nh??n vi??n ???? v???n ch??a cho th??ng tin v??? tr??? s??? l??m vi???c(Office).
SELECT				*
FROM				Staff s
WHERE				S.Office_id IS NULL;

-- Ques10: Nh??n vi??n c?? m?? ID =9 hi???n t???i ???? ngh??? vi???c, b???n h??y x??a th??ng tin c???a nh??n vi??n n??y tr??n h??? th???ng
DELETE			
FROM				Staff
WHERE				Staff_id=9;

-- Ques11: FB v?? 1 l?? do n??o ???? kh??ng c??n mu???n ho???t ?????ng t???i Australia n???a, v?? Mark Zuckerberg mu???n b???n x??a t???t c??? c??c th??ng tin tr??n h??? th???ng 
-- li??n quan ?????n qu???c gia n??y. H??y t???o 1 Procedure c?? ?????u v??o l?? t??n qu???c gia c???n x??a th??ng tin ????? l??m vi???c n??y v?? g???i l???i cho anh ???y.

-- Ques14: B???n h??y vi???t 1 Procedure ????? l???y ra t??n tr??? s??? m?? c?? s??? l?????ng nh??n vi??n ??ang l??m vi???c nhi???u nh???t.
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

-- Ques17: FB ??ang v?????ng v??o 1 ?????o lu???t h???n ch??? ho???t ?????ng, FB ch??? c?? th??? ho???t ?????ng t???i ??a tr??n 100 qu???c gia tr??n th??? gi???i, h??y t???o Trigger ????? ng??n ng?????i nh???p li???u nh???p v??o qu???c gia th??? 101 (b???n c?? th??? s??? d???ng s??? n?????c nh??? h??n ????? Test VD 11 n?????c).

