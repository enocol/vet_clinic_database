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
UPDATE animals SET species = 'unspecified';
ROLLBACK;
begin;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = '';
COMMIT;

begin;
DELETE FROM animals;
ROLLBACK;

begin DELETE FROM animals WHERE date_of_birth > '2022-01-01';
savepoint after_jan_2022;
UPDATE animals SET weight_kg = weight_kg * -1;
rollback to savepoint after_jan_2022;
begin;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
