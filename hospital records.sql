SELECT * FROM Hospital_Records;

--1. Total Number of Patients
-- Write an SQL query to find the total number of patients across all hospitals.
SELECT SUM(Patients_Count) AS Total_Patients
FROM Hospital_Records;

--Q.2. Average Number of Doctors per Hospital
-- Retrieve the average count of doctors available in each hospital.
SELECT Hospital_Name, AVG(Doctors_Count) AS Average_Doctors
FROM Hospital_Records
GROUP BY Hospital_Name;

--Top 3 Departments with the Highest Number of Patients
-- Find the top 3 hospital departments that have the highest number of patients.
SELECT Department, SUM(Patients_Count) AS Total_Patients
FROM Hospital_Records
GROUP BY Department
ORDER BY Total_Patients DESC
LIMIT 3;

-- Q.4 Hospital with the Maximum Medical Expenses
-- Identify the hospital that recorded the highest medical expenses.
SELECT Hospital_Name, SUM(Medical_Expenses) AS Total_Expenses
FROM Hospital_Records
GROUP BY Hospital_Name
ORDER BY Total_Expenses DESC
LIMIT 1;

-- Q.5 Daily Average Medical Expenses
-- Calculate the average medical expenses per day for each hospital.
SELECT 
    Hospital_Name,
    ROUND(AVG(Medical_Expenses / (Discharge_Date - Admission_Date + 1)), 2) AS Avg_Daily_Expenses
FROM Hospital_Records
GROUP BY Hospital_Name;

--Q.6 Longest Hospital Stay
--Find the patient with the longest stay by calculating the difference between
--Discharge Date and Admission Date.
SELECT 
    Hospital_Name,
    Department,
    Admission_Date,
    Discharge_Date,
    (Discharge_Date - Admission_Date) AS Stay_Duration
FROM Hospital_Records
ORDER BY Stay_Duration DESC
LIMIT 1;

-- Q.7Total Patients Treated Per City Count the total number of patients treated in each city
SELECT 
    Location AS City,
    SUM(Patients_Count) AS Total_Patients
FROM Hospital_Records
GROUP BY Location;

--Q.8 Average Length of Stay Per Department
-- Calculate the average number of days patients spend in each department.

SELECT 
    Department,
    ROUND(AVG(Discharge_Date - Admission_Date), 2) AS Avg_Length_of_Stay
FROM Hospital_Records
GROUP BY Department;

-- Q.9 Identify the Department with the Lowest Number of Patients
-- Find the department with the least number of patients

SELECT 
    Department,
    SUM(Patients_Count) AS Total_Patients
FROM Hospital_Records
GROUP BY Department
ORDER BY Total_Patients ASC
LIMIT 1;

--Monthly Medical Expenses Report
-- Group the data by month and calculate the total medical expenses for each month.

SELECT 
    TO_CHAR(Admission_Date, 'YYYY-MM') AS Year_Month,
    SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital_Records
GROUP BY Year_Month
ORDER BY Year_Month;




