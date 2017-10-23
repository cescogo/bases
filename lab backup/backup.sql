rman connect target /
--Level 0: Completo
--Level 1 Cumulative:acumulativo desde que cambio un blaque
--Level 1 Differential: backup de los bloques que cambiaron
--Schema
report schema;
-- tipo 0
backup incremental level 0 database tag='L0';
--tipo 1 cumulativo incremental
backup incremental level 1 cumulative database tag='icumulative';
-- tipo diferencial incremental
backup incremental level 1 database tag='idifferential';

list backup of database summary;