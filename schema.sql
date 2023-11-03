/* Database schema to keep the structure of entire database. */


CREATE TABLE animals (id integer, name text, date_of_birth date, escape_attempts integer, neutered boolean, weight_kg decimal) ;
ALTER TABLE animals ADD species varchar(255);

CREATE table owners (id SERIAL PRIMARY KEY, full_name VARCHAR(100), age INT);
CREATE TABLE species (id SERIAL PRIMARY KEY, name VARCHAR(255));

ALTER TABLE animals ADD COLUMN new_id SERIAL PRIMARY KEY;
ALTER TABLE animal DROP COLUMN id;
ALTER TABLE animals RENAME COLUMN new_id TO id;


ALTER TABLE ANIMALS DROP COLUMN SPECIES;
ALTER TABLE ANIMALS ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE ANIMALS ADD COLUMN owner_id INT REFERENCES owners(id);

CREATE TABLE vet (id SERIAL PRIMARY KEY, name VARCHAR(255), age INT, date_of_graduation DATE);
CREATE TABLE specializations (vet_id INT REFERENCES vet(id), species_id INT REFERENCES species(id), PRIMARY KEY (vet_id, species_id));
CREATE TABLE visits (vet_id INT REFERENCES vet(id), animal_id INT REFERENCES animals(id), PRIMARY KEY (vet_id, animal_id));
ALTER TABLE visits ADD COLUMN date_of_visit date;



