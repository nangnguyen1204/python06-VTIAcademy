-- Viết triggers để tránh trường hợp người dùng nhập thông tin module Project không hợp lệ
-- (Project_Modules.ProjectModulesDate < Projects.ProjectStartDate,
-- Project_Modules.ProjectModulesCompletedOn > Projects.ProjectCompletedOn)

USE `project_management`;
DROP TRIGGER IF EXISTS verify_insert_module;
DELIMITER $$
CREATE TRIGGER verify_insert_module
BEFORE INSERT ON `project_modules`
FOR EACH ROW
BEGIN
		DECLARE 	v_project_start_date 	date;
        DECLARE 	v_project_complete_on	date;
        
		SELECT 		p.project_start_date INTO v_project_start_date
        FROM		projects p
        WHERE		p.projectID = NEW.projectID;
		
        SELECT 		p.project_complete_on INTO v_project_complete_on
        FROM		projects p
        WHERE		p.projectID = NEW.projectID;
        
        IF
			NEW.project_modules_date < v_project_start_date 
            OR NEW.project_modules_complete_one > v_project_complete_on
            THEN 
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'khong the insert do vi pham dieu kien';
        END IF;
END$$
DELIMITER ;

-- Trong database phần Assignment 3, Tạo 1 VIEW để lấy ra tất cả các thực tập sinh là
-- ET, 1 ET thực tập sinh là những người đã vượt qua bài test đầu vào và thỏa mãn số
-- điểm như sau:
--  ET_IQ + ET_Gmath>=20  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18

USE `extraassignment_1`;
CREATE VIEW get_trainee AS
SELECT 			*
FROM			trainee
WHERE			ET_IQ + ET_Gmath>=20 AND ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18;

