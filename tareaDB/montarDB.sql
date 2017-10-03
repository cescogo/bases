connect sys/root as sysdba 
shutdown
startup nomount pfile=initARS.ora 
--startup pfile='C:\ora\pfile\init.ora';
connect sys/root as sysdba
alter database mount;