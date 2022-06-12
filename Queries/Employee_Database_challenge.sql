-- DELIVERABLE 1

-- Create new table of retiring employees by title
SELECT e.emp_no,
	   e.first_name, 
	   e.last_name, 
	   t.titles, 
	   t.from_date, 
	   t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

-- Verify new table
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
                    rt.first_name,
                    rt.last_name,
                    rt.titles
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Verify new table
SELECT * FROM unique_titles;

-- Create new table with count of retiring titles
SELECT COUNT(ut.titles), ut.titles
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.titles
ORDER BY COUNT(ut.titles) DESC;

-- Verify new table
SELECT * FROM retiring_titles;

-- DELIVERABLE 2

-- Create Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	                e.first_name,
	                e.last_name,
                    e.birth_date,
                    de.from_date,
                    de.to_date,
                    t.titles
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de 
    ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
    ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no

-- Verify table
SELECT * FROM mentorship_eligibility

-- DELIVERABLE 3

-- Create a count of mentor titles
SELECT COUNT(me.titles), me.titles
INTO mentor_titles
FROM mentorship_eligibility AS me
GROUP BY me.titles
ORDER BY COUNT(me.titles) DESC;

-- Verify table
SELECT * FROM mentor_titles;

--Roles per Staff and Departament: 
SELECT DISTINCT ON (rt.emp_no) 
	                rt.emp_no,
	                rt.first_name,
	                rt.last_name,
	                rt.titles,
	                d.dept_name
INTO retiring_deptarments
FROM retirement_titles as rt
INNER JOIN dept_emp as de
    ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
    ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;

-- Verify table
SELECT * FROM retiring_deptarments;