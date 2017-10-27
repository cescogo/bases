create table t1 (int a,int b,int c);
create user udb7 identified by udb7;
grant dba to udb7;

show parameters remote_login_passwordfile;
alter system set remote_login_passwordfile = 'SHARED' scope = spfile;
shutdown
startup mount
show parameters remote_login_passwordfile;
alter database open
CREATE DATABASE LINK remotedb1 CONNECT TO SYSDBA IDENTIFIED BY ROOT USING'(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = 172.17.112.141)(PORT = 1521))(CONNECT_DATA = (SERVICE_NAME = XE)))';


grant select on table to user



create database link DLBD7;
connect user identified by password using DLBD7;
connect bd8 identified by bd8 using DLBD7;

CREATE DATABASE LINK DLBD7 CONNECT TO  IDENTIFIED BY db7 USING 'DLBD7';

--drop database link DLBD7;

connect bd8/bd8@BD7

select * from t1@BD7;

DROP PUBLIC DATABASE LINK DLBD7; 
create public database link clase connect to TOM identified by TOM using 'BD7';

create public database link clase2 connect to BD8 identified by BD8 using 'BD7';


CREATE DATABASE LINK remotedb1 CONNECT TO SYSDBA IDENTIFIED BY ROOT USING'(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = 172.17.112.141)(PORT = 1521))(CONNECT_DATA = (SERVICE_NAME = XE)))';--crear role 

--crear privilegio


--crear usuario

--crear link