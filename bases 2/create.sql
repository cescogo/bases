create table departamentos(cod_depto number, 
nombre varchar2(10)) tablespace "user";

create table empleado(
cod_emp      number,
nombre       varchar2(10), 
cod_depto1   number,
email varchar2(10)) tablespace "user";

alter table test add constraint test_pk
primary key (cod_emp);

alter table departamentos add constraint departamentos_pk
primary key (cod_depto);

alter table empleado add constraint empleado_fk_depto
foreign key (cod_depto1) references departamentos(cod_depto);

alter table empleado add constraint empleado_uk1
unique (email);

insert into departamentos(cod_depto, nombre) values
(10, 'Ventas');

insert into departamentos(cod_depto, nombre) values
(20, 'Info');

insert into empleado(cod_emp, nombre, cod_depto1) values
(1, 'Juan',10);

insert into empleado(cod_emp, nombre, cod_depto1) values
(2, 'Pedro',20);


select * 
from ALL_ALL_TABLES 
where empleado like '%emp%';


select owner, table_name, tablespace_name
from dba_tablespaces
 where table_name='test';