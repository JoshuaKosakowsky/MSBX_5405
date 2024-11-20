DROP DATABASE IF EXISTS Medical;
CREATE DATABASE Medical;
USE Medical;

DROP TABLE IF EXISTS ReferralEncounter;
DROP TABLE IF EXISTS PatientInsurance;
DROP TABLE IF EXISTS HospitalPatient;
DROP TABLE IF EXISTS NursePatient;
DROP TABLE IF EXISTS DoctorPatient;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Nurses;
DROP TABLE IF EXISTS Referrals;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Hospitals;
DROP TABLE IF EXISTS Insurance;
DROP TABLE IF EXISTS Encounters;
DROP TABLE IF EXISTS Referrals;

CREATE TABLE Staff (
    StaffID VARCHAR(5),
    FirstName TEXT(30),
    LastName TEXT(30),
    MiddleName TEXT(30),
    CertDate DATE,
    MedicalLicenseNumber TEXT(30),
    Specialty TEXT(30),
    YearsExperience INT,
  CONSTRAINT Staff_PK PRIMARY KEY (StaffID)
);

INSERT INTO STAFF (StaffID, FirstName, LastName, MiddleName, CertDate, MedicalLicenseNumber, Specialty, YearsExperience) VALUES
	('D0001', 'Alton', 'Alvarado', 'A', '2023-06-07', '4205868369', 'Family Medicine', '14'),
	('D0002', 'Elbert', 'Madden', 'G', '2024-08-30', '1578369284', 'Neurologist', '17'),
	('D0003', 'Zack', 'Guerrero', 'Edgar', '2022-02-03', '2628519772', 'Psychiatrist', '16'),
	('D0004', 'Deena', 'Garrison', 'O', '2022-03-08', '4871000489', 'Pediatrician', '16'),
	('D0005', 'Elias', 'Jefferson', 'P', '2022-11-02', '7247564975', 'Immunology', '7'),
	('N0001', 'Camila', 'Payne', 'A', '2022-12-19', '7044041000', 'Nurse Practitioner', '20'),
	('N0002', 'Maximilian', 'Grant', 'H', '2023-02-03', '3967987103', 'Surgical Nurse', '24'),
	('N0003', 'Dominik', 'Warren', 'R', '2024-07-20', '5209972429', 'Pediatrics', '14'),
	('N0004', 'Byron', 'Ryan', 'N', '2022-03-10', '1920568015', 'Registered Nurse', '19'),
	('N0005', 'Leonardo', 'Walker', 'O', '2023-10-28', '5801216015', 'Emergency Room Nurse', '2'),
	('N0006', 'Carina', 'Elliott', 'P', '2023-02-25', '8190739337', 'Critical Care Nurse', '12'),
	('N0007', 'April', 'Evans', 'Z', '2022-08-12', '9758471507', 'Geriatric Nurse', '7'),
	('N0008', 'Tiana', 'Kelly', 'E', '2023-01-19', '2264301104', 'Oncology Nursing', '12'),
	('N0009', 'Max', 'Carroll', 'Brian', '2024-05-21', '8638062390', 'Registered Nurse', '10'),
	('N0010', 'George', 'Wells', 'H', '2023-05-31', '3408811891', 'Oncology Nursing', '20');


