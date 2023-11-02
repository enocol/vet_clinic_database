/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like %mon ;
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019 ;
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu') ;
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5 ;
SELECT * FROM animals WHERE neutered = true ;
SELECT * FROM animals WHERE name <> 'Gabumon' ;
SELECT * FROM animals where weight_kg >= 10.4 and weight_kg <= 17.3 ;

BEGIN;
SELECT species FROM animals;
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
SELECT species FROM animals;
begin;
SELECT * FROM animals WHERE name LIKE '%mon'
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals WHERE name LIKE '%mon'
SELECT * FROM animals WHERE species = ''
UPDATE animals SET species = 'pokemon' WHERE species = '';
SELECT * FROM animals WHERE species = ''
COMMIT;

begin;
SELECT * FROM animals;
DELETE FROM animals;
SELECT * from animals;
ROLLBACK;
SELECT * FROM animals;

begin DELETE FROM animals WHERE date_of_birth > '2022-01-01';
savepoint after_jan_2022;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals WHERE weight_kg < 0;
rollback to savepoint after_jan_2022;
SELECT * FROM animals WHERE date_of_birth > '2022-01-01'
begin;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * from animals WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) as total_escape_attempts FROM animals GROUP BY neutered ORDER BY total_escape_attempts DESC;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT a.name AS Animals_of_Melody_Pong FROM animals AS a JOIN owners AS o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';
SELECT a.name AS Animal_of_type_Pokemon FROM animals AS a JOIN species AS s ON a.species_id = s.id WHERE s.name = 'Pokemon';
SELECT o.full_name AS name_of_owner, a.name AS Name_of_animal FROM owners AS o LEFT JOIN animals AS a ON o.id = a.owner_id ORDER BY o.full_name;
SELECT s.name AS Name_of_species, COUNT(a.id) AS Number_of_animals FROM species AS s LEFT JOIN animals AS a ON s.id = a.species_id GROUP BY s.name ORDER BY s.name;
