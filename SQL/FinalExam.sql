-- Questions1 Tạo table với các ràng buộc và kiểu dữ liệu
-- Thêm ít nhất 3 bản ghi vào table
DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE IF NOT EXISTS ThucTap;
USE ThucTap;

-- create table 1: GiangVien  
DROP TABLE IF EXISTS GiangVien;
CREATE TABLE GiangVien ( 
	magv		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hoten		NVARCHAR(50) NOT NULL,
    luong		INT UNSIGNED NOT NULL
);

-- create table 2: SinhVien
DROP TABLE IF EXISTS SinhVien;
CREATE TABLE 	SinhVien (
	masv		MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	hoten 		NVARCHAR(50) NOT NULL,
    namsinh		DATE,
    quequan		NVARCHAR(50) NOT NULL
);

-- create table 3: DeTai
DROP TABLE IF EXISTS DeTai;
CREATE TABLE 	DeTai (
	madt		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	tendt	 	NVARCHAR(50) NOT NULL UNIQUE KEY,
    kinhphi		INT	UNSIGNED NOT NULL,
    NoiThucTap	NVARCHAR(50) NOT NULL
);


-- create table 3: HuongDan
DROP TABLE IF EXISTS HuongDan;
CREATE TABLE HuongDan (
	id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	masv		MEDIUMINT UNSIGNED NOT NULL,
	madt 		TINYINT UNSIGNED NOT NULL, 
	magv 		TINYINT UNSIGNED NOT NULL,
	ketqua 		TINYINT UNSIGNED NOT NULL,
	CONSTRAINT fk_masv 		FOREIGN KEY(masv) 		REFERENCES SinhVien(masv),
    CONSTRAINT fk_madt		FOREIGN KEY(madt) 		REFERENCES DeTai(madt),
    CONSTRAINT fk_magv 		FOREIGN KEY(magv) 		REFERENCES GiangVien(magv)
);


-- insert dữ liệu bảng GiangVien

SELECT 					*	FROM GiangVien ;
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('hoten1', '20000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('hoten2', '15000000');
INSERT INTO `thuctap`.`giangvien` (`hoten`, `luong`) VALUES ('hoten3', '30000000');

-- insert dữ liệu bảng SinhVien

SELECT 					*	FROM SinhVien ;
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('ngomanhhung', '1997-10-15', 'sontay');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('nguyenvanhieu', '2000-01-01', 'namdinh');
INSERT INTO `thuctap`.`sinhvien` (`hoten`, `namsinh`, `quequan`) VALUES ('chuhonghanh', '1999-09-02', 'dalat');

-- insert dữ liệu bảng DeTai

SELECT 					*	FROM DeTai ;
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('tendt1', '500000', 'NoiThucTap1');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('tendt2', '100000', 'NoiThucTap2');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('tendt3', '1000000', 'NoiThucTap3');
INSERT INTO `thuctap`.`detai` (`tendt`, `kinhphi`, `NoiThucTap`) VALUES ('CONG NGHE SINH HOC', '3500000', 'NoiThucTap4');

-- insert dữ liệu bảng HuongDan

SELECT 					*	FROM HuongDan ;
INSERT INTO `thuctap`.`huongdan` (`masv`, `madt`, `magv`, `ketqua`) VALUES ('3', '1', '1', '9');
INSERT INTO `thuctap`.`huongdan` (`masv`, `madt`, `magv`, `ketqua`) VALUES ('1', '4', '2', '5');
INSERT INTO `thuctap`.`huongdan` (`masv`, `madt`, `magv`, `ketqua`) VALUES ('2', '2', '3', '3');


-- 2a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
SELECT					s.masv,s.hoten
FROM					SinhVien s
LEFT JOIN				HuongDan h ON h.masv = s.masv
WHERE					h.masv IS NULL ;

-- 2b)  Lấy ra số sinh viên làm đề tài ‘CONG NGHE SINH HOC’
SELECT					s.masv,s.hoten,d.tendt
FROM					HuongDan h
INNER JOIN				SinhVien s ON h.masv = s.masv
INNER JOIN				DeTai 	 d ON h.madt = d.madt
WHERE					d.tendt = 'CONG NGHE SINH HOC';


-- 3. Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm:
-- mã số, họ tên và tên đề tài
-- (Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")
DROP VIEW IF EXISTS		SinhVienInfo;
CREATE VIEW SinhVienInfo AS
SELECT					s.masv,s.hoten,d.tendt
FROM					HuongDan h
INNER JOIN				SinhVien s ON h.masv = s.masv
INNER JOIN				DeTai 	 d ON h.madt = d.madt
UNION
SELECT					s.masv,s.hoten,'Chua co' AS DeTai 
FROM					SinhVien s
LEFT JOIN				HuongDan h ON h.masv=s.masv
WHERE					h.masv IS NULL;
SELECT					*
FROM					SinhVienInfo;


-- 4. Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900 thì hiện ra thông báo "năm sinh phải > 1900"
DROP TRIGGER IF EXISTS	Trg_InsertSinhVien ;
DELIMITER $$
CREATE TRIGGER Trg_InsertSinhVien
BEFORE INSERT ON SinhVien
FOR EACH ROW
BEGIN
					IF(year(NEW.namsinh)<= 1900	) THEN
                    SIGNAL SQLSTATE'12345'
                SET MESSAGE_TEXT = 'năm sinh phải > 1900';
END IF;
END $$
DELIMITER ;
INSERT INTO SinhVien(hoten			,namsinh				,quequan			)
VALUES				('hunglon'		,'1899-01-01'			,'sadasds'			);



-- 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi
ALTER TABLE HuongDan DROP FOREIGN KEY 	fk_masv;
ALTER TABLE HuongDan ADD CONSTRAINT		fk_masv	FOREIGN KEY(masv)		REFERENCES SinhVien(masv) ON DELETE CASCADE;
