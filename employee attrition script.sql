-- taking a look at our dataset--
Select *
from employee_attrition;

-- SQL query to find details of employee under attrition having 5+ years of experience and between the age group of 27 - 55 --

Select *
from employee_attrition
where age between 27 and 55
and TotalWorkingYears >= 5;

-- To check then total count of the dataset under the above condition we use --

Select count(*)
from employee_attrition
where age between 27 and 55
and TotalWorkingYears >= 5;

-- Fetch the details of employees having maximum and minimum salary working in different departments who received less than 13% salary hike --

select department,
	   max(MonthlyIncome),
       min(MonthlyIncome)
from employee_attrition
where PercentSalaryHike < 13
group by Department
order by max(MonthlyIncome) desc;

-- Calculate the average monthly income of all the employees who worked more than 3 years whose educational background  is medical--

select avg(MonthlyIncome)
from employee_attrition
where YearsAtCompany > 5
and EducationField = 'Medical';

-- identify the total number of male and female employee under attrition whose marital status is married and haven't received promotion in the last 2 years--

select Gender,count(EmployeeNumber)
from employee_attrition
where MaritalStatus = 'Married'
and YearsSinceLastPromotion = 2
group by Gender;

-- identify the total number of male and female employee under attrition whose marital status is married and haven't received promotion in the last 2 years where attrition is 'yes'--

select Gender,count(EmployeeNumber)
from employee_attrition
where MaritalStatus = 'Married'
and YearsSinceLastPromotion = 2
and Attrition = 'yes'
group by Gender;

-- Employees with max performance rating but no promotion for 4 years and above(use of sub query)--

select * 
from employee_attrition
where PerformanceRating = (select max(PerformanceRating) from employee_attrition)
and YearsSinceLastPromotion >= 4;

-- who has max and min percentage of salary hike--

select YearsAtCompany,
	   PerformanceRating,
       YearsSinceLastPromotion,
       max(PercentSalaryHike),
       min(PercentSalaryHike)
from employee_attrition
group by YearsAtCompany, PerformanceRating,YearsSinceLastPromotion
order by max(PercentSalaryHike) desc,
         min(PercentSalaryHike) asc;
         
-- Selecting distinct departments--

select distinct Department
from employee_attrition;

-- Employee working overtime but given a minimum salary hike and are more than 5 years within the company--

select *
from employee_attrition
where OverTime = 'yes'
and PercentSalaryHike = ( select (min(PercentSalaryHike)) from employee_attrition)
and YearsAtCompany > 5
and Attrition = 'yes';

select *
from employee_attrition
where OverTime = 'yes'
and PercentSalaryHike = ( select (max(PercentSalaryHike)) from employee_attrition)
and YearsAtCompany < 5;

select *
from employee_attrition
where OverTime = 'no'
and PercentSalaryHike = ( select (max(PercentSalaryHike)) from employee_attrition)
and YearsAtCompany < 5;

select MaritalStatus,
       max(RelationshipSatisfaction),
       min(RelationshipSatisfaction)
from employee_attrition
group by MaritalStatus;