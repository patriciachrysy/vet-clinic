/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD species varchar(100);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    age int
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

ALTER TABLE animals DROP COLUMN species; 

ALTER TABLE animals ADD species_id int;
ALTER TABLE animals ADD owner_id int;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age int,
    date_of_graduation date
);

CREATE TABLE specializations (
    species_id int REFERENCES species (id) ON UPDATE CASCADE ON DELETE CASCADE,
    vet_id int REFERENCES vets (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT specializations_pkey PRIMARY KEY (species_id, vet_id)
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id int REFERENCES animals (id) ON UPDATE CASCADE ON DELETE CASCADE,
    vet_id int REFERENCES vets (id) ON UPDATE CASCADE ON DELETE CASCADE,
    visit_date date
);