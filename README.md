# Pewlett-Hackard-Analysis

## Overview
The purpose was to provide Pewlett Hackard with an analysis using SQL, determining the number of retiring employees per title and identifying employees who are eligible to participate in a mentorship program.

## Results
1. A table was created in order to determine the number of employees retiring by title. This query returned 133,776 rows which is an extensive list. However, the table is showing **ALL** the titles that employees held while working at Pewlett Hackard, resulting in duplicates.
  
![image](https://user-images.githubusercontent.com/103764279/173193107-0a2e4e94-c095-40b6-955d-8b1a4366bd3d.png)

2. To get an accurate count of employees retiring by title, a new query was created where each employee is only listed once with their most recent title. After removing the duplicates, the new query returned 90,398 rows.

![image](https://user-images.githubusercontent.com/103764279/173194426-6dd2661b-9010-4720-99d7-a19e52f8e6df.png)

3. A count was then created of the number of retiring titles.

![image](https://user-images.githubusercontent.com/103764279/173197898-7aa5c5ac-d84e-487d-8b90-1493affc48e4.png)

4. Lastly, a table was created to determine the employees who are eligible for the mentorship program.

![image](https://user-images.githubusercontent.com/103764279/173198035-d8b3a416-7d37-4428-a348-fa93e141e40f.png)

## Summary
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
-- When "silver tsunami" begins to make an impact, there 90,398 roles that will need to be filled.

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
-- After creating a query for mentorship eligibility, there are only 1,549 employees elibigilbe to become mentors. This finding shows how big the gap is between retirees and replacement staff. With so many staff retiring, there are not enough replacement staff to take over those roles.

### Addtional Queries
In this query, a count of mentor titles was taken to see how that matched up to the retiring titles. After reviewing both this table and the retiring titles table, this gives further evidence that there is not enough staff to fill the positions that will be retiring. 

`-- Create a count of mentor titles`

`SELECT COUNT(me.titles), me.titles`

`INTO mentor_titles`

`FROM mentorship_eligibility AS me`

`GROUP BY me.titles`

`ORDER BY COUNT(me.titles) DESC;`

![image](https://user-images.githubusercontent.com/103764279/173251331-5706b9e1-0e3e-4d10-a46d-8867863fa509.png)

This next query, we can see what staff are retiring and from what departments.

`SELECT DISTINCT ON (rt.emp_no) 
	                rt.emp_no,
	                rt.first_name,
	                rt.last_name,
	                rt.titles,
	                d.dept_name`
                  
`INTO retiring_deptarments`

`FROM retirement_titles as rt`

`INNER JOIN dept_emp as de
    ON (rt.emp_no = de.emp_no)`
    
`INNER JOIN departments as d
    ON (d.dept_no = de.dept_no)`
    
`ORDER BY rt.emp_no, rt.to_date DESC;`

![image](https://user-images.githubusercontent.com/103764279/173252219-e11af02c-7b1a-4e10-8cd0-589873ed165f.png)

