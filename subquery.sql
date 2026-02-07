-- subquery
select avg(m.marks) as total, s.name from marks m 
join student s on m.id = s.id
group by s.name
order by total desc
limit 1


-- find the student name has makrs more than total avg
select s.name, m.marks from marks m 
join student s on m.id = s.id
where m.marks > (select avg(marks) from marks)

select s.name, m.marks from marks m 
join student s on m.id = s.id
where m.marks > 82.26
order by m.marks desc


-- Find the student details (id and name) for the student who got the highest marks.
select s.id, s.name,m.marks from marks m
join student s on m.id = s.id
where m.marks = (select max(marks) from marks)


--List the names of students who have marks greater than 80 or exactly 100
select s.name, m.marks from marks m
join student s on m.id = s.id
where m.marks in 
(select marks from marks 
where marks > 80 or marks = 99)


-- Find the names of students who are present in the student 
-- table but have no marks recorded in the marks table.
select s.name, m.marks from student s
full join marks m on s.id = m.id
where s.id not in (select id from marks)

SELECT s.name 
FROM student s
WHERE NOT EXISTS 
(SELECT 1 FROM marks m WHERE s.id = m.id);


-- Second Highest Mark (Advanced)
-- Find the name of the student who has the second-highest marks.
SELECT s.name, m.marks 
FROM student s
JOIN marks m ON s.id = m.id
WHERE m.marks = (
    SELECT marks 
    FROM marks 
    ORDER BY marks DESC 
    LIMIT 1 OFFSET 1
);

SELECT s.name, m.marks 
FROM student s
JOIN marks m ON s.id = m.id
WHERE m.marks = (
    SELECT max(marks) 
    FROM marks
	where marks < (select max(m.marks) from marks m)
);


-- union unique recoreds
select id from  student 
union
select id from marks 


-- union duplicate recoreds
select id from  student 
union all
select id from marks 


-- view in sql creates a sample table using the data which you want to displays
create view students as select name from student

select * from students