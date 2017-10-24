Granted Roles:
SELECT * FROM DBA_ROLE_PRIVS  WHERE GRANTEE = 'ERGO';
SELECT * FROM DBA_TAB_PRIVS  WHERE GRANTEE = 'ERGO';
SELECT * FROM DBA_TAB_PRIVS  WHERE GRANTEE IN (SELECT granted_role FROM DBA_ROLE_PRIVS  WHERE GRANTEE = 'ERGO');
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'ERGO';


CREATE ROLE test_role IDENTIFIED BY test123;
GRANT select, insert, update, delete ON suppliers TO test_role;
GRANT test_role TO smithj;

create table t1(a int,b int);


//Habilitar Role
SET ROLE supervisor IDENTIFIED BY bodega;
//Rol default para el usuario
ALTER USER ergo DEFAULT ROLE ALL;
solo para procedures.
GRANT EXECUTE ON PC001 TO SUPERVISOR;

create table t1(a int,b int);
create user ergo identified by proxy;
CREATE ROLE supervisor IDENTIFIED BY bodega;
grant create session to ergo;
GRANT select, delete ON t1 TO supervisor;
GRANT supervisor TO ergo;
create user usuario2 identified by usuario2;
create table t3(a int,b int);
create table t2(a int,b int);



create table t1(a int, b int, c int);
create user test identified by test;
grant create session to test;
create role rol identified by rol;
grant insert on t1 to rol;
grant select on t1 to test;
