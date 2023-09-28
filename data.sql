insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Agumon','3-FEB-2020',0,true,10.23);
insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Gabumon','15-NOV-2018',2,true,8.0);
insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Pikachu','7-JAN-2021',1,false,15.04);
insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Devimon','12-MAY-2017',5,true,11.0);

insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Charmander','8-Feb-2020',0,false,11.0);
insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Plantmon','15-Nov-2021',2,true,-5.7);
insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Squirtle','2-Apr-1993',3,false,-12.13);
insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Angemon','12-Jun-2005',1,true,-45.0);
insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Boarmon','7-Jun-2005',7,true,20.4);
insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Blossom','13-Oct-1998',3,true,17.0);
insert into animals  (name, date_of_birth, escape_attempts, neutered, weight_kg) values('Ditto','14-May-2022',4,true,22.0);


insert into owners (full_name,age) values ('Sam Smith', 34);
insert into owners (full_name,age) values ('Jennifer Orwell', 19);
insert into owners (full_name,age) values ('Bob', 45);
insert into owners (full_name,age) values ('Melody Pond', 77);
insert into owners (full_name,age) values ('Dean Winchester', 14);
insert into owners (full_name,age) values ('Jodie Whittaker', 38);


insert into species (name) values ('Pokemon');
insert into species (name) values ('Digimon');


/* Modify your inserted animals so it includes the species_id value:

    If the name ends in "mon" it will be Digimon
    All other animals are Pokemon
*/


update animals set species_id=2 where name like '%mon';

update animals set species_id=1 where name not like '%mon';

update animals set owner_id=1 where name = 'Agumon'

update animals set owner_id=2 where name = 'Gabumon' or name='Pikachu'

update animals set owner_id=3 where name = 'Devimon' or name='Plantmon';

update animals set owner_id=4 where name = 'Charmander' or name='Squirtle' or name='Blossom';

update animals set owner_id=5 where name = 'Angemon' or name='Boarmon';


INSERT INTO vets (name, age, date_of_graduation)
	VALUES ('William Tatcher', 45, '23-APR-2000');

INSERT INTO vets (name, age, date_of_graduation)
	VALUES ('Maisy Smith', 26, '17-JAN-2019');

INSERT INTO vets (name, age, date_of_graduation)
	VALUES ('Stephanie Mendez', 64, '14-MAY-1981');

INSERT INTO vets (name, age, date_of_graduation)
	VALUES ('Jack Harkness', 38, '08-JUN-2008');