---
connect sys/root as sysdba 
shutdown
startup nomount pfile=initARS.ora 
connect sys/root as sysdba


--Lleva el nombre del otro			
CREATE DATABASE TTT
LOGFILE 
GROUP 5 ('F:\Desktop\tienda\redo\redo01.log') SIZE 100M, 
GROUP 6 ('F:\Desktop\tienda\redo\redo02.log') SIZE 100M, 
GROUP 7 ('F:\Desktop\tienda\redo\redo03.log') SIZE 100M, 
CHARACTER SET WE8ISO8859P1 
NATIONAL CHARACTER SET utf8 
DATAFILE 'F:\Desktop\tienda\system.dbf' SIZE 500M autoextend on next 10M
EXTENT MANAGEMENT LOCAL 
SYSAUX DATAFILE 'F:\Desktop\tienda\sysaux.dbf' SIZE 100M REUSE 
DEFAULT TEMPORARY TABLESPACE tempts1 TEMPFILE 'F:\Desktop\tienda\temp01.dbf'  SIZE 100M 
UNDO TABLESPACE undotbs_01 DATAFILE 'F:\Desktop\tienda\undotbs_01.dbf'  SIZE 100M;
--Monta La Base De Datos
alter database mount;
--Queries para VLOG
--select * from V$LOG_HISTORY
--select * from V$LOGFILE
--select * from V$LOG;
--Agrega Miembro a un grupo
alter database add logfile member 'F:\Desktop\tienda\redo\redo0.log' to group 7;
--Agrega Grupo
alter database add logfile group 8 'F:\Desktop\tienda\redo\redo04.log' SIZE 100M;

--select * from V$LOG_HISTORY
--select * from V$LOGFILE
--select * from V$LOG;
--average switch.

--alter system switch logfile;
--alter system checkpoint;