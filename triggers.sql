create database trig_exp;
use trig_exp;
create table car_detail ( id int auto_increment primary key,about_car varchar (200));
desc car_detail;
create table cars(car_name varchar (20),brand varchar (20),bhp int, tunning varchar (20));
insert into cars values("civic","honda",234,"yes");
insert into cars values("supra","toyota",356,"not yet");
insert into cars values("r8","audi",454,"yes");
insert into cars values("gtr-34","nissian",330,"yes");
select * from cars;
select * from car_detail;
set SQL_SAFE_UPDATES =0;
UPDATE CARS SET BHP=432 WHERE CAR_NAME="GTR-34";
DELETE FROM CARS WHERE CAR_NAME='R8';

--TRIGGERS STARTS HERE
--TRIGGER FOR insert cars
delimiter $$
create trigger machine_added 
after insert 
on cars
for each row
begin  
     insert into car_detail (about_car) values ("new car added into collection");
end$$
delimiter ;
--trigger for updating a car
delimiter %%
create trigger car_modified
after update 
on cars 
for each row
begin
     insert into car_detail (about_car) values ("this car is being modified");
end%%
delimiter ;
--trigger for  deletion of a car 
DELIMITER ^^
CREATE TRIGGER DESTROY_CAR
AFTER DELETE 
ON CARS
FOR EACH ROW
BEGIN
      INSERT INTO CAR_DETAIL (ABOUT_CAR) VALUES ('IAM GONNA DESTROY THIS CAR');
END^^
DELIMITER ;