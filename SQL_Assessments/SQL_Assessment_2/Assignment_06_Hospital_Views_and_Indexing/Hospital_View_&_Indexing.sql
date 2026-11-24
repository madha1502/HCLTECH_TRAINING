CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;
CREATE TABLE Doctors (
 doctor_id INT PRIMARY KEY,
 doctor_name VARCHAR(50) NOT NULL,
 specialization VARCHAR(50)
);
CREATE TABLE Patients (
 patient_id INT PRIMARY KEY,
 patient_name VARCHAR(50) NOT NULL,
 age INT,
 disease VARCHAR(50),
 doctor_id INT,
 FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
INSERT INTO Doctors VALUES
(1,'Dr Kumar','Cardiology'),(2,'Dr Meena','Neurology'),
(3,'Dr Arun','Orthopedics'),(4,'Dr Priya','Dermatology'),
(5,'Dr Ravi','General Medicine');
INSERT INTO Patients VALUES
(101,'Arun',25,'Fever',5),(102,'Bala',40,'Heart Pain',1),
(103,'Charan',32,'Migraine',2),(104,'Divya',28,'Skin Allergy',4),
(105,'Ezhil',55,'Knee Pain',3),(106,'Farah',35,'Fever',5),
(107,'Gokul',45,'Heart Pain',1),(108,'Hari',29,'Migraine',2),
(109,'Indhu',38,'Skin Allergy',4),(110,'Jeeva',60,'Knee Pain',3);
CREATE VIEW PatientDetails AS
SELECT patient_id,patient_name,disease FROM Patients;
CREATE VIEW DoctorPatientDetails AS
SELECT d.doctor_name,p.patient_name,p.disease
FROM Doctors d JOIN Patients p ON d.doctor_id=p.doctor_id;
SELECT * FROM PatientDetails;
SELECT * FROM DoctorPatientDetails;
EXPLAIN SELECT * FROM Patients WHERE patient_name='Arun';
CREATE INDEX idx_patient_name ON Patients(patient_name);
CREATE INDEX idx_patient_disease ON Patients(disease);
CREATE INDEX idx_age_disease ON Patients(age,disease);
EXPLAIN SELECT * FROM Patients WHERE patient_name='Arun';
EXPLAIN SELECT * FROM Patients WHERE age=40 AND disease='Heart Pain';
SHOW INDEX FROM Patients;
DROP INDEX idx_patient_disease ON Patients;
