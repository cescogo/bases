drop table a;
drop table b;
create table a(cedula int,des varchar(2),constraint PKTienda primary key (cedula))tablespace Veterinaria;
create table b(a int,des varchar(10))tablespace Veterinaria;


insert into a (cedula,des) values (1,'a1');



create or replace trigger 
b_trg_in BEFORE INSERT on b
REFERENCING OLD AS OLD  NEW AS NEW
FOR EACH ROW
BEGIN
  IF  exist(:new.a)=1 then
  insert into b (a,des) values (:new.a,:new.des);  
  END IF;
END b_trg_in;
/
show error

create or replace function exist(id in number)
return number is
Vresultado number;
BEGIN
 select cedula into Vresultado from a where cedula=id; 
 
 return (1);
 EXCEPTION
 WHEN NO_DATA_FOUND THEN

  return (0);
END exist;
/
show error

--insert into b (a,des) values (2,'ab');
