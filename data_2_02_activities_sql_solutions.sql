

/* 
2.02 Activity 1.

1) Select districts and salaries (from the district table) where 
salary is greater than 10000. Suggestion is to use the case study 
extended here (you have it already after getting the 2.01 activity) 
to work out which columns are required here. Return columns as district_name 
and average_salary.
*/
select A2 as district_name, A11 as average_salary
from district
where A11 > 10000;



/*
2) Select those loans whose contract finished and were not paid.
*/
select loan_id as loans_unpaid, status
from loan
where status = 'B'; 



/* 
3) Select cards of type junior. 
Return just first 10 in your query. 
*/
select type
from card
where type = 'junior'
limit 10;



/*
2.02 Activity 2
1) Select those loans whose contract finished and not 
paid back. Return the debt value from the status you 
identified in the last activity, together with loan_id and 
account_id. 
*/
select account_id, loan_id, status, amount
from loan
where status = 'B'; 



/*
2) Calculate the urban population for all districts:
From the total population and the urban population % ratio, we calculate
the total number of urban population.alter
*/
select A2 as district_name, round(A10 * (A4 / 100)) as urban_population
from district;



/*
 3) On the previous query result - re-run it but filtering out districts
where the rural population is greater than 50%.
*/
select A2 as district_name, round(A10 * (A4 / 100)) as urban_population, round(100 - A10, 1) as rural_population_ratio
from district
where (100 - A10) > 50;




/*
2.02 Activity 3

1) Get all junior cards issued last year.
*/
select type, issued
from card
where type = 'junior' and issued > 980000;



/*
2) Get the first 10 transactions for withdrawals that are not in cash. 
You will need the extended case study information to tell you which 
values are required here, and you will need to refer to conditions 
on two columns.
*/
select operation, amount, date
from trans
where operation not in ('VYBER')
limit 10;





/* 
3) Refine your query from last activity on loans whose 
contract finished and not paid back - filtered to loans 
where they were left with a debt bigger than 1000. 
Return the debt value together with loan_id and account_id. 
Sort by the highest debt value to the lowest. 
*/
select status, loan_id, account_id, amount as debt_value, date
from loan
where status = 'B' and amount > 1000
order by amount desc;




/*
2.02 Activity 4

Get the biggest and the smallest transaction with 
non-zero values in the database (use the trans 
table in the bank database).
*/
select max(amount) as biggest_transation, min(amount) as smallest_transation
from trans
where amount > (0);




/*
Get account information with an extra column year showing the 
opening year as 'YY'. Eg., 1995 will show as 95.
Hint: Look at the first two characters of the string date in 
the account table.
*/
select *, left(date, 2) as opening_year
from account;
















