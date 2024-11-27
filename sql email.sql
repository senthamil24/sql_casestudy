select*from employees;
 
SELECT * 
FROM employees
JOIN departments
on employees.deparment_id=departments.id
WHERE departments.id = 10;
    SELECT * 
FROM Projects

WHERE Budget > 50000;   
insert into employees (values  name, age,gen('shalini',23,'female',56000),('maha',20,'female',53000);

select*from employees;

set sql_safe_updates=0;
delete from employees;


create database friends;
use friends;
create table  employeement3(
employee_id int,
deparment_id int,
name varchar(45),
age int,
salary int,
deparment varchar(20)
);
insert into employeement3
( employee_id, deparment_id,name,age,salary,deparment)
values(1,23,"ramya",23,45000,"finance"),(2,24,"senthu",34,50000,"sales"),
(3,25,"lakshmanan",56,23000,"marketing"),(4,26,"suganthi",45,34900,"HR"),(5,27,"john Doe",23,12000,"sales");

select*from employeement3;
SELECT e.name
FROM employeement3 e
JOIN employeement3 john
  ON e.deparment_id = john.deparment_id
  where employee.name="johndoe";

select*from employeement3;


 select max( salary )as secondhighestsalary
 from employeement3
 where salary< (SELECT MAX(Salary) FROM Employee);
 
 
 
 create database  Netflix;
 use Netflix;
 
 create table vip (
  user_id int,
  sign_up_date date, 
  subscription_type text
  );
  
  
  create  table watching_activity(
activity_id integer,
 user_id integer,
 date_time timestamp,
 show_id integer,
 hours_watched float
 );

insert into vip
(user_id,sign_up_date,subscription_type)
values(1,"2024-04-14","premium"),(2,"2023-09-24","standard"),(3,"2022-02-11","standard with ad");

select*from vip;

insert into watching_activity
(activity_id,user_id,date_time,show_id,hours_watched)
values(08,1,"2005-10-30 " "08:30:00", 23,"24.5"),(09,2,"2024-01-12""17:45:30",24,"18.90"),(10,3,"2023-03-26""16:10:21",25,"20.34");
select*from watching_activity;


create table show_review(
review_id integer,
 user_id integer,
 review_date timestamp,
 show_id integer, 
 stars integer
 );

insert into show_review
(review_id,user_id,review_date,show_id,stars)
values(45,1,"2024-11-23",11,4),(46,2,"2024-03-15",12,5),(47,3,"2023-05-11",13,3);
select*from show_review;



create table subscription(
 user_id integer,
 active boolean
 );

create table viewing_history(
user_id integer,
 show_id integer,
 episode_id integer,
 watch_date date
 );
create table showing(
 show_id integer,
 show_name text
 );

insert into subscription
(user_id,active)
values(1,true),(2,false),(3,false);
#delete from subscription;
select*from subscription;

insert into viewing_history
(user_id,show_id,episode_id,watch_date)
values(1,11,51,"2024-11-14"),(2,12,52,"2024-11-17"),(3,13,53,"2024-11-21");
 select*from viewing_history;

insert into showing
(show_id,show_name)
values(11,"mahanadhi"),(12,"veera"),(13,"idhyam");
select*from showing;



drop table movies;
create table movies(
 movie_id integer,
 title text,
 genre text,
 release_year date
 );
create table customer(
user_id integer, 
name text,
 email text,
 last_movie_watched integer,
 date_watched date
);



insert into movies
(movie_id,title,genre,release_year)
values(201,"amaran","action","2024-10-31"),(202,"lubber pandhu","drama","2024-10-12"),
(203,"kanguva","science fiction","2024-11-12");
select*from movies;




insert into customer
(user_id,name,email,last_movie_watched,date_watched)
values(1,"darumavathi","daru1791@gmail.com",3,"2024-09-23"),(2,"sasikala","sasi2981@gmail.com",2,"2021-02-12"),(2,"samudehwari","samu2296@gmail.com",10,"1998-04-23");
select*from customer;
