--Creación de tabla CURSOS
--COURSES(id, name, code, date_start, date_end) 
CREATE TABLE COURSES (
 id INT NOT NULL PRIMARY KEY,
 name VARCHAR2(255) NOT NULL,
 code INT NOT NULL,
 date_start DATE,
 date_end DATE,
 constraint CK_name_VALUES
  CHECK(name IN ('Business and Computing', 'Computer Science', 'Chemistry', 'History','Zoology'))
) TABLESPACE COURSES

select * from COURSES;

--SE REALIZA LA CREACION DE LA TABLA ESTUDENTS
--STUDENTS(id, first_name, last_name, date_of_birth, city, address)
--SE REALIZA LA CREACIÓN DE LA TABLA PPRODUCTOS
CREATE TABLE STUDENTS(
ID INT NOT NULL PRIMARY KEY,
first_name VARCHAR2(255) NOT NULL,
last_name VARCHAR2(255) NOT NULL,
date_of_birth DATE,
city VARCHAR2(255) NOT NULL,
address VARCHAR2(255) NOT NULL,
COURSES_ID INT NOT NULL,
CONSTRAINT FK_COURSES foreign key (COURSES_ID) references COURSES(id)
) TABLESPACE COURSES
select * from STUDENTS;
--se realiza creacion de tabla ATTENDANCE
--ATTENDANCE(id, student_id, course_id, attendance_date)
CREATE TABLE ATTENDANCE (
 id INT NOT NULL PRIMARY KEY,
 student_id INT NOT NULL,
 course_id INT NOT NULL,
 attendance_date DATE,
CONSTRAINT FK_COURS foreign key (student_id) references COURSES(id),
CONSTRAINT FK_STUDENTS foreign key (course_id) references STUDENTS(id)
) TABLESPACE COURSES

SELECT * FROM ATTENDANCE;
--se realiza creacion de tabla answer
--ANSWERS(id, number_of_question, answer)
--SE REALIZA LA CREACIÓN DE LA TABLA RESPUESTAS
CREATE TABLE ANSWERS(
ID INT NOT NULL, 
number_of_question varchar2(255) NOT NULL,
answer varchar2(255) NOT NULL,
constraint CK_id_VALUES
 CHECK(answer IN ('QUESTION 1', 'QUESTION 2', 'QUESTION 3', 'QUESTION 4', 'QUESTION 5'))
) TABLESPACE COURSES
select * from ANSWERS;

--se realiza creación de secuencia

CREATE SEQUENCE answer_seq
 START WITH     500
 INCREMENT BY   10
 NOCACHE
 NOCYCLE;
 
 --6. Import data
--Import data from files data/courses.csv, data/students.csv and data/attendance.csv
--Be careful with the names of the headers on each CSV file and when you import the date the format of the date should be DD/MM/RR
