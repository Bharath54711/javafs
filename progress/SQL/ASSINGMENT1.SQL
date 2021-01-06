create database HMS;
use HMS;
CREATE TABLE DOCTOR_MASTER
(DOCTOR_ID VARCHAR(15) UNIQUE NOT NULL,
DOCTOR_NAME VARCHAR(15) NOT NULL,
DEPT VARCHAR(15) NOT NULL);

INSERT INTO DOCTOR_MASTER VALUES('D0001','Ram','ENT'),('D0002','Rajan','ENT'),('D0003','Samita','EYE'),('D0004','Bhavan','Surgery'),('D0005','Sheela','Surgey'),('D0006','Nethra','Surgery');

create table ROOM_MASTER
(
room_no VARCHAR(15) unique not null,
room_type varchar(15) not null,
status VARCHAR(15) not null); 

ALTER TABLE DOCTOR_MASTER
MODIFY DOCTOR_ID VARCHAR(15) PRIMARY KEY;


INSERT INTO ROOM_master VALUES('R0001','AC','occupied'),('R0002','suite','vacant'),('R0003','NonAC','Vacant'),('R0004','NonAC','occupied'),('R0005','AC','vacant'),('R0006','AC','occupied');
select * from Room_master;


create table PATIENT_MASTER
(
PID VARCHAR(15) UNIQUE NOT NULL,
NAME VARCHAR(15) NOT NULL,
AGE INT(15) NOT NULL,
WEIGHT INT(15) NOT NULL,
GENDER VARCHAR(10) NOT NULL,
ADDRESS VARCHAR(50) NOT NULL,
PHONENO VARCHAR(10) NOT NULL,
DISEASE VARCHAR(50) NOT NULL,
DOCTOR_ID VARCHAR(5), 
FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR_MASTER(DOCTOR_id));


ALTER TABLE PATIENT_MASTER
MODIFY PID VARCHAR(15) PRIMARY KEY;

ALTER TABLE ROOM_MASTER
MODIFY ROOM_NO VARCHAR(15) PRIMARY KEY;
SELECT * FROM PATIENT_MASTER;


INSERT INTO PATIENT_MASTER VALUES('P0001','gita',35,65,'F','CHENNAI', '9867145678','EYE Infection','D0003');
INSERT INTO PATIENT_MASTER VALUES('P0002','Ashish',40,670,'M','Delhi', '9845675678','Asthama','D0003');
INSERT INTO PATIENT_MASTER VALUES('P0003','Radha',25,60,'F','CHENNAI', '9867166678','Pain in heart','D0005');
INSERT INTO PATIENT_MASTER VALUES('P0004','chandra',28,55,'F','BANGLORE', '9867785678','Asthama','D0001');
INSERT INTO PATIENT_MASTER VALUES('P0005','goyal',42,65,'M','DELHI', '8967545678','PAIN IN STOMACH','D0004');

select * from patient_master;
CREATE TABLE ROOM_ALLOCATION
(
ROOM_NO VARCHAR(15),
PID VARCHAR(15),
ADMISSION_DATE DATE NOT NULL,
RELEASE_DATE DATE NOT NULL,
FOREIGN KEY(ROOM_NO) REFERENCES ROOM_MASTER(ROOM_NO),
FOREIGN KEY(PID) REFERENCES PATIENT_MASTER(PID)
);
INSERT INTO ROOM_ALLOCATION VALUES( 'R0001','P0001','2016-08-15','2016-08-26');
INSERT INTO ROOM_ALLOCATION VALUES( 'R0002','P0002','2016-11-15','2016-11-26');
INSERT INTO ROOM_ALLOCATION VALUES( 'R0002','P0003','2016-08-01','2016-12-30');
INSERT INTO ROOM_ALLOCATION VALUES( 'R0004','P0001','2017-01-01','2017-01-30');

update patient_master set gender where 


SELECT * FROM DOCTOR_MASTER;
SELECT * FROM PATIENT_MASTER;
SELECT * FROM ROOM_MASTER;
SELECT * FROM ROOM_ALLOCATION;
SELECT NAME from patient_master;

use hms;
-- query1
-- display the pat who were admitted in the month of the jan
select name from Patient_master
where pid =(select pid from ROOM_ALLOCATION where (select Month(admission_date)='01'));

-- query2
-- display the female patient who is not suff. from asthma

select name from Patient_master
where not( disease = 'asthma')
or gender='F';

-- query 3
-- count the number of males and female patients
select COUNT(IF(gender = 'M', 1, NULL)) as MC,
COUNT(IF(gender= 'F', 1, NULL)) as FC from Patient_master;

-- query 4
-- diaplaY PID,PNAME,DID,DNAME,ROOMNO,ROOMTYPE,ADM_DAT
select PATIENT_MASTER.pid,PATIENT_MASTER.name,DOCTOR_MASTER.doctor_id,DOCTOR_MASTER.doctor_name,ROOM_MASTER.room_no ,ROOM_MASTER.room_type,ROOM_ALLOCATION.admission_date
from PATIENT_MASTER,DOCTOR_MASTER,ROOM_MASTER,ROOM_ALLOCATION;

 

-- query 5
-- display the room no which is never allocated to any patient

select room_no from ROOM_MASTER
where not room_no in(select room_no from ROOM_ALLOCATION);

-- query 6
-- display room_no ,room_type which r allocated more than once

select room_no,room_type from ROOM_MASTER
where room_no in(select distinct(room_no) from ROOM_ALLOCATION)







