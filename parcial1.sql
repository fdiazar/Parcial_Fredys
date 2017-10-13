--1. Create Tablespace
-- Create a tablespace called "COURSES" with one datafile of 50Mb, the name of the datafile should be: courses1.dbf
CREATE TABLESPACE COURSES DATAFILE 
'C:\parcial_Fredys\morning_topic_a\courses1.DBF' SIZE 50M;
--2. Create profile
--Create a profile named "administrativo" with the following specifications: 
--a) Idle time of 25 minutes b) Failed login attempts 4 c) Onle one session per user
SELECT * FROM DBA_PROFILES;
-- CREACIÓN DE PERFIL "comercial_medellin"
CREATE PROFILE administrativo LIMIT
    SESSIONS_PER_USER 1 --NRO DE SSIONES PERMITIDAS POR USUARIO
    IDLE_TIME 25 --lIMITE DETIEMPO DE INACTIVIDAD
    failed_login_attempts 4; --NUMERO DE INTENTOS FALLIDOS
--3. Create user
--Create an user named with your github's username (In my case would be amartinezg) 
--with only 30Mb of space on tablespace, the profile should be "administrativo"
CREATE USER fdiazar
    IDENTIFIED BY fdiazar
    PROFILE administrativo
    DEFAULT TABLESPACE COURSES
    QUOTA 30M ON RENTING_COLOM1;
--4. Setting up user
--your user should be able to log in and have DBA privileges
GRANT CONNECT TO fdiazar;
GRANT DBA TO fdiazar;

