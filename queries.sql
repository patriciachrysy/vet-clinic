/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;


SELECT name FROM animals WHERE neutered = true AND  escape_attempts < 3;


SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR  name = 'Pikachu';


SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;


SELECT * FROM animals WHERE neutered = true;


SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(name) FROM animals;


SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;


SELECT AVG(weight_kg) FROM animals;


SELECT SUM(escape_attempts), neutered FROM animals GROUP BY neutered;


SELECT MIN(weight_kg) AS min_weight, MAX(weight_kg) as max_weight, species FROM animals GROUP BY species;


SELECT AVG(escape_attempts) AS avg_esc_attempts, species FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;



SELECT name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals INNER JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';

SELECT full_name AS owner, string_agg(name, ', ') AS animals FROM animals RIGHT JOIN owners ON owner_id = owners.id GROUP BY owner;

SELECT species.name AS type, COUNT(animals.name) AS total_animals FROM animals RIGHT JOIN species ON species_id = species.id GROUP BY type;

SELECT animals.name AS Jennifers_digimons FROM animals LEFT JOIN owners on owner_id = owners.id LEFT JOIN species ON species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT name as Dean_loyal_animals FROM animals LEFT JOIN owners ON owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

SELECT full_name AS owner, COUNT(name) AS total_animals FROM animals RIGHT JOIN owners ON owner_id = owners.id GROUP BY owner ORDER BY total_animals DESC LIMIT 1;