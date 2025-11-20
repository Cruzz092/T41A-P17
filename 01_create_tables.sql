CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  data JSONB
);

-- Ejercicios recomendados de HSTORE
--1 - Crear una tabla de productos con especificaciones en JSONB.
CREATE TABLE productos(
  id SERIAL PRIMARY KEY,
  name TEXT,
  specs JSONB
);

-- Ejercicios básicos de HSTORE
-- Ejercicios intermedios de HSTORE
-- Ejercicios avanzados de HSTORE
CREATE EXTENSION IF NOT EXISTS hstore;
--1 - Crear una tabla con columna HSTORE
-- Define una tabla productos con atributos como marca, color, peso.
CREATE TABLE product(
  id SERIAL PRIMARY KEY,
  nombre TEXT,
  atributos HSTORE
);
