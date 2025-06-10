use dummy_data;
show tables;
desc soliders;
delimiter $$
create procedure insertion_dummy ()
begin
declare i int default 1;
while i<=100 do
insert into soliders (sol_id,name) values(i,concat('soldier_',i));
set i=i+1;
end while;
end$$
delimiter ;
call insertion_dummy();
drop procedure insertion_dummy;
select * from soliders;
create index sol_id_index on soliders (sol_id);
select * from soliders where sol_id between 1 and 100;
delimiter %%
create procedure sol_location()
begin
declare i  int default 1;
while i<=100 do
update soliders set country="russia" where sol_id =i;
set i=i+1;
end while;
end %%
delimiter ;
call sol_location;
create index loc_indx on soliders(country);
select * from soliders where country="russia";



 

