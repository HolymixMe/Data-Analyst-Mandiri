use mandiri;

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