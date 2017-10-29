-- SON LOS JOB TYPES QUE HAY
--Job action type ('PLSQL_BLOCK', 'STORED_PROCEDURE', 'EXECUTABLE', 'CHAIN', 'EXTERNAL_SCRIPT', 'SQL_SCRIPT', and 'BACKUP_SCRIPT')

BEGIN
DBMS_SCHEDULER.CREATE_JOB (
 job_name        => 'PruebaS5',
 job_type        => 'SQL_SCRIPT', 
 job_action      => 'select * from t1;',
 start_date      => '18-OCT-17 10.8.00PM',
 repeat_interval => 'FREQ=DAILY',
 enabled         => TRUE);
END;
/

BEGIN
DBMS_SCHEDULER.create_job(
   job_name => 'BCKRMAN',
   job_type => 'BACKUP_SCRIPT',
   job_action => 'backup incremental level 0 database tag=''L02'';',
    start_date      => '18-OCT-17 10.13.00PM',
 repeat_interval => 'FREQ=DAILY',
   enabled => TRUE);
END;
/
--Ver jobs
select job_name, start_date,STATUS from dba_scheduler_jobs where JOB_NAME = 'PruebaS1';
--Ver si ocurrio
select job_name, log_date, status from user_scheduler_job_log where JOB_NAME = 'PruebaS2';
--Verificacion de que se quedo programada
select job_name, STATE, LAST_START_DATE, LAST_RUN_DURATION, NEXT_RUN_DATE, FAILURE_COUNT from DBA_SCHEDULER_JOBS;

select job_name, STATE, LAST_START_DATE,FAILURE_COUNT from DBA_SCHEDULER_JOBS;


SET LINESIZE 200
COLUMN START_DATE FORMAT A20
COLUMN JOB_ACTION FORMAT A20
COLUMN enabled FORMAT A10
COLUMN LAST_START_DATE FORMAT A10
select owner,job_name,JOB_TYPE,JOB_ACTION,START_DATE,enabled,FAILURE_COUNT,RUN_COUNT,JOB_PRIORITY,LAST_START_DATE from dba_scheduler_jobs;


--Ver los fallidos
SELECT JOB_NAME, STATE FROM DBA_SCHEDULER_JOBS;