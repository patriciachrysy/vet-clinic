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


SELECT animals.name AS william_last_animal_seen, visit_date AS on_the FROM visits LEFT JOIN animals ON animal_id = animals.id LEFT JOIN vets ON vet_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY visit_date DESC LIMIT 1;

SELECT DISTINCT COUNT(animal_id) AS mendez_total_diff_animals_seen FROM visits LEFT JOIN vets ON vet_id = vets.id WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name AS vet,  string_agg(species.name, ', ') AS speciality FROM specializations INNER JOIN species ON species_id = species.id RIGHT JOIN vets ON vet_id = vets.id GROUP BY vet;

SELECT animals.name AS animal, visit_date FROM visits INNER JOIN animals ON animal_id = animals.id INNER JOIN vets ON vet_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name AS animal, COUNT(vet_id) AS visits_to_vet FROM visits INNER JOIN animals ON animal_id = animals.id GROUP BY animal ORDER BY visits_to_vet DESC LIMIT 1;

SELECT animals.name AS maisy_first_visit, visit_date FROM visits INNER JOIN animals ON animal_id = animals.id INNER JOIN vets ON vet_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visit_date ASC LIMIT 1;

SELECT animals.name AS animal_name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, vets.name AS vet_name, vets.age AS vet_age, vets.date_of_graduation AS vet_date_of_graduation, visit_date FROM visits INNER JOIN animals ON animal_id = animals.id INNER JOIN vets ON vet_id = vets.id ORDER BY visit_date LIMIT 1;

SELECT SUM(result.unspec_animals_count) AS total_unspecialized_visits FROM (SELECT vets.name AS vet_name, COUNT(animal_id) AS unspec_animals_count FROM visits INNER JOIN vets ON visits.vet_id = vets.id INNER JOIN animals ON visits.animal_id = animals.id FULL JOIN specializations ON vets.id = specializations.vet_id WHERE animals.species_id NOT IN (SELECT species_id FROM specializations WHERE vet_id = vets.id)  GROUP BY vet_name) AS result;

SELECT species.name AS maisy_species_visits, COUNT(animal_id) AS species_visits_count FROM visits INNER JOIN animals ON animal_id = animals.id INNER JOIN species ON animals.species_id = species.id INNER JOIN vets on vet_id = vets.id WHERE vets.name = 'Maisy Smith' GROUP BY maisy_species_visits ORDER BY species_visits_count DESC LIMIT 1;