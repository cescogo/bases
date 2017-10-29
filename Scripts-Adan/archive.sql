-- procedimiento de quitar los comentarios al código (#) y luego salvar el archivo.
--#modificar Parametro de init.ora
--# log_archive_start=true 
--# log_archive_dest=%Oracle_home%/database/%Oracle_sid%/Archive 
--# log_archive_format=´´%sample%T%TS%S.ARC´´ 
--#Nota: Le llamamos activar, a el

sqlplus connect sysdba/root as sysdba
shutdown immediate; 
startup nomount;
alter database mount;
ALTER DATABASE ARCHIVELOG; 
Alter Database Open;
Alter system archive log start; 
--Este muestar que el comando este en archive
archive log list;
--Este cambia los log files
alter system switch logfile;
--Ver secuencia de archives
ARCHIVE LOG LIST;

 