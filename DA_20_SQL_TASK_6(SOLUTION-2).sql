--2.Creating where,group by,having and order by clause base views on following table.

select * from university_info;

select * from college;

select * from deparments;

select * from emp;

select * from student_branch;

select * from student;
--------------------------------------------
--solution 1(create view using where clause)
create view new_emplyee as
select * 
from   emp
where  doj > '2025-01-01';

--select statement for new_emplyee view.
select * from new_emplyee;
--------------------------------------------
--solution 2(create view using group by clause)
CREATE VIEW Gpa_Group_Counts AS
SELECT   gpa,COUNT(*) AS student_count
FROM     student
GROUP BY gpa ;
--------------------------------------------
--solution 3(create view using having clause)
CREATE VIEW Gpa_Group_Counts_grt3 AS
SELECT   gpa,COUNT(*) AS student_count
FROM     student
GROUP BY gpa 
HAVING   COUNT(*) > 3 ;
-------------------------------------------
--solution 4(create view using order by clause)
CREATE VIEW university_name_asc_order AS
SELECT uni_id,uni_name,inst_date
FROM   university_info
ORDER BY uni_name ASC;

----------------END TASK 2----------------------













