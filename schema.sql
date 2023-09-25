create  database db_vet_clinic
use db_vet_clinic

create table animals(
    id int,
    name varchar(20),
    date_of_birth date,
    escape_attempts int,
    neutered bit,
    weight_kg decimal
);
