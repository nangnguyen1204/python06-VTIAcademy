
-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo
-- trước 1 năm trước
DROP TRIGGER IF EXISTS verify_create_date_group;

DELIMITER $$
CREATE TRIGGER verify_create_date_group
BEFORE INSERT ON `group`
FOR EACH ROW
BEGIN
		IF 		NEW.createDate < DATE_SUB(NOW() , INTERVAL 1 YEAR) THEN 	
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'Khong the insert ';
		END IF;
END $$
DELIMITER ;

INSERT INTO `group`(createDate) VALUES ('2018-01-01');


-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department "Sale" cannot add more user"

DROP TRIGGER IF EXISTS verify_sales_department;
DELIMITER $$
CREATE TRIGGER verify_sales_department
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
		DECLARE sale_id INT;
        
		SELECT 	departmentID INTO  sale_id
		FROM	department
		WHERE	departmentName = 'Sales';
        
		IF 		NEW.departmentID = sale_id THEN 	
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
		END IF;
END $$
DELIMITER ;

insert into `Account` 	(Email,  				UserName,		FullName,	DepartmentID,PositionID,	CreateDate) values
						('testtrigger@gmail.com', 'congnang1', 'cong nang 1',	 	3,				 1, 		'2022-01-01' );

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user


DROP TRIGGER IF EXISTS verify_quantity_user_in_group;
DELIMITER $$
CREATE TRIGGER verify_quantity_user_in_group
BEFORE INSERT ON groupaccount 
FOR EACH ROW
BEGIN
		DECLARE v_count_user_in_group INT;
        
		SELECT 		COUNT(accountID) INTO v_count_user_in_group
		FROM		groupaccount
        WHERE		groupID = NEW.groupID
		GROUP BY	groupID ;
        
		IF 	v_count_user_in_group >= 5 THEN 	
        SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'max user in group is 5';
		END IF;
END $$
DELIMITER ;

insert into groupAccount (groupID,	accountID,	joinDate	) values 
						( 	1,			9,		'2022-03-01');


-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question

DROP TRIGGER IF EXISTS verify_max_10_question;
DELIMITER $$
CREATE TRIGGER verify_max_10_question
BEFORE INSERT ON examquestion
FOR EACH ROW 
BEGIN
	DECLARE 	v_count_question_in_exam INT;
        
	SELECT 		COUNT(questionID) INTO v_count_question_in_exam
	FROM		examquestion
	WHERE		examID = NEW.examID
	GROUP BY	examID ;
        
	IF 	v_count_question_in_exam >= 10 THEN 	
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = 'max question in exam is 10';
	END IF;
END $$
DELIMITER ;

insert into examQuestion(examID,questionID) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,7),(1,3),(1,8);

-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
-- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
-- tin liên quan tới user đó

DROP TRIGGER IF EXISTS verify_delete_user;
DELIMITER $$
CREATE TRIGGER verify_delete_user
BEFORE DELETE ON `account`
FOR EACH ROW 
BEGIN     
	IF 		OLD.`Email` = 'admin@gmail.com' THEN 	
	SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT = 'đây là tài khoản admin, không cho phép user xóa';
	END IF;
END $$
DELIMITER ;

-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
-- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
-- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"

DROP TRIGGER IF EXISTS verify_default_department;
DELIMITER $$
CREATE TRIGGER verify_default_department
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
		DECLARE v_waitting_room_id INT;
        
        SELECT 		`DepartmentID` INTO v_waitting_room_id
        FROM		department
        WHERE		departmentName = 'Phong cho';
        
        IF 		NEW.`DepartmentID` IS NULL THEN 
        SET		NEW.`DepartmentID` = v_waitting_room_id ; 
        END IF;
END$$
DELIMITER ;

INSERT INTO `account` ( Email, 			UserName, 					FullName, 		DepartmentID , 			positionID		)
    VALUES 			('email@.com',  	'abc'    , 				'	fullname',			null     ,  		NULL	 	);	
    
-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
-- question, trong đó có tối đa 2 đáp án đúng.

DROP TRIGGER IF EXISTS verify_answers_question;
DELIMITER $$
CREATE TRIGGER verify_answers_question
BEFORE INSERT ON answer
FOR EACH ROW
BEGIN
		DECLARE 	v_numbers_answer_question 	INT;
        DECLARE		v_number_correct_answer		INT;
        
        SELECT 		COUNT(answerID) INTO v_numbers_answer_question
        FROM		answer
        WHERE		questionID = NEW.questionID
        GROUP BY	questionID;
        
        SELECT		COUNT(answerID) 	INTO v_number_correct_answer
        FROM 		answer
        WHERE		questionID = NEW.questionID AND isCorrect = 'T'
        GROUP BY	isCorrect;
        
        IF 		v_numbers_answer_question > 4 THEN 
        SIGNAL SQLSTATE '12345'
        SET	MESSAGE_TEXT = "chỉ cho phép user tạo tối đa 4 answers cho mỗi question"; 
        ELSEIF	v_number_correct_answer > 2 	THEN
        SIGNAL SQLSTATE '12345'
        SET	MESSAGE_TEXT = "chỉ có tối đa 2 đáp án đúng cho mỗi question"; 
        END IF;
