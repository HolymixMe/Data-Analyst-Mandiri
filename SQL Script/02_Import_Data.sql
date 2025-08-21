use mandiri;

-- Load Data
load data infile '/path/to/data/users_data.csv'
into table users_data
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

load data infile '/path/to/data/cards_data.csv'
into table cards_data
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

load data infile '/path/to/data/transactions_data.csv'
into table transactions_data
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

-- Memperbaiki Struktur Data
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