
-- cau1 :
CREATE VIEW v_danh_sach_nhan_vien_phong_sale AS 
SELECT a.*, d.departmentName 
FROM `account` a JOIN department d ON a.DepartmentID = d.departmentID 
WHERE d.departmentName = 'sales';

SELECT * FROM v_danh_sach_nhan_vien_phong_sale;

-- cau2

CREATE VIEW v_numbers_group_of_user AS 
SELECT a.*, count(ga.accountID) AS numbers_group_of_user
FROM `account` a JOIN groupaccount ga ON a.accountID = ga.accountID 
GROUP BY AccountID
HAVING numbers_group_of_user = (SELECT max(table_numbers_group_of_user.numbers_group_of_user) 
								FROM (SELECT COUNT(ga.groupID) AS numbers_group_of_user
									  FROM groupaccount ga 
									  GROUP BY accountID) table_numbers_group_of_user);


WITH tb_dem_group 		AS(
						SELECT COUNT(ga.groupID) AS numbers_group_of_user
						FROM groupaccount ga 
						GROUP BY accountID),
	tb_max_dem_group 	AS(
						SELECT MAX(tb_dem_group.numbers_group_of_user) AS max_group
						FROM tb_dem_group)
SELECT a.*, count(ga.accountID) AS numbers_group_of_user
FROM `account` a JOIN groupaccount ga ON a.accountID = ga.accountID 
GROUP BY accountID
HAVING numbers_group_of_user =(SELECT max_group
								FROM tb_max_dem_group
                                );
                                
                                
      
      
      
-- cau3 
DROP VIEW IF EXISTS v_content_great_length;   
CREATE VIEW v_content_great_length AS
SELECT q.*
FROM question q
WHERE length(q.content) > 12;            

SELECT * FROM v_content_great_length;

DELETE
FROM v_content_great_length
WHERE length(content) > 12;



--      cau4 


WITH 
tb_dem_account AS(
SELECT COUNT(ga.accountID) AS dem_account
FROM groupaccount ga 
GROUP BY groupID
)
SELECT * , COUNT(ga.accountID)
FROM `group` g JOIN groupaccount ga ON g.groupID = ga.groupID
GROUP BY ga.groupID
HAVING COUNT(ga.accountID) = (SELECT MAX(tb_dem_account.dem_account) 
								FROM tb_dem_account);




-- cau5
DROP VIEW IF EXISTS v_creator_ho_nguyen;
CREATE VIEW v_creator_ho_nguyen AS
SELECT q.*, a.FullName 
FROM question q JOIN `account` a ON q.creatorID = a.AccountID
WHERE a.FullName LIKE 'Nguyen%'; 

SELECT * FROM v_creator_ho_nguyen;
      