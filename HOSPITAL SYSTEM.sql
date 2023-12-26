USE [HOSPITAL SYSTEM]
-- Hospital Table
CREATE TABLE HOSPITAL
(
    HOSP_NAME VARCHAR(50)  PRIMARY KEY,
    COUNTRY VARCHAR(50),
    ADDRESS VARCHAR(50)		
);

-- MedicineTable
CREATE TABLE MEDICINE
(
    REG_NO INT PRIMARY KEY,
    MED_NAME VARCHAR(50) NOT NULL,
    PRICE INT,
    EXP_DATE DATE
);

-- Doctor Table
CREATE TABLE DOCTOR
(
    DOC_ID INT PRIMARY KEY,
    DNAME VARCHAR(50),
    GENDER CHAR(1),
    QUALIFICATION VARCHAR(50),
    JOB_SPECIFICATION VARCHAR(50),
    HOSP_NAME VARCHAR(50),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL(HOSP_NAME)
);

-- Nurse Table
CREATE TABLE NURSE (
    NURSE_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    GENDER CHAR(1),
    DOC_ID INT ,
    HOSP_NAME VARCHAR(50),
	FOREIGN KEY (DOC_ID) REFERENCES DOCTOR (DOC_ID),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL (HOSP_NAME)
    
);

-- Patient Table
CREATE TABLE PATIENT
(
    SSN VARCHAR(50) PRIMARY KEY,
    FNAME VARCHAR(50),
    LNAME VARCHAR(50),
    AGE INT,
    GENDER CHAR(1),
    NURSE_ID INT,
    REC_ID INT,
    FOREIGN KEY (NURSE_ID) REFERENCES NURSE(NURSE_ID),
    FOREIGN KEY (REC_ID) REFERENCES RECEPTION(REC_ID) 
);

-- Reception Table
CREATE TABLE RECEPTION
(
    REC_ID INT PRIMARY KEY,
    TEL_NO VARCHAR(20) NOT NULL,
    EMAIL VARCHAR(50),
    HOSP_NAME VARCHAR(50),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL (HOSP_NAME)
);

-- Appointment Table
CREATE TABLE APPOINTMENT
(
    APPOINT_NO INT PRIMARY KEY,
    APPOINT_DATE DATE   NOT NULL,
    APPOINT_TIME time,
    REC_ID INT,
    FOREIGN KEY (REC_ID) REFERENCES RECEPTION (REC_ID)
);

-- Diagnosis Table
CREATE TABLE DIAGNOSIS
(
    DIAGNOS_NO INT PRIMARY KEY,
    ISSUE_DATE DATE,
    TREATMENT VARCHAR(100),
    REMARKS VARCHAR(1000),
    NURSE_ID INT,
    DOC_ID INT,
    FOREIGN KEY (NURSE_ID) REFERENCES NURSE (NURSE_ID),
    FOREIGN KEY (DOC_ID) REFERENCES DOCTOR (DOC_ID)
);

-- Visit Table
CREATE TABLE VISIT
(
    VISIT_DATE DATE,
    SSN VARCHAR(50),
    HOSP_NAME VARCHAR(50),
    FOREIGN KEY (SSN) REFERENCES PATIENT (SSN),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL (HOSP_NAME)
);

-- Purchase Table
CREATE TABLE PURCHASE
(
    SSN VARCHAR(50),
    REG_NO INT,
    FOREIGN KEY (SSN) REFERENCES PATIENT (SSN),
    FOREIGN KEY (REG_NO) REFERENCES MEDICINE (REG_NO)
);

-- Examine Table
CREATE TABLE EXAMINE
(
    SSN VARCHAR(50),
    DOC_ID INT,
    FOREIGN KEY (SSN) REFERENCES PATIENT (SSN),
    FOREIGN KEY (DOC_ID) REFERENCES DOCTOR (DOC_ID)
);

-- Medicine Country Table
CREATE TABLE MEDICINE_COUNTRY
(
    REG_NO INT,
    MAN_COUNTRY VARCHAR(50),
    PRIMARY KEY (REG_NO, MAN_COUNTRY)
);

