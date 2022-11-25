

## FULL TEXT SEARCH
-- MENAMBAHKAN Full-Text Search
ALTER TABLE products
ADD FULLTEXT products_fulltext (name, description);
-- Show Create
SHOW CREATE TABLE products;
-- Cara konvensional (LIKE)
SELECT * FROM products
WHERE name LIKE '%mie%' OR description LIKE '%mie%'; -- diurutkan berdasarkan id 
-- TEST Full-Text Search
-- Natural Languge Mode
SELECT * FROM Products
WHERE MATCH (name, description)
AGAINST ('ayam' IN NATURAL LANGUAGE MODE); -- diurutkan berdasarkan ranking penemuan kata 'mie'
-- Boolean Mode
SELECT * FROM Products
WHERE MATCH (name, description)
AGAINST ('+ayam -bakso' IN BOOLEAN MODE); -- mencari yang mengandung 'mie' tanpa mengandung 'bakso'
-- Query Expansion Mode
SELECT * FROM Products
WHERE MATCH (name, description)
AGAINST ('bakso' WITH QUERY EXPANSION); -- diurutkan berdasarkan ranking penemuan kata 'bakso' kemudian dilanjutkan dengan yang berhubungan dengan pencarian sebelumnya


## TABLE RELATIONSHIP
-- MEMBUAT Foreign Key
CREATE TABLE wishlist
(
	id INT NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
) ENGINE = InnoDB;
-- Describe
DESCRIBE wishlist;
-- Show Create
SHOW CREATE TABLE wishlist;
-- MEMBUANG Foreign Key
ALTER TABLE wishlist
DROP FOREIGN KEY fk_wishlist_product;
-- MENAMBAHKAN Foreign Key
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id);
-- TEST Foreign Key
INSERT INTO wishlist (id_product, description)
VALUES ('P0001', 'Makanan Kesukaan');
INSERT INTO wishlist (id_product, description)
VALUES ('SALAH', 'Makanan Kesukaan'); -- Foreign Key akan menolak data yang tidak ada di tabel yang berelasi
-- ----------
SELECT * FROM wishlist;
-- ----------
DELETE FROM products
WHERE id = 'P0001'; -- Foreign Key akan menolak menghapus data yang berelasi dengan tabel lain

-- FOREIGN KEY ON DELETE CASCADE ON UPDATE CASCADE
-- MEMBUANG Foreign Key
ALTER TABLE wishlist
DROP FOREIGN KEY fk_wishlist_product;
-- Insert Data Product
INSERT INTO products (id, name, category, price, quantity)
VALUES 	('Pxxxx', 'Permen', 'Lain-lain', 500, 1000);
-- ----------
SELECT * FROM products;
-- ----------
-- MENAMBAHKAN Foreign Key ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
ON DELETE CASCADE ON UPDATE CASCADE;
-- TEST Foreign Key ON DELETE CASCADE ON UPDATE CASCADE
INSERT INTO wishlist (id_product, description)
VALUES ('Pxxxx', 'Makanan Kesukaan'); -- coba insert beberapa kali
-- ----------
SELECT * FROM wishlist;
-- ----------
-- Delete di product
DELETE FROM products
WHERE id = 'Pxxxx'; -- Data di product akan hilang dan juga menghilangkan yang di wishlist (yang berelasi)

## JOIN
SELECT * FROM wishlist 
JOIN products ON (wishlist.id_product = products.id);
-- Memilih field tertentu
SELECT wishlist.id, products.id, products.name, wishlist.description 
FROM wishlist
JOIN products ON (wishlist.id_product = products.id);
-- Menggunakan Alias
SELECT 	w.id AS id_wishlist,
		p.id AS id_product,
        p.name AS product_name,
        w.description AS wishlist_description
FROM wishlist AS w
JOIN products AS p ON (w.id_product = p.id);

-- RELASI KE 2 TABEL
DESC customers;
-- Menambah field id_customer
ALTER TABLE wishlist
ADD COLUMN id_customer INT;
-- Describe
DESC wishlist;
-- MENAMBAH Foreign Key kedua
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_customer
FOREIGN KEY (id_customer) REFERENCES customers(id);
-- Show
SHOW CREATE TABLE wishlist;
-- ----------
SELECT * FROM customers;
-- ----------
SELECT * FROM wishlist;
-- ----------
UPDATE wishlist
SET id_customer = 1
WHERE id = 1;
-- TEST
-- Memilih field tertentu
SELECT customers.email, products.id, products.name, wishlist.description 
FROM wishlist
JOIN products ON (wishlist.id_product = products.id)
JOIN customers ON (wishlist.id_customer = customers.id);
-- Menggunakan Alias
SELECT 	w.id AS id_wishlist,
		p.id AS id_product,
        p.name AS product_name,
        w.description AS wishlist_description
FROM wishlist AS w
JOIN products AS p ON (w.id_product = p.id);

## ONE TO ONE RELATIONSHIP
CREATE TABLE wallet
(
	id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY id_customer_unique (id_customer),
    FOREIGN KEY fk_wallet_customer (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;
-- Describe
DESC wallet;
-- ----------
SELECT * FROM customers;
-- ----------
INSERT INTO wallet (id_customer)
VALUES (1), (3);
-- ----------
SELECT * FROM wallet;
-- ----------
SELECT customers.email, wallet.balance
FROM wallet JOIN customers ON (wallet.id_customer = customers.id);

## ONE TO MANY RELATIONSHIP
CREATE TABLE categories
(
	id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;
-- Describe
DESC categories;
-- Membuang field category di tabel products
ALTER TABLE products
DROP COLUMN category;
-- Describe
DESC products;
-- Menambahkan field id_category
ALTER TABLE products
ADD COLUMN id_category VARCHAR(10);
-- Membuat Constraint
ALTER TABLE products
ADD CONSTRAINT fk_product_categories
FOREIGN KEY (id_category) REFERENCES categories (id);
-- ----------
SELECT * FROM products;
-- ----------
SELECT * FROM categories;
-- ----------
INSERT INTO categories (id, name)
VALUES	('C0001', 'Makanan'),
		('C0002', 'Minuman'),
		('C0003', 'Lain-lain');
-- Update products
UPDATE products
SET id_category = 'C0001'
WHERE id IN ('P0001', 'P0002', 'P0003', 'P0004', 'P0005', 'P0006', 'P0013', 'P0014', 'P0015');
UPDATE products
SET id_category = 'C0002'
WHERE id IN ('P0007', 'P0008', 'P0009');
UPDATE products
SET id_category = 'C0003'
WHERE id IN ('P0010', 'P0011', 'P0012', 'P0016' );
-- Join
SELECT products.id, products.name, categories.name
FROM products
JOIN categories ON (categories.id = products.id_category);

## MANY TO MANY RELATIONSHIP
-- Membuat tabel orders
CREATE TABLE orders
(
	id INT NOT NULL AUTO_INCREMENT,
    total INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE = InnoDB;
-- Describe
DESC orders;
-- Membuat tabel perantara
CREATE TABLE orders_detail
(
	id_product VARCHAR(10) NOT NULL,
    id_order INT NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id_product, id_order)
) ENGINE = InnoDB;
-- Describe
DESC orders_detail;
-- Constraint
ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_products
FOREIGN KEY (id_product) REFERENCES products (id);
ALTER TABLE orders_detail
ADD CONSTRAINT fk_orders_detail_orders
FOREIGN KEY (id_order) REFERENCES orders (id);
-- Show
SHOW CREATE TABLE orders_detail;
-- Menginput orders
INSERT INTO orders (total)
VALUES (50000);
-- ----------
SELECT * FROM orders;
-- ----------
INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES 	('P0001', 1, 25000, 1),
		('P0002', 1, 25000, 1);
INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES 	('P0003', 2, 25000, 1),
		('P0004', 3, 25000, 1);
INSERT INTO orders_detail (id_product, id_order, price, quantity)
VALUES 	('P0001', 2, 25000, 1),
		('P0003', 3, 25000, 1);
-- ----------
SELECT * FROM orders_detail;
-- ----------
SELECT * FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (products.id = orders_detail.id_product);
-- 
SELECT orders.id, products.id, products.name, orders_detail.quantity, orders_detail.price FROM orders
JOIN orders_detail ON (orders_detail.id_order = orders.id)
JOIN products ON (products.id = orders_detail.id_product);

## INNER JOIN
-- ----------
SELECT * FROM categories;
-- ----------
-- Menambah category yang tidak dipakai
INSERT INTO categories (id, name)
VALUES	('C0004', 'Oleh-oleh'),
		('C0005', 'Gadget');
-- Menambah product yang tidak memiliki category
INSERT INTO products (id, name, price, quantity)
VALUES 	('X0001', 'X Satu', 25000, 200),
		('X0002', 'X Dua',  10000, 300),
        ('X0003', 'X Tiga', 15000, 500);
-- ----------
SELECT * FROM products;
-- ----------
-- JOIN (default INNER JOIN -> hasilnya sama)
SELECT * FROM categories
JOIN products ON (products.id_category = categories.id);
-- INNER JOIN
SELECT * FROM categories
INNER JOIN products ON (products.id_category = categories.id);
-- LEFT JOIN (data categories semua diambil, product -> null)
SELECT * FROM categories
LEFT JOIN products ON (products.id_category = categories.id);
-- RIGHT JOIN (data product semua diambil, category -> null)
SELECT * FROM categories
RIGHT JOIN products ON (products.id_category = categories.id);
-- CROSS JOIN (mengalikan data tabel 1 dengan data tabel 2)
SELECT * FROM categories
CROSS JOIN products;

-- Membuat Tabel Perkalian
CREATE TABLE numbers (
id INT NOT NULL,
PRIMARY KEY (id)
) ENGINE = InnoDB;
-- Input Data
INSERT INTO numbers (id) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);
-- ----------
SELECT * FROM numbers;
-- ----------
SELECT numbers1.id, numbers2.id, (numbers1.id * numbers2.id)
FROM numbers AS numbers1
CROSS JOIN numbers AS numbers2
ORDER BY numbers1.id, numbers2.id;

## SUB-QUERY
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);
-- Mencari max price
SELECT MAX(price) FROM products;
-- ----------
SELECT * FROM products;
-- ----------
-- Sub-Query dari JOIN
SELECT MAX(price) FROM (SELECT price FROM categories JOIN products ON (products.id_category = categories.id)) as cp;
-- Update
UPDATE products
SET price = 1000000
WHERE id = 'X0003';
-- Sub-Query dari FROM

## Membuuat Tabel Baru
CREATE TABLE guestbook
(
	id		INT NOT NULL AUTO_INCREMENT,
    email 	VARCHAR(100),
    title	VARCHAR(200),
    content	TEXT,
    PRIMARY KEY (id)
) ENGINE = InnoDB;
-- Mencari Customer
SELECT * FROM customers;
-- Insert Data
INSERT INTO guestbook(email, title, content)
VALUES 	('guest@gmail.com', 'Hello', 'Hello'),
		('guest2@gmail.com', 'Hello', 'Hello'),
        ('guest3@gmail.com', 'Hello', 'Hello'),
        ('budidarmawan@gmail.com', 'Hello', 'Hello'),
        ('budidarmawan@gmail.com', 'Hello', 'Hello'),
        ('budidarmawan@gmail.com', 'Hello', 'Hello');
-- ----------
SELECT * FROM guestbook;
-- ----------
-- UNION (Menggabungkan isi 2 Tabel tanpa data duplikat)
SELECT email FROM customers
UNION
SELECT email FROM guestbook;
-- UNION (Menggabungkan isi 2 Tabel dengan data duplikat)
SELECT email FROM customers
UNION ALL
SELECT email FROM guestbook;
-- Count UNION ALL
SELECT emails.email, COUNT(emails.email)
FROM (	SELECT email FROM customers
		UNION ALL
        SELECT email FROM guestbook ) as emails
GROUP BY emails.email;

-- INTERSECT (Tidak ada sintaks khusus di MySQL, disiasati dengan cara berikut)
SELECT DISTINCT email from customers
WHERE email IN (SELECT DISTINCT email from guestbook);
-- INTERSECT dengan JOIN
SELECT DISTINCT customers.email from customers
INNER JOIN guestbook ON (guestbook.email = customers.email);

-- MINUS (Tidak ada sintaks khusus di MySQL, disiasati dengan cara berikut)
SELECT DISTINCT customers.email, guestbook.email from customers
LEFT JOIN guestbook ON (customers.email = guestbook.email)
WHERE guestbook.email IS NULL;

## TRANSACTION with COMMIT
START TRANSACTION;
-- Insert
INSERT INTO guestbook(email, title, content)
VALUES 	('contoh@gmail.com', 'Hello', 'Hello'),
		('contoh2@gmail.com', 'Hello', 'Hello'),
        ('contoh3@gmail.com', 'Hello', 'Hello');
-- ----------
SELECT * FROM guestbook;
-- ----------
-- COMMIT
COMMIT;

## TRANSACTION with ROLLBACK
START TRANSACTION;
-- Delete
DELETE FROM guestbook;
-- ROLLBACK
ROLLBACK;

## LOCKING
-- User 1
START TRANSACTION;
UPDATE guestbook
SET title = '1'
WHERE id = 27;
SELECT * FROM guestbook;
COMMIT;

## LOCKING MANUAL dengan FOR UPDATE
START TRANSACTION;
SELECT * FROM products;
SELECT * FROM products
WHERE id = 'P0001'
FOR UPDATE;
UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';
COMMIT;

## DEADLOCK
START TRANSACTION;
SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;
SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;

## LOCK TABLES READ
LOCK TABLES products READ;
SELECT * FROM products;
UPDATE products
SET quantity = 100
WHERE id = 'P0001';
UNLOCK TABLES;

## LOCK TABLES WRITE
LOCK TABLES products WRITE;
SELECT * FROM products;
UPDATE products
SET quantity = 150
WHERE id = 'P0001';
UNLOCK TABLES;

## LOCK INSTANCE FOR BACKUP (MySQL Version 8)
LOCK INSTANCE FOR BACKUP;
UNLOCK INSTANCE;

## Membuat USER
CREATE USER 'budi'@'localhost';
CREATE USER 'darmawan'@'%';

DROP USER 'budi'@'localhost';
DROP USER 'darmawan'@'%';

GRANT SELECT ON belajar_mysql.* TO  'budi'@'localhost';

GRANT SELECT ON belajar_mysql.* TO  'darmawan'@'%';
GRANT INSERT, UPDATE, DELETE ON belajar_mysql.* TO  'darmawan'@'%';

SHOW GRANTS FOR 'budi'@'localhost';
SHOW GRANTS FOR 'darmawan'@'%';

SET PASSWORD FOR 'budi'@'localhost' = 'rahasia';
SET PASSWORD FOR 'darmawan'@'%' = 'rahasiajuga';