
select * from animals where name like '%mon';

SELECT name
FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

select name from animals 
where neutered=true and escape_attempts<3

select date_of_birth from animals
where name= 'Agumon' or name='Pikachu'

select name,escape_attempts  from animals
where weight_kg >10.5

select * from animals where neutered =true

select * from animals where name ='Gabumon'

select * from animals
where weight_kg between 10.4 and 17.3


/* Inside a transaction update the animals table by setting the species column
to unspecified. Verify that change was made. Then roll back the change and
verify that the species columns went back to the state before the 
transaction.
*/


BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


/*Inside a transaction:

    Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
    Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
    Verify that changes were made.
    Commit the transaction.
    Verify that changes persist after commit.
 */

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

/* Now, take a deep breath and... Inside a transaction delete all records
in the animals table, then roll back the transaction.After the rollback verify if all records in the animals table still exists.
After that, you can start breathing as usual ;) */

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

/*Inside a transaction:

    Delete all animals born after Jan 1st, 2022.
    Create a savepoint for the transaction.
    Update all animals' weight to be their weight multiplied by -1.
    Rollback to the savepoint
    Update all animals' weights that are negative to be their weight multiplied by -1.
    Commit transaction
 */

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT before_weight_update;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO before_weight_update;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
commit;
select * from animals;

/* Write queries to answer the following questions:

    How many animals are there?
    How many animals have never tried to escape?
    What is the average weight of animals?
    Who escapes the most, neutered or not neutered animals?
    What is the minimum and maximum weight of each type of animal?
    What is the average number of escape attempts per animal type of those born between 1990 and 2000?
*/

select count(name) as total_animals from animals;

select count(name) as total_animals  from animals where escape_attempts =0;

select avg(weight_kg) as Average_weight from animals;

select neutered, max(escape_attempts) from animals group by neutered;

select species, min(weight_kg), max(weight_kg) from animals group by species;

SELECT species, AVG(escape_attempts) AS average_escape_attempts FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

/* Write queries (using JOIN) to answer the following questions:

    What animals belong to Melody Pond?
    List of all animals that are pokemon (their type is Pokemon).
    List all owners and their animals, remember to include those that don't own any animal.
    How many animals are there per species?
    List all Digimon owned by Jennifer Orwell.
    List all animals owned by Dean Winchester that haven't tried to escape.
    Who owns the most animals?
*/

select * from animals a
inner join owners o
on a.owner_id=o.Id
where full_name='Melody Pond'


select * from animals a
inner join species s
on a.species_id=s.id
where s.name='Pokemon'

select * from animals a
full outer join owners o
on  a.owner_id=o.Id
where a.owner_id is null


select s.name, count(a.name)as Animal_count from animals a
inner join species s
on a.species_id=s.id
group by s.name


select * from animals a
inner join species s
on a.species_id=s.id
inner join owners o
on a.owner_id=o.id
where s.name= 'Digimon' and o.full_name= 'Jennifer Orwell'


select * from animals a
inner join owners o
on a.owner_id=o.Id
where full_name='Dean Winchester' and a.escape_attempts=0


select  count(a.name)as total,o.full_name
 from animals a
inner join owners o
on a.owner_id=o.Id
group by o.full_name
order by total desc
limit 1


/* Write queries to answer the following:

    Who was the last animal seen by William Tatcher?
    How many different animals did Stephanie Mendez see?
    List all vets and their specialties, including vets with no specialties.
    List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
    What animal has the most visits to vets?
    Who was Maisy Smith's first visit?
    Details for most recent visit: animal information, vet information, and date of visit.
    How many visits were with a vet that did not specialize in that animal's species?
    What specialty should Maisy Smith consider getting? Look for the species she gets the most.
*/


select * from vets ve
inner join visits vi
on ve.id= vi.vet_id
inner join animals an
on an.id=vi.animals_id
where ve.name='William Tatcher'
order by visit_date desc
limit 1;


select count (distinct animals_id) as total_animal_see from vets ve
inner join visits vi
on ve.id= vi.vet_id
where ve.name='Stephanie Mendez';

select * from vets ve
full outer join specializations sp
on ve.id=sp.vet_id
full outer join species se
on se.id=sp.species_id


SELECT * FROM visits vi LEFT JOIN animals a ON a.id = vi.animals_id 
LEFT JOIN vets v ON v.id = vi.vet_id	
WHERE v.name = 'Stephanie Mendez' AND vi.visit_date
BETWEEN '01-apr-2020' and '30-aug-2020';


select an.name, count(*) as most_visit from visits vi
inner join animals an
on an.id= vi.animals_id
group by an.name
order by most_visit desc



SELECT * FROM visits vi LEFT JOIN animals a ON a.id = vi.animals_id 
	LEFT JOIN vets v ON v.id = vi.vet_id
	WHERE v.name = 'Maisy Smith'	
	ORDER BY vi.visit_date LIMIT 1;
	

SELECT * FROM visits vi
INNER JOIN animals an 
ON an.id = vi.animals_id 
INNER JOIN vets ve 
ON ve.id = vi.vet_id;
	

SELECT COUNT(vi.animals_id)  as total FROM visits vi 
INNER JOIN vets ve 
ON ve.id = vi.vet_id 
WHERE ve.id NOT IN (SELECT vet_id FROM specializations);


SELECT v.name , s.name AS specieName, COUNT(s.name) as total FROM visits vi
LEFT JOIN animals a ON a.id = vi.animals_id LEFT JOIN vets v ON v.id = vi.vet_id LEFT JOIN species s
ON s.id = a.species_id
WHERE v.name = 'Maisy Smith' GROUP BY v.name, s.name
ORDER BY total DESC
LIMIT 1;




/*Before and After applying index to check the optimaization*/

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';