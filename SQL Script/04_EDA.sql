use mandiri;

-- Exploratory Data Analyst

select current_age, count(*) as user_count
from mandiri.users_data
group by current_age
order by current_age;

select gender, count(*) as user_count
from mandiri.users_data
group by gender;

select 
    id,
    yearly_income,
    total_debt,
    round(total_debt / nullif(yearly_income,0),2) as debt_to_income_ratio
from mandiri.users_data;

select card_brand, count(*) as total_cards
from mandiri.cards_data
group by card_brand;

select mcc, count(*) as total_transactions, sum(amount) as total_spent
from mandiri.transactions_data
group by mcc
order by total_spent desc