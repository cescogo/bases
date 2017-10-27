-- Integrantes 
-- César Cornejo Gómez
--Adan Rivera Sanchez
--Elena Mora Cordero
--Horacio Barrantes Férnandez
--
--


create table alertas (usuario varchar(20),tabla varchar(20),privilegio varchar(20));

CREATE OR REPLACE Procedure PC001 
is
	cursor c is
		select p.grantee,p.table_name,p.privilege from
		(SELECT username FROM dba_users WHERE TRUNC(created) > (SELECT MIN(TRUNC(created)) FROM dba_users))u,
		(SELECT grantee,table_name,privilege FROM DBA_TAB_PRIVS)p
		where p.grantee = u.username;
	alerta c%rowtype;
begin
	open c;
	loop
	fetch c into alerta;
	exit when c%notfound;
	insert into alertas values alerta;
	commit;
	end loop;
	close c;
end;
/


select p.grantee,p.table_name,p.privilege from
		(SELECT username FROM dba_users WHERE TRUNC(created) > (SELECT MIN(TRUNC(created)) FROM dba_users))u,
		(SELECT grantee,table_name,privilege FROM DBA_TAB_PRIVS)p
		where p.grantee = u.username;
		

select * from 		
(select * from USER_ROLE_PRIVS)a,
(SELECT username FROM dba_users WHERE TRUNC(created) > (SELECT MIN(TRUNC(created)) FROM dba_users))b
where a.username = b.username;
		
		SELECT * FROM dba_users WHERE TRUNC(created) > (SELECT MIN(TRUNC(created)) FROM dba_users);
		
		
select p.grantee,p.table_name,p.privilege from
		(select role from dba_roles)u,
		(SELECT grantee,table_name,privilege FROM DBA_TAB_PRIVS)p
		where p.grantee = u.role and u.role = 'R1' or u.role='R2' or u.role='R3';
		
select * from user_role_privs where username='U1';


//Privilegios del rol
SELECT grantee,table_name,privilege FROM DBA_TAB_PRIVS where grantee='R1';
SELECT grantee,table_name,privilege FROM DBA_TAB_PRIVS where grantee='R2';
SELECT grantee,table_name,privilege FROM DBA_TAB_PRIVS where grantee='R3';
