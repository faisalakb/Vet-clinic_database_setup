/* Database schema to keep the structure of entire database. */

create table animals(
    id int,
    name varchar(20),
    date_of_birth date,
    escape_attempts int,
    neutered bit,
    weight_kg decimal
);