CREATE TABLE Doctors (
		StaffID VARCHAR(5),
  	NPINumber VARCHAR(20) UNIQUE,
  CONSTRAINT Doctors_PK PRIMARY KEY (StaffID),
  CONSTRAINT Doctors_FK FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

INSERT INTO DOCTORS (StaffID, NPINumber) VALUES
	('D0001', '89267'),
	('D0002', '98900'),
	('D0003', '89067'),
	('D0004', '38152'),
	('D0005', '44497');

CREATE TABLE Nurses (
		StaffID VARCHAR(5),
  	NursingLicenseNumber VARCHAR(20) UNIQUE,
  CONSTRAINT Nurses_PK PRIMARY KEY (StaffID),
  CONSTRAINT Nurses_FK FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

INSERT INTO NURSES (StaffID, NursingLicenseNumber) VALUES
	('N0001', '18595'),
	('N0002', '76350'),
	('N0003', '12243'),
	('N0004', '87397'),
	('N0005', '11487'),
	('N0006', '38166'),
	('N0007', '28263'),
	('N0008', '60119'),
	('N0009', '95324'),
	('N0010', '62368');
  
CREATE TABLE Patients (
    PatientID	VARCHAR(5),
    FirstName	TEXT(30),
    MiddleName	TEXT(30),
    LastName	TEXT(30),
    Street	TEXT(50),
    City	TEXT(30),
    State	TEXT(30),
    ZipCode	VARCHAR(10),
    Gender	VARCHAR(10),
    PhoneNumber	VARCHAR(12),
    Email	VARCHAR(512),
    DateOfBirth	DATE,
    EmergencyContact	TEXT(30),
    EmergencyContactNum	VARCHAR(12),
    Allergies	VARCHAR(512),
  CONSTRAINT Patients_PK PRIMARY KEY (PatientID)
);

INSERT INTO Patients (PatientID, FirstName, MiddleName, LastName, Street, City, State, ZipCode, Gender, PhoneNumber, Email, DateOfBirth, EmergencyContact, EmergencyContactNum, Allergies) VALUES
	('P0001', 'Timmy', 'Orlan', 'Chill', '8950 Buell Center', 'Colorado Springs', 'Colorado', '80945', 'M', '719-666-7127', 'gchill0@edublogs.org', '1954-05-08', 'Gery', '940-399-8535', 'KETOROLAC TROMETHAMINE'),
	('P0002', 'Hildegaard', 'Francoise', 'Phinnis', '5 Oak Valley Road', 'Denver', 'Colorado', '80241', 'F', '303-816-5167', 'aphinnis1@ning.com', '1978-11-24', 'Ashien', '443-103-2861', ''),
	('P0003', 'Philomena', 'Lizbeth', 'Thorold', '15 Buell Junction', 'Denver', 'Colorado', '80217', 'F', '303-664-6257', 'mthorold2@sourceforge.net', '2022-02-20', 'Malinde', '602-580-3520', ''),
	('P0004', 'Aurea', '', 'Motten', '713 Cherokee Crossing', 'Boulder', 'Colorado', '80305', 'F', '720-571-1539', 'zmotten3@hibu.com', '1957-02-08', 'Zoe', '602-628-5564', ''),
	('P0005', 'Dwayne', 'Simmonds', 'Caudrelier', '0 Fairview Street', 'Denver', 'Colorado', '80243', 'M', '303-191-2117', 'bcaudrelier4@digg.com', '2000-07-09', 'Bancroft', '857-504-4329', 'Pine Australian Beefwood'),
	('P0006', 'Madelene', '', 'Sprowson', '14 Westerfield Crossing', 'Colorado Springs', 'Colorado', '80905', 'F', '719-795-2658', 'ssprowson5@usda.gov', '2022-05-02', 'Sofia', '702-986-4784', 'Raspberry'),
	('P0007', 'Adrian', 'Edee', 'Conn', '50628 Florence Terrace', 'Boulder', 'Colorado', '80305', 'F', '303-820-6863', 'rconn6@pagesperso-orange.fr', '1961-12-07', 'Ramonda', '904-562-2697', ''),
	('P0008', 'Maurita', '', 'Kinker', '14222 Kedzie Pass', 'Colorado Springs', 'Colorado', '80940', 'F', '719-991-3233', 'bkinker7@hud.gov', '1966-10-01', 'Belle', '405-217-4303', ''),
	('P0009', 'Zorah', 'Eartha', 'Sneezem', '4530 Manufacturers Avenue', 'Denver', 'Colorado', '80209', 'F', '303-136-2359', 'rsneezem8@huffingtonpost.com', '1992-02-14', 'Rianon', '713-637-4603', 'Amoxicillin'),
	('P0010', 'Vanya', '', 'Willmett', '68 Farmco Hill', 'Colorado Springs', 'Colorado', '80915', 'M', '719-648-5576', 'fwillmett9@stumbleupon.com', '2008-09-05', 'Filmer', '603-823-0068', 'Dexmethylphenidate hydrochloride');
  
CREATE TABLE Hospitals (
    HospitalID	VARCHAR(5),
    HospitalName	VARCHAR(50),
    Street	TEXT(50),
    City	TEXT(30),
    State	TEXT(30),
    Zipcode	VARCHAR(10),
    Services	VARCHAR(512),
  CONSTRAINT Hospitals_PK PRIMARY KEY (HospitalID)
);

INSERT INTO Hospitals (HospitalID, HospitalName, Street, City, State, Zipcode, Services) VALUES
	('H0001', 'Aufderhar, Von And Donnelly', '315 Golden Leaf Circle', 'Colorado Springs', 'Colorado', '81505', 'Full'),
	('H0002', 'Sporer-Raynor', '34 Schlimgen Road', 'Boulder', 'Colorado', '80305', 'Comprehenisve Primary Care'),
	('H0003', 'Kuphal-Klein', '35 Walton Circle', 'Denver', 'Colorado', '80217', 'Full');
  
CREATE TABLE Insurance (
    InsuranceID	VARCHAR(5),
  	CompanyName	VARCHAR(50),
    Street	TEXT(50),
    City	TEXT(30),
    State	TEXT(30),
    Zipcode	VARCHAR(10),
    PhoneNumber	VARCHAR(12),
  CONSTRAINT Insurance_PK PRIMARY KEY (InsuranceID)
);

INSERT INTO Insurance (InsuranceID, CompanyName, Street, City, State, Zipcode, PhoneNumber) VALUES
	('I0001', 'Cigna', '900 Cottage Grove Rd', 'Bloomfield', 'Connecticut', '06002', '860-579-0506'),
	('I0002', 'Kaiser Permanente', '1 Kaiser Plaza', 'Oakland', 'California', '94612', '510-641-3585'),
	('I0003', 'Aetna', '151 Farmington Avenue', 'Hartford', 'Connecticut', '06105', '959-820-6676');
  
CREATE TABLE Encounters (
    VisitID	VARCHAR(5),
    EncounterType	VARCHAR(50),
    VisitDate	DATE,
  CONSTRAINT VisitID_PK PRIMARY KEY (VisitID)
);

INSERT INTO Encounters (VisitID, EncounterType, VisitDate) VALUES
	('V0001', 'Inpatient', '2020-09-18'),
	('V0002', 'Emergency', '2020-11-12'),
	('V0003', 'Inpatient', '2020-12-06'),
	('V0004', 'Follow-Up', '2020-12-18'),
	('V0005', 'Outpatient', '2021-01-18'),
	('V0006', 'Consultation', '2021-06-22'),
	('V0007', 'Surgery', '2023-05-14'),
	('V0008', 'Outpatient', '2023-07-09'),
	('V0009', 'Surgery', '2023-10-03'),
	('V0010', 'Inpatient', '2024-02-26');
  
CREATE TABLE Referrals (
    ReferralID	VARCHAR(5),
    ReferralDate	DATE,
    ReferralTime	TIME,
    ReferreringDoctor	VARCHAR(5),
    ReceivingDoctor	VARCHAR(5),
    FollowUpDate	DATE,
    ReasonForReferral	VARCHAR(50),
  CONSTRAINT ReferralID_PK PRIMARY KEY (ReferralID),
  CONSTRAINT ReferreringDoctor_FK FOREIGN KEY (ReferreringDoctor) REFERENCES Staff(StaffID),
  CONSTRAINT ReceivingDoctor_FK FOREIGN KEY (ReceivingDoctor) REFERENCES Staff(StaffID)
);

INSERT INTO Referrals (ReferralID, ReferralDate, ReferralTime, ReferreringDoctor, ReceivingDoctor, FollowUpDate, ReasonForReferral) VALUES
	('R0001', '2021-02-18', '15:46:28', 'D0001', 'D0005', '2021-02-25', 'Lab'),
	('R0002', '2022-12-03', '8:28:14', 'D0005', 'D0002', '2023-01-02', 'Imaging'),
	('R0003', '2023-08-13', '5:41:28', 'D0004', 'D0001', '2023-08-27', 'Specialist Care'),
	('R0004', '2024-01-07', '20:56:23', 'D0003', 'D0002', '2024-01-14', 'Imaging'),
	('R0005', '2024-10-02', '5:38:00', 'D0001', 'D0004', '2024-12-01', 'Second Opinion');
  
CREATE TABLE DoctorPatient (
    StaffID VARCHAR(5),
    PatientID VARCHAR(5),
    EncounterID VARCHAR(5),
    PRIMARY KEY (StaffID, PatientID, EncounterID),
    CONSTRAINT DoctorPatient_Doctor_FK FOREIGN KEY (StaffID) REFERENCES Doctors(StaffID),
    CONSTRAINT DoctorPatient_Patient_FK FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT DoctorPatient_Encounter_FK FOREIGN KEY (EncounterID) REFERENCES Encounters(VisitID)
);

INSERT INTO DoctorPatient (StaffID, PatientID, EncounterID) VALUES
	('D0001', 'P0010', 'V0001'),
  ('D0002', 'P0009', 'V0009'),
  ('D0005', 'P0008', 'V0007'),
  ('D0003', 'P0003', 'V0005'),
  ('D0001', 'P0001', 'V0006'),
  ('D0004', 'P0002', 'V0008'),
  ('D0004', 'P0003', 'V0003'),
  ('D0002', 'P0007', 'V0002');
  
CREATE TABLE NursePatient (
    StaffID VARCHAR(5),
    PatientID VARCHAR(5),
    EncounterID VARCHAR(5),
    PRIMARY KEY (StaffID, PatientID, EncounterID),
    CONSTRAINT NursePatient_Nurse_FK FOREIGN KEY (StaffID) REFERENCES Nurses(StaffID),
    CONSTRAINT NursePatient_Patient_FK FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT NursePatient_Encounter_FK FOREIGN KEY (EncounterID) REFERENCES Encounters(VisitID)
);

INSERT INTO NursePatient (StaffID, PatientID, EncounterID) VALUES
  ('N0009', 'P0008', 'V0007'),
  ('N0005', 'P0006', 'V0006'),
  ('N0003', 'P0009', 'V0009'),
  ('N0003', 'P0010', 'V0001'),
  ('N0002', 'P0007', 'V0002'),
  ('N0008', 'P0004', 'V0008'),
  ('N0010', 'P0003', 'V0003'),
  ('N0005', 'P0007', 'V0010');

CREATE TABLE HospitalPatient (
    HospitalID VARCHAR(5),
    PatientID VARCHAR(5),
    EncounterID VARCHAR(5),
    PRIMARY KEY (HospitalID, PatientID, EncounterID),
    CONSTRAINT HospitalPatient_Hospital_FK FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID),
    CONSTRAINT HospitalPatient_Patient_FK FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT HospitalPatient_Encounter_FK FOREIGN KEY (EncounterID) REFERENCES Encounters(VisitID)
);

INSERT INTO HospitalPatient (HospitalID, PatientID, EncounterID) VALUES
  ('H0001', 'P0008', 'V0007'),
  ('H0002', 'P0006', 'V0006'),
  ('H0003', 'P0009', 'V0009'),
  ('H0003', 'P0010', 'V0001'),
  ('H0002', 'P0007', 'V0002'),
  ('H0001', 'P0004', 'V0008'),
  ('H0001', 'P0003', 'V0003'),
  ('H0001', 'P0007', 'V0010');
  
CREATE TABLE PatientInsurance (
    InsuranceID VARCHAR(5),
    PatientID VARCHAR(5),
    PRIMARY KEY (InsuranceID, PatientID),
    CONSTRAINT PatientInsurance_Insurance_FK FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID),
    CONSTRAINT PatientInsurance_Patient_FK FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO PatientInsurance (InsuranceID, PatientID) VALUES
  ('I0001', 'P0001'),
  ('I0001', 'P0002'),
  ('I0002', 'P0003'),
  ('I0003', 'P0004'),
  ('I0003', 'P0005'),
  ('I0003', 'P0006'),
  ('I0003', 'P0007'),
  ('I0002', 'P0008'),
  ('I0002', 'P0009'),
  ('I0001', 'P0010');
  
CREATE TABLE ReferralEncounter (
    ReferralID VARCHAR(5),
    EncounterID VARCHAR(5),
    PRIMARY KEY (ReferralID, EncounterID),
    CONSTRAINT ReferralEncounter_Referral_FK FOREIGN KEY (ReferralID) REFERENCES Referrals(ReferralID),
    CONSTRAINT ReferralEncounter_Encounter_FK FOREIGN KEY (EncounterID) REFERENCES Encounters(VisitID)
);

INSERT INTO ReferralEncounter (ReferralID, EncounterID) VALUES
  ('R0001', 'V0001'),
  ('R0002', 'V0003'),
  ('R0003', 'V0006'),
  ('R0004', 'V0007'),
  ('R0005', 'V0009');
