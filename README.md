End-to-End Hospital Management Analysis (MySQL & Power BI)
🎯 Project Objective
This project analyzes a synthetic hospital dataset to uncover operational, financial, and patient demographic insights. It demonstrates a full data analysis workflow, from database creation and SQL querying to building a multi-page interactive dashboard in Power BI.

🛠️ Tools & Technologies
Database: MySQL (for database creation, data loading, and analysis)

Data Transformation (ETL): SQL (LOAD DATA INFILE) & Power Query (M Language)

Data Modeling & Visualization: Power BI

Analysis Languages: SQL & DAX

🚀 Project Workflow
Database Design: Architected a relational schema in MySQL with 5 tables (patients, doctors, appointments, treatments, billings) and enforced data integrity using primary and foreign keys.

Data Ingestion: Loaded 5 raw CSV files into the MySQL database, handling security protocols (local_infile) and performing on-the-fly data transformations (e.g., using STR_TO_DATE to fix date formats).

Data Modeling (Power BI): Transformed the data in Power Query by merging transactional tables into a denormalized Hospital_activity fact table. Created a Dim_Date table using DAX (CALENDAR, FORMAT) and built a star schema model with active relationships to the dimension tables (Dim_Date, patients, doctors, billings, treatments).

Analysis & Visualization: Wrote complex DAX measures (Billing_Total, Appointments_Count, Age_group) and SQL queries (JOIN, GROUP BY, CASE, TIMESTAMPDIFF) to answer 10 key business questions. Presented these findings in a 4-page, interactive Power BI report (including an Executive Summary).

📊 Key Insights & Recommendations
1. Operations Overview
Busiest Specialization: Pediatrics (98 appointments) drives the most operational volume.

Busiest Branch: Central Hospital (84 appointments) is the busiest location, driven primarily by its high volume of Pediatrics cases.

Monthly Trends: Activity for 2023 peaked in April (25 appointments) and hit a low in September (11 appointments).

Recommendation: Plan for increased staffing or resources for Pediatrics and at Central Hospital, especially during the Q2 peak.

2. Patient Demographics
Core Demographic: Young Adults (21-40) are the largest patient segment, making up ~49% of all appointments.

Gender: The patient base skews male, accounting for ~62% of appointments.

Insurance: The market is concentrated, with MedCare Plus (42%) and WellnessCorp (29%) covering 71% of all appointments.

Recommendation: Focus marketing and patient outreach on Young Adult males and ensure strong partnerships with MedCare Plus and WellnessCorp.

3. Financial Analysis
Top Earning Specialization: Pediatrics generates the most revenue (approx. ₹259K), aligning with its high appointment volume.

Payment Methods: Credit Card (36.5%) is the largest payment method, followed by Insurance (33.0%) and Cash (30.4%).

Revenue at Risk: A significant portion of billed revenue is not secured.

Recommendation: A critical review of the billing process is needed. The ₹193K in 'Failed' payments must be investigated, and a collections strategy for the ₹185K in 'Pending' payments should be implemented to improve revenue capture.

📈 Power BI Dashboard Preview
<img width="1093" height="638" alt="Screenshot 2025-10-30 233117" src="https://github.com/user-attachments/assets/7448cb45-1fc6-4ac7-b380-a276e224a00c" />
<img width="1193" height="643" alt="Screenshot 2025-10-30 233307" src="https://github.com/user-attachments/assets/b54bc478-8d01-422c-bdf3-6fcf1ccfda23" />
<img width="1136" height="647" alt="Screenshot 2025-10-30 233415" src="https://github.com/user-attachments/assets/6ef7287e-f016-49a3-9f42-f67b86070100" />
<img width="1145" height="511" alt="Screenshot 2025-10-30 233519" src="https://github.com/user-attachments/assets/a1125549-0fd6-4071-a0e7-c79175e827b6" />


Page 1: Operations Overview
Page 2: Patient Profile
Page 3: Financial & Revenue Analysis
Page 4: Executive Summary
🗂️ Repository Contents
/data: Contains the 5 raw CSV files used for the project (patients.csv, doctors.csv, etc.).

/sql_scripts:

Hospital_Project_Sql_Code.sql: A single, consolidated file containing all SQL scripts for database creation, data loading, and analysis queries.

/power_bi_report: 

Hospital_Analysis.pbix: The complete Power BI project file.

