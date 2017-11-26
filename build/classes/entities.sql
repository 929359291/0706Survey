CREATE TABLE test_emp(
	emp_id INT AUTO_INCREMENT,
	emp_name CHAR(100),
	emp_salary DOUBLE(15,2),
	PRIMARY KEY(emp_id)
);

CREATE TABLE guest_user(
	user_id INT AUTO_INCREMENT,
	user_name CHAR(100),
	user_pwd CHAR(100),
	company BOOLEAN,
	PRIMARY KEY(user_id)
);

CREATE TABLE guest_bag(
	bag_id INT AUTO_INCREMENT,
	bag_name CHAR(100),
	bag_order INT,
	survey_id INT,
	PRIMARY KEY(bag_id),
	FOREIGN KEY(survey_id) REFERENCES guest_survey(survey_id)
);
CREATE TABLE guest_survey(
	survey_id INT AUTO_INCREMENT,
	survey_name CHAR(100),
	survey_complete BOOLEAN,
	logo_path CHAR(200),
	user_id INT,
	PRIMARY KEY(survey_id),
	FOREIGN KEY(user_id) REFERENCES guest_user(user_id)
);

CREATE TABLE guest_question(
	question_id INT AUTO_INCREMENT,
	question_name CHAR(100),
	question_type INT,
	question_options CHAR(100),
	bag_id INT,
	PRIMARY KEY(question_id),
	FOREIGN KEY(bag_id) REFERENCES guest_bag(bag_id)
);

CREATE TABLE guest_answer(
	answer_id INT AUTO_INCREMENT,
	answer_content CHAR(200),
	answer_uuid CHAR(100),
	survey_id INT,
	question_id INT,
	PRIMARY KEY(answer_id),
	FOREIGN KEY(survey_id) REFERENCES guest_survey(survey_id),
	FOREIGN KEY(question_id) REFERENCES guest_question(question_id)
);

CREATE TABLE manager_admin(
	admin_id INT AUTO_INCREMENT PRIMARY KEY,
	admin_name CHAR(100),
	admin_pwd CHAR(100)
);

CREATE TABLE manager_res(
	res_id INT AUTO_INCREMENT,
	servlet_path CHAR(100),
	res_code INT,
	res_pos INT,
	public_status BOOLEAN,
	PRIMARY KEY(res_id)
);

CREATE TABLE manager_auth(
	auth_id INT AUTO_INCREMENT,
	auth_name CHAR(100),
	PRIMARY KEY(auth_id)
);

CREATE TABLE manager_role(
	role_id INT AUTO_INCREMENT,
	role_name CHAR(100),
	PRIMARY KEY(role_id)
);

ALTER TABLE guest_user
ADD code_arr CHAR(100);

ALTER TABLE manager_admin
ADD code_arr CHAR(100);

CREATE TABLE inner_auth_res(
	res_id INT,
	auth_id INT,
	PRIMARY KEY(res_id,auth_id),
	FOREIGN KEY(res_id) REFERENCES manager_res(res_id),
	FOREIGN KEY(auth_id) REFERENCES manager_auth(auth_id)
);

CREATE TABLE inner_role_auth(
	auth_id INT,
	role_id INT,
	PRIMARY KEY(auth_id,role_id),
	FOREIGN KEY(auth_id) REFERENCES manager_auth(auth_id),
	FOREIGN KEY(role_id) REFERENCES manager_role(role_id)
);

CREATE TABLE inner_admin_role(
	admin_id INT,
	role_id INT,
	PRIMARY KEY(admin_id,role_id),
	FOREIGN KEY(admin_id) REFERENCES manager_admin(admin_id),
	FOREIGN KEY(role_id) REFERENCES manager_role(role_id)
);

CREATE TABLE inner_user_role(
	user_id INT,
	role_id INT,
	PRIMARY KEY(user_id,role_id),
	FOREIGN KEY(user_id) REFERENCES guest_user(user_id),
	FOREIGN KEY(role_id) REFERENCES manager_role(role_id)
);

CREATE TABLE manager_log(
	log_id INT AUTO_INCREMENT PRIMARY KEY,
	operator CHAR(100),
	operate_time CHAR(100),
	method_name CHAR(100),
	type_name CHAR(100),
	input_data VARCHAR(6000),
	output_data VARCHAR(6000),
	exception_type CHAR(200),
	exception_message VARCHAR(6000)
);