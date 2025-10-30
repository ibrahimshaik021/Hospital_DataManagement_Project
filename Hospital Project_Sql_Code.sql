Here is the complete SQL code developed during this project, from database creation to the final analysis queries.

1. ⚙️ Database & Table Creation
This script will create the hospital_db database and all 5 tables with their correct data types, primary keys, and foreign keys.

-- 1. Create the database
CREATE DATABASE hospital_db;

-- 2. Select the database to use
USE hospital_db;

-- 3. Create 'patients' table
CREATE TABLE patients (
    patient_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL,
    insurance_provider VARCHAR(50) NOT NULL,
    insurance_number VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- 4. Create 'doctors' table
CREATE TABLE doctors (
    doctor_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialisation VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    years_experience INT NOT NULL,
    hospital_branch VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- 5. Create 'appointments' table
CREATE TABLE appointments (
    appointment_id VARCHAR(50) PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    doctor_id VARCHAR(50) NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason_for_visit VARCHAR(100) NOT NULL,
    status VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- 6. Create 'treatments' table
CREATE TABLE treatments (
    treatment_id VARCHAR(50) PRIMARY KEY,
    appointment_id VARCHAR(50) NOT NULL,
    treatment_type VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    cost DECIMAL(9,2) NOT NULL,
    treatment_date DATE NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 7. Create 'billings' table
CREATE TABLE billings (
    bill_id VARCHAR(50) PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    treatment_id VARCHAR(50) NOT NULL,
    bill_date DATE NOT NULL,
    amount DECIMAL(9,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);




You got it. This is a great way to consolidate all your work for your GitHub repository.

Here is the complete SQL code we developed during this project, from database creation to the final analysis queries.

1. ⚙️ Database & Table Creation
This script will create the hospital_db database and all 5 tables with their correct data types, primary keys, and foreign keys.

SQL

-- 1. Create the database
CREATE DATABASE hospital_db;

-- 2. Select the database to use
USE hospital_db;

-- 3. Create 'patients' table
CREATE TABLE patients (
    patient_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL,
    insurance_provider VARCHAR(50) NOT NULL,
    insurance_number VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- 4. Create 'doctors' table
CREATE TABLE doctors (
    doctor_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialisation VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    years_experience INT NOT NULL,
    hospital_branch VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- 5. Create 'appointments' table
CREATE TABLE appointments (
    appointment_id VARCHAR(50) PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    doctor_id VARCHAR(50) NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason_for_visit VARCHAR(100) NOT NULL,
    status VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- 6. Create 'treatments' table
CREATE TABLE treatments (
    treatment_id VARCHAR(50) PRIMARY KEY,
    appointment_id VARCHAR(50) NOT NULL,
    treatment_type VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    cost DECIMAL(9,2) NOT NULL,
    treatment_date DATE NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 7. Create 'billings' table
CREATE TABLE billings (
    bill_id VARCHAR(50) PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    treatment_id VARCHAR(50) NOT NULL,
    bill_date DATE NOT NULL,
    amount DECIMAL(9,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);
2. 📥 Data Ingestion (CSV Load Scripts)
These are the final, corrected scripts to load the data from your CSVs, including the command to enable local_infile and all date transformations.


-- 1. Enable local_infile for the session
SET GLOBAL local_infile = 1;

-- 2. Load 'patients' data (handles 2 date columns)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/patients.csv"
INTO TABLE patients
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(patient_id, first_name, last_name, gender, @temp_dob, contact_number, address, @temp_reg_date, insurance_provider, insurance_number, email)
SET 
    dob = STR_TO_DATE(@temp_dob, '%d-%m-%Y'),
    registration_date = STR_TO_DATE(@temp_reg_date, '%d-%m-%Y');

-- 3. Load 'doctors' data (simple load)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/doctors.csv"
INTO TABLE doctors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(doctor_id, first_name, last_name, specialisation, phone_number, years_experience, hospital_branch, email);

-- 4. Load 'appointments' data (handles 1 date column)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/appointments.csv"
INTO TABLE appointments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(appointment_id, patient_id, doctor_id, @temp_app_date, appointment_time, reason_for_visit, status)
SET 
    appointment_date = STR_TO_DATE(@temp_app_date, '%d-%m-%Y');

-- 5. Load 'treatments' data (handles 1 date column)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/treatments.csv"
INTO TABLE treatments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(treatment_id, appointment_id, treatment_type, description, cost, @temp_tre_date)
SET 
    treatment_date = STR_TO_DATE(@temp_tre_date, '%d-%m-%Y');

-- 6. Load 'billings' data (handles 1 date column)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/billing.csv"
INTO TABLE billings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(bill_id, patient_id, treatment_id, @temp_bill_date, amount, payment_method, payment_status)
SET 
    bill_date = STR_TO_DATE(@temp_bill_date, '%d-%m-%Y');


You got it. This is a great way to consolidate all your work for your GitHub repository.

Here is the complete SQL code we developed during this project, from database creation to the final analysis queries.

1. ⚙️ Database & Table Creation
This script will create the hospital_db database and all 5 tables with their correct data types, primary keys, and foreign keys.

SQL

-- 1. Create the database
CREATE DATABASE hospital_db;

-- 2. Select the database to use
USE hospital_db;

-- 3. Create 'patients' table
CREATE TABLE patients (
    patient_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL,
    insurance_provider VARCHAR(50) NOT NULL,
    insurance_number VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- 4. Create 'doctors' table
CREATE TABLE doctors (
    doctor_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialisation VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    years_experience INT NOT NULL,
    hospital_branch VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- 5. Create 'appointments' table
CREATE TABLE appointments (
    appointment_id VARCHAR(50) PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    doctor_id VARCHAR(50) NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason_for_visit VARCHAR(100) NOT NULL,
    status VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- 6. Create 'treatments' table
CREATE TABLE treatments (
    treatment_id VARCHAR(50) PRIMARY KEY,
    appointment_id VARCHAR(50) NOT NULL,
    treatment_type VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    cost DECIMAL(9,2) NOT NULL,
    treatment_date DATE NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 7. Create 'billings' table
CREATE TABLE billings (
    bill_id VARCHAR(50) PRIMARY KEY,
    patient_id VARCHAR(50) NOT NULL,
    treatment_id VARCHAR(50) NOT NULL,
    bill_date DATE NOT NULL,
    amount DECIMAL(9,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(100) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);
2. 📥 Data Ingestion (CSV Load Scripts)
These are the final, corrected scripts to load the data from your CSVs, including the command to enable local_infile and all date transformations.

(Note: The file paths are specific to your machine and will need to be updated if you move the files.)

SQL

-- 1. Enable local_infile for the session
SET GLOBAL local_infile = 1;

-- 2. Load 'patients' data (handles 2 date columns)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/patients.csv"
INTO TABLE patients
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(patient_id, first_name, last_name, gender, @temp_dob, contact_number, address, @temp_reg_date, insurance_provider, insurance_number, email)
SET 
    dob = STR_TO_DATE(@temp_dob, '%d-%m-%Y'),
    registration_date = STR_TO_DATE(@temp_reg_date, '%d-%m-%Y');

-- 3. Load 'doctors' data (simple load)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/doctors.csv"
INTO TABLE doctors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(doctor_id, first_name, last_name, specialisation, phone_number, years_experience, hospital_branch, email);

-- 4. Load 'appointments' data (handles 1 date column)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/appointments.csv"
INTO TABLE appointments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(appointment_id, patient_id, doctor_id, @temp_app_date, appointment_time, reason_for_visit, status)
SET 
    appointment_date = STR_TO_DATE(@temp_app_date, '%d-%m-%Y');

-- 5. Load 'treatments' data (handles 1 date column)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/treatments.csv"
INTO TABLE treatments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(treatment_id, appointment_id, treatment_type, description, cost, @temp_tre_date)
SET 
    treatment_date = STR_TO_DATE(@temp_tre_date, '%d-%m-%Y');

-- 6. Load 'billings' data (handles 1 date column)
LOAD DATA LOCAL INFILE "C:/Users/ibrah/OneDrive/Desktop/Projects/Hospital Management Project/billing.csv"
INTO TABLE billings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(bill_id, patient_id, treatment_id, @temp_bill_date, amount, payment_method, payment_status)
SET 
    bill_date = STR_TO_DATE(@temp_bill_date, '%d-%m-%Y');
3. 📊 SQL Analysis Queries
These are the final queries we wrote to answer all our project questions and find the key insights.

1. Operational & Staffing Analysis
-- Q1.1: Appointments by Specialization
SELECT 
    d.specialisation,
    COUNT(*) AS appointments_count
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.specialisation
ORDER BY appointments_count DESC;

-- Q1.2: Appointments by Hospital Branch
SELECT 
    d.hospital_branch,
    COUNT(*) AS appointments_count
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.hospital_branch
ORDER BY appointments_count DESC;

-- Q1.3: Monthly Trends (Appointments, Registrations, Treatments)
SELECT 
    'Appointment' AS event_type,
    YEAR(a.appointment_date) AS event_year,
    MONTH(a.appointment_date) AS event_month,
    COUNT(*) AS total_count
FROM appointments a
GROUP BY event_type, event_year, event_month

UNION ALL

SELECT 
    'Registration' AS event_type,
    YEAR(p.registration_date) AS event_year,
    MONTH(p.registration_date) AS event_month,
    COUNT(*) AS total_count
FROM patients p
GROUP BY event_type, event_year, event_month

UNION ALL

SELECT 
    'Treatment' AS event_type,
    YEAR(t.treatment_date) AS event_year,
    MONTH(t.treatment_date) AS event_month,
    COUNT(*) AS total_count
FROM treatments t
GROUP BY event_type, event_year, event_month

ORDER BY event_year, event_month, event_type;

-- Q1.4: Correlation between Experience and Appointment Count
SELECT 
    d.doctor_id,
    d.years_experience,
    COUNT(a.appointment_id) AS appointments_count
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.years_experience
ORDER BY d.years_experience;

-- Q1.5: Average Time Gap (Appointment to Treatment)
SELECT 
   AVG(DATEDIFF(t.treatment_date, a.appointment_date)) AS avg_time_gap_days
FROM treatments t
JOIN appointments a ON t.appointment_id = a.appointment_id;

-- Q1.6: Time Gap by Treatment Type
SELECT 
    t.treatment_type,
    AVG(DATEDIFF(t.treatment_date, a.appointment_date)) AS avg_time_gap
FROM treatments t
JOIN appointments a ON t.appointment_id = a.appointment_id
GROUP BY t.treatment_type;

-- Deeper Dive 1: Branch & Specialization Breakdown
SELECT 
    d.hospital_branch,
    d.specialisation,
    COUNT(*) AS appointment_count
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.hospital_branch, d.specialisation
ORDER BY d.hospital_branch, appointment_count DESC;

-- Deeper Dive 2: Monthly Trends by Branch & Specialization
SELECT 
    d.hospital_branch,
    d.specialisation,
    MONTH(a.appointment_date) AS appointment_month,
    COUNT(*) AS appointment_count
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.hospital_branch, d.specialisation, appointment_month
ORDER BY appointment_month, d.hospital_branch;

2. Patient Demographics & Profile

-- Q2.1 (Part 1): Distribution by Gender
SELECT 
    gender,
    COUNT(*) AS patient_count
FROM patients
GROUP BY gender;

-- Q2.1 (Part 2): Distribution by Age Group (at time of appointment)
SELECT 
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, p.dob, a.appointment_date) BETWEEN 0 AND 20 THEN 'Teenage (0-20)'
        WHEN TIMESTAMPDIFF(YEAR, p.dob, a.appointment_date) BETWEEN 21 AND 40 THEN 'Young_Age (21-40)'
        WHEN TIMESTAMPDIFF(YEAR, p.dob, a.appointment_date) BETWEEN 41 AND 60 THEN 'Middle_Age (41-60)'
        ELSE 'Old_Age (61+)'
    END AS Patient_Group,
    COUNT(*) AS appointment_count
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY Patient_Group
ORDER BY appointment_count DESC;

-- Q2.2: Insurance Provider Market Share (by patient count)
SELECT 
    insurance_provider,
    COUNT(patient_id) AS patient_count
FROM patients
GROUP BY insurance_provider
ORDER BY patient_count DESC;


3. Financial & Revenue Analysis

-- Q3.1: Total Revenue by Specialization 
SELECT 
    d.specialisation,
    SUM(b.amount) AS total_revenue
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
JOIN treatments t ON a.appointment_id = t.appointment_id
JOIN billings b ON t.treatment_id = b.treatment_id
GROUP BY d.specialisation
ORDER BY total_revenue DESC;

-- Q3.2: Revenue by Payment Method
SELECT 
    payment_method,
    SUM(amount) AS total_revenue
FROM billings
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Q3.3: Revenue by Payment Status
SELECT 
    payment_status,
    SUM(amount) AS total_revenue
FROM billings
GROUP BY payment_status
ORDER BY total_revenue DESC;


