backup incremental level 0 database tag='L01';
backup incremental level 1 cumulative database tag='icumulative';
backup incremental level 1 database tag='idifferential';
backup as copy database spfile plus archivelog;
backup database spfile plus archivelog tag='FBD';
list backup of database summary;