# Data-Analyst-Mandiri

This repository contains **SQL scripts** for cleaning and exploratory data analysis (EDA) on the `mandiri` database.  
The database consists of three main tables:  
- **users_data** → User information (age, income, debt, etc.)  
- **cards_data** → Card details (brand, credit limit, chip, etc.)  
- **transactions_data** → Transaction details (amount, merchant, MCC, etc.)

## ✅ Prerequisites
- MySQL Server (8.0+) 
- Database management tool (MySQL Workbench, pgAdmin, DBeaver, or command line)
  
## 🛠️ Installation & Setup
1. Clone the repository
```bash
git clone https://github.com/HolymixMe/Data-Analyst-Mandiri.git
cd Data-Analyst-Mandiri
```
2. Create Database
```sql
CREATE DATABASE mandiri;
``` 
3. Run the SQL scripts in sequence:
```bash
mysql -u your_username -p mandiri < sql/01_DDL.sql
mysql -u your_username -p mandiri < sql/02_Import_Data.sql
mysql -u your_username -p mandiri < sql/03_Cleaning_Data.sql
mysql -u your_username -p mandiri < sql/04_EDA.sql
```
Using MySQL Workbench:
- Open each SQL file in MySQL Workbench
- Execute the scripts in numerical order
- Ensure you're connected to the 'mandiri' database 

> ⚠️ Note: The placeholder path /path/to/data/... in Import_Data.sql must be replaced with the actual location of your CSV files.
