--
-- audit.sql
-- Pete Finnigan 
-- 15-Apr-2003
--
-- example code for the SQL injection article for www.securityfocus.com
--
set serveroutput on size 1000000

spool audit.lis

--
-- SQL to check if the audit has been enabled in the database and where the output will be
-- written to.
--

select name,value from v$parameter
where name like 'audit%'
/

--
-- Test to see what audit actions are defined. Note:- doesn't include object audit actions.
--

select * from dba_stmt_audit_opts
union
select * from dba_priv_audit_opts
/

--
-- Turn on audit for capturing logon and logoff attemempts for all users except
-- privileged attempts.
--

audit create session
/

--
-- check what audit privileges have been granted and to what users and roles.
--

select *
from dba_sys_privs
where privilege like '%AUDIT%'

--
-- SQL to generate audit actions to be enabled for changes to objects in the
-- database schema. NOTE:- This is a sample set of commands and not all 
-- possible ones. Also the spool lines will stop the spool command at the start
-- of this file. Cut and paste this section into another file to run it.
--

set head off
set feed off
set pages 0
spool aud.lis
select 'audit '||name||';'
from system_privilege_map
where (name like 'CREATE%TABLE%'
or name like 'CREATE%INDEX%'
or name like 'CREATE%CLUSTER%'
or name like 'CREATE%SEQUENCE%'
or name like 'CREATE%PROCEDURE%'
or name like 'CREATE%TRIGGER%'
or name like 'CREATE%LIBRARY%')
union
select 'audit '||name||';'
from system_privilege_map
where (name like 'ALTER%TABLE%'
or name like 'ALTER%INDEX%'
or name like 'ALTER%CLUSTER%'
or name like 'ALTER%SEQUENCE%'
or name like 'ALTER%PROCEDURE%'
or name like 'ALTER%TRIGGER%'
or name like 'ALTER%LIBRARY%')
union
select 'audit '||name||';'
from system_privilege_map
where (name like 'DROP%TABLE%'
or name like 'DROP%INDEX%'
or name like 'DROP%CLUSTER%'
or name like 'DROP%SEQUENCE%'
or name like 'DROP%PROCEDURE%'
or name like 'DROP%TRIGGER%'
or name like 'DROP%LIBRARY%')
union
select 'audit '||name||';'
from system_privilege_map
where (name like 'EXECUTE%INDEX%'
or name like 'EXECUTE%PROCEDURE%'
or name like 'EXECUTE%LIBRARY%')
/
spool off
@@aud.lis

--
-- check what audit actions the above SQL has enabled.
--

select audit_option,success,failure
from dba_stmt_audit_opts
union
select privilege,success,failure
from dba_priv_audit_opts
/

--
-- SQL to print out details of all logon and logoff attempts in the audit trail.
--

col username for a15
col terminal for a6
col timestamp for a15
col logoff_time for a15
col action_name for a8
col returncode for 9999
select     username,
   terminal,
   action_name,
   to_char(timestamp,'DDMMYYYY:HHMISS') timestamp,
   to_char(logoff_time,'DDMMYYYY:HHMISS') logoff_time,
   returncode
from       dba_audit_session
/

--
-- SQL to test for failed logon attempts, grouped per day.
--

select count(*),username,terminal,to_char(timestamp,'DD-MON-YYYY')
from dba_audit_session
where returncode<>0
group by username,terminal,to_char(timestamp,'DD-MON-YYYY')
/

--
-- Change to above SQL to show a little more details.
--

select count(*),username,terminal,to_char(timestamp,'DD-MON-YYYY'),returncode
from dba_audit_session
group by username,terminal,to_char(timestamp,'DD-MON-YYYY'),returncode
/

--
-- SQL to check for attempts to access the database with non existant users. This could
-- indicate someone trying to guess user names and passwords.
--

select username,terminal,to_char(timestamp,'DD-MON-YYYY HH24:MI:SS')
from dba_audit_session
where returncode<>0
and not exists (select 'x'
   from dba_users
   where dba_users.username=dba_audit_session.username)
/

--
-- Check for access attempts to the database at unusual hours. The two times should
-- be altered or passed in and if detail is needed for multiple days then group by 
-- the date as well.
--

select	username,
	terminal,
    	action_name,
    	returncode,
    	to_char(timestamp,'DD-MON-YYYY HH24:MI:SS'),
    	to_char(logoff_time,'DD-MON-YYYY HH24:MI:SS')
from dba_audit_session
where to_date(to_char(timestamp,'HH24:MI:SS'),'HH24:MI:SS') < to_date('08:00:00','HH24:MI:SS')
or to_date(to_char(timestamp,'HH24:MI:SS'),'HH24:MI:SS') > to_date('19:30:00','HH24:MI:SS')
/

--
-- Check for users sharing database logons.
--

select count(distinct(terminal)),username
from dba_audit_session
having count(distinct(terminal))>1
group by username
/

--
-- Check for multiple database accounts being used from one terminal. This could indicate
-- wrong doing as each terminal should in theory be used by one person and one account?
--

select count(distinct(username)),terminal
from dba_audit_session
having count(distinct(username))>1
group by terminal
/

--
-- Check the audit trail for any changes being made to the structure of the database schema.
--

col username for a8
col priv_used for a16
col obj_name for a22
col timestamp for a17
col returncode for 9999
select  username,
        priv_used,
        obj_name,
        to_char(timestamp,'DD-MON-YYYY HH24:MI') timestamp,
        returncode
from dba_audit_trail
where priv_used is not null
and priv_used<>'CREATE SESSION'
/

spool off