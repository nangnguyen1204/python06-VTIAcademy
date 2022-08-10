
-- Viết stored procedure (không có parameter) để Remove tất cả thông tin
-- project đã hoàn thành sau 3 tháng kể từ ngày hiện. In số lượng record đã
-- remove từ các table liên quan trong khi removing (dùng lệnh print)

DROP PROCEDURE IF EXISTS remove_project_over_3month;
DELIMITER $$
CREATE PROCEDURE remove_project_over_3month()
BEGIN
	DELETE FROM projects p
    WHERE 		p.project_complete_on < date_sub(curdate(), interval 3 month);
END $$
DELIMITER ;

-- Viết stored procedure (có parameter) để in ra các module đang được thực hiện)

DELIMITER $$
CREATE PROCEDURE get_modules_processing()
BEGIN	
	SELECT 		*
	FROM		project_modules pm
	WHERE		pm.project_modules_complete_one IS NULL;
END$$
DELIMITER ;

-- Viết hàm (có parameter) trả về thông tin 1 nhân viên đã tham gia làm mặc dù không ai giao việc cho nhân viên đó (trong bảng Works);

DELIMITER $$
CREATE PROCEDURE get_employee_free()
BEGIN
	WITH get_ID_employee_free AS(
								SELECT work_done.employeeID 
                                FROM work_done
		)
	SELECT 		*
	FROM 		employee e
	WHERE		e.employee_status = 'ss' AND e.employeeID NOT IN (SELECT * FROM get_ID_employee_free);
END $$
DELIMITER ;





