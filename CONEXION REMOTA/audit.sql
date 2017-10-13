conn sysdba/root as sysdba
show parameter audit
alter system set audit_trail=db, extended scope=spfile;
alter system set audit_sys_operations=TRUE scope=SPFILE;
shutdown
startup
show parameter audit

COLUMN usuario FORMAT A8
COLUMN obj_name FORMAT A10
COLUMN ACCION FORMAT A12
COLUMN sql_text FORMAT A37  
COLUMN fecha FORMAT A37  

SELECT username usuario,obj_name,action_name ACCION, sql_text,cast(extended_timestamp as TIMESTAMP)fecha FROM   dba_audit_trail ORDER BY timestamp;
---SELECT username,obj_name,action_name, sql_text FROM   dba_audit_trail WHERE  username = 'nombre' ORDER BY timestamp;

AUDIT CREATE ANY TABLE, DROP ANY TABLE BY username;
AUDIT INSERT , UPDATE , DELETE , Select ON T1 BY ACCESS;

select * from all_users;
archive log list;

--select * from all_users;
create table emp (id number,dpt number);
insert into emp (id, dpt) values (1212,10);
update emp set id = 9900 where dpt = 1212;
delete from emp where dpt=1212;
commit;



 INSERT INTO sys.t1@DLBD1 (a,b) VALUES (1312123,11021991);
 INSERT INTO sys.t1@DLBD3 (a,b) VALUES (1312123,11021991);
 INSERT INTO sys.t1@DLBD4 (a,b) VALUES (1312123,11021991);
 INSERT INTO sys.t1@DLBD5 (a,b) VALUES (1312123,11021991);
 COMMIT;
 select * from sys.t1@DLBD1;
 select * from sys.t1@DLBD3;
 select * from sys.t1@DLBD4;
 select * from sys.t1@DLBD5;