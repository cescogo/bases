--Granted Roles:
SELECT * FROM DBA_ROLE_PRIVS  WHERE GRANTEE = 'ERGO';
--Privileges Granted Directly To ERGO:
SELECT * FROM DBA_TAB_PRIVS  WHERE GRANTEE = 'ERGO';
--Privileges Granted to Role Granted to ERGO:
SELECT * FROM DBA_TAB_PRIVS  WHERE GRANTEE IN (SELECT granted_role FROM DBA_ROLE_PRIVS  WHERE GRANTEE = 'ERGO');
--Granted System Privileges:
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'ERGO';