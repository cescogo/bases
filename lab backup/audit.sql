conn sysdba/root as sysdba
show parameter audit
--Cambiar el exclusive a shared
alter system set audit_trail=db, extended scope=spfile;
alter system set audit_sys_operations=TRUE scope=SPFILE;
shutdown;
startup ;
show parameter audit;
show parameter remote_login_passwordfilel
COLUMN username FORMAT A8
COLUMN obj_name FORMAT A10
COLUMN action_name FORMAT A12
COLUMN sql_text FORMAT A37    
SELECT username,obj_name,action_name, sql_text FROM   dba_audit_trail ORDER BY timestamp;
--AUDIT CREATE ANY TABLE, DROP ANY TABLE BY username;
--AUDIT INSERT , UPDATE , DELETE  ON scott.emp BY ACCESS;

select * from all_users;
archive log list;
