SELECT data->>'nombre' AS nombre
FROM usuarios
WHERE data->>'activo' = 'true';

CREATE INDEX idx_data_gin ON usuarios USING GIN (data);

SELECT * FROM usuarios
WHERE data @> '{"activo": true}';

--DEMAS EJERCICIOS --
--Recomendados
--3 - Consultar productos por color, tamaño o categoría.

SELECT * FROM productos WHERE specs ->> 'color'='rojo'; -- color
SELECT * FROM productos WHERE specs ->> 'size'='L'; -- tamaño
SELECT * FROM productos WHERE specs ->> 'category'='calzado'; --categoria

--4 - Crear índices GIN y medir el rendimiento.

CREATE INDEX IF NOT EXISTS idx_productos_specs_gin ON productos USING GIN (specs);


-- Ejercicios básicos --
--3 - Consultar por una clave específica
-- Encuentra todos los productos cuyo atributo color sea "rojo".
SELECT * FROM product
WHERE atributos -> 'color'='rojo';

--4- Actualizar un valor dentro del HSTORE
-- Cambia el valor de peso para un producto específico.
UPDATE product
SET atributos = atributos || 'peso=>150g'
WHERE nombre='camisa';
SELECT * FROM product WHERE nombre = 'camisa';

--5 - Eliminar una clave de un registro
-- Elimina el atributo color de un producto.
UPDATE product
SET atributos = delete(atributos, 'color')
WHERE nombre = 'jabon';
SELECT * FROM product WHERE nombre = 'jabon';


--Ejercicios intermedios --
--1 - Filtrar registros que contienen una clave
-- Usa el operador ? para encontrar productos que tengan el atributo marca.
SELECT * FROM product
WHERE atributos ? 'marca';

--2 - Combinar HSTORE con otras columnas
-- Consulta productos que tengan marca = 'Sony' y precio > 500.
SELECT * FROM product WHERE atributos @> 'marca => Sony' AND
(atributos -> 'precio')::INT > 500;

--3 - Extraer todas las claves y valores
-- Usa skeys() y svals() para listar todos los atributos de cada producto.
SELECT skeys(atributos) FROM product;
SELECT svals(atributos) FROM product;

--4 - Contar cuántos productos tienen un atributo específico
-- ¿Cuántos productos tienen el atributo color?
SELECT COUNT(*) FROM product
WHERE atributos ? 'color';
