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
SELECT * FROM animals;
UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * FROM animals;
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