END$$
DELIMITER ;
    
INSERT INTO `testing_system_assignment_1`.`answer` (`answerID`, `questionID`, `isCorrect`) VALUES ('7', '3', 'f');
INSERT INTO `testing_system_assignment_1`.`answer` (`answerID`, `questionID`, `isCorrect`) VALUES ('8', '3', 'f');
INSERT INTO `testing_system_assignment_1`.`answer` (`answerID`, `questionID`, `isCorrect`) VALUES ('10', '3', 'f');
    

-- Question 8: Viết trigger sửa lại dữ liệu cho đúng:
-- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định
-- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database   

DROP TRIGGER IF EXISTS verify_insert_gender;
DELIMITER $$
CREATE TRIGGER verify_insert_gender
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
        IF 			NEW.`gender` = 'nam'  THEN 
        SET			NEW.`gender` = 'M' ; 
        ElSEIF		NEW.`gender` = 'nu'  THEN 
        SET			NEW.`gender` = 'F' ; 
        ElSEIF		NEW.`gender` = 'chưa xác định' OR null  THEN 
        SET			NEW.`gender` = 'U' ;
        END IF;
END$$
DELIMITER ;

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày

DROP TRIGGER IF EXISTS verify_del_exam;
DELIMITER $$
CREATE TRIGGER verify_del_exam
BEFORE DELETE ON `exam`
FOR EACH ROW
BEGIN
        IF 			OLD.`createDate` > date_sub(now(), INTERVAL 2 DAY)  THEN 
        SIGNAL	SQLSTATE '12345'
        SET MESSAGE_TEXT = 'khong the xoa exam duoc tao 2 ngay trc';
        END IF;
END$$
DELIMITER ;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
-- question khi question đó chưa nằm trong exam nào

DROP TRIGGER IF EXISTS verify_del_exam;
DELIMITER $$
CREATE TRIGGER verify_del_exam
BEFORE DELETE ON `question`
FOR EACH ROW
BEGIN
		DECLARE		v_exam_ID		INT;
        
		SELECT 		examID  INTO v_exam_ID
        FROM		question q LEFT JOIN examquestion eq ON q.questionID = eq.questionID
        WHERE		q.questionID = OLD.questionID;
        
        IF 			v_exam_ID IS NULL  THEN 
        SIGNAL	SQLSTATE '12345'
        SET MESSAGE_TEXT = 'khong the xoa question nay';
        END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS verify_del_exam;
DELIMITER $$
CREATE TRIGGER verify_del_exam
BEFORE UPDATE ON `question`
FOR EACH ROW
BEGIN
		DECLARE		v_exam_ID		INT;
        
		SELECT 		examID  INTO v_exam_ID
        FROM		question q LEFT JOIN examquestion eq ON q.questionID = eq.questionID
        WHERE		q.questionID = OLD.questionID;
        
        IF 			v_exam_ID IS NULL  THEN 
        SIGNAL	SQLSTATE '12345'
        SET MESSAGE_TEXT = 'khong the UPDATE question nay';
        END IF;
END$$
DELIMITER ;

UPDATE 		question
SET			content = ' test trigger'  
WHERE		questionID = 6;

-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"
SELECT 		examID,
			CASE 
            WHEN 	time(duration) < '00:30:00' THEN "Short time"
            WHEN 	time(duration) BETWEEN '00:30:00' AND '01:00:00' THEN "Medium time"
            WHEN 	time(duration) > '01:00:00' THEN "Long time"
            ELSE 	null
            END 	AS duration
FROM 		exam;


-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
-- là the_number_user_amount và mang giá trị được quy định như sau:
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher

SELECT 		groupID, COUNT(accountID) AS number_user,
			CASE 
            WHEN	COUNT(accountID) <= 5 THEN 'few'
            WHEN	COUNT(accountID) BETWEEN 6 AND 20 THEN 'normal'
            WHEN	COUNT(accountID) > 20 THEN 'higher'
            END AS the_number_user_amount
FROM		groupaccount
GROUP BY	groupID;


-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
-- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"

SELECT 		departmentName, 
			CASE 	
            WHEN	COUNT(AccountID) = 0 THEN "Không có User"
            ELSE	COUNT(AccountID)
            END	AS	number_account
FROM		department d LEFT JOIN `account` a ON d.departmentID = a.DepartmentID
GROUP BY	d.departmentID;