INSERT INTO HOSPITAL(HOSP_NAME ,COUNTRY, ADDRESS)
VALUES
('King Hamad Hospital', 'Kingdom Bahrain', 'Sheikh Isa Salman'),
('Mayo Clinic', 'United States', ' San Pablo Road'),
('Bahrain Defence Force', 'Kingdom Bahrain', 'Waly Alahe'),
('Salamaniya Hospital', 'Kindgom of Bahrain', 'Salmaniya Medical'),
('St Thomas' , 'United Kingdom', 'Westminster Brid'),
('King Faisal Specialist ', 'Saudi Arabia', 'Al Mathar Ash Shamali'),
('Al-Hilal Hospital', 'Kingdom of Bahrain', 'Al-Hilal Hospital, Muharraq, Bahrain'),
('Emirates Hospital', 'United Arab Emirates', 'Jumeirah Beach Rd'),
('American Hospital','Kingdom Bahrain', 'Sheikh Essa Road'),
('Dar Al Shifa Hospital', 'Kuwait', 'Beirut Street');

INSERT INTO MEDICINE (REG_NO,MED_NAME,PRICE,EXP_DATE)
VALUES
(020, 'Adol Syrup', 300, '2025/4/12'),
(021, 'Amoxil Capsules', 700, '2024/3/20'),
(022, 'Aspirin', 50, '2023/12/9'),
(023, 'Bonjela Gel', 400, '2024/9/23'),
(024, 'Paracetamol', 1.200, '2024/5/17'),
(025, 'Atorvastatin', 1.500, '2023/6/15'),
(026, 'Coversyl', 1.000, '2023/5/15'),
(027, 'Diamicron', 0.900, '2024/2/3'),
(028, 'Lipitor', 1.400, '2025/3/12'),
(029, 'Glucophage', 1.700, '2024/7/19');

INSERT INTO PATIENT (SSN,FNAME,LNAME,AGE,GENDER)
VALUES
(100000001, 'Sara', 'Majeed', 27, 'F'),
(100000002, 'Ahmed', 'Jamaal', 59, 'M'),
(100000003, 'Abdulla', 'Hameed', 45, 'M'),
(100000004, 'Mariam', 'Muhammad', 40, 'F'),
(100000005, 'Fatema', 'Hasan', 64, 'F'),
(100000006, 'Zainab', 'Abdulla', 55, 'F'),
(100000007, 'Khalil', 'Ibrahim', 35, 'M'),
(100000008, 'Alyaa', 'Husain', 57, 'F'),
(100000009, 'Khalid', 'Ahmed', 60, 'M'),
(100000010, 'Jawad', 'Ali', 20, 'M');

INSERT INTO DOCTOR(DOC_ID,DNAME,GENDER,QUALIFICATION,JOB_SPECIFICATION)
VALUES 
(1, 'Abdullah', 'M', 'MBBS', 'Dermatologist'),
(2, 'Ahmed', 'M', 'Board Certifie', 'Opthalmologist'),
(3, 'Ameera', 'F', 'MD', 'Pediatrician'),
(4, 'Ali', 'M', 'BPT', 'Physiotherapist'),
(5, 'Carolina', 'F', 'MS', 'Surgeon'),
(6, 'Sarah', 'F', 'MD', 'Anatomy'),
(7, 'Qasim', 'M', 'MD', 'Radiologist'),
(8, 'Fatema', 'F', 'Residency', 'Anesthologist'),
(9, 'Khalid', 'M', 'MBBS', 'Psychiatrist'),
(10, 'Amal', 'F', 'D.M.', 'Nephrologist');

INSERT INTO NURSE (NURSE_ID,NAME,GENDER)
VALUES
(01, 'Sanaa', 'F' ),
(02, 'Kathy', 'F'),
(03, 'Mary', 'F'),
(04, 'Ibrahim','M'),
(05, 'Anaya','F'),
(06, 'Asha','F'),
(07, 'Zainab','F'),
(08, 'Zeshan', 'M'),
(09, 'Adam', 'M'),
(10, 'Hawra', 'F');

INSERT INTO RECEPTION(REC_ID,TEL_NO,EMAIL)
VALUES
(041, '39123456', 'khuh@gmail.com'),
(042, '39123456', 'khuh@gmail.com'),
(044, '33456780', 'emirateshospital@yahoo.com'),
(045, '33123456', 'bdf@yahoo.com' ),
(046, '33678901', 'alhilal@facebook.com'),
(047, '39678901', 'daralshifa@gmail.com'),
(048, '33912045', 'st.thomashospital@gmail.com'),
(049, '39912045', 'kingfaisalshrc@yahoo.com' ),
(050, '39678901', 'daralshifa@gmail.com');

