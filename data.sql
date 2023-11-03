/* Populate database with sample data. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-3', 0, 'yes', 10.23 ) ;

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, 'yes', 8 ) ;

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, 'no', 15.04 ) ;

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, 'yes', 11 ) ;

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES  ('Charmander', '2020-02-08', 0, false, -11),
                                                                                         ('Plantmon', '2021-11-15', 2, true, -5.7),
                                                                                         ('Squirtle', '1993-04-02', 3, false, -12.13),
                                                                                         ('Angemon', '2005-06-12', 1, true, -45),
                                                                                         ('Boarmon', '2005-06-07', 7, true,  20.4),
                                                                                         ('Blossom', '1998-10-13', 3, true, 17),
                                                                                         ('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO OWNERS (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
INSERT INTO SPECIES (name) VALUES ('Digimon), ('Pokemon');

UPDATE ANIMALS SET species_id = 1 WHERE name LIKE '%mon';
UPDATE ANIMALS SET species_id = 2 WHERE species_id IS NULL;
  
UPDATE ANIMALS SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE ANIMALS SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE ANIMALS SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Plantmon' OR name = 'Devimom';
UPDATE ANIMALS SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE ANIMALS SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO VET (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'),('Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez', 64, '1981-05-04'),('Jack Harkness',  38, '2008-06-08');
