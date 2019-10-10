DROP TABLE IF EXISTS EMPLOYEESFAMILY ; 
DROP TABLE IF EXISTS EMPLOYEESCONTACTS ; 
DROP TABLE IF EXISTS EMPLOYEES ; 

CREATE TABLE EMPLOYEES (
  id1 serial PRIMARY KEY,   name VARCHAR(90) NOT NULL,
  post VARCHAR(90), dept VARCHAR(90) default 'HUMAN-RESOURCE',
  salary int default 62005,
  status VARCHAR(90) default 'PART-TIME', 
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP );

CREATE TABLE EMPLOYEESCONTACTS (
  id2 serial PRIMARY KEY,  
  email VARCHAR(90) NOT NULL,  mobile VARCHAR(90) NOT NULL,
  retirement VARCHAR(90) default 'CONTRATOR', UNIQUE(email,mobile),
  FOREIGN KEY (id2) REFERENCES EMPLOYEES on delete cascade );

CREATE TABLE EMPLOYEESFAMILY (
    id3 serial PRIMARY KEY,    
    mother VARCHAR(90) NOT NULL, 
    father VARCHAR(90) NOT NULL,UNIQUE(mother,father),
    FOREIGN KEY (id3) REFERENCES EMPLOYEES on delete cascade );

INSERT INTO EMPLOYEES ( name,salary, dept) VALUES ( 'Nikolas Nchena', 10,'MALE'),
( 'Lorena Nchena', 7,'FEMALE'),( 'Leon Nchena', 5,'MALE'); 
INSERT INTO EMPLOYEESCONTACTS (id2,email, mobile) VALUES (1,'Leonchena@yahoo.com', '+230775263158');
INSERT INTO EMPLOYEESFAMILY (id3, father,mother) VALUES (1,'LINOS NCHENA', 'KRISTINA NCHENA'),
(2,'PRESLY NCHENA', 'CATHY NCHENA'),(3,'NELSON SIMWEMBA', 'NORIA SIMWEMBA'); 
SELECT id1,name,id2,email,id3,father from EMPLOYEES,EMPLOYEESCONTACTS,EMPLOYEESFAMILY;