select
  sid,
  start_time,
  totalwork
  sofar, 
 (sofar/totalwork) * 100 pct_done
from 
   v$session_longops
where 
   totalwork > sofar
AND 
   opname NOT LIKE '%aggregate%'
AND 
   opname like 'RMAN%';

select 
   sid, 
   spid, 
   client_info, 
   event, 
   seconds_in_wait, 
   p1, p2, p3
 from 
   v$process p, 
   v$session s
 where 
   p.addr = s.paddr
 and 
   client_info like 'rman channel=%';
   