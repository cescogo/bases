drop table a;
drop table b;
create table a(cedula int,des varchar(2),constraint PKTienda primary key (cedula))tablespace Veterinaria;
create table b(a int,des varchar(10))tablespace Veterinaria;


insert into a (cedula,des) values (1,'a1');



create or replace trigger 
b_trg_in BEFORE INSERT on b
REFERENCING OLD AS OLD  NEW AS NEW
FOR EACH ROW
declare
res number; 
BEGIN
select count(*) into res from a where cedula=:new.a;
  IF  res=0 then
  insert into b (a,des) values (:new.a,:new.des);
 
   END IF;   
END b_trg_in;
/
show error
-------------------------------------------------



--insert into b (a,des) values (2,'ab');