INSERT INTO APPOINTMENT(APPOINT_NO,APPOINT_DATE,APPOINT_TIME)
VALUES
(0001, '2022/5/3', '07:05:03'),
(0002, '2022/3/17', '13:30:00'),
(0003, '2022/12/22', '09:45:00'),
(0004, '2022/7/9', '17:20:00'),
(0005, '2022/5/3', '12:15:00'),
(0006, '2022/11/20', '08:05:00'),
(0007, '2022/7/12', '15:40:00'),
(0008, '2022/4/1', '14:00:00'),
(0009, '2022/8/30', '10:25:00'),
(0010, '2022/6/15', '16:50:00');

INSERT INTO VISIT(VISIT_DATE)
VALUES
('2023/10/10'),
('2023/5/10'),
('2023/1/30'),
('2023/6/4'),
('2023/12/24'),
('2023/11/11'),
('2023/2/6'),
('2023/4/21'),
('2022/4/19'),
('2023/2/7');

INSERT INTO DIAGNOSIS (DIAGNOS_NO,ISSUE_DATE,TREATMENT,REMARKS)
VALUES
(31, '2022/6/4', 'Physiotherapy', 'Once a month'),
(32, '2022/5/29', 'Aromatherapy', 'Twice a week'),
(33, '2022/6/18', 'Cyrotherapy', 'Twice a month'),
(34, '2022/7/7', 'Phototherapy', 'Once a month'),
(35, '2022/8/13' , 'Radiotherapy', 'Once in 3 months'),
(36, '2022/12/3', 'Immunotherapy', 'Once a month'),
(37, '2022/7/4', 'Monotherapy', 'Once a month'),
(38, '2022/6/4', 'Pharmacotherapy', 'Once a month'),
(39, '2022/7/19', 'Oxygen therapy', 'Once a week'),
(40, '2022/6/25', 'Gene therapy', 'Once a month');

--alter 5
    ALTER TABLE patient
	ADD Email VARCHAR (30);
	
	ALTER TABLE hospital
	ADD Fax VARCHAR (30);

	ALTER TABLE diagnosis
	ALTER COLUMN REMARKS VARCHAR(300);

	ALTER TABLE PATIENT
	ADD SEX VARCHAR (30);

	ALTER TABLE PATIENT
	ALTER COLUMN EMAIL VARCHAR(30) NOT NULL;

	ALTER TABLE EMPLOYEE
	ADD ShiftWork_Start varchar(20),ShiftWork_End varchar(20);

   SELECT DOC_ID, DNAME, HOSP_NAME
    FROM DOCTOR;

SELECT * 
FROM DIAGNOSIS
ORDER BY DIAGNOS_NO DESC; 

SELECT *
FROM HOSPITAL
WHERE COUNTRY LIKE 'Kingdom of Bahrain';

   SELECT * FROM Doctor
	WHERE DOC_ID =1;

	SELECT DISTINCT AGE
	FROM Patient;

	SELECT FName,LNAME
	from PATIENT
	WHERE GENDER ='F';
	
	   
    SELECT *
	From Patient
	Where FNAME like 'm%';

	SELECT Name, GENDER
	from NURSE
	WHERE NURSE_ID=(SELECT MIN(NURSE_ID)FROM NURSE);

	SELECT MED_NAME ,EXP_DATE,REG_NO
	FROM MEDICINE
	WHERE Price BETWEEN 100 AND 500;

	SELECT *
	FROM NURSE
	WHERE NAME LIKE '%A' ;

	SELECT COUNT(*)
	FROM MEDICINE;

	SELECT REG_NO, MAX(PRICE)
	FROM MEDICINE
	GROUP BY REG_NO
	ORDER BY REG_NO;

	SELECT * FROM DIAGNOSIS;
	SELECT * FROM Patient;
	SELECT * FROM Doctor;
	SELECT * FROM APPOINTMENT;

	SELECT * FROM MEDICINE
	WHERE PRICE>5;

	SELECT * FROM MEDICINE
	WHERE PRICE=5;
    
    SELECT COUNT( *)
	FROM PATIENT
	WHERE AGE BETWEEN 20 AND 50;

	SELECT DNAME,NAME FROM DOCTOR INNER JOIN NURSE ON NURSE.DOC_ID=DOCTOR.DOC_ID;

    SELECT COUNT(DNAME),QUALIFICATION  FROM DOCTOR WHERE QUALIFICATION  ='MD'
	GROUP BY QUALIFICATION ;