SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS person;
CREATE TABLE person (
	person_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	surname VARCHAR(20) NOT NULL,
	birthdate DATE  NOT NULL,
	email VARCHAr(50) NOT NULL,
	passwd VARCHAR(255) NOT NULL,
	additional_note VARCHAR(255) NULL
);

DROP TABLE IF EXISTS thesis;
CREATE TABLE thesis (
	thesis_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	thesis_type VARCHAR(20) NOT NULL,
	description VARCHAR(255) NULL,
	person_id INT NOT NULL,
	FOREIGN KEY (person_id) REFERENCES person(person_id)
);

DROP TABLE IF EXISTS contact;
CREATE TABLE contact (
	contact_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	person_id INT NOT NULL,
	contact_type VARCHAR(20) NOT NULL,
	value VARCHAR(50) NOT NULL,
	FOREIGN KEY (person_id) REFERENCES person(person_id)
);

DROP TABLE IF EXISTS role;
CREATE TABLE role (
	role_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	role_type VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS person_has_role;
CREATE TABLE person_has_role (
	person_id INT NOT NULL,
	role_id INT NOT NULL,
	FOREIGN KEY (person_id) REFERENCES person(person_id),
	FOREIGN KEY (role_id) REFERENCES role(role_id)
);

DROP TABLE IF EXISTS address;
CREATE TABLE address (
	address_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	state VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	house_number INT NOT NULL,
	postal_code INT NOT NULL
);

DROP TABLE IF EXISTS person_has_address;
CREATE TABLE person_has_address (
	person_id INT NOT NULL,
	address_id INT NOT NULL,
	address_type VARCHAR(50),
	FOREIGN KEY (person_id) REFERENCES person(person_id),
	FOREIGN KEY (address_id) REFERENCES address(address_id)
);

DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty (
	faculty_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	address_id INT NOT NULL,
	FOREIGN KEY (address_id) REFERENCES address(address_id)
);

DROP TABLE IF EXISTS faculty_has_person;
CREATE TABLE faculty_has_person (
	faculty_id INT NOT NULL,
	person_id INT NOT NULL,
	relation VARCHAR(20),
	FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
	FOREIGN KEY (person_id) REFERENCES person(person_id)
);

DROP TABLE IF EXISTS department;
CREATE TABLE department (
	department_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	decription VARCHAR(255) NULL
);

DROP TABLE IF EXISTS faculty_has_department;
CREATE TABLE faculty_has_department (
	faculty_id INT NOT NULL,
	department_id INT NOT NULL,
	FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
	FOREIGN KEY (department_id) REFERENCES department(department_id)
);

DROP TABLE IF EXISTS department_has_person;
CREATE TABLE department_has_person (
	department_id INT NOT NULL,
	person_id INT NOT NULL,
	relation VARCHAR(20),
	FOREIGN KEY (department_id) REFERENCES department(department_id),
	FOREIGN KEY (person_id) REFERENCES person(person_id)
);

DROP TABLE IF EXISTS study_program;
CREATE TABLE study_program (
	program_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description VARCHAR(255) NULL
);

DROP TABLE IF EXISTS department_has_program;
CREATE TABLE department_has_program (
	department_id INT NOT NULL,
	program_id INT NOT NULL,
	FOREIGN KEY (department_id) REFERENCES department(department_id),
	FOREIGN KEY (program_id) REFERENCES study_program(program_id)
);

DROP TABLE IF EXISTS program_has_person;
CREATE TABLE program_has_person (
	program_id INT NOT NULL,
	person_id INT NOT NULL,
	relation VARCHAR(20),
	FOREIGN KEY (program_id) REFERENCES study_program(program_id),
	FOREIGN KEY (person_id) REFERENCES person(person_id)
);

DROP TABLE IF EXISTS subject;
CREATE TABLE subject (
	subject_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	department_id INT NOT NULL,
	description VARCHAR(255) NULL,
	prerequisites VARCHAR(255) NULL,
	semester SMALLINT NOT NULL,
	additional_info VARCHAR(255) NULL,
	FOREIGN KEY (department_id) REFERENCES department(department_id)
);

DROP TABLE IF EXISTS program_has_subject;
CREATE TABLE program_has_subject (
	program_id INT NOT NULL,
	subject_id INT NOT NULL,
	FOREIGN KEY (program_id) REFERENCES study_program(program_id),
	FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

DROP TABLE IF EXISTS person_has_subject;
CREATE TABLE person_has_subject (
	person_id INT NOT NULL,
	subject_id INT NOT NULL,
	relation VARCHAR(20),
	FOREIGN KEY (person_id) REFERENCES person(person_id),
	FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

SET FOREIGN_KEY_CHECKS = 1;
