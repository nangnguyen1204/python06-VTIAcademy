-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DELIMITER $$
CREATE PROCEDURE p_department_info(IN p_department_name VARCHAR(100))
BEGIN
	SELECT 	d.departmentName , a.*
    FROM 	department d JOIN `account` a ON d.DepartmentID = a.DepartmentID
    WHERE 	d.departmentName = p_department_name;
END$$
DELIMITER ;

CALL testing_system_assignment_1.p_department_info('sales');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group

DROP PROCEDURE IF EXISTS number_account_in_group;
DELIMITER $$
CREATE PROCEDURE number_account_in_group(IN p_groupID INT,OUT number_account INT)
BEGIN
	SELECT 		(ga.accountID)
    INTO		number_account
    FROM 		groupaccount ga RIGHT JOIN `group` g ON ga.groupID = g.groupID
    WHERE		ga.groupID = p_groupID
    GROUP BY	ga.groupID;
END$$
DELIMITER ;

SET @number_account = 1;
CALL testing_system_assignment_1.number_account_in_group(2,@number_account);
SELECT @number_account;

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại

DROP PROCEDURE IF EXISTS number_question_in_type;
DELIMITER $$
CREATE PROCEDURE number_question_in_type()
BEGIN
	SELECT 		q.typeID, count(q.questionID)
    FROM 		question q
    WHERE		month(q.createDate) = month(curdate()) AND year(q.createDate) = year(curdate())
    GROUP BY	q.typeID;
END$$
DELIMITER ;

select curdate(); -- lấy ngày hiện tại

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

-- store procedure
DROP PROCEDURE IF EXISTS get_id_type_max_question;
DELIMITER $$
CREATE PROCEDURE get_id_type_max_question()
BEGIN
	WITH
	tb_count_question AS(
					SELECT 		COUNT(q.questionID) number_question_in_type
					FROM 		question q
					GROUP BY 	q.typeID
	),
	tb_max_question AS(
					SELECT 	MAX(tb_count_question.number_question_in_type) AS max_number_question_in_type
                    FROM	tb_count_question
	)
	SELECT 		q.typeID		
    FROM 		question q
    GROUP BY	q.typeID
    HAVING		COUNT(q.questionID) = (SELECT 	max_number_question_in_type
										FROM 	tb_max_question);
END$$
DELIMITER ;

-- function
DROP FUNCTION IF EXISTS f_get_id_type_max_question;
DELIMITER $$
CREATE FUNCTION f_get_id_type_max_question() RETURNS INT
BEGIN 
	DECLARE v_id_type_max_question INT;
    WITH
	tb_count_question AS(
					SELECT 		COUNT(q.questionID) AS number_question_in_type
					FROM 		question q
					GROUP BY 	q.typeID
	),
	tb_max_question AS(
					SELECT 	MAX(tb_count_question.number_question_in_type) AS max_number_question_in_type
                    FROM	tb_count_question
	)
	SELECT 		q.typeID		INTO v_id_type_max_question
    FROM 		question q
    GROUP BY	q.typeID
    HAVING		COUNT(q.questionID) = (SELECT 	max_number_question_in_type
										FROM 	tb_max_question)
	LIMIT 		1;
	RETURN 		v_id_type_max_question;
END $$
DELIMITER ;

SELECT f_get_id_type_max_question();

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question

SELECT 	tq.typeName
FROM 	typequestion tq 
WHERE 	typeId = f_get_id_type_max_question();
                     
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào

DROP PROCEDURE IF EXISTS get_group_by_char;
DELIMITER $$
CREATE PROCEDURE get_group_by_char(IN p_char_input VARCHAR(50))
BEGIN
	SELECT 		groupName AS result
    FROM		`group`
    WHERE		groupName LIKE CONCAT('%',p_char_input,'%')
    UNION ALL
    SELECT 		UserName AS result
    FROM		`account`
    WHERE		UserName LIKE CONCAT('%',p_char_input,'%');
END$$
DELIMITER ;

-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:

-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
select substring_index('abc@gmail@.com',"@",2);
-- Sau đó in ra kết quả tạo thành công
INSERT INTO department(departmentName) VALUE ('Phong cho');
DROP PROCEDURE IF EXISTS insert_info;
DELIMITER $$
CREATE PROCEDURE insert_info(IN p_full_name VARCHAR(50), p_email VARCHAR(50))
BEGIN 
	DECLARE 	v_positionID INT ;
    DECLARE 	v_departmentID INT ;
    
    SELECT 		positionID INTO v_positionID
    FROM 		position 
    WHERE 		positionName = 'Dev';
    
    SELECT 		departmentID INTO v_departmentID
    FROM 		department 
    WHERE 		departmentName = 'Phong cho';
    
	INSERT INTO `account` ( Email, 			UserName, 					FullName, 		DepartmentID , 			positionID		)
    VALUES 				  (p_email,  substring_index(p_email,"@",1), 	p_full_name,	v_departmentID     ,  v_positionID	 	);
    
    SELECT 		*
    FROM		`account`
    WHERE		Email = p_email;
