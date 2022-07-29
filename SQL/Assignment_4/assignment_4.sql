
-- 1 
SELECT 
    a.AccountID, d.DepartmentName
FROM
    `account` a
        JOIN
    department d ON a.DepartmentID = d.DepartmentID
ORDER BY AccountID; 


-- 2 
SELECT 
    *
FROM
    account
WHERE
    DATE(CreateDate) > DATE('2010-12-20');
    
-- 3     
SELECT 
    a.*, p.PositionName
FROM
    account a
        JOIN
    position p ON a.PositionID = p.PositionID
WHERE
    p.PositionName = 'Dev';
 
 
 -- 4 
SELECT 
    d.*, COUNT(a.accountID) AS numbers_account
FROM
    department d
        JOIN
    account a ON d.DepartmentID = a.DepartmentID
GROUP BY DepartmentID
having numbers_account >3
;


-- 5 
SELECT 
    q.*, COUNT(eq.questionID) AS numbers_use
FROM
    question q
        JOIN
    examquestion eq ON q.questionID = eq.questionID
GROUP BY questionID
HAVING numbers_use = (SELECT 
        MAX(eq.numbers_use)
    FROM
        (SELECT 
            COUNT(questionID) AS numbers_use
        FROM
            examquestion
        GROUP BY questionID) eq);     

SELECT 
    MAX(eq.numbers_use)
FROM
    (SELECT 
        COUNT(questionID) AS numbers_use
    FROM
        examquestion
    GROUP BY questionID) eq;


-- 6     
SELECT 
    cq.*, COUNT(q.categoryID) AS numbers_category_use
FROM
    categoryquestion cq
        JOIN
    question q ON cq.categoryID = q.categoryID
GROUP BY categoryID
ORDER BY numbers_category_use DESC;   


-- 7 
SELECT 
    q.questionID,
    COUNT(eq.questionID) AS numbers_question_use_in_exam
FROM
    question q
        JOIN
    examquestion eq ON q.questionID = eq.questionID
GROUP BY questionID
ORDER BY numbers_question_use_in_exam DESC;

-- 8 

SELECT 
    an.questionID, COUNT(an.answerID) AS numbers_answer
FROM
    answer an
GROUP BY questionID
HAVING numbers_answer = (SELECT 
        MAX(anx.numbers_answer)
    FROM
        (SELECT 
            COUNT(answerID) AS numbers_answer
        FROM
            answer
        GROUP BY questionID) anx);

select max(anx.numbers_answer) from (select count(answerID) as numbers_answer from answer group by questionID) anx;


-- 9 
SELECT 
    g.groupID,
    g.groupName,
    COUNT(ga.accountID) AS numbers_account_in_group
FROM
    `group` g
        JOIN
    groupaccount ga ON g.groupID = ga.groupID
GROUP BY groupID
ORDER BY numbers_account_in_group DESC;

-- 10 

SELECT 
    p.*, COUNT(a.accountID) AS numbers_account_in_position
FROM
    position p
        JOIN
    account a ON p.PositionID = a.PositionID
GROUP BY PositionID
HAVING numbers_account_in_position = (SELECT 
        MIN(ax.numbers_account_in_position)
    FROM
        (SELECT 
            COUNT(accountID) AS numbers_account_in_position
        FROM
            account
        GROUP BY PositionID) ax)
; 

select min(ax.numbers_account_in_position) from (select count(accountID) as numbers_account_in_position from account group by PositionID) ax;

-- --cau 11 ???--

-- 12

SELECT 
    q.*, an.answerID
FROM
    question q
        LEFT JOIN
    answer an ON q.questionID = an.questionID;

-- 13
SELECT 
    tq.*, COUNT(q.questionID) AS numbers_question_of_type
FROM
    question q
        JOIN
    typequestion tq ON q.typeID = tq.typeId
GROUP BY typeID;

-- 14 
SELECT 
    g.*
FROM
    `group` g
        LEFT JOIN
    groupaccount ga ON g.groupID = ga.groupID
WHERE
    ga.groupID IS NULL; 

-- 15
SELECT 
    q.*
FROM
    question q
        LEFT JOIN
    answer a ON q.questionID = a.questionID
WHERE
    a.questionID IS NULL;

-- union union all
-- cau1
SELECT 
    a.*, ga.groupID
FROM
    `account` a
        JOIN
    groupaccount ga ON a.AccountID = ga.accountID
WHERE
    groupID = 1 
UNION SELECT 
    a.*, ga.groupID
FROM
    `account` a
        JOIN
    groupaccount ga ON a.AccountID = ga.accountID
WHERE
    groupID = 2; 
    
-- cau2
SELECT 
    groupID, COUNT(accountID) AS numbers_account_on_group
FROM
    groupaccount
GROUP BY groupID
HAVING numbers_account_on_group = 1 
UNION ALL SELECT 
    groupID, COUNT(accountID) AS numbers_account_on_group
FROM
    groupaccount
GROUP BY groupID
HAVING numbers_account_on_group > 1
;
