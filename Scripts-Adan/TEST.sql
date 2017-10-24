BEGIN
DBMS_SCHEDULER.create_job(
   job_name => 'Respaldo',
   job_type => 'BACKUP_SCRIPT',
   job_action => 'l_script',
 
   enabled => TRUE
);
END;
/