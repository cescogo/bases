-- backup completo con rman
shutdown;
startup;
-- error
-- conectar con rman en una cmd aparte 
rman target/
-- restore tablespace <nombreTSP>
restore tablespace USERS;
-- recover tablespace <nombreTSP>
recover tablespace USERS;
-- abre bd cmd del sql 
alter database open;
-- poner tsp online
alter tablespace USERS online; 
-- corroborar que exista el tsp que se esta recuperando
select TABLESPACE_NAME, STATUS from dba_tablespaces;
-- select a la tabla de ese tsp para terminar comprobacion
select * from T1;