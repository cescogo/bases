--Verificar archive
archive log list;
-- control file, online redo log files y data files:
select name from v$controlfile;
select name from v$datafile;
select member from v$logfile;
--# numero de secuencia actual
select current_scn from v$database;
select group#, sequence#, status from v$log;
--Aqui Crea la tablas
create table t1(a int,b int,c int);
--Realizar Respaldo en frio
shu immediate;
startup mount;


-- Esto es en otro cmd
--Conectar a rman
rman
connect target / 
--este tiene que decir connected to target database: TEST (DBID=2213428959, not open)

backup database tag='res10282017-1';
backup current controlfile tag='res10282017-1c';

restore tablespace users;
--Regresa a sql
alter database open;
select group#, sequence#, status from v$log;

insert into t1(a,b,c) values (1,1,1);

alter system switch logfile; 
select name, FIRST_CHANGE#, SEQUENCE# from v$archived_log;

select current_scn from v$database;

alter system switch logfile;
select name, FIRST_CHANGE#, SEQUENCE# from v$archived_log;

insert into t1(a,b,c) values (2,2,2);

select current_scn from v$database;
alter system switch logfile;
select name, FIRST_CHANGE#, SEQUENCE# from v$archived_log;

--Aqui viene lo chungo volarse la db.
--aqui es donde se elimina
--Esto para ver los tb
--select * from V$TABLESPACE
-- Entonces apaga ese tb
alter tablespace users offline;
shu abort;
startup;

--Vamos al rman
rman target /
restore controlfile from 'C:\oraclexe\app\oracle\fast_recovery_area\XE\BACKUPSET\2017_10_19\O1_MF_NCSN0_L01_DYKVC2G9_.BKP';

--en sql
alter database mount;
--en rman
restore database
--Esto es para recuperar hasta una secuencia
recover database until scn 818237;
--obvio no
alter database open read only;

--Esto para ful recovery
recover database until cancel using backup controlfile;
alter database open resetlogs;
-- recover database;   


----despues de error de noresetlogs o open reselogs
shut immediate;
startup mount;
alter database open resetlogs;
alter database open;
