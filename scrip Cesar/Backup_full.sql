--en cmd sql 
--bajar base
shutdown immediate;
--montar base
startup mount;

--cmd rman
rman target/
-- backup full con nombre deseado
backup database tag='res-27-10-2017-1';
-- backup full del controlfile 
backup current controlfile tag='res-27-10-2017-1con'
