

DROP DATABASE IF EXISTS project_management;
CREATE DATABASE IF NOT EXISTS project_management;

USE project_management;

CREATE	TABLE	projects(
    projectID						SMALLINT PRIMARY KEY AUTO_INCREMENT,
    managerID						INT,
    project_name					VARCHAR(255),
    project_start_date				DATE,
    project_description				VARCHAR(255),
    project_detail					VARCHAR(255),
    project_complete_on				DATE
);

CREATE TABLE	employee(
	employeeID						INT PRIMARY KEY AUTO_INCREMENT,
    employee_last_name				VARCHAR(255),
    employee_first_name				VARCHAR(255),
    employee_hire_date				DATE,
    employee_status					VARCHAR(255),
    supervisorID					INT,
    social_security_number			INT
);


CREATE TABLE project_modules(
	moduleID 						SMALLINT PRIMARY KEY AUTO_INCREMENT,
    projectID						SMALLINT,
    employeeID						INT,
    project_modules_date			DATE,
    project_modules_complete_one	DATE,
    project_modules_description		VARCHAR(255),
    FOREIGN KEY(projectID)		REFERENCES	projects(projectID) 	ON DELETE CASCADE,
    FOREIGN KEY(employeeID)		REFERENCES	employee(employeeID)	ON DELETE CASCADE
);

CREATE TABLE	work_done(
	work_done_ID					INT PRIMARY KEY AUTO_INCREMENT,
    employeeID						INT,
    moduleID						SMALLINT,
    work_done_date					DATE,
    work_done_description			VARCHAR(255),
    work_done_status				VARCHAR(255),
    FOREIGN KEY(employeeID) 	REFERENCES  employee(employeeID) 		ON DELETE CASCADE,
    FOREIGN KEY(moduleID)  		REFERENCES 	project_modules(moduleID)	ON DELETE CASCADE
);

INSERT INTO projects(managerID,  project_name 		, 	project_start_date	,   	project_description			, 	project_detail			, 	project_complete_on)
VALUES				(	1,		'project name 1'	,	'2012-01-01'		,		'project_description 123'	,   'project_detail 1123'	, 	'2018-01-01'		),			
					(	2,		'project name 123'	,	'2015-01-01'		,		'description 1'				,   'detail 1'				, 	'2022-08-01'		),
                    (	3,		'project 21'		,	'2017-01-01'		,		'project'					,   'project_detail 1'		, 	'2020-12-01'		),
                    (	2,		'project name 13213',	'2022-01-01'		,		'project_description 23'	,   'project'				, 	'2022-07-01'		);
                    
INSERT INTO employee(employee_last_name	,	employee_first_name	,	employee_hire_date	,	employee_status	,	supervisorID ,	social_security_number)                     
VALUES				(	'nang'			,	'Nguyen Cong'		,		'2018-02-02'	,		'ss'		,		5		 ,		10001			  ),
					(	'Huy'			,	'Tran Cong'			,		'2014-03-02'	,		'non-ss'	,		5		 ,		10002			  ),
                    (	'Lam'			,	'Pham Van'			,		'2015-04-02'	,		'ss'		,		5		 ,		10003			  ),
                    (	'Truc'			,	'Nguyen Thi'		,		'2016-08-02'	,		'non-ss'	,		5		 ,		10004			  ),
                    (	'Viet'			,	'Vu Cong'			,		'2017-12-02'	,		'ss'		,		5		 ,		10005			  );
                    
INSERT INTO project_modules(projectID	,	employeeID	,	project_modules_date	, 	project_modules_complete_one ,  project_modules_description	)
VALUES					   (	1		,		2		,		'2014-09-12'		,		'2020-06-04'			 , 'project_modules_description'),
						   (	2		,		5		,		'2015-09-12'		,		'2020-06-04'			 , 'description'				),
                           (	3		,		4		,		'2016-09-12'		,		'2020-06-04'			 , 'project_modules'			),
                           (	1		,		5		,		'2017-09-12'		,			null				 , 'project'					),
                           (	2		,		2		,		'2018-09-12'		,		'2020-06-04'			 , 'modules_description'		),
                           (	3		,		1		,		'2019-09-12'		,			null				 , 'sd_modules_description'		);
                           
INSERT INTO work_done(employeeID	,	moduleID	,	 work_done_date	,	work_done_description		,	work_done_status	)
VALUES				 (	1			,		1		,		null		,	'work_done_description'		,	'non-done'			),
					 (	2			,		1		,	 '2022-06-12'	,	'work_done'					,	'done'				),
                     (	3			,		2		,			null	,	'description'				,	'non-done'			),
                     (	4			,		3		,	 '2022-06-12'	,	'done_description'			,	'done'				),
                     (	1			,		5		,	 '2022-06-12'	,	'work_description'			,	'done'				),
                     (	2			,		5		,			null	,	'work_done_description12'	,	'non-done'			);








