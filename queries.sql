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



