create database if not exists mandiri;

use mandiri;

create table `users_data` (
  `id` varchar(50) default null,
  `current_age` int(11) default null,
  `retirement_age` int(11) default null,
  `birth_year` year(4) default null,
  `birth_month` int(11) default null,
  `gender` varchar(50) default null,
  `address` varchar(50) default null,
  `latitude` double default null,
  `longitude` double default null,
  `per_capita_income` varchar(50) default null,
  `yearly_income` varchar(50) default null,
  `total_debt` varchar(50) default null,
  `credit_score` int(11) default null,
  `num_credit_cards` int(11) default null
);

create table `cards_data` (
  `id` varchar(50) default null,
  `client_id` varchar(50) default null,
  `card_brand` varchar(50) default null,
  `card_type` varchar(50) default null,
  `card_number` varchar(50) default null,
  `expires` varchar(50) default null,
  `cvv` int(11) default null,
  `has_chip` varchar(50) default null,
  `num_cards_issued` int(11) default null,
  `credit_limit` varchar(50) default null,
  `acct_open_date` varchar(50) default null,
  `year_pin_last_changed` year(4) default null,
  `card_on_dark_web` varchar(50) default null
);

create table `transactions_data` (
  `id` varchar(50) default null,
  `date` varchar(50) default null,
  `client_id` varchar(50) default null,
  `card_id` varchar(50) default null,
  `amount` varchar(50) default null,
  `use_chip` varchar(50) default null,
  `merchant_id` varchar(50) default null,
  `merchant_city` varchar(50) default null,
  `merchant_state` varchar(50) default null,
  `zip` double default null,
  `mcc` int(11) default null,
  `errors` varchar(50) default null

);
