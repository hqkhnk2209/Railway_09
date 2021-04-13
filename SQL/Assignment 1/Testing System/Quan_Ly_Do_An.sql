DROP DATABASE IF EXISTS Quan_Ly_Do_An;
CREATE DATABASE IF NOT EXISTS Quan_Ly_Do_An;
USE Quan_Ly_Do_An;

-- create table 1: GiangVien  
DROP TABLE IF EXISTS GiangVien;
CREATE TABLE GiangVien ( 
	IdGV		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TenGV		NVARCHAR(50) NOT NULL,
    Tuoi		TINYINT UNSIGNED NOT NULL,
    HocVi		NCHAR(10) NOT NULL
);

-- create table 2: SinhVien
DROP TABLE IF EXISTS SinhVien;
CREATE TABLE 	SinhVien (
	IdSV		MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TênSV 		NVARCHAR(50) NOT NULL,
    NamSinh		DATE,
    QueQuan		NVARCHAR(50) NOT NULL
);

-- create table 3: DeTai
DROP TABLE IF EXISTS DeTai;
CREATE TABLE 	DeTai (
	IdDeTai		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	TenDeTai 	NVARCHAR(50) NOT NULL UNIQUE KEY
);


-- create table 3: HuongDan
DROP TABLE IF EXISTS HuongDan;
CREATE TABLE HuongDan (
	ID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	IdSV		MEDIUMINT UNSIGNED NOT NULL,
	IdDeTai 	TINYINT UNSIGNED NOT NULL, 
	IdGV 		TINYINT UNSIGNED NOT NULL,
	Diem 		TINYINT UNSIGNED NOT NULL,
	CONSTRAINT fk_IdSV 		FOREIGN KEY(IdSV) 		REFERENCES SinhVien(IdSV),
    CONSTRAINT fk_IdDeTai 	FOREIGN KEY(IdDeTai) 	REFERENCES DeTai(IdDeTai),
    CONSTRAINT fk_IdGV 		FOREIGN KEY(IdGV) 		REFERENCES GiangVien(IdGV)
);

-- insert du lieu 
SELECT			* FROM	GiangVien;
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV1', '30', 'Ths');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV2', '40', 'Ts');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV3', '25', 'PGS');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV4', '50', 'GS');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV5', '37', 'PGS');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV6', '47', 'Ths');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV7', '45', 'Ts');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV8', '39', 'GS');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV9', '43', 'Ts');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV10', '37', 'Ths');
INSERT INTO `giangvien` (`TenGV`, `Tuoi`, `HocVi`) VALUES ('TenGV11', '39', 'PGS');

SELECT			* FROM  SinhVien;
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV1', '1999-01-02', 'QueQuan1');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV2', '2000-01-01', 'QueQuan2');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV3', '1997-03-05', 'QueQuan3');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV4', '2002-04-12', 'QueQuan4');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV5', '2000-12-15', 'QueQuan5');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV6', '1999-06-12', 'QueQuan6');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV7', '2002-12-12', 'QueQuan7');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV8', '2000-09-08', 'QueQuan8');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV9', '1999-07-12', 'QueQuan9');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV10', '2002-06-09', 'QueQuan10');
INSERT INTO `sinhvien` (`TênSV`, `NamSinh`, `QueQuan`) VALUES ('TênSV11', '2001-04-09', 'QueQuan11');

SELECT			*	FROM	DeTai;
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai1');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai2');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai3');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai4');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai5');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai6');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai7');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai8');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai9');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai10');
INSERT INTO `detai` (`TenDeTai`) VALUES ('TenDeTai11');

SELECT			*  FROM		HuongDan;
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('1', '2', '2', '50');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('2', '1', '3', '89');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('3', '3', '1', '35');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('4', '5', '2', '67');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('5', '2', '5', '48');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('6', '6', '6', '90');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('7', '8', '1', '12');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('8', '9', '11', '90');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('9', '4', '10', '32');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('10', '11', '6', '59');
INSERT INTO `huongdan` (`IdSV`, `IdDeTai`, `IdGV`, `Diem`) VALUES ('11', '7', '7', '78');


-- Ques2. Viết lệnh để a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
SELECT					s.IdSV,s.TênSV
FROM					SinhVien s
LEFT JOIN				HuongDan h ON h.IdSV = s.IdSV
WHERE					h.IdSV IS NULL ;

-- Ques2 b) Lấy ra số sinh viên làm đề tài ‘DeTai 6’
SELECT					s.IdSV,s.TênSV,d.TenDeTai
FROM					HuongDan h
INNER JOIN			SinhVien s  ON h.IdSV 	= s.IdSV
INNER JOIN			DeTai d 	ON h.IdDeTai = d.IdDeTai
WHERE				d.TenDeTai = 'DeTai 6';

-- Ques 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm: mã số, họ tên và tên đề tài 
-- Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có"
DROP VIEW IF EXISTS		SinhVienInfo;
CREATE VIEW SinhVienInfo AS
SELECT					s.IdSV,s.TênSV,d.TenDeTai
FROM					HuongDan h
INNER JOIN				SinhVien s  ON h.IdSV 	= s.IdSV
INNER JOIN				DeTai d 	ON h.IdDeTai = d.IdDeTai
UNION
SELECT					s.IdSV,s.TênSV,'Chua co' AS DeTai 
FROM					SinhVien s
LEFT JOIN				HuongDan h ON h.IdSV=s.IdSV
WHERE					h.IdSV IS NULL;
SELECT					*
FROM					SinhVienInfo;

-- 4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1950 thì hiện ra thông báo "Moi ban kiem tra lai nam sinh"
DROP TRIGGER IF EXISTS Trg_InsertSinhvien;
DELIMITER $$
CREATE TRIGGER Trg_InsertSinhvien
BEFORE INSERT ON SinhVien
FOR EACH ROW
BEGIN
				IF(year(new.NamSinh)<=1950 ) THEN
                SIGNAL SQLSTATE'12345'
                SET MESSAGE_TEXT = 'Moi ban kiem tra lai nam sinh';
END IF;
END $$
DELIMITER ;
INSERT INTO SinhVien(TênSV			,NamSinh				,QueQuan			)
VALUES				('asdasdas'		,'1949-01-01'			,'sadasds'			);


-- 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông tin trong table HuongDan liên quan tới sinh viên đó 
-- sẽ bị xóa đi
ALTER TABLE HuongDan DROP FOREIGN KEY 	fk_IdSV;
ALTER TABLE HuongDan ADD CONSTRAINT		fk_IdSV	FOREIGN KEY(IdSV)		REFERENCES SinhVien(IdSV) ON DELETE CASCADE;


-- Ques6. Viết 1 Procedure để khi nhập vào tên của sinh viên thì sẽ thực hiện xóa toàn bộ thông tin liên quan của sinh viên trên hệ thống
DROP PROCEDURE IF EXISTS Trg_XoaSinhVien;
DELIMITER $$
CREATE PROCEDURE Trg_XoaSinhVien(IN

