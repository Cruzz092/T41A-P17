INSERT INTO usuarios (data)
VALUES 
  ('{"nombre": "Ana", "activo": true, "edad": 30}'),
  ('{"nombre": "Juan", "activo": false, "edad": 25}');

-- 2 - Insertar al menos 5 productos con diferentes atributos.
INSERT INTO productos (name, specs) VALUES
('Camiseta Deportiva', '{"color":"rojo","size":"M","category":"ropa","material":"poliester","brand":"SportX","stock":150}'::jsonb),
('Zapatillas Runner', '{"color":"negro","size":"42","category":"calzado","material":"malla","brand":"RunFast","stock":60,"weight_g":320}'::jsonb),
('Mochila Urbana', '{"color":"azul","size":"L","category":"accesorios","material":"nylon","brand":"CarryPro","stock":30,"waterproof":true}'::jsonb),
('Laptop Slim 14"', '{"color":"gris","size":"14","category":"electronica","cpu":"i5","ram_gb":8,"brand":"CompuTech","stock":12}'::jsonb),
('Silla Oficina', '{"color":"negro","size":"standard","category":"muebles","material":"cuero","brand":"SitComfort","stock":22,"max_weight_kg":120}'::jsonb);

--2 - Insertar registros con múltiples pares clave-valor
-- Inserta al menos 5 productos con diferentes combinaciones de atributos.
INSERT INTO product(nombre, atributos) VALUES
('camisa','marca=>guchi, color=>rojo, peso=>100g, precio=>800'),
('jabon','marca=>avon, color=>rosa, peso=>500g, precio=>200'),
('labial','marca=>avon, color=>cafe, peso=>50g, precio=>100'),
('lapicero','marca=>bic, color=>azul, peso=>10g, precio=>1000'),
('television','marca=>Sony, color=>negro, peso=>800g, precio=>8000');
