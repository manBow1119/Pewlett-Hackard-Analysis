-- Get info for retirement by titles --
DROP TABLE retirement_titles;
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date 
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
DROP TABLE unique_titles;
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;


SELECT * FROM unique_titles

-- Get number of retirees by title -- 
DROP TABLE retiring_titles;
SELECT COUNT(title), title

INTO retiring_titles

FROM unique_titles

GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;


-- Mentorship Program Queries --
 DROP TABLE membership_eligibility;
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
e.first_name, 
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
on e.emp_no = de.emp_no
INNER JOIN titles as ti
on e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND(de.to_date = '9999-01-01') 
 	
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;
