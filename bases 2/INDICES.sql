CREATE TABLE test(a1 varchar2(20), a2 INT);

select a.index_name from DBA_ind_columns a, DBA_indexes b 
where a.index_name=b.index_name and a.table_name=upper('EMPLOYEES') order by a.table_name, 
a.index_name, a.column_position;

CREATE or replace PROCEDURE indice(index_name varchar2) AS
   BEGIN
     execute immediate 'Alter index' || index_name || 'rebuild'
		 || 'tablespace' || 'test';
   END;
/

--drop table test;