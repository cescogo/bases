select log_mode from v$database;
configure controlfile autobackup on;
configure backup optimization on;
rman 
connect target /
--Level 0: Completo
--Level 1 Cumulative:acumulativo desde que cambio un blaque
--Level 1 Differential: backup de los bloques que cambiaron
--Schema
report schema;
-- tipo 0
backup incremental level 0 database tag='L01';
--tipo 1 cumulativo incremental
backup incremental level 1 cumulative database tag='icumulative';
-- tipo diferencial incremental
backup incremental level 1 database tag='idifferential';
--FULL TODO
backup as copy database spfile plus archivelog;
--FULL
backup database spfile plus archivelog tag='FBD';
--
list backup of database summary;

--Elimina
delete backup;
--Elimina obsoletos
 delete obsolete;