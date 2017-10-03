CREATE or replace PROCEDURE RebuildIndex(tName IN VARCHAR2) AS
pkName varchar2(20);
   BEGIN
		SELECT cols.constraint_name INTO pkName
		FROM all_constraints cons, all_cons_columns cols
		WHERE cols.table_name =  UPPER(tName)
		AND cons.constraint_type = 'P'
		AND cons.constraint_name = cols.constraint_name
		AND cons.owner = cols.owner;
        execute immediate 'ALTER INDEX ' || pkName || ' REBUILD TABLESPACE "index"';  
   END RebuildIndex;
/