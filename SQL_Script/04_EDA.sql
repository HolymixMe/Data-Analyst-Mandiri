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

select 
    t.merchant_id,
    c.has_chip,
    count(*) as total_transaksi,
    round(avg(cast(t.amount as decimal(15,2))),2) as avg_amount
from mandiri.transactions_data t
join mandiri.cards_data c
    on t.card_id = c.id
group by t.merchant_id, c.has_chip
order by total_transaksi desc
limit 20;