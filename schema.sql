/* Database schema to keep the structure of entire database. */


CREATE TABLE animals (id integer, name text, date_of_birth date, escape_attempts integer, neutered boolean, weight_kg decimal) ;
ALTER TABLE animals ADD species varchar(255);

CREATE table owners (id SERIAL PRIMARY KEY, full_name VARCHAR(100), age INT);
CREATE TABLE species (id SERIAL PRIMARY KEY, name VARCHAR(255));

