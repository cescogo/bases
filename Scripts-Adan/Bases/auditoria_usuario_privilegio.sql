column username format a15
column audit_option format a20
column privilege format a20
column success format a10
column failure format a10
select user_name, audit_option, success, failure
from dba_stmt_audit_opts
union
select user_name, privilege, success, failure
from dba_priv_audit_opts
/

select username,obj_name,action_name from dba_audit_trail;