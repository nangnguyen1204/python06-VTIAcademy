
create database if not exists demoPythonDatabase;

use demoPythonDatabase;

CREATE TABLE customers (
    id 					TINYINT,
    first_name 			VARCHAR(20),
    last_name 			VARCHAR(20),
    age 				TINYINT
);


CREATE TABLE persons (
    id 					TINYINT,
    full_name 			VARCHAR(50),
    address 			VARCHAR(50),
    birth_day			DATE,
    gender 				ENUM('M', 'F')
);


								-- BÀI TẬP Testing_System_1-- 
drop database if exists Testing_System_Assignment_1;
create database if not exists Testing_System_Assignment_1;

use Testing_System_Assignment_1;

CREATE TABLE IF NOT EXISTS department (
    departmentID 			TINYINT PRIMARY KEY AUTO_INCREMENT,
    departmentName 			VARCHAR(100)
);

insert into department (DepartmentName) values ('Marketing'),('Ke toan'),('sales'),('Bao ve'),('Nhan su'),('Giam doc'),('thu ki'),('pho giam doc');

CREATE TABLE if not exists `Position` (
    PositionID 				TINYINT PRIMARY KEY AUTO_INCREMENT,
    PositionName 			ENUM('Dev', 'Test', 'Scum Master', 'PM')
);

insert into `Position` (PositionName) values ('Dev'),('Scum Master'),('Test'),('PM'),('Test');

CREATE TABLE IF NOT EXISTS `Account` (
    AccountID 				TINYINT PRIMARY KEY AUTO_INCREMENT,
    Email 					VARCHAR(255),
    UserName 				VARCHAR(255),
    FullName 				VARCHAR(255),
    DepartmentID 			TINYINT,
    PositionID 				TINYINT,
    CreateDate 				DATE,
    FOREIGN KEY (PositionID)
        REFERENCES `Position` (PositionID)
        ON DELETE CASCADE,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID)
        ON DELETE CASCADE
);


insert into `Account` 	(Email,  				UserName,		FullName,	DepartmentID,PositionID,	CreateDate) values
						('congnang1@gmail.com', 'congnang1', 'cong nang 1',	 1,				 1, 		'2022-01-01' ),
						('congnang2@gmail.com', 'congnang2', 'cong nang 2',	 2,				 2, 		'2022-01-02' ),
						('congnang3@gmail.com', 'congnang3', 'cong nang 3',  3, 			 3, 		'2022-01-03' ),
						('congnang4@gmail.com', 'congnang4', 'cong nang 4',	 4,				 4, 		'2022-01-04' ),
						('congnang5@gmail.com', 'congnang5', 'cong nang 5',  5,				 4, 		'2022-01-05' ),
					    ('congnang6@gmail.com', 'congnang6', 'cong nang 6',	 6,				 3, 		'2022-01-06' );

insert into `Account` (Email,UserName,FullName,DepartmentID,PositionID,CreateDate) values
('congnang6@gmail.com', 'congnang6', 'cong nang 666', 6, 3, '2022-01-06' );

CREATE TABLE IF NOT EXISTS `group` (
    groupID 			TINYINT PRIMARY KEY AUTO_INCREMENT,
    groupName 			VARCHAR(255),
    creatorID 			SMALLINT,
    createDate			 DATE
);

insert into `group`(groupName,	 creatorID, 	createDate) values
					('group1', 		1 , 	'2022-02-01'),
					('group2', 		2 , 	'2022-02-02'),
					('group3', 		3 , 	'2022-02-03'),
					('group4',		4 , 	'2022-02-04'),
					('group5',		5 , 	'2022-02-05'),
					('group6', 		6 , 	'2022-02-06');


CREATE TABLE IF NOT EXISTS groupAccount (
    groupID 			TINYINT,
    accountID 			SMALLINT,
    joinDate			 DATE
);

insert into groupAccount (groupID,	accountID,	joinDate	) values 
						( 	1,			1,		'2022-03-01'),
						(	1,			2,		'2022-03-02'),
						(	3,			3,		'2022-03-03'),
						(	4,			3,		'2022-03-04'),
                        (	5,			3,		'2022-03-04'),
						(	1,			5,		'2022-03-05');

CREATE TABLE if not exists typeQuestion (
    typeId				 TINYINT PRIMARY KEY AUTO_INCREMENT,
    typeName			 ENUM('Essay', 'Multiple-Choice')
);

insert into typeQuestion (typeName) values ('Essay'),('Multiple-Choice');

CREATE TABLE IF NOT EXISTS categoryQuestion (
    categoryID 				TINYINT PRIMARY KEY AUTO_INCREMENT,
    categoryName 			ENUM('Java', '.NET', 'SQL', 'Postman', 'Ruby')
);

insert into categoryQuestion(categoryName) values ('Java'), ('.NET'), ('SQL'), ('Postman'), ('Ruby');


CREATE TABLE IF NOT EXISTS question (
    questionID 			SMALLINT PRIMARY KEY AUTO_INCREMENT,
    content				VARCHAR(255),
    categoryID 			TINYINT,
    typeID				TINYINT,
    creatorID 			SMALLINT,
    createDate 			DATE,
    FOREIGN KEY (categoryID)
        REFERENCES categoryQuestion (categoryID)
        ON DELETE CASCADE,
    FOREIGN KEY (typeID)
        REFERENCES typeQuestion (typeID)
        ON DELETE CASCADE
);

insert into  question(content,		categoryID,	typeID, creatorID,	createDate  ) values
					 ('content1',		 1, 		1, 		1, 		'2022-04-01'),
					 ('content2',		 2,			2, 		2, 		'2022-04-02'),
					 ('content3', 		 3, 		2, 		3, 		'2022-04-03'),
					 ('content4', 		 4, 		1, 		4, 		'2022-04-04'),
					 ('content5',		 5, 		2, 		5, 		'2022-04-05'),
					 ('content6',		 3, 		1, 		6, 		'2022-04-06');



CREATE TABLE answer (
    answerID 			SMALLINT PRIMARY KEY AUTO_INCREMENT,
    content 			VARCHAR(255),
    questionID 			SMALLINT,
    isCorrect 			ENUM('T', 'F'),
    FOREIGN KEY (questionID)
        REFERENCES question (questionID)
        ON DELETE CASCADE
);

insert into answer(   content,	questionID,	isCorrect) values
					('content1',	1, 			'T'),
					('content2', 	2, 			'F'),
					('content3', 	3, 			'T'),
					('content4', 	4, 			'F'),
					('content5', 	5, 			'T'),
					('content6', 	6, 			'F');


CREATE TABLE IF NOT EXISTS exam (
    examID 				SMALLINT PRIMARY KEY AUTO_INCREMENT,
    `code` 				CHAR(10),
    title 				VARCHAR(255),
    categoryID			TINYINT,
    duration 			TIME,
    creatorID 			TINYINT,
    createDate 			DATE,
    FOREIGN KEY (categoryID) 	REFERENCES categoryQuestion (categoryID)	ON DELETE CASCADE,
	FOREIGN KEY (creatorID) 	REFERENCES `account` (accountID)	ON DELETE CASCADE
);

insert into 		exam(`code`,		title, 	categoryID,		duration,	creatorID,	createDate) values
						('codeexam01',	'title1',	1,			'01:01:01',		1,		'2022-05-01'),
						('codeexam02',	'title2',	2,			'01:01:02',		2,		'2022-05-02'),
						('codeexam03', 	'title3',	3,			'01:01:03',		4,		'2022-05-03'),
						('codeexam04',	'title4',	4,			'01:01:04',		3,		'2022-05-04'),
						('codeexam05',	'title5',	5,			'01:01:05',		5,		'2022-05-05');

CREATE TABLE IF NOT EXISTS examQuestion (
    examID 				SMALLINT,
    questionID 			SMALLINT
);


insert into examQuestion(examID,questionID) values (1,1),(2,2),(3,3),(4,4),(5,5),(6,1),(7,1);

							-- Bài tập Extra Assignment 1 --
        
create database if not exists extraAssignment_1;

use extraAssignment_1;

drop table if exists trainee;
CREATE TABLE IF NOT EXISTS trainee (
    traineeID 				SMALLINT PRIMARY KEY AUTO_INCREMENT,
    fullName 				VARCHAR(255),
    birthDay				DATE,
    gender 					ENUM('male', 'female', 'unknown'),
    ET_IQ 					TINYINT CHECK (ET_IQ > 0 AND ET_IQ <= 20),
    ET_Gmath 				TINYINT CHECK (ET_Gmath > 0 AND ET_Gmath <= 20),
    ET_English				TINYINT CHECK (ET_English > 0 AND ET_English <= 50),
    trainingClass 			VARCHAR(255),
    evaluationNotes 		TEXT
);


alter table trainee
add VTI_Account varchar(50) not null unique key;

CREATE TABLE dataTypes1 (
    dataTypes1ID 				INT PRIMARY KEY AUTO_INCREMENT,
    dataTypes1Name 				VARCHAR(50),
    dataTypes1Code 				CHAR(5),
    dataTypes1ModifiedDate 		DATETIME
);

drop table if exists dataTypes2;

CREATE TABLE dataTypes2 (
    dataTypes2ID 					INT PRIMARY KEY AUTO_INCREMENT,
    dataTypes2Name 					VARCHAR(50),
    dataTypes2BirthDay				DATE,
    dataTypes2Gender 				TINYINT CHECK(dataTypes2Gender < 2),
    dataTypes2isDeletedFlag 		ENUM('1', '0')
);

