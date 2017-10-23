
sqlplus connect sysdba/root as sysdba
shutdown immediate; 
--#modificar Parametro de init.ora
--# log_archive_start=true 
--# log_archive_dest=%Oracle_home%/database/%Oracle_sid%/Archive 
--# log_archive_format=´´%sample%T%TS%S.ARC´´ 
--#Nota: Le llamamos activar, a el procedimiento de quitar los comentarios al código (#) y luego salvar el archivo.
startup nomount;
alter database mount;
ALTER DATABASE ARCHIVELOG; 
Alter Database Open;
Alter system archive log start; 
ALTER SESSION SET log_archive_start = true ;
ALTER SESSION SET log_archive_dest=%Oracle_home%/database/%Oracle_sid%/Archive ;
ALTER SESSION SET log_archive_format=´´%XE%T%TS%S.ARC´´ ;
show parameter v$archived_log;
 