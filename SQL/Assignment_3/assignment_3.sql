SELECT 
    departmentID
FROM
    department
WHERE
    DepartmentName = 'sales';

SELECT 
    FullName
FROM
    `account`
GROUP BY FullName
HAVING LENGTH(FullName) = (SELECT 
        MAX(LENGTH(FullName))
    FROM
        account);

SELECT 
    *
FROM
    account
WHERE 
    LENGTH(FullName) = (SELECT 
            MAX(LENGTH(FullName))
        FROM
            account);
            
SELECT 
    *
FROM
    account
WHERE 
	DepartmentID = 3 and
    LENGTH(FullName) = (SELECT 
            MAX(LENGTH(FullName))
        FROM
            account
        WHERE
            DepartmentID = 3);
            
select groupName from `group` where date(createDate) < date('2019-12-20');

SELECT 
    questionID
FROM
    question
WHERE
    (SELECT 
            COUNT(answerID)
        FROM
            answer
        GROUP BY questionID
        HAVING COUNT(answerID) >= 4);

SELECT 
    examID
FROM
    exam
WHERE
    TIME(duration) >= TIME('01:00:00')
        AND createDate < '2019-12-19';

SELECT 
    *
FROM
    `group`
ORDER BY createDate DESC
LIMIT 5;

SELECT 
    COUNT(AccountID)
FROM
    account
WHERE
    DepartmentID = 2;

SELECT 
    *
FROM
    account
WHERE
    FullName LIKE 'D%o';

DELETE FROM exam 
WHERE
    createDate < '2019-12-19';

DELETE FROM question 
WHERE
    content LIKE 'cau hoi %';

UPDATE account 
SET 
    FullName = 'Nguyen Ba Loc',
    Email = 'loc.nguyenba@vti.com.vn'
WHERE
    accountID = 5;

UPDATE groupaccount 
SET 
    groupID = 4
WHERE
    accountID = 5;

					-- extra--
                    
insert into trainee (fullName, 			birthDay, 		gender, ET_IQ, ET_Gmath, ET_English,trainingClass, evaluationNotes ) values
					('Cong Nang 01',	'2000-04-12', 'male', 	20,		20,			50,		'Python06',		'evaluationNotes01'			),
					('Cong Nang 023',	'1999-05-12', 'female', 2,		2,			50,		'Python067',	'evaluationNotes01ad'		),
					('Cong Nang 04',	'2005-03-12', 'male', 	10,		10,			25,		'Java',			'evaluationNotes01asdasd'	),
					('Cong Nang 05',	'1950-02-12', 'female', 5,		5,			5,		'Java',			'a'							),
					('Cong Nang 06',	'1960-01-12', 'male', 	10,		10,			10,		'Python06',		''							),
					('Cong Nang 07',	'2003-01-12', 'female', 15,		15,			15,		'SQL',			'sa'						),
					('Cong Nang 08',	'2000-02-12', 'male', 	5,		20,			30,		'SQL',			'evaluationNotes01'			),
					('Lam 1',			'2000-03-12', 'female', 7,		7,			40,		'Python06',		'evaluationNotes01'			),
					('duc',				'2000-02-12', 'female', 20,		2,			30,		'C#','fafa'									),
					('viet 1',			'2000-02-12', 'male', 	15,		5,			50,		'Python06',		'aaaaaaaa'					),
					('nguyen cong nang','2000-10-12', 'male', 	15,		2,			2,		'Python06',		'aaaaa'						);



select * from trainee order by month(birthDay) asc;

SELECT 
    *
FROM
    trainee
WHERE
    LENGTH(fullName) = (SELECT 
            MAX(LENGTH(fullName))
        FROM
            trainee);
            
SELECT 
    *
FROM
    trainee
WHERE
    (ET_IQ + ET_Gmath) >= 20 AND ET_IQ >= 8
        AND ET_Gmath >= 8
        AND ET_English >= 18;

DELETE FROM trainee 
WHERE
    traineeID = 3;

UPDATE trainee 
SET 
    trainingClass = 'Java'
WHERE
    traineeID = 5;

create database if not exists ex;
 
 use ex;
 
 CREATE TABLE IF NOT EXISTS forex (
    forexID INT PRIMARY KEY AUTO_INCREMENT,
    forexContent INT
);
 
 alter table forex auto_increment =100;
 
 insert into forex(forexContent) values(10),(12),(13),(14),(15);