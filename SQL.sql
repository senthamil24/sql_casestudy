
create table  departments (
      id INT Primary Key auto_increment,
      Fullname varchar(50) not null);
create table employees(
      id INT PRIMARY KEY auto_increment,
      Fullname varchar(50) not null,
      age int not null,
      gender varchar(100) not null,
      salary int not null, check (salary >30000),
      deparment_id int,
      foreign key(deparment_id) references departments(id));
create table projects(
      id INT PRIMARY KEY auto_increment,
      Fullname varchar(50) not null,
      budget int not null, check (budget >10000));
create table employee_projects(
      employee_id int,
      Foreign Key (employee_id)References Employees(id),
      project_id int,
      foreign key(project_id) references projects(id),
       Primary Key (`employee_id`, `project_id`));
create table Attendance(
       id int PRIMARY KEY auto_increment,
       employee_id int,
       foreign key(employee_id) references employees(id),
       date date not null,
       status ENUM('Present', 'Absent', 'On Leave'));

select * from Attendance;
select*from employee_projects;
select*from  projects;
select*from employees;
select*from  departments;     

 Insert into departments(Fullname) values('senthu'),('gaya'),('safya'),('asha');
 Insert into departments(Fullname) values ('IT'),('HR');
 insert into employees( Fullname,age,gender,salary,deparment_id) values ('ilakiya',12,'female',50000,4);
  insert into employees( Fullname,age,gender,salary,deparment_id) values ('harini',29,'female',56000,10),('saipriya',12,'female',58000,11);
 insert into  projects( Fullname,budget)values ('diviya',11000),('rizwana',23000),('shalini',45000),('maha',20000);
 insert into  projects( Fullname,budget)values('kaviya',59000),('divya dharashini',56000);
 insert into employee_projects( employee_id,project_id)values(1,2),(3,4);
 select*from employee_projects;
 insert into attendance(employee_id,date,status)values(1,'2024-11-15',1),(2,'2001-12-16',2),(3,'2003-10-1',3);
select*from attendance;

SELECT * FROM employees;
SELECT * 
FROM employees
JOIN departments
on employees.deparment_id=departments.id
WHERE departments.id = 10;
select*from projects;
SELECT * FROM projects
WHERE budget > 50000;
SELECT e.Fullname, p.Fullname,e.id
FROM employees e
JOIN employee_projects ep ON e.id = ep.employee_id
JOIN projects p ON ep.project_id = p.id;

select d.Fullname, COUNT(e.id) AS employee_count
FROM employees e
join departments d
on e.deparment_id=d.id
group by d.Fullname;

SELECT * FROM employees
WHERE salary > 50000;


select * 
FROM attendance
WHERE employee_id = 2;


update employees
set salary = salary * 1.10
WHERE deparment_id = '11';
UPDATE employees
SET deparment_id = 5
WHERE id = 4;
select*from employees;



create database LibraryDB;
use LibraryDB;
create table books(
id INT  Primary Key auto_increment,
title VARCHAR(100) Not Null,
author VARCHAR(50) Not Null,
published_year YEAR Not Null,
genre VARCHAR(30)
);
select * from books;

create table members(
id INT Primary Key auto_increment,
name VARCHAR(50) Not Null,
membership_date  int Not Null
);
create table borrowing(
id INT Primary Key auto_increment, 
book_id int,Foreign Key(book_id) References books(id),
members_id int, Foreign Key(members_id) references members(id),
borrow_date  date  Not Null,
return_date date
);
#insert into books values(title,author,published_year,genre);
insert into books
(title,author,published_year,genre)
values("save wildlife","kaviya",2004,"Fiction");
insert into books
(title,author,published_year,genre)
values("mystery of life","parthiban",1998,"mystery"),
("romo","shankar",2018,"comedy"),
("samy","vel",2006,"drama");
select*from books;
insert into members
(name,membership_date)
values("maha",2001-11-13),
("shalini",2009-05-23),
("swetha",1998-03-26);
select*from members;
insert into borrowing
(book_id,members_id,  borrow_date,return_date)
values( 1,1, "2022-05-11","2022-06-11"),   
(2,2,"2007-08-17","2007-08-25"),
(3,3,"2024-02-16","2024-02-28");
SELECT*FROM borrowing;

select title from books where id=1;
select*from books;
select*from members;

SELECT 
    borrowing.id AS borrowing_id,
    members.name AS member_name,
    books.title AS book_title,
    borrowing.borrow_date,
    borrowing.return_date
FROM 
    borrowing
JOIN 
    members ON borrowing.members_id = Members.id
JOIN 
    books ON borrowing.book_id = Books.id;
    select*from borrowing;
    
    SELECT 
    members.name AS member_name,
    COUNT(borrowing.book_id) AS books_borrowed
FROM 
    borrowing
JOIN 
    members ON borrowing.members_id = members.id
GROUP BY 
    members.name;
    
    
    
    create database StudentDB;
    
    use  StudentDB;
    create table students(
	 id INT Primary Key auto_increment ,
     name VARCHAR(50) Not Null,
     age INT Not Null,
     email VARCHAR(50) Not Null Unique
     );
     
     create table courses(
     	id INT Primary Key auto_increment, 
		name VARCHAR(50) Not Null
        );
		create table enrollment( 
        students_id INT, Foreign Key (students_id) References Students(id),
		courses_id INT, Foreign Key (courses_id) References Courses(id),
        grade CHAR(1),
		Primary Key (students_id, courses_id)
        );
 insert into students
 (name,age,email)
 values("vinisha",23,"vini@gmail.com"),
 ("sheha",21,"shehaavaram@gmail.com"),
 ("sharumathi",25,"charudevil@gmail.com");
 SELECT*FROM students;
 insert into courses
 ( name)
 values('B.COM'),('BBA'),('BA'),('B.SC'),('B.TECH');
 SELECT*FROM courses;
 
 insert into enrollment
 (students_id,courses_id,grade)
 values(1,1,'A'),(2,2,'B'),(3,3,'C');
 SELECT*FROM enrollment;
 
 select*from students;
 select*from courses;
 
 drop table courses;
 
 SELECT 
    students.name AS StudentName,
    Courses.name AS enrolledCourse
FROM 
    students
JOIN 
    enrollment ON students.id = enrollment.students_id
join
    courses on courses.id=enrollment.courses_id;
    
    SELECT 
    courses.name AS courses_name,
    COUNT(students_id) AS studentsCount
FROM 
    enrollment
JOIN 
    courses ON enrollment.courses_id = courses.id
GROUP BY 
    courses.name;
    
 create database RetailDB;
 use RetailDB;
 
 create table  products(    
	id INT Primary Key auto_increment,
	name VARCHAR(50) Not Null,
	price DECIMAL(10, 2) Not Null Check( Price > 0),
	stock INT Not Null Check( Stock >= 0)
    );
    
    create table suppliers(
    id INT Primary Key auto_increment,
	name VARCHAR(50) Not Null,
	contact VARCHAR(50)
    );
    
    create table sales(
    id INT Primary Key auto_increment, 
	product_id INT, Foreign Key (product_id)References Products(id),
	date DATE Not Null,
	quantity INT Not Null, Check (Quantity > 0),
	total_price DECIMAL(10, 2) Not Null
    );

insert into products
(name,price,stock)
values("classmate",65,267),("acer",45000,150),("vivo",15000,210),("suprem",2300,9);
select*from products;

insert into suppliers
(name,contact)
values("balaji",7305551961),("sivapriya",9941222295),("porvika",9384650455);
			
	select*from suppliers;
    
    insert into sales
    (product_id,date,quantity,total_price)
    values(1,"2024-09-23",10, 650),(2,"2023-06-4",2,90000),(3,"2003-12-16",4,60000);
    
select*from sales;

SELECT*FROM PRODUCTS;

SELECT 
    id, 
    name, 
    price, 
    stock
FROM 
    products
WHERE 
    stock < 10;

select 
    sales.id AS id,
    Products.name AS name,
    sales.quantity AS quantity,
    (Products.price * Sales.quantity) AS total_price
FROM 
    sales
JOIN 
    products ON sales.product_id = Products.id;
     
SELECT 
    Products.name AS name,
    SUM(sales.quantity * products.price) AS TotalSales
FROM 
    sales
JOIN 
    Products ON Sales.product_id = Products.id
GROUP BY 
    Products.name ;    
    
    
    
    
    
  CREATE database HospitalDB;  
use HospitalDB;

create table patients(
id INT Primary Key auto_increment, 
name VARCHAR(50) Not Null,
age INT Not Null,
gender VARCHAR(10),
contact VARCHAR(50)
);

create table  doctors(
id INT Primary Key auto_increment,
name VARCHAR(50) Not Null,
specialization VARCHAR(50) Not Null
);
      
create table appointments(
id INT Primary Key auto_increment,
patients_id INT, Foreign Key(patients_id) References patients(id),
doctors_id INT, Foreign Key(doctors_id) References doctors(id),
appointments_date DATE Not Null,
status ENUM('Scheduled', 'Completed', 'Cancelled')
);

insert into patients
(name,age,gender,contact)
values("arathi",23,"female",9710337592),("priya",12,"female",7659000121),("senthil",45,"male",8900765231);
SELECT*FROM patients;

insert into doctors
(name,specialization)
values("monokar","skin"),("vishvanathan","ortho"),("sujatha","gynocalisist");


insert into  appointments
(patients_id,doctors_id,appointments_date,status)
values(1,1,"2024_11-17", 'Completed'),(2,2,"2024-11-23",'Scheduled'),(3,3,"2024-11-30",'cancelled');

 select*from appointments; 
 
 Select
 doctors.name as doctors_name,
patients.name as patients_name,
appointments.appointments_date
from
doctors
join
appointments on doctors.id=appointments.doctors_id
inner join patients on  patients.id=appointments.patients_id;
    
select
    doctors_id, 
    COUNT(*) AS appointments_count
FROM 
    appointments
GROUP BY 
    doctors_id;
     
    
	
    


		

create database learingdb;
use learingdb;
create  table courses (
 id INT Primary Key auto_increment,
title VARCHAR(100) Not Null,
description TEXT
);

 
create table instructors(
id INT Primary Key auto_increment,
name VARCHAR(50) Not Null,
expertise VARCHAR(50) Not Null
);
  
  create table student(
  id INT Primary Key auto_increment,
name VARCHAR(50) Not Null,
email VARCHAR(50) Not Null Unique
);


create table enrollment(
student_id INT, Foreign Key(student_id) References Student(id),
courses_id INT, Foreign Key (courses_id)References Courses(id),
enrollment_date DATE Not Null,
Primary Key (student_id, courses_id)
);


insert into courses
(title,description)
values ("POWER BI","learn basic of  power bi dashboard"),("FINANCE","learn basic structur of money"),
("MY SQL","learn basic of my sql workbench");
select*from courses;

insert into instructors
(name,expertise)
values("ragavan","painter"),("sandhya","cooking"),
("dilip","reading");
select*from instructors;


insert into student
(name,email)
values("kavitha","kaviya234@gmail.com"),("srividhya","divuyahu@gmail.com"),
("naren","naresh234@gmail.com");
select*from student;


insert into enrollment
(student_id,courses_id,enrollment_date)
values(1,1,"2024-09-23"),(2,2,"2023-05-11"),
(3,3,"2024-06-02");
select*from enrollment;
select*from courses;
select*from instructors;


select
student.name as studentname,
courses.title as titlename
from
student
join
enrollment on student.id= enrollment.student_id
join
courses on courses.id= enrollment.courses_id;

SELECT 
    courses.title as title ,
    COUNT(student_id) AS studentcount
FROM 
    enrollment
JOIN courses ON enrollment.courses_id = Courses.id
GROUP BY title;


	
 



	



