#The healthcare department wants to categorize the patients into the following category.
#Write a SQL query to list all the patient name, gender, dob, and their category.

CREATE DATABASE HealthcareDB;
USE HealthcareDB;
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Gender ENUM('male', 'female'),
    DOB DATE
);
INSERT INTO Patients (Name, Gender, DOB) VALUES
('John Doe', 'male', '2000-05-15'),
('Jane Smith', 'female', '1990-11-23'),
('Robert Johnson', 'male', '1980-07-30'),
('Emily Davis', 'female', '1975-03-12'),
('Michael Brown', 'male', '1965-09-09'),
('Linda Wilson', 'female', '1962-12-22');

#Used to categorize each patient based on their date of birth and gender.
#WHEN DOB < '2005-01-01' AND DOB >= '1985-01-01' AND Gender = 'male' THEN 'AdultMale' checks if the patient is an adult male, and so on.
#DOB: Date of birth of the patient.
#Category: The derived category based on the CASE statement.

SELECT
    Name,
    Gender,
    DOB,
    CASE
        WHEN DOB >= '2005-01-01' AND Gender = 'male' THEN 'YoungMale'
        WHEN DOB >= '2005-01-01' AND Gender = 'female' THEN 'YoungFemale'
        WHEN DOB < '2005-01-01' AND DOB >= '1985-01-01' AND Gender = 'male' THEN 'AdultMale'
        WHEN DOB < '2005-01-01' AND DOB >= '1985-01-01' AND Gender = 'female' THEN 'AdultFemale'
        WHEN DOB < '1985-01-01' AND DOB >= '1970-01-01' AND Gender = 'male' THEN 'MidAgeMale'
        WHEN DOB < '1985-01-01' AND DOB >= '1970-01-01' AND Gender = 'female' THEN 'MidAgeFemale'
        WHEN DOB < '1970-01-01' AND Gender = 'male' THEN 'ElderMale'
        WHEN DOB < '1970-01-01' AND Gender = 'female' THEN 'ElderFemale'
    END AS Category
FROM Patients;
