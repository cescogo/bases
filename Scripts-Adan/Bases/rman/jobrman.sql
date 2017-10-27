exec DBMS_SCHEDULER.create_job ( -
job_name    => 'BACKUP_Name',    -
job_type    => 'EXECUTABLE',     -
job_action =>'F:\Documents\GitHub\bases\Scripts-Adan\Bases\rman\bck.bat \c',-
start_date    => trunc(SYSTIMESTAMP)+4/24, -
repeat_interval => 'Freq=daily;ByDay=WED,SAT;ByHour=4;ByMinute=00',-
end_date    => NULL,   -
enabled    => TRUE,    -
comments    => 'Backup script on Wednesday, Saturday 4AM.');