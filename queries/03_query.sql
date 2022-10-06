-------------------------------
-- 3
-------------------------------
SELECT
   concat(e.first_name, ' ', e.last_name) AS employee_full_name,
   e.title AS employee_title,
   date_part('year', AGE(e.hire_date , e.birth_date)) AS employee_age,
   date_part('year', AGE(current_date , e.hire_date )) AS employee_tenure,
   concat(m.first_name, ' ', m.last_name) as manager_full_Name,
   m.title AS manager_title 
FROM
   employees e 
   left join
      employees m 
      on e.reports_to = m.employee_id 
ORDER BY
   employee_age,
   employee_full_name