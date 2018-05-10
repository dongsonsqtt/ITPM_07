use hospital;
#Q.1 Find the detail of the patient name starts with J.
SELECT *
FROM patient
WHERE P_NAME like 'J%';

#Q.2 Find the detail of the patient who are admitted after 1st January 2015.
SELECT *
FROM patient
WHERE year(DOA) >= 2015;

#Q.3 Find the number fo patient admitted in each year.
SELECT COUNT(*) as NO_OF_PATIENT, year(DOA)
FROM patient
GROUP BY year(DOA)
ORDER BY year(DOA);

#Q.4 Find the name and date of admission who have been alloted room number from 5 to 15.
SELECT P_NAME,DOA
FROM patient
WHERE ROOM_NO BETWEEN 5 and 15;

#Q.5 Display the patient list arranged by room number.
SELECT *
FROM patient
ORDER BY ROOM_NO;

#Q.6 Find the name and timing of dentist.
SELECT DOC_NAME,S_TIME,E_TIME
FROM doctors_detail
WHERE SPECS = 'DENTIST';

#Q.7 Find the doctors available after 13.00 hrs
SELECT *
FROM doctors_detail
WHERE HOUR(E_TIME) >= 13;

#Q.8 How many doctors availble in hospital?
SELECT COUNT(*) as NO_OF_DOCTORS
FROM doctors_detail;

#Q.9 Name the patient which is treated by Dr. Thomas.
SELECT pt.P_NAME
FROM patient as pt
WHERE pt.D_ID = (SELECT DOC_ID FROM doctors_detail WHERE DOC_NAME = 'Thomas');

#OR

SELECT pt.P_NAME
FROM patient pt,doctors_detail dd
WHERE pt.D_ID = dd.DOC_ID AND dd.DOC_NAME = 'Amaira';

#Q.10 Find the roomno, name of the patient and corresponding doctors name from which they have taken treatment.
SELECT pt.ROOM_NO, pt.P_NAME, dd.DOC_NAME
FROM patient as pt, doctors_detail as dd
WHERE pt.D_ID = dd.DOC_ID;

#Q.11 Find the details of patient who is admitted on 20th January 2017 and has dental issues.
SELECT pt.*
FROM patient as pt
WHERE DOA = '2017-01-20' AND D_ID in (SELECT DOC_ID FROM doctors_detail where SPECS = 'Dentist');

#OR

SELECT pt.*
FROM patient pt, doctors_detail dd
WHERE pt.DOA = '2017-01-20' AND pt.D_ID = dd.DOC_ID AND dd.SPECS = 'Dentist';

#Q.12 Find the patient name and room number who has taken appointment of Skin Specialist.
SELECT pt.P_NAME,pt.ROOM_NO
FROM patient as pt
WHERE D_ID in (SELECT DOC_ID FROM doctors_detail where SPECS = 'Skin Specialist');

#OR

SELECT pt.P_NAME,pt.ROOM_NO
FROM patient pt, doctors_detail dd
WHERE pt.D_ID = dd.DOC_ID AND dd.SPECS = 'Skin Specialist';

#Q.13 Find the distinct specialization of doctors available in hospital.
SELECT DISTINCT SPECS
FROM doctors_detail;

#Q.14 Find the detail of the medicine taken by patient John.
SELECT *
FROM medicine
WHERE P_ID IN (SELECT P_ID FROM patient WHERE P_NAME = 'John');

#OR

SELECT md.*
FROM medicine md,patient pt
WHERE md.P_ID = pt.P_ID AND pt.P_NAME = 'John';

#Q.15 find the detail of the patients who has taken medicine Luctocin-25mg and treated by Dr Asmi khurana.
SELECT *
FROM patient
WHERE P_ID IN (SELECT P_ID FROM medicine WHERE MEDICINE = 'LUCTOCIN-25MG') and D_ID = (SELECT DOC_ID FROM doctors_detail WHERE DOC_NAME = 'Asmi khurana');

#OR

