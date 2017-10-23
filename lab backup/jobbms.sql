BEGIN
DBMS_SCHEDULER.CREATE_JOB (
 job_name        => 'PruebaS1',
 job_type        => 'PLSQL_BLOCK', 
-- SON LOS JOB TYPES QUE HAY
--PL/SQL BLOCK
--STORED_PROCEDURE
--EXECUTABLE
--CHAIN
--EXTERNAL_SCRIPT
--SQL_SCRIPT
--BACKUP_SCRIPT
 job_action      => 'select * from t1;',
 start_date      => '19-OCT-17 2.00.00PM',
 repeat_interval => 'FREQ=DAILY',
 enabled         => TRUE);
END;
/
--Ver jobs
select job_name, start_date from dba_scheduler_jobs where JOB_NAME = 'PruebaS1';
--Ver si ocurrio
select job_name, log_date, status from user_scheduler_job_log where JOB_NAME = 'EJEMPLO1';
--Verificacion de que se quedo programada
select job_name, STATE, LAST_START_DATE, LAST_RUN_DURATION, NEXT_RUN_DATE, FAILURE_COUNT from DBA_SCHEDULER_JOBS;