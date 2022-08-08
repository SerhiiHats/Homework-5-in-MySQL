/* Создайте базу данных с именем “MyJoinsDB”.
В данной базе данных создайте 3 таблицы, 
В 1-й таблице содержатся имена и номера телефонов сотрудников компании.
Во 2-й таблице содержатся ведомости о зарплате и должностях сотрудников: главный директор, менеджер, рабочий. 
В 3-й таблице содержится информация о семейном положении, дате рождения, и месте проживания. */

CREATE DATABASE MyJoinsDB;

USE myjoinsdb;

CREATE TABLE Employees (
id_emp INT AUTO_INCREMENT PRIMARY KEY,
name_emp VARCHAR(50) NOT NULL,
phone_emp VARCHAR(15) NOT NULL UNIQUE);

CREATE TABLE Title_jobs (
id_job INT AUTO_INCREMENT PRIMARY KEY,
id_emp INT NOT NULL,
salary_job DOUBLE NOT NULL DEFAULT 0,
title_job VARCHAR(30) NOT NULL DEFAULT 'Trenee',
FOREIGN KEY (id_emp) REFERENCES Employees (id_emp));

CREATE TABLE Description_employees (
id_des INT AUTO_INCREMENT PRIMARY KEY,
id_emp INT NOT NULL UNIQUE,
married_des VARCHAR (15) NOT NULL,
birthday_des DATE NOT NULL,
address_des VARCHAR(50),
FOREIGN KEY (id_emp) REFERENCES Employees (id_emp));

INSERT INTO Employees (name_emp, phone_emp)
VALUES
('Буюклі Л.М', '+380678514751'),
('Даниленко Д.І', '+380679548521'),
('Чекан О.В.', '+380679512575'),
('Антоненко І.А.', '+380738529614'),
('Балева Н.О.', '+380638547596');

SELECT * FROM Employees;

INSERT INTO Title_jobs (id_emp, salary_job, title_job)
VALUES 
(1, 10000.5, 'головний директор'),
(2, 8000.5, 'менеджер'),
(3, 6500.5, 'робітник'),
(4, 7800.5, 'робітник'),
(5, 5895.5, 'робітник');

SELECT * FROM Title_jobs;

INSERT INTO Description_employees (id_emp, married_des, birthday_des, address_des)
VALUES 
(1, 'not married', '1988-04-15', 'Ukraine, Odessa, Bugaivska, 5'),
(2, 'married', '1995-11-21', 'Ukraine, Odessa, Ekaterininskaya, 84'),
(3, 'not married', '1980-06-10', 'Ukraine, Odessa, Nikolaevskaya doroga, 15'),
(4, 'married', '1991-10-04', 'Ukraine, Odessa, B.Khmelnitskogo, 34'),
(5, 'not married', '1987-07-27', 'Ukraine, Odessa, Kanatnaya, 19');

SELECT * FROM Description_employees;

