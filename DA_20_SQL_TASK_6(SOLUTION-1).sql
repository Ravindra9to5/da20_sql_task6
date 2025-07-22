------------Task-6------------------
--1.Create join base views on following table.

select * from university_info;

select * from college;

select * from deparments;

select * from emp;

select * from student_branch;

select * from student;
-----------------------------------
---solution.1-create University_With_Colleges for showing college info with university.

CREATE VIEW University_With_Colleges AS
SELECT u.uni_id,
       u.uni_name,
       u.address,
       c.college_id,
       c.name,
       c.dean
FROM
       university_info AS u
       INNER JOIN College AS c
       ON u.uni_id = c.university_id;
	   
--select statement for previous view
select * from UniversityWithColleges ;
----------------------------------------------------------------------------------------
--solution-2-creating Details_of_Univ_Col_Dept view for showing info based on department

CREATE VIEW Details_of_Univ_Col_Dept AS
SELECT u.uni_id,
       u.uni_name,
       c.college_id,
       c.name,
       d.deparment_id
FROM   university_info AS u
       INNER JOIN College AS c
       ON u.uni_id = c.university_id
       INNER JOIN deparments AS d
       ON c.college_id = d.college_id;

--select statement for Details_of_Univ_Col_Dept view
select * from Details_of_Univ_Col_Dept ;
------------------------------------------------------------
--solution-2-creating Dept_hod_info view for showing info about HOD based on department.
--(using left  join)

CREATE VIEW Dept_hod_info AS
SELECT
  u.uni_id,
  u.uni_name,
  c.college_id,
  c.name,
  d.deparment_id,
  d.hod_name
FROM Deparments AS d
LEFT JOIN College AS c
  ON d.college_id = c.college_id
LEFT JOIN University_Info AS u
  ON c.university_id = u.uni_id;
  
--select statement for Dept_With_College_and_Uni view
select * from Dept_With_College_and_Uni;

-----------End first task----------------------















