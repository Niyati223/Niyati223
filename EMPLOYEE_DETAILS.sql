CREATE TABLE EMPLOYEE_DETAILS1
(EMP_IDNO INT NOT NULL, EMP_FNAME VARCHAR(50) NOT NULL, EMP_LNAME VARCHAR(50) NOT NULL,
EMP_DEPT INT NOT NULL,
PRIMARY KEY(EMP_IDNO),
UNIQUE(EMP_FNAME)
);

INSERT INTO EMPLOYEE_DETAILS1
	(EMP_IDNO,EMP_FNAME,EMP_LNAME,EMP_DEPT)
VALUES
	(127323,'MICHALE','ROBBIN',57),(526689,'CARLOS','SNARES',63),(843795,'ENRIC','DOSIO',57),(328717,'JHON','SNARES',63),(444527,'JOSEPH','DOSNI',47),(659831,'ZANIFER','EMILY',47),(847674,'KULESWAR','SITARAM',57),(748681,'HENREY','GABRIEL',47),(555935,'ALEX','MANUEL',57);

SELECT EMP_IDNO,EMP_FNAME,EMP_LNAME
WHERE EMP_DEPT=57;