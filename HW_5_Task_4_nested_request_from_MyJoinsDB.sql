
USE myjoinsdb;

-- 1) Сделайте выборку при помощи вложенных запросов для таких заданий: Получите контактные данные сотрудников (номера телефонов, место жительства)

SELECT myjoinsdb.employees.name_emp AS name, myjoinsdb.employees.phone_emp AS phone, 
(SELECT myjoinsdb.description_employees.address_des FROM myjoinsdb.description_employees WHERE myjoinsdb.description_employees.id_emp = myjoinsdb.employees.id_emp) AS address 
FROM myjoinsdb.employees;

-- 2) Сделайте выборку при помощи вложенных запросов для таких заданий: Получите информацию о дате рождения всех холостых сотрудников и их номера.

SELECT myjoinsdb.employees.name_emp AS name, (SELECT myjoinsdb.description_employees.married_des FROM myjoinsdb.description_employees WHERE myjoinsdb.employees.id_emp = myjoinsdb.description_employees.id_emp) AS married,
(SELECT myjoinsdb.description_employees.birthday_des FROM myjoinsdb.description_employees WHERE myjoinsdb.employees.id_emp = myjoinsdb.description_employees.id_emp) AS birthday,
myjoinsdb.employees.phone_emp AS phone
FROM myjoinsdb.employees WHERE myjoinsdb.employees.id_emp IN
(SELECT myjoinsdb.description_employees.id_emp FROM myjoinsdb.description_employees WHERE myjoinsdb.description_employees.married_des = 'not married');

-- 3) Сделайте выборку при помощи вложенных запросов для таких заданий:  Получите информацию обо всех менеджерах компании: дату рождения и номер телефона.

SELECT myjoinsdb.employees.name_emp AS name, 
(SELECT myjoinsdb.title_jobs.title_job FROM  myjoinsdb.title_jobs WHERE myjoinsdb.employees.id_emp =  myjoinsdb.title_jobs.id_emp) AS title_jobs,
(SELECT myjoinsdb.description_employees.birthday_des FROM myjoinsdb.description_employees WHERE myjoinsdb.employees.id_emp = myjoinsdb.description_employees.id_emp) AS birthday,
myjoinsdb.employees.phone_emp AS phone 
FROM myjoinsdb.employees WHERE myjoinsdb.employees.id_emp IN (SELECT myjoinsdb.title_jobs.id_emp FROM myjoinsdb.title_jobs WHERE myjoinsdb.title_jobs.title_job = 'менеджер');
