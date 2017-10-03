spool tienda.log
DROP  USER  tienda  CASCADE;
Drop tablespace tienda including contents and datafiles;
Drop tablespace personas including contents and datafiles;

create user tienda identified by tienda;
grant dba to tienda;


--TABLESPACE
CREATE TABLESPACE Tienda DATAFILE 'tienda.dat'  SIZE 10M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;
CREATE TABLESPACE Personas DATAFILE 'personas.dat'  SIZE 10M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;



create table Tienda(cedula int,telefono varchar(10),nombre varchar(20), direccion varchar(10),  constraint PKTienda primary key (cedula))tablespace tienda;
create table Producto(numero int,nombre varchar(10),cantidad int,precio int,codigo varchar(20),  constraint PKProducto primary key (numero))tablespace tienda;
create table Clientes(carnet int,cedula int,nombre varchar(10),genero char,edad float,constraint PKCliente Primary Key (cedula))tablespace personas;
create table Orden(numero int,cliente int,producto int,constraint PKOrden Primary Key (numero))tablespace tienda;

spool off;
