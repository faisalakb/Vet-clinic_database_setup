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

insert into  specializations values ((select id from species where name='Pokemon'), (select id from vets where name ='William Tatcher' ));
insert into  specializations values ((select id from species where name='Pokemon'), (select id from vets where name ='Stephanie Mendez' ));
insert into  specializations values ((select id from species where name='Digimon'), (select id from vets where name ='Stephanie Mendez' ));
insert into  specializations values ((select id from species where name='Digimon'), (select id from vets where name ='Jack Harkness' ));


INSERT INTO visits (animals_id, vet_id, visit_date)VALUES (
      ( SELECT id FROM animals WHERE name = 'Agumon'),
      ( SELECT id FROM vets WHERE name = 'William Tatcher'),
      '24-MAY-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Agumon'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '22-JUL-2020'
    );

INSERT INTO visits (animals_id, vet_id,  visit_date)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Gabumon'),
      ( SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '02-FEB-2021'
   );

INSERT INTO visits (animals_id, vet_id,  visit_date)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Pikachu'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '05-JAN-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Pikachu'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '08-MAR-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Pikachu'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '14-MAY-2020'
   );

INSERT INTO visits (animals_id, vet_id,  visit_date)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Devimon'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '04-MAY-2021'
   );

INSERT INTO visits (animals_id, vet_id,  visit_date)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Charmander'),
      ( SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '24-FEB-2021'
   );

INSERT INTO visits (animals_id, vet_id,  visit_date)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Plantmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '21-DEC-2019'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Plantmon'),
      ( SELECT id FROM vets WHERE name = 'William Tatcher'),
      '10-AUG-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Plantmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '07-APR-2021'
   );

INSERT INTO visits (animals_id, vet_id,  visit_date)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Squirtle'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '29-SEP-2019'
   );

INSERT INTO visits (animals_id, vet_id,  visit_date)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Angemon'),
      ( SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '03-OCT-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Angemon'),
      ( SELECT id FROM vets WHERE name = 'Jack Harkness'),
      '04-NOV-2020'
    );

INSERT INTO visits (animals_id, vet_id,  visit_date)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Boarmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '24-JAN-2019'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Boarmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '15-MAY-2019'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Boarmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '27-FEB-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Boarmon'),
      ( SELECT id FROM vets WHERE name = 'Maisy Smith'),
      '03-AUG-2020'
   );

INSERT INTO visits (animals_id, vet_id,  visit_date)
  VALUES (
      ( SELECT id FROM animals WHERE name = 'Blossom'),
      ( SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
      '24-MAY-2020'
   ),
   (
      ( SELECT id FROM animals WHERE name = 'Blossom'),
      ( SELECT id FROM vets WHERE name = 'William Tatcher'),
      '11-JAN-2021'
    );

	