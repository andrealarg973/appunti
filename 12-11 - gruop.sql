select
	e.gender as sex,
	count(*) as n_employees
from employees as e
group by e.gender

-- -------------------------
select
	e.gender as sex,
	count(distinct e.first_name) as nomi_diversi
from employees as e
group by e.gender

-- -------------------------

select *
from salaries
where emp_no = 10060
order by to_date desc

-- -------------------------
select 
	emp_no,
	count(*) as num_variazioni_stipendio
from salaries
group by emp_no