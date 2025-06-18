--Drop Database HospitalManagementSystem

Create Database HospitalManagementSystem;
GO

Use HospitalManagementSystem;
GO

-- Department Table
CREATE TABLE Department (
    dept_Id VARCHAR(100) PRIMARY KEY,
    dept_Name VARCHAR(100)
);

-- Ward Table
CREATE TABLE Ward (
    ward_No VARCHAR(100) PRIMARY KEY,
    ward_Name VARCHAR(100),
    dept_Id VARCHAR(100),
    FOREIGN KEY (dept_Id) REFERENCES Department(dept_Id)
);

-- Bed Table
CREATE TABLE Bed (
    bed_No VARCHAR(100) PRIMARY KEY,
    ward_No VARCHAR(100),
    FOREIGN KEY (ward_No) REFERENCES Ward(ward_No)
);

-- Room Table
CREATE TABLE Room (
    room_No VARCHAR(100) PRIMARY KEY,
    dept_Id VARCHAR(100),
    room_Type VARCHAR(100),
    FOREIGN KEY (dept_Id) REFERENCES Department(dept_Id)
);

-- Patients Table
CREATE TABLE Patients (
    patient_Id VARCHAR(100) PRIMARY KEY,
    FName VARCHAR(100),
    LName VARCHAR(100),
    Gender VARCHAR(100),
    Date_Of_Birth DATE,
    contact_No VARCHAR(100),
    pt_Address VARCHAR(100)
);

-- Doctor Table
CREATE TABLE Doctor (
    doct_Id VARCHAR(100) PRIMARY KEY,
    dept_Id VARCHAR(100),
    FName VARCHAR(100),
    LName VARCHAR(100),
    Gender VARCHAR(100),
    contact_No VARCHAR(100),
    surgeon_Type VARCHAR(100),
    office_No FLOAT,
    FOREIGN KEY (dept_Id) REFERENCES Department(dept_Id)
);

-- Nurse Table
CREATE TABLE Nurse (
    nurse_Id VARCHAR(100) PRIMARY KEY,
    dept_Id VARCHAR(100),
    FName VARCHAR(100),
    LName VARCHAR(100),
    Gender VARCHAR(100),
    conatct_No VARCHAR(100),
    FOREIGN KEY (dept_Id) REFERENCES Department(dept_Id)
);

-- Helpers Table
CREATE TABLE Helpers (
    helper_Id VARCHAR(100) PRIMARY KEY,
    dept_Id VARCHAR(100),
    FName VARCHAR(100),
    LName VARCHAR(100),
    Gender VARCHAR(100),
    contact_No VARCHAR(100),
    FOREIGN KEY (dept_Id) REFERENCES Department(dept_Id)
);

-- Appointment Table
CREATE TABLE Appointment (
    appoIntment_Id VARCHAR(100) PRIMARY KEY,
    patient_Id VARCHAR(100),
    doct_Id VARCHAR(100),
    reason VARCHAR(100),
    appointment_Date DATE,
    payment_amount VARCHAR(100),
    mode_of_payment VARCHAR(100),
    mode_of_appointment VARCHAR(100),
    appointment_status VARCHAR(100),
    FOREIGN KEY (patient_Id) REFERENCES Patients(patient_Id),
    FOREIGN KEY (doct_Id) REFERENCES Doctor(doct_Id)
);

-- BedRecords Table
CREATE TABLE BedRecords (
    admission_Id VARCHAR(100) PRIMARY KEY,
    bed_No VARCHAR(100),
    patient_Id VARCHAR(100),
    nurse_Id VARCHAR(100),
    helper_Id VARCHAR(100),
    admission_Date DATE,
    discharge_Date DATE,
    amount VARCHAR(100),
    mode_of_payment VARCHAR(100),
    FOREIGN KEY (bed_No) REFERENCES Bed(bed_No),
    FOREIGN KEY (patient_Id) REFERENCES Patients(patient_Id),
    FOREIGN KEY (nurse_Id) REFERENCES Nurse(nurse_Id),
    FOREIGN KEY (helper_Id) REFERENCES Helpers(helper_Id)
);

-- RoomRecords Table
CREATE TABLE RoomRecords (
    admisson_ID VARCHAR(100) PRIMARY KEY,
    room_no VARCHAR(100),
    patient_Id VARCHAR(100),
    nurse_Id VARCHAR(100),
    helper_Id VARCHAR(100),
    admission_Date DATE,
    discharge_Date DATE,
    amount VARCHAR(100),
    mode_of_payment VARCHAR(100),
    FOREIGN KEY (room_no) REFERENCES Room(room_No),
    FOREIGN KEY (patient_Id) REFERENCES Patients(patient_Id),
    FOREIGN KEY (nurse_Id) REFERENCES Nurse(nurse_Id),
    FOREIGN KEY (helper_Id) REFERENCES Helpers(helper_Id)
);

-- MedicalRecord Table
CREATE TABLE MedicalRecord (
    record_Id VARCHAR(100) PRIMARY KEY,
    doct_Id VARCHAR(100),
    patient_Id VARCHAR(100),
    visit_Date DATE,
    curr_Weight FLOAT,
    curr_height FLOAT,
    curr_Blood_Pressure VARCHAR(100),
    curr_Temp_F FLOAT,
    diagnosis VARCHAR(100),
    treatment VARCHAR(100),
    next_Visit DATE,
    FOREIGN KEY (doct_Id) REFERENCES Doctor(doct_Id),
    FOREIGN KEY (patient_Id) REFERENCES Patients(patient_Id)
);

-- StaffShift Table
CREATE TABLE StaffShift (
    shift_Id VARCHAR(100) PRIMARY KEY,
    doct_Id FLOAT,
    nurse_Id FLOAT,
    helper_Id FLOAT,
    shift_Date DATE,
    shift_Start VARCHAR(100),
    shift_End VARCHAR(100)
    -- NOTE: foreign keys skipped here due to FLOAT inconsistency; adjust if needed
);

-- SurgeryRecord Table
CREATE TABLE SurgeryRecord (
    surgery_Id VARCHAR(100) PRIMARY KEY,
    patient_Id VARCHAR(100),
    surgeon_Id VARCHAR(100),
    surgery_Type VARCHAR(100),
    surgery_Date DATE,
    start_Time VARCHAR(100),
    end_Time VARCHAR(100),
    room_no VARCHAR(100),
    notes VARCHAR(100),
    nurse_Id VARCHAR(100),
    helper_Id VARCHAR(100),
    FOREIGN KEY (patient_Id) REFERENCES Patients(patient_Id),
    FOREIGN KEY (surgeon_Id) REFERENCES Doctor(doct_Id),
    FOREIGN KEY (room_no) REFERENCES Room(room_No),
    FOREIGN KEY (nurse_Id) REFERENCES Nurse(nurse_Id),
    FOREIGN KEY (helper_Id) REFERENCES Helpers(helper_Id)
);
