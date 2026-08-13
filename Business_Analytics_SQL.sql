create database Investment_Analysis;
use Investment_Analysis;
Create Table Investment_Data (
id int auto_increment primary key,
Gender varchar(20),
Age int,
Investment_Avenues varchar(10),
Mutual_Funds int,
Equity_market int,
Debentures int,
Government_bonds int,
Fixed_Deposits int,
PPF int,
Gold int,
Stock_Market varchar(10),
Factor varchar(50),
Objective varchar(100) ,
Purpose varchar(100),
Duration varchar (30),
Investment_Monitor varchar(30),
Expect varchar(20),
Avenue  varchar(50),
savings_objective  varchar(100),
Reason_Equity varchar(100),
Reason_Mutual varchar(100),
Reason_Bonds varchar(100),
Reason_FD varchar(100),
Sources varchar(100)
)

Select * from Investment_Data;

-- How many participants are present in the dataset
select count(*) as total_participants from investment_data;

-- What is the gender distribution of participants?
select gender, count(*) as number_of_participants 
from investment_data
group by gender order by  number_of_participants desc;

-- What percentage of participants belongs to each gender?
select gender, count(*) as number_of_participants,
round(count(*) * 100.0 / (select count(*) from investment_data),2) as percentage from investment_data
group by gender 
order by number_of_participants desc;

-- what are the minimum, maximum and average ages of participants?
select min(age) as minimum_age, max(age) as maximum_age,
round(avg(age),2) as average_age from investment_data;

-- How many participants belongs to each age group?
select 
case 
when age between 20 and 24 then '20-24'
when age between 25 and 29 then '25-29'
when age between 30 and 34 then '30-34'
else 'Below 20'
end as age_group, count(*) as number_of_participants
from investment_data
group by age_group
order by age_group;

-- What is the most preferred investment avenue and percentage of participants prefers each investment avenue?
select avenue, count(*) AS number_of_participants,
round(count(*) * 100 / (select count(*) from investment_data),2) as percentage
from investment_data
group by Avenue
order by number_of_participants desc;

-- What are the main reason for choosing mutual investments?
select reason_mutual, count(*) as number_of_participants 
from investment_data
group by Reason_Mutual
order by number_of_participants desc;

-- What are the participants main savings objective
select savings_objective, count(*) as number_of_participants
from investment_data 
group by savings_objective
order by number_of_participants desc;

-- What are the most commonly used sources of investment information?
select sources, count(*) as number_of_used
from investment_data
group by Sources 
order by number_of_used desc;

-- what investment duration is most commonly preferred?
select duration , count(*) as number_of_investment
from investment_data
group by Duration
order by number_of_investment desc;

-- What is the estimated average investment duration?
SELECT 
    ROUND(AVG(CASE
                WHEN duration = 'less than 1 year' THEN 0.5
                WHEN duration = '1-3 years' THEN 2
                WHEN duration = '3-5 years' THEN 4
                WHEN duration = 'more than 5 years' THEN 6
            END),
            2) AS estimated_average_duration_years
FROM
    investment_data;
    
    -- what returns do participants expect from their investment?
    select expect , count(*) as number_of_participants
    from investment_data
    group by Expect 
    order by number_of_participants desc;
     
	








