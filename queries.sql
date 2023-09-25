
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