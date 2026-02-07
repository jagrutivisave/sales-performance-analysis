select * from student
select * from student_data
select * from marks


alter table student_date
rename to student_data


create table student
(
id serial primary key,
name varchar(50)
);


create table student_data
(
id int primary key,
age int,
city varchar(50)
)


INSERT INTO student (name) VALUES 
('Liam Smith'), ('Olivia Brown'), ('Noah Garcia'), ('Emma Jones'), ('Oliver Miller'),
('Sophia Davis'), ('Elijah Rodriguez'), ('Isabella Martinez'), ('James Hernandez'), ('Charlotte Lopez');


INSERT INTO student_date (id, age, city) VALUES
(1, 20, 'New York'),
(2, 22, 'Los Angeles'),
(3, 21, 'Chicago'),
(4, 23, 'Houston'),
(5, 20, 'Phoenix'),
(6, 22, 'Philadelphia'),
(7, 21, 'San Antonio'),
(8, 24, 'San Diego'),
(9, 23, 'Dallas'),
(10, 20, 'San Jose');


ALTER TABLE student_data
ADD CONSTRAINT student_date_pkey
FOREIGN KEY (id) 
REFERENCES student(id);


select 
s.id,
s.name,
sd.age, 
sd.city
from student s
join student_data sd on s.id = sd.id
where s.name in ('Liam Smith','Olivia Brown','Noah Garcia','Emma Jones')


create table marks(
mark_id serial primary key,
id int, 
subject varchar(50),
marks int, 
foreign key (id) references student (id)
)


INSERT INTO marks (id, subject, marks) 
VALUES
(1, 'Mathematics', 85),
(1, 'Science', 92),
(1, 'History', 78),

(2, 'Mathematics', 80),
(2, 'Science', 99),
(2, 'History', 70),

(3, 'Mathematics', 87),
(3, 'Science', 91),
(3, 'History', 75),

(4, 'Mathematics', 90),
(4, 'Science', 95),
(4, 'History', 79),

(5, 'Mathematics', 60),
(5, 'Science', 90),
(5, 'History', 78)


select 
s.name,
m.subject,
m.marks
from student s
join marks m on s.id = m.id


select 
s.name,
m.subject,
m.marks
from student s
join marks m on s.id = m.id
where s.name = 'Emma Jones'


select 
s.name,
m.subject,
m.marks
from student s
join marks m on s.id = m.id
where m.marks > 80 


select s.name, m.subject, m.marks from student s
join marks m on s.id = m.id 
order by m.marks desc


select 
s.name,
avg(m.marks)
from student s
join marks m on s.id = m.id
group by s.name


-- inner join
select * from student s 
join marks m on s.id = m.id


-- left join display all the values from left table name student
select * from student s 
left join marks m on s.id = m.id



-- right join display all the values from right table name student
select * from marks m
right join student s on s.id = m.id



-- full join combine both tables
select * from student s 
full join marks m on s.id = m.id



-- cross join displays all the combinations
select * from student s
cross join marks m  



