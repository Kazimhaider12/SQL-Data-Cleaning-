# SQL-Data-Cleaning-

🚀 From Raw Dataset to Clean SQL-Ready Data | Real Estate Data Cleaning Project

In this project, I worked with a raw real estate dataset and followed a structured step-by-step approach to transform it into a clean, analysis-ready format using MySQL.

📥 Step 1: Importing the Dataset into MySQL

The dataset was first imported into a raw staging table.
This allowed me to preserve the original data while performing cleaning operations separately.

🧹 Step 2: Data Cleaning Using SQL

After importing, I applied structured SQL queries to clean and standardize the dataset:

✔ Removed NULL and empty values
✔ Trimmed extra spaces
✔ Replaced missing categorical values with “Unknown”
✔ Removed currency symbols (₹), commas, and text like “Lac”, “sqft”
✔ Converted text-based numeric fields into proper numeric data types
✔ Extracted floor number and total floors from mixed text
✔ Removed duplicate records
✔ Converted price from “Lac” to actual INR values

🏗 Step 3: Data Transformation

Converted square feet into numeric format

Converted price per sqft into integer values

Created new clean columns for analysis

Structured the data for reporting and dashboard generation

📊 Final Outcome

The raw flat dataset was transformed into a structured and analysis-ready SQL table suitable for:

Reporting

Dashboard creation

Data visualization

Business insights

This project highlights how powerful SQL is for real-world data cleaning and transformation before moving into analytics or BI tools.

💡 Clean data = Accurate insights

#SQL #DataCleaning #DataAnalytics #MySQL #DataTransformation #RealEstateData #DataEngineering 
