drop database if exists extraassignment_4;

create database if not exists extraassignment_4;

use extraassignment_4;

CREATE TABLE IF NOT EXISTS department (
    department_number 		SMALLINT PRIMARY KEY AUTO_INCREMENT,
    department_name 		NVARCHAR(255)
);

CREATE TABLE IF NOT EXISTS employee_table (
    employee_number 		MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
    employee_name 			NVARCHAR(255),
    department_number 		SMALLINT,
    FOREIGN KEY (department_number)
        REFERENCES department (department_number)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS employee_skill_table (
    employee_number 		MEDIUMINT,
    skill_code 				NVARCHAR(255),
    date_registered			DATE
);

INSERT INTO  department (department_name) VALUES 
('sales'),('giam doc'),('marketing'),('phong nhan su'),('phong ke hoach'),('ke toan'),('customer service'),('developer'),('quality '),('finance'),('reseach'),('pho giam doc');

INSERT INTO employee_table(employee_name, department_number) VALUES
							('cong nang' ,		1),
                            ('huy nam' ,		2),
                            ('ha hang' ,		3),
                            ('manh duc' ,		4),
                            ('phuong hang' ,	5),
                            ('trinh thuy' ,		6),
                            ('huy hoang' ,		6),
                            ('du hien' ,		6),
                            ('van lam' ,		1),
                            ('duc viet' ,		9);
truncate table employee_skill_table;                            
INSERT INTO employee_skill_table (employee_number,skill_code, 	date_registered ) VALUES
								 (	1, 				'Java'   ,  '2000-07-28' ),
                                 (	1, 				'Ruby'   ,  '2010-06-01' ),
                                 (	3, 				'Java'   ,  '2000-05-02' ),
                                 (	4, 				'Java'   ,  '2004-04-11' ),
                                 (	4, 				'Ruby'   ,  '2022-03-12' ),
                                 (	6, 				'SQL'    ,  '2005-03-14' ),
                                 (	1, 				'C#'   	 ,  '2006-02-17' ),
                                 (	2, 				'C++'    ,  '2007-01-23' ),
                                 (	2, 				'Python' ,  '2008-12-22' ),
                                 (	2, 				'Java'   ,  '2022-10-28' );
                                 
SELECT 
    et.*, est.skill_code
FROM
    employee_table et
        JOIN
    employee_skill_table est ON et.employee_number = est.employee_number
WHERE
    est.skill_code = 'Java';
    
SELECT 
    d.*,
    COUNT(et.employee_number) AS numbers_employee_on_department
FROM
    department d
        JOIN
    employee_table et ON d.department_number = et.department_number
GROUP BY department_number
HAVING numbers_employee_on_department > 1;

SELECT 
    d.department_name,
    count(et.employee_number) , GROUP_CONCAT(et.employee_name)
FROM
    employee_table et
        RIGHT JOIN
    department d ON et.department_number = d.department_number
GROUP BY d.department_number
ORDER BY count(et.employee_number) DESC;

SELECT 
    et.*, COUNT(est.skill_code) AS numbers_skill_of_employee
FROM
    employee_table et
        JOIN
    employee_skill_table est ON et.employee_number = est.employee_number
GROUP BY est.employee_number
HAVING numbers_skill_of_employee >= 2
ORDER BY numbers_skill_of_employee DESC;