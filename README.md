# Data-Analyst-Mandiri

This repository contains **SQL scripts** for cleaning and exploratory data analysis (EDA) on the `mandiri` database.  
The database consists of three main tables:  
- **users_data** → User information (age, income, debt, etc.)  
- **cards_data** → Card details (brand, credit limit, chip, etc.)  
- **transactions_data** → Transaction details (amount, merchant, MCC, etc.)
  
## 📌 Database Structure  
Database: `mandiri`  
- `users_data`  
- `cards_data`  
- `transactions_data`

> ⚠️ Note: The raw data was directly imported into DBeaver (MySQL/MariaDB).  
> Therefore, no `CREATE TABLE` or `INSERT` statements are included in this repository.  

## 🔧 SQL Script  

```sql
use mandiri;

-- Memperbaiki Tipe Kolom

alter table mandiri.cards_data 
    modify column id varchar(50) null,
    modify column year_pin_last_changed year null,
    modify column client_id varchar(50) null,
    modify column card_number varchar(50) null;

alter table mandiri.users_data 
    modify column id varchar(50) null,
    modify column birth_year year null;

alter table mandiri.transactions_data 
    modify column client_id varchar(50) null,
    modify column id varchar(50) null,
    modify column card_id varchar(50) null,
    modify column merchant_id varchar(50) null;

update mandiri.cards_data
	set credit_limit = replace(credit_limit , '$', '');
alter table mandiri.cards_data 
	modify column credit_limit decimal(15,2);

update mandiri.users_data
set per_capita_income = replace(per_capita_income, '$', ''),
    yearly_income = replace(yearly_income, '$', ''),
    total_debt = replace(total_debt, '$', '');
alter table mandiri.users_data 
    modify column per_capita_income decimal(15,2),
    modify column yearly_income decimal(15,2),
    modify column total_debt decimal(15,2);

update mandiri.transactions_data 
	set amount = replace(amount, '$', '');
alter table mandiri.transactions_data 
	modify column amount decimal(15,2);

-- Cleaning Data

select count(*) - count(distinct id) as duplicate_users
from mandiri.users_data;

select count(*) - count(distinct id) as duplicate_cards
from mandiri.cards_data;

select count(*) - count(distinct id) as duplicate_transactions
from mandiri.transactions_data;

create table mandiri.transactions_data_new as
select distinct *
from mandiri.transactions_data;

drop table mandiri.transactions_data;

alter table mandiri.transactions_data_new
rename to transactions_data;

select errors, count(*) as total_errors
from mandiri.transactions_data
group by errors;

update mandiri.transactions_data
set errors = 'none'
where trim(errors) = '';

update mandiri.transactions_data
set merchant_state = 'online'
where trim(merchant_state) = '';

update mandiri.transactions_data
set zip = 0
where zip is null;

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



