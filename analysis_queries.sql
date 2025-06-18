1. Department with the highest number of appointments
SELECT d.dept_Name, COUNT(*) AS total_appointments
FROM Appointment a
JOIN Doctor doc ON a.doct_Id = doc.doct_Id
JOIN Department d ON doc.dept_Id = d.dept_Id
GROUP BY d.dept_Name
ORDER BY total_appointments DESC;

-- 2. Doctor who treated the most patients
SELECT doc.FName, doc.LName, COUNT(DISTINCT a.patient_Id) AS total_patients
FROM Appointment a
JOIN Doctor doc ON a.doct_Id = doc.doct_Id
GROUP BY doc.doct_Id
ORDER BY total_patients DESC;

-- 3. Monthly revenue from bed charges
SELECT 
  MONTH(admission_Date) AS month,
  YEAR(admission_Date) AS year,
  SUM(CAST(amount AS DECIMAL(10,2))) AS total_bed_revenue
FROM BedRecords
GROUP BY YEAR(admission_Date), MONTH(admission_Date)
ORDER BY year, month;

-- 4. Average room stay amount per department
SELECT 
  d.dept_Name,
  AVG(CAST(r.amount AS DECIMAL(10,2))) AS avg_room_charge
FROM RoomRecords r
JOIN Room rm ON r.room_no = rm.room_No
JOIN Department d ON rm.dept_Id = d.dept_Id
GROUP BY d.dept_Name;

-- 5. Number of canceled appointments
SELECT appointment_status, COUNT(*) AS total
FROM Appointment
GROUP BY appointment_status;

-- 6. Patients with multiple surgeries
SELECT patient_Id, COUNT(*) AS total_surgeries
FROM SurgeryRecord
GROUP BY patient_Id
HAVING COUNT(*) > 1;

-- 7. Most common diagnosis
SELECT diagnosis, COUNT(*) AS frequency
FROM MedicalRecord
GROUP BY diagnosis
ORDER BY frequency DESC
LIMIT 5;

-- 8. Patient age distribution
SELECT
  CASE
    WHEN TIMESTAMPDIFF(YEAR, Date_Of_Birth, CURDATE()) <= 18 THEN '0-18'
    WHEN TIMESTAMPDIFF(YEAR, Date_Of_Birth, CURDATE()) BETWEEN 19 AND 40 THEN '19-40'
    WHEN TIMESTAMPDIFF(YEAR, Date_Of_Birth, CURDATE()) BETWEEN 41 AND 60 THEN '41-60'
    ELSE '60+'
  END AS age_group,
  COUNT(*) AS total_patients
FROM Patients
GROUP BY age_group;

-- 9. Nurse assigned to most patients (bed + room)
SELECT nurse_Id, COUNT(*) AS total_patients_assigned
FROM (
  SELECT nurse_Id FROM BedRecords
  UNION ALL
  SELECT nurse_Id FROM RoomRecords
) AS combined
GROUP BY nurse_Id
ORDER BY total_patients_assigned DESC;

-- 10. Appointments per mode (Online vs Offline)
SELECT mode_of_appointment, COUNT(*) AS total
FROM Appointment
GROUP BY mode_of_appointment;