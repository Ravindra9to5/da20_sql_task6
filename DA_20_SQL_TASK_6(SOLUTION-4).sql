--Creating view with the help of multi join,CTE And Subquery

--Solution-1(this view show dept_hod_info)

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

--Select statement for Dept_hod_info view.
select * from Dept_hod_info;
----------------------------------------------------------------------

--Solution-2(Lists each university with its total number of colleges).

CREATE VIEW Univ_College_Counts AS
WITH College_Counts AS (
  SELECT university_id, COUNT(*) AS college_count
  FROM College
  GROUP BY university_id
)
SELECT
  u.uni_id,
  u.uni_name,
  cc.college_count
FROM University_info u
LEFT JOIN College_Counts cc
  ON u.uni_id = cc.university_id;

--Select statement for Univ_College_Counts view.
select * from Univ_College_Counts;
---------------------------------------------------------------------

--Solution-3(This view lists students whose GPA is above the average GPA of all students)

CREATE VIEW High_GPA_Students AS
SELECT first_name,
       last_name,
       gpa
FROM   student
WHERE  gpa > (SELECT AVG(gpa)
              FROM student
             );

--Select statement for High_GPA_Students view.
select * from High_GPA_Students;

-------------------------------END TASK---------------------------------------			
  