SELECT pt.*
FROM patient pt, medicine md,doctors_detail dd
WHERE pt.P_ID = md.P_ID AND pt.D_ID = dd.DOC_ID AND md.MEDICINE = 'LUCTOCIN-25MG' AND dd.DOC_NAME = 'Asmi khurana';

#Q.16 find the sale of medicine from the medicine shop.
SELECT SUM(SALE.TOTAL) as TOTAL_SALE
FROM (SELECT QTY * PRICE as TOTAL FROM medicine) as SALE;

#Q.17 Which doctor use to give prescription to patient to take Glocin Gel.
SELECT dd.*
FROM doctors_detail as dd,  patient
WHERE patient.D_ID = DOC_ID AND patient.P_ID IN (SELECT P_ID FROM medicine WHERE MEDICINE = 'GLOCIN-GEL');

#OR

SELECT dd.*
FROM doctors_detail dd, patient pt, medicine md
WHERE pt.D_ID = dd.DOC_ID AND pt.P_ID = md.P_ID AND md.MEDICINE = 'GLOCIN-GEL';

#Q.18 Find the detail of the patient who has taken the medicine of highest price.
SELECT *
FROM patient
WHERE P_ID = (SELECT P_ID FROM medicine WHERE PRICE = (SELECT MAX(PRICE) FROM medicine));

#OR

SELECT pt.*
FROM patient pt,medicine md
WHERE pt.P_ID = md.P_ID AND md.PRICE = (SELECT MAX(PRICE) FROM medicine);

#Q.19 Increase the price of the medicine by 20% which are prescribed by Dentist.
SELECT *, PRICE * 1.2 as NEW_PRICE
FROM medicine;

#Q.20 Display the the Doctors name and total cost of medicine given by each doctor to patients.
SELECT DOC_NAME, SUM(COST) as TOTAL_COST
FROM doctors_detail dd, (SELECT pt.P_NAME,pt.D_ID, QTY * PRICE as COST
						 FROM patient pt,medicine md
						 WHERE pt.P_ID = md.P_ID) as temp
WHERE dd.DOC_ID = temp.D_ID
GROUP BY dd.DOC_ID;

#Q.21 find the detail of patient who has taken medicine in quantity more than 10.
SELECT pt.*
FROM patient pt,medicine md
WHERE pt.P_ID = md.P_ID AND md.QTY > 10;

#Q.22 Find the billing date of patient who has taken the lowest cost of medicine.
SELECT BILLDATE
FROM medicine
WHERE QTY * PRICE = (SELECT MIN(QTY * PRICE) as COST
					FROM medicine);

#Q.23 Apply the 15% VAT/TAX to all the medicine.
SELECT *, PRICE * 1.15 as PRICE_AFTER_VAT
FROM medicine;

#Q.24 Find the total payment taken by each doctor from hospital.
SELECT ac.DOC_ID,DOC_NAME, SUM(DOC_FEE) as PAYMENT
FROM accounts ac, doctors_detail dd
where ac.DOC_ID = dd.DOC_ID
GROUP BY ac.DOC_ID;

#Q.25 Find the Patient name,Doctors name, specialization and doctors fee for individual patient
SELECT pt.P_NAME,dd.DOC_NAME,dd.SPECS,ac.DOC_FEE
FROM patient pt,accounts ac, doctors_detail dd
WHERE pt.P_ID = ac.P_ID AND dd.DOC_ID =ac.DOC_ID;

#Q.26 Find the total payment including roomcharge, doctor fee,medicine cost paid by patient Amaira.
SELECT temp.P_NAME,ac.DOC_FEE,ac.ROOM_CHARGE, temp.MEDICINE_COST
FROM accounts ac, (SELECT pt.P_ID, pt.P_NAME, COALESCE( medicine.PRICE * medicine.QTY,0) as MEDICINE_COST
					FROM patient pt
					LEFT JOIN medicine ON pt.P_ID = medicine.P_ID
					WHERE pt.P_NAME = 'Amaira') as temp
WHERE ac.P_ID = temp.P_ID;

#Q.27 Find the average payment of doctors.
SELECT AVG(DOC_FEE) as AVERAGE_PAYMENT
FROM accounts;

#Q.28 Find the detail of patient who is admitted for more than 5 days in a hospital.
SELECT pt.*
FROM patient pt,accounts ac
WHERE pt.P_ID = ac.P_ID AND ac.NO_OF_DAYS > 5;

#Q.29 Which patient stays in hospital for maximum number of days and also display the payment dome by him/her.
Select temp.P_NAME, ac.*,temp.MEDICINE_COST
FROM accounts ac, (SELECT pt.P_ID, pt.P_NAME, COALESCE( medicine.PRICE * medicine.QTY,0) as MEDICINE_COST
					FROM patient pt
					LEFT JOIN medicine ON pt.P_ID = medicine.P_ID) as temp
WHERE ac.NO_OF_DAYS = (SELECT MAX(NO_OF_DAYS) FROM accounts) AND ac.P_ID = temp.P_ID; 

#Q.30 Find the total payment taken from patients by hospital.
SELECT SUM(DOC_FEE) as TOTAL_DOC_FEE,SUM(ROOM_CHARGE) as TOTAL_ROOM_CHARGE, SUM(temp.MEDICINE_COST) as TOTAL_MEDICINE_COST, SUM(DOC_FEE)+SUM(ROOM_CHARGE)+SUM(temp.MEDICINE_COST) as TOTAL_PAYMENT
FROM accounts ac, (SELECT pt.P_ID, pt.P_NAME, COALESCE( medicine.PRICE * medicine.QTY,0) as MEDICINE_COST
					FROM patient pt
					LEFT JOIN medicine ON pt.P_ID = medicine.P_ID) as temp;

#Q.31 Arrange the doctors detail and the payment detail with respect to payment in descending order.
SELECT ac.DOC_ID,DOC_NAME, SUM(DOC_FEE) as PAYMENT
FROM accounts ac, doctors_detail dd
WHERE ac.DOC_ID = dd.DOC_ID
GROUP BY ac.DOC_ID
ORDER BY PAYMENT DESC;

#Q.32 Find the name of patient whos has paid highest room charge.
SELECT P_NAME
FROM patient
WHERE P_ID = (SELECT P_ID
			FROM accounts
			WHERE ROOM_CHARGE = (SELECT MAX(ROOM_CHARGE) FROM accounts));

SELECT pt.P_NAME
FROM patient pt, accounts ac
WHERE pt.P_ID = ac.P_ID AND ac.ROOM_CHARGE = (SELECT MAX(ROOM_CHARGE) FROM accounts);

#Q.33 Find the detail of patient whos has paid lowest doctor fee.
SELECT *
FROM patient
WHERE P_ID = (SELECT P_ID
			FROM accounts
			WHERE DOC_FEE = (SELECT MIN(DOC_FEE) FROM accounts));

SELECT pt.*
FROM patient pt, accounts ac
WHERE pt.P_ID = ac.P_ID AND ac.DOC_FEE = (SELECT MIN(DOC_FEE) FROM accounts);

#Q.34 Find doctor name, patient name, cost of medicine and quantity who has prescribed by doctor to take solberis-500.
SELECT pt.P_NAME, dd.DOC_NAME, md.PRICE, md.QTY
FROM patient pt ,doctors_detail dd, medicine md
WHERE md.MEDICINE = 'SOLBERIS-500' AND md.P_ID = pt.P_ID AND pt.D_ID = dd.DOC_ID;

#Q.35 Find the patient name, doctors name, specialization, doctors fee whos has taken medicine Kalpol-250.
SELECT pt.P_NAME,dd.DOC_NAME,dd.SPECS, ac.DOC_FEE
FROM patient pt,medicine md, doctors_detail dd, accounts ac
WHERE pt.P_ID=md.P_ID AND md.MEDICINE = 'KALPOL-250' AND pt.D_ID=dd.DOC_ID AND pt.P_ID=ac.P_ID;
