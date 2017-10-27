create user rman identified by rman   default tablespace nuevo quota unlimited on nuevo;
grant connect to rman
grant recovery_catalog_owner to rman;
create catalog;
register database;
upgrade catalog;