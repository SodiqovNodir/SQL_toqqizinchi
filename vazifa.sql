
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS products;

-- ---------------------------- jadval yaratish --------------------------------------

CREATE TABLE IF NOT EXISTS categories(
	id SERIAL PRIMARY KEY,
	cat_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS products(
  id SERIAL PRIMARY KEY,
  pro_name VARCHAR(50),
  added DATE DEFAULT CURRENT_DATE,
  price NUMERIC(10, 2),
  category_id INTEGER REFERENCES categories(id)
);

-- ---------------------------- malumot kiritish --------------------------------------

INSERT INTO categories(cat_name) VALUES
('Kiyimlar'),
('Oyoq Kiyimlar'),
('Mayshiy Texnika'),
('Oziq Ovqat'),
('O''yinchoqlar'),
('Gullar');

INSERT INTO products(pro_name, added, price, category_id) VALUES
('Krasofka', '2024-09-23', 200000, 2),
('Ko''z oynak', '2021-09-31', 150000, null),
('Palto', '2024-02-13', 200000, 1),
('Sapok', '2023-02-11', 350000, 2),
('Haladelnik', '2023-11-21', 3500000, 3),
('Oynak', '2021-09-24', 100000, null),
('Ayiqcha', '2023-02-03', 500000, 5),
('Kabel', '2023-12-11', 25000, null),
('Soch Mashinkasi', '2023-02-11', 350000, null),
('Konditsaner', '2024-09-23', 5000000, 3),
('Basanoshka', '2023-02-12', 150000, 2),
('Naushnik', '2021-09-10', 150000, null),
('Lego', '2023-02-03', 50000, 5),
('Kurtka', '2023-02-03', 500000, 1),
('Tungi chiroq', '2021-09-01', 100000, null);

-- ---------------------------- jadvalni chiqarish --------------------------------------

SELECT pro_name, cat_name, price, TO_CHAR(added, 'dd.mm.yyyy') FROM products
JOIN categories ON products.category_id = categories.id;

SELECT pro_name, cat_name, price, TO_CHAR(added, 'dd.mm.yyyy') FROM products
LEFT JOIN categories ON products.category_id = categories.id;

SELECT pro_name, cat_name, price, TO_CHAR(added, 'dd.mm.yyyy') FROM products
RIGHT JOIN categories ON products.category_id = categories.id;

SELECT cat_name, pro_name, price, TO_CHAR(added, 'dd.mm.yyyy') FROM categories 
JOIN products ON categories.id = products.category_id;

SELECT pro_name, cat_name, price, added FROM products 
LEFT JOIN categories ON categories.id = products.category_id 
WHERE products.category_id IS NULL;

SELECT pro_name, cat_name, price, TO_CHAR(added, 'dd.mm.yyyy') FROM products
FULL JOIN categories ON products.category_id = categories.id;

SELECT pro_name, cat_name, price, TO_CHAR(added, 'dd.mm.yyyy') FROM products
CROSS JOIN categories ON products.category_id = categories.id;

SELECT * FROM products CROSS JOIN categories
ON products.category_id = categories.id;

SELECT pro_name, cat_name, price, TO_CHAR(added, 'dd.mm.yyyy') FROM products
NATURAL JOIN categories;

CREATE TABLE IF NOT EXISTS actors(
	id SERIAL PRIMARY KEY,
	act_name VARCHAR(25),
	act_yonalish VARCHAR(50),
	filmlar_soni CHAR(3)
);

CREATE TABLE IF NOT EXISTS films(
	id SERIAL PRIMARY KEY,
	film_name VARCHAR(50),
	film_price NUMERIC(15, 2),
	added DATE
);




















