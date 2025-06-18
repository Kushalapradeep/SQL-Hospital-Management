# 🏥 Hospital Database Management System (HMS) - SQL Portfolio Project

This is a comprehensive SQL-based portfolio project simulating a Hospital Management System (HMS) using dummy data. The objective is to showcase data analyst capabilities such as database design, data transformation, and analytical SQL queries to solve real-world business problems in a healthcare setting.

---

## 📌 Project Objective

To create a relational database that manages hospital operations such as patient details, appointments, medical records, doctor assignments, room/bed occupancy, and department management. Then, perform analysis using SQL to derive actionable insights for hospital administration and planning.

---

## 🛠️ Tools Used

- **MySQL**: Database creation, normalization, and SQL queries
- **Excel**: Data cleaning and formatting before import
- **dbdiagram.io**: ER diagram visualization

## 🗂️ Dataset Overview

The data is divided into multiple entities:

- `Patients`: Demographics and basic information
- `Doctor`: Assigned department and specialization
- `Appointment`: Booking details, status, and type
- `MedicalRecord`: Patient diagnosis and treatment history
- `SurgeryRecord`: Surgery and procedure records
- `Room` & `RoomRecords`: Room allocation and charges
- `Bed` & `BedRecords`: Bed allocation and charges
- `Department`: Department and ward information
- `Nurse`: Assigned to rooms/beds

Data was generated synthetically using ChatGPT.

---

## 🧱 Database Design

- ✅ Tables: 10+
- ✅ Primary & Foreign Key constraints applied
- ✅ Normalized to eliminate redundancy
- ✅ ER Diagram created to illustrate relationships

---

## 🔄 Data Loading

1. Cleaned Excel sheets manually
2. Created tables using `create_tables.sql`
3. Imported Excel sheets into MySQL tables
4. Verified using `SELECT` queries

---

## 📊 Business Problems Solved

The following insights were extracted using advanced SQL queries (`analysis_queries.sql`):

| # | Business Question |
|---|-------------------|
| 1 | Which department has the highest number of appointments? |
| 2 | Which doctor has treated the most patients? |
| 3 | What is the monthly revenue from bed charges? |
| 4 | What is the average room charge per department? |
| 5 | How many appointments were canceled? |
| 6 | Which patients underwent multiple surgeries? |
| 7 | What are the most common diagnoses? |
| 8 | What is the age distribution of patients? |
| 9 | Which nurse has handled the most patients? |
|10 | What are the trends in appointment modes (Online vs Offline)? |

---

## 🏁 Outcome

- ✅ Designed a fully normalized relational database system for a multi-department hospital using MySQL.
- ✅ Imported and transformed raw data from Excel into structured SQL tables using proper constraints and relationships.
- ✅ Developed an ER diagram to visualize data relationships and improve schema understanding.
- ✅ Solved 10+ real-world hospital management problems using complex SQL queries involving joins, aggregations, grouping, and subqueries.
- ✅ Analyzed key performance metrics such as department efficiency, patient demographics, revenue trends, and appointment patterns.
- ✅ Strengthened hands-on skills in SQL, data cleaning, and database analytics—demonstrating readiness for data analyst roles in healthcare or operations domains.


