-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT				a.FullName,a.DepartmentID,d.DepartmentID
FROM				`Account` a
JOIN				Department d ON a.DepartmentID = d.DepartmentID;

-- Question 2 :Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT				*
FROM				`Account` 
WHERE				CreateDate > 20/12/2010;

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT				a.FullName,a.PositionID,p.PositionID
FROM				`Account` a
JOIN				Position p ON a.PositionID = p.PositionID
WHERE				p.PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT				d.DepartmentName,count(a.DepartmentID)
FROM				Department d
JOIN				`Account` a ON 	a.DepartmentID = d.DepartmentID
GROUP BY			a.DepartmentID
HAVING				count(a.DepartmentID) >3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

            
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT				CQ.CategoryID,CQ.CategoryName,count(Q.CategoryID)
FROM				Categoryquestion CQ 
INNER JOIN			Question Q ON Q.CategoryID = CQ.CategoryID
GROUP BY			Q.CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT				Q.Content,Q.CategoryID,count(E.CategoryID)
FROM				Question Q
INNER JOIN			Exam E ON E.CategoryID = Q.CategoryID
GROUP BY			E.CategoryID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