END $$
DELIMITER ;



-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

DROP PROCEDURE IF EXISTS get_max_length_content;
DELIMITER $$
CREATE PROCEDURE get_max_length_content(IN p_type_question ENUM('Essay','Multiple-Choice') )
BEGIN
WITH get_max_length_content AS(
			SELECT 		MAX(char_length(content)) 
			FROM	 	question q JOIN typequestion tq ON q.typeID = tq.typeId
			WHERE 		tq.typeName = p_type_question 				
)
SELECT 		* 
FROM		question q JOIN typequestion tq ON q.typeID = tq.typeId
WHERE		char_length(q.content) = (SELECT	 * 
									  FROM   	 get_max_length_content	);
END $$
DELIMITER ;

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

DROP PROCEDURE IF EXISTS delete_exam_by_ID;
DELIMITER $$
CREATE PROCEDURE delete_exam_by_ID(IN p_examID INT )
BEGIN
	DELETE FROM exam
    WHERE		examID = p_examID;
    SELECT 		*
    FROM		exam;
END $$
DELIMITER ;

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing

DROP PROCEDURE IF EXISTS get_exam_3year_ago;
DELIMITER $$
CREATE PROCEDURE get_exam_3year_ago()
BEGIN
    SELECT 		examID
    FROM		exam
    WHERE 		createDate < date_sub(now(),interval 3 year);
END $$
DELIMITER ;

START TRANSACTION;
COMMIT;
CALL	testing_system_assignment_1.delete_exam_by_ID( get_exam_3year_ago());

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
 
DROP PROCEDURE IF EXISTS del_department_by_name;
DELIMITER $$
CREATE PROCEDURE del_department_by_name(IN p_department_name VARCHAR(50))
BEGIN
	WITH tb_department_choose AS(
								SELECT 		a.accountID
                                FROM 		`account` a JOIN department d ON a.DepartmentID = d.DepartmentID
                                WHERE		d.departmentName = p_department_name
    ),
    id_phong_cho 				AS(
								SELECT departmentID
								FROM	department
								WHERE	departmentName = 'Phong cho viec'
    )
    UPDATE 		`account`
    SET 		departmentID = (SELECT * FROM id_phong_cho)
    WHERE		accountID IN (SELECT * FROM tb_department_choose);
    
    DELETE FROM department 
    WHERE 	departmentName = p_department_name;
    
    SELECT 		* 
    FROM		`account`;
    
    SELECT 		* 
    FROM 		department;
END $$
DELIMITER ;

ROLLBACK;

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay


DROP PROCEDURE IF EXISTS statistc_question_by_month;
DELIMITER $$
CREATE PROCEDURE statistc_question_by_month()
BEGIN
	SELECT 		month(q.createDate), COUNT(q.questionID) , GROUP_CONCAT(q.questionID)
	FROM		question q
	GROUP BY	month(q.createDate)
	ORDER BY	month(q.createDate);
END $$
DELIMITER ;


-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")



DROP PROCEDURE IF EXISTS statistc_question_6_month_ago;
DELIMITER $$
CREATE PROCEDURE statistc_question_6_month_ago()
BEGIN
WITH tb_6_months AS(
		SELECT MONTH(date_sub(now(), INTERVAL 5 MONTH)) AS MONTH UNION
		SELECT MONTH(date_sub(now(), INTERVAL 4 MONTH)) AS MONTH UNION
		SELECT MONTH(date_sub(now(), INTERVAL 3 MONTH)) AS MONTH UNION
		SELECT MONTH(date_sub(now(), INTERVAL 2 MONTH)) AS MONTH UNION
		SELECT MONTH(date_sub(now(), INTERVAL 1 MONTH)) AS MONTH UNION
		SELECT MONTH(now()) AS MONTH)
        SELECT 		tb_6_months.MONTH, 
					CASE WHEN	COUNT(q.questionID) = 0 THEN 'không có câu hỏi nào trong tháng'
					ELSE		COUNT(q.questionID) 
					END	AS 		quantity_question		
		FROM		tb_6_months LEFT JOIN question q ON MONTH(q.createDate) = tb_6_months.MONTH
		GROUP BY	tb_6_months.MONTH
		ORDER BY	tb_6_months.MONTH;
END $$
DELIMITER ;









