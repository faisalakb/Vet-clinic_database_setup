create  database db_vet_clinic
use db_vet_clinic

create table animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(20),
    date_of_birth date,
    escape_attempts int,
    neutered ,
    weight_kg decimal
);

ALTER TABLE animals 
	ADD species varchar(20);

create table owners(
	id int primary key GENERATED ALWAYS AS IDENTITY,
	full_name varchar(255),
	age int
)

create table species(
	id int primary key GENERATED ALWAYS AS IDENTITY,
	name varchar(50)
	
)


/* Modify animals table:

    Make sure that id is set as auto incremented PRIMARY KEY
    Remove column species
    Add column species_id which is a foreign key referencing species table
    Add column owner_id which is a foreign key referencing the owners table
 */

/* I already apply the auto increment*/

alter table animals 
add constraint pk_animal_id
primary key(id)

alter table animals 
drop column species


alter table animals 
add column species_id int 

alter table animals
add constraint FK_animal_species
foreign key(species_id) references species(id)

alter table animals
add column owner_id int

alter table animals
add constraint fk_owners_id
foreign key (owner_id) references owners (id)

create table vets(
	id int primary key GENERATED ALWAYS AS IDENTITY,
	name varchar(30),
	age int,
	date_of_graduation date
)

create table specializations(
	species_id INT NOT NULL,
	vet_id INT NOT NULL,
	FOREIGN KEY (species_id) REFERENCES species (id),
	FOREIGN KEY (vet_id) REFERENCES vets (id)	
	
)

create table visits(
	animals_id INT NOT NULL,
	vet_id INT NOT NULL,
	visit_date DATE NOT NULL,
	FOREIGN KEY (animals_id) REFERENCES animals (id),
	FOREIGN KEY (vet_id) REFERENCES vets (id)	
)

/* Index creation for optimation*/

/* add a new column email */
ALTER TABLE owners ADD COLUMN email VARCHAR(255);

/* create indexes for animal_id, vet_id and owners email */
CREATE INDEX animals_id_visit_index ON visits(animals_id);
CREATE INDEX vets_id_visit_index ON visits(vet_id desc);
CREATE INDEX owners_email_index ON owners(email); 
