COLUMN Nombre FORMAT A8
COLUMN Dir FORMAT A37
SELECT DISTINCT ts.TABLESPACE_NAME Nombre, dir.FILE_NAME  Dir FROM DBA_SEGMENTS ts JOIN DBA_DATA_FILES dir ON (ts.TABLESPACE_NAME = dir.TABLESPACE_NAME);
select log_mode,name from v$database;
set linesize 300
COLUMN job_name FORMAT A37
COLUMN FechaCreacion FORMAT A37
COLUMN status FORMAT A10
COLUMN FechaUltimoUso FORMAT A37
COLUMN Duracion FORMAT A37
select job_name,owner,status,to_char(REQ_START_DATE, 'DD-MON-YY HH24:MM:SS') FechaCreacion,to_char(ACTUAL_START_DATE, 'DD-MON-YY HH24:MM:SS') FechaUltimoUso,
to_char(RUN_DURATION, 'DD-MON-YY HH24:MM:SS') Duracion from ALL_SCHEDULER_JOB_RUN_DETAILS;
--select job_name,owner,status,REQ_START_DATE,ACTUAL_START_DATE,RUN_DURATION from ALL_SCHEDULER_JOB_RUN_DETAILS;
--
--  List job information.
--to_char(log_date, 'DD-MON-YY HH24:MM:SS') timestamp   job_class,
 
SET PAUSE ON
SET PAUSE 'Press Return to Continue'
SET HEADING ON
SET LINESIZE 300
SET PAGESIZE 60
COLUMN owner FORMAT A20
COLUMN LAST_START_DATE FORMAT A35
COLUMN next_run_date FORMAT A35 
COLUMN START_DATE FORMAT A35 
COLUMN job_action FORMAT A35
SELECT owner,
job_name,
enabled,
job_action,
to_char(START_DATE, 'DD-MON-YY HH24:MM:SS')START_DATE,
to_char(LAST_START_DATE, 'DD-MON-YY HH24:MM:SS')LAST_START_DATE,
to_char(next_run_date, 'DD-MON-YY HH24:MM:SS')next_run_date
FROM   dba_scheduler_jobs
ORDER BY owner, job_name
/