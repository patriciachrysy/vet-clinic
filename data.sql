/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (5, 'Charmander', '2020-02-08', 0, false, -11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (7, 'Squirtle', '1993-04-02', 3, false, -12.13);
.
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (8, 'Angemon', '2005-06-12', 1, true, -45);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (9, 'Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (10, 'Blossom', '1998-10-13', 3, true, 17);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);



INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age) VALUES ('Bob', 45);

INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);



INSERT INTO species (name) VALUES ('Pokemon');

INSERT INTO species (name) VALUES ('Digimon');


UPDATE animals
SET species_id = specy.id
FROM (SELECT id FROM species WHERE name = 'Digimon') AS specy
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = specy.id
FROM (SELECT id FROM species WHERE name = 'Pokemon') AS specy
WHERE species_id IS NULL;


UPDATE animals
SET owner_id = owner.id
FROM (SELECT id FROM owners WHERE full_name = 'Sam Smith') AS owner
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = owner.id
FROM (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') AS owner
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = owner.id
FROM (SELECT id FROM owners WHERE full_name = 'Bob') AS owner
WHERE name = 'Plantmon' OR name = 'Devimon';

UPDATE animals
SET owner_id = owner.id
FROM (SELECT id FROM owners WHERE full_name = 'Melody Pond') AS owner
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = owner.id
FROM (SELECT id FROM owners WHERE full_name = 'Dean Winchester') AS owner
WHERE name = 'Angemon' OR name = 'Boarmon';




INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');


INSERT INTO specializations (species_id, vet_id)
VALUES (
    (SELECT id AS species_id FROM species WHERE name = 'Pokemon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'William Tatcher')
);

INSERT INTO specializations (species_id, vet_id)
VALUES (
    (SELECT id AS species_id FROM species WHERE name = 'Digimon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Stephanie Mendez')
);

INSERT INTO specializations (species_id, vet_id)
VALUES (
    (SELECT id AS species_id FROM species WHERE name = 'Pokemon' ),
    (SELECT id AS vet_id FROM vets WHERE name = 'Stephanie Mendez')
);

INSERT INTO specializations (species_id, vet_id)
VALUES (
    (SELECT id AS species_id FROM species WHERE name = 'Digimon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Jack Harkness')
);




INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Agumon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'William Tatcher'),
    '2020-05-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Agumon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Stephanie Mendez'),
    '2020-07-22'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Gabumon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Jack Harkness'),
    '2021-02-02'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Pikachu'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Maisy Smith'),
    '2020-01-05'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Pikachu'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Maisy Smith'),
    '2020-03-08'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Pikachu'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Maisy Smith'),
    '2020-05-14'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Devimon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Stephanie Mendez'),
    '2021-05-04'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Charmander'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Jack Harkness'),
    '2021-02-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Plantmon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Maisy Smith'),
    '2019-12-21'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Plantmon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'William Tatcher'),
    '2020-08-10'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Plantmon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Maisy Smith'),
    '2021-04-07'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Squirtle'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Stephanie Mendez'),
    '2019-09-29'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Angemon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Jack Harkness'),
    '2020-11-04'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Angemon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Jack Harkness'),
    '2019-01-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Boarmon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Maisy Smith'),
    '2019-01-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Boarmon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Maisy Smith'),
    '2019-05-15'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Boarmon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Maisy Smith'),
    '2020-02-27'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Boarmon'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Maisy Smith'),
    '2020-08-03'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Blossom'),
    (SELECT id AS vet_id FROM vets WHERE name = 'Stephanie Mendez'),
    '2020-05-24'
);

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (
    (SELECT id AS animal_id FROM animals WHERE name = 'Blossom'),
    (SELECT id AS vet_id FROM vets WHERE name = 'William Tatcher'),
    '2021-01-11'
);


