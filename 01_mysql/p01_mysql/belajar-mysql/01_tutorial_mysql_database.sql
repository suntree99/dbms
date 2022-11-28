-- MYSQL DATABASE
-- Database Management System (DBMS) adalah apliksai untuk mengelola data
-- Contoh DBMS yang populer seperti MySQL, PostgreSQL, MongoDB, Oracle, dll.

-- SINTAKS SQL tidak case sensitive (incasesensitive), antara show dengan SHOW sama saja
show engines; -- menampilkan engines yang tersedia di dalam server 
SHOW DATABASES; -- menampilkan semua database yanga di dalam server mySQL

-- MEMBUAT DATABASE
create database belajar_mysql; -- membuat database
use belajar_mysql; -- memilih database untuk digunakan 

-- MEMBUAT TABLE
create table barang -- membuat tabel dalam database yang telah dipilih 
(
id int,
nama varchar(100),
harga int,
jumlah int
);
show tables; -- menampikan tabel
describe barang; -- menampikan field tabel
show create table barang; -- menampilan format pembuatan tabel

-- MENGUBAH TABLE
alter table barang add column salah text; -- menambahkan field baru di akhir kolom
alter table barang drop column salah; --  menghapus field
alter table barang modify nama varchar(200) after deskripsi; -- memodifikasi posisi field
alter table barang modify nama varchar(200) first; -- memodifikasi posisi field menjadi di awal
-- NULL VALUE
alter table barang modify id int not null; -- memodifikasi field tidak boleh null
alter table barang modify nama varchar(200) not null; -- memodifikasi field tidak boleh null
-- DEFAULT VALUE
alter table barang modify harga int not null default 0; -- memodifikasi field dengan menambahkan nilai default
alter table barang modify jumlah int not null default 0; -- memodifikasi field dengan menambahkan nilai default
alter table barang add column waktu_dibuat timestamp not null default current_timestamp; -- menambahkan field timestamp dan memberi nilai default
-- MENGINPUT DATA
insert into barang (id, nama) value (1, 'Apel'); -- menginput data
-- MENAMPILKAN DATA
select * from barang; -- menampilkan seluruh data
-- MEMBERSIHKAN TABEL
truncate barang; -- menghapus seluruh data tabel
-- MENGHAPUS TABEL
drop table barang; -- mengapus tabel

-- MEMBUAT TABEL BARU (merapikan sintaks SQL dengan huruf KAPITAL)
CREATE TABLE products
(
	id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price INT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB; -- membua tabel degan menyertakan engine yang dipilih
SHOW TABLES; -- menampilkan tabel
DESCRIBE products; -- menampilkan struktur tabel

-- MENGINPUT DATA
INSERT INTO products (id, name, price, quantity) 
VALUES ('P0001', 'Mie Ayam Original', 15000, 100); -- menginput data berdasarkan field yang dipilih
-- ----------
SELECT * FROM products; --  menampilkan data
-- ----------
INSERT INTO products (id, name, description, price, quantity) 
VALUES ('P0002', 'Mie Ayam Bakso', 'Mie Ayam Original + Bakso', 20000, 100); -- menginput data berdasarkan field yang dipilih
INSERT INTO products (id, name, price, quantity) 
VALUES 	('P0003', 'Mie Ayam Ceker', 20000, 100),
		('P0004', 'Mie Ayam Spesial', 25000, 100),
        ('P0005', 'Mie Ayam Yamin', 15000, 100); -- menginput data berdasarkan field yang dipilih
-- MENAMPILKAN DATA
SELECT id, name, price, quantity
FROM products; -- menampilkan data bedasarkan field yang dipilih
SELECT name, quantity, id
FROM products; -- menampilkan data bedasarkan field yang dipilih

-- MENAMBAHKAN PRIMARY KEY
ALTER TABLE products
ADD PRIMARY KEY (id); -- menambahkan primary key kepada salah satu field
-- TEST DUPLIKAT DATA (PRIMARY KEY)
INSERT INTO products (id, name, price, quantity) 
VALUES ('P0001', 'Mie Ayam Original', 15000, 100); -- mencoba memasukkan data dengan primary key yang sama --> error

-- FILTER PENCARIAN
SELECT * FROM products WHERE quantity = 100; -- mencari berdasarkan quantity tertentu
SELECT * FROM products WHERE price = 15000; -- mencari berdasarkan price tertentu
SELECT * FROM products WHERE id = 'P0001'; -- mencari berdasarkan id tertentu
SELECT * FROM products WHERE name = 'mie ayam bakso'; -- incase sensitive masih tetap berlaku dalam stringnya

-- MENAMBAH FIELD ENUM
ALTER TABLE products
ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-lain')
AFTER name; -- membuat field bertipe enum
-- ----------
SELECT * FROM products; --  menampilkan data
-- ----------

-- UPDATE DATA
UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001'; -- mengupdate data
UPDATE products
SET category = 'Makanan',
	description = 'Mie Ayam Original + Ceker'
WHERE id = 'P0003'; -- mengupdate data beberapa field
UPDATE products
SET price = price + 5000
WHERE id = 'P0005'; -- mengupdate data dengan memanfaatkan value sebelumnya

-- MENGHAPUS DATA
DELETE FROM products
WHERE id = 'P0009'; -- hati-hati dengan WHERE clause ini, perhatikan dengan cermat

-- ALIAS
SELECT 	id AS Kode,
		name AS Nama,
		category AS Kategory,
        price AS Harga,
        quantity AS Jumlah
FROM products; -- alias pada field

SELECT 	p.id AS Kode,
		p.name AS Nama,
		p.category AS Kategory,
        p.price AS Harga,
        p.quantity AS Jumlah
FROM products AS p; -- alias pada tabel

-- MENAMBAH DATA
INSERT INTO products (id, category, name, price, quantity)
VALUES 	('P0006', 'Makanan', 'Bakso Rusuk', 20000, 200),
		('P0007', 'Minuman',  'Es Jeruk', 10000, 300),
        ('P0008', 'Minuman',  'Es Campur', 15000, 500),
		('P0009', 'Minuman',  'Es Teh Manis', 5000, 400),
        ('P0010', 'Lain-lain',  'Kerupuk', 2500, 1000),
		('P0011', 'Lain-lain',  'Keripik Udang', 10000, 300),
        ('P0012', 'Lain-lain',  'Es Krim', 5000, 200),
		('P0013', 'Makanan',  'Mie Ayam Jamur', 20000, 50),
        ('P0014', 'Makanan',  'Bakso Telor', 20000, 150),
		('P0015', 'Makanan',  'Bakso Jando', 25000, 300); -- menginput data tambahan berdasarkan field yang dipilih
-- MELENGKAPI DATA
UPDATE products SET category = 'Makanan' WHERE id = 'p0002';
UPDATE products SET category = 'Makanan' WHERE id = 'p0004';
UPDATE products SET category = 'Makanan' WHERE id = 'p0005';
-- ----------
SELECT * FROM products; --  menampilkan data
-- ----------

-- WHERE OPERATOR
SELECT * FROM products 
WHERE quantity > 100; --  menampilkan data yang quantitynya lebih dari 100
SELECT * FROM products 
WHERE quantity >= 100; --  menampilkan data yang quantitynya lebih dari 100
SELECT * FROM products 
WHERE category != 'Makanan'; --  menampilkan data yang categorinya bukan makanan
SELECT * FROM products 
WHERE category <> 'Minuman'; --  menampilkan data yang categorinya bukan minuman
-- AND
SELECT * FROM products 
WHERE quantity > 100 AND price > 20000; -- menampilkan data dengan operasi boolean
SELECT * FROM products 
WHERE category = 'Makanan' AND price < 20000; -- menampilkan data dengan operasi boolean
-- OR
SELECT * FROM products 
WHERE quantity > 100 OR price > 20000; -- menampilkan data dengan operasi boolean
-- PRIORITAS ()
SELECT * FROM products 
WHERE (category = 'Makanan' OR quantity > 500) AND price > 20000; -- menampilkan data dengan operasi boolean
-- LIKE
SELECT * FROM products 
WHERE name LIKE 'mie%'; -- menampilkan data yang kata depannya 'mie'
SELECT * FROM products 
WHERE name LIKE '%bakso'; -- menampilkan data yang kata belakangnya 'bakso'
SELECT * FROM products 
WHERE name LIKE '%usu%'; -- menampilkan data yang mengandung kata 'usu'
-- IS NULL
SELECT * FROM products 
WHERE description IS NULL; -- menampilkan data yang description nya NULL
SELECT * FROM products 
WHERE description IS NOT NULL; -- menampilkan data yang description nya TIDAK NULL
-- BETWEEN
SELECT * FROM products 
WHERE price BETWEEN 10000 AND 20000; -- menampilkan data yang harganya antara 10000 - 20000
SELECT * FROM products 
WHERE price NOT BETWEEN 10000 AND 20000; -- menampilkan data yang harganya diluar antara 10000 - 20000
-- IN
SELECT * FROM products 
WHERE category IN ('Makanan', 'Minuman'); -- menampilkan data yang categorinya berada dalam kurung IN
SELECT * FROM products 
WHERE category NOT IN ('Makanan', 'Minuman'); -- menampilkan data yang categorinya selain dalam kurung IN

-- ORDER BY CLAUSE
SELECT * FROM products 
ORDER BY category; -- menampilkan data dengan mengurutkan berdasarkan category (defaultnya ASCENDING)
SELECT id, category, name 
FROM products ORDER BY category; -- menampilkan data dengan field tertentu dan mengurutkan berdasarkan category
SELECT id, category, price, name 
FROM products ORDER BY category ASC, price DESC; -- menampilkan data dengan beberapa pengurutan

-- LIMIT CLAUSE
SELECT * FROM products 
ORDER BY id LIMIT 5; -- menampilkan data pertama dengan jumlah 5
SELECT * FROM products 
ORDER BY id LIMIT 3; -- menampilkan data dengan jumlah 3
SELECT * FROM products 
ORDER BY id LIMIT 0, 5; -- sama seperrti LIMIT 5
SELECT * FROM products 
ORDER BY id LIMIT 10, 5; -- menampilkan data dengan dengan offset atau diskip 5, berjumlah 5 (pagination)
SELECT * FROM products 
ORDER BY id LIMIT 15, 5; -- menampilkan data dengan dengan offset atau diskip 10, berjumlah 5 (pagination)

-- DISTINCT DATA
SELECT category 
FROM products; --  menampilkan data berdasarkan category (termasuk yang duplikat)
SELECT DISTINCT category 
FROM products; -- DISTINCT menghilangkan yang duplikat (hanya 1 kali ditampikan)

-- NUMERIC FUNCTION
SELECT 10 * 10 AS Hasil;
SELECT 10 AS P, 10 AS L, 10 * 10 AS Hasil;
SELECT id, name, price, price DIV 1000 AS 'Price in K' FROM products;
-- MATHEMATICAL FUNCTION
SELECT PI();
SELECT POWER(10,2);
SELECT id, COS(price), SIN(price), TAN(price) FROM products;
SELECT id, name, price
FROM products
WHERE price DIV 1000 > 15 ;

-- AUTO INCREMENT
CREATE TABLE admin
(
	id			INT				NOT NULL AUTO_INCREMENT,
    first_name	VARCHAR(100)	NOT NULL,
	last_name	VARCHAR(100)	NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB; --  membuat table dengan AUTO_INCREMENT (harus pada PRIMARY KEY)
DESCRIBE admin; -- menampilkan struktur tabel
INSERT INTO admin (first_name, last_name)
VALUES	('Budi', 'Darmawan'),
		('Iwan', 'Setiawan'),
        ('Wati', 'Susanti'); -- menambahkan data tanpa menginput id karena sudah AUTO_INCREMENT
-- ----------
SELECT * FROM admin; --  menampilkan seluruh data
-- ----------
DELETE FROM admin 
WHERE id = 3; -- menghapus data dengan id = 3
INSERT INTO admin (first_name, last_name)
VALUES	('Wati', 'Susanti'); -- id akan diteruskan walaupun data sudah dihapus
SELECT LAST_INSERT_ID(); -- menampilkan id yang terakhir dibuat

-- STRING FUNCTION
SELECT 	id,
		LOWER(name) AS 'Name Lower',
		UPPER(name) AS 'Name Lower',
        LENGTH(name) AS 'Name Length'
FROM products;

-- DATE AND TIME FUNCTION
SELECT 	id, created_at,
		EXTRACT(YEAR FROM created_at) AS YEAR,
		EXTRACT(MONTH FROM created_at) AS MONTH
FROM products; -- mengekstak sebagian data dari date_time
SELECT id, created_at, YEAR(created_at), MONTH(created_at) 
FROM products; -- hasilnya sama dengan extract

-- FLOW CONTROL FUNCTION
SELECT 	id,
		category,
        CASE category
        WHEN 'Makanan' THEN 'Enak'
        WHEN 'Minuman' THEN 'Segar'
        ELSE 'Apa Itu?'
        END AS 'Category'
FROM products; -- contoh CASE

SELECT 	id,
		price,
        IF (price <= 15000, 'Murah', IF (price <= 20000, 'Mahal', 'Mahal Banget')) AS 'Mahal?'
FROM products; -- contoh IF

SELECT id, name, IFNULL(description, 'Kosong') 
FROM products; -- contoh IFNULL

-- AGGREGATE FUNCTION (tidak dapat digabungkan dengan field biasa)
SELECT COUNT(id) AS 'Total Product'
FROM products;
SELECT MAX(price) AS 'Product Termahal' 
FROM products;
SELECT MIN(price) AS 'Product Termurah' 
FROM products;
SELECT AVG(price) AS 'Rata-rata Harga' 
FROM products;
SELECT SUM(quantity) AS 'Total Stock' 
FROM products;

-- GROUP BY CLAUSE (khusus aggregat)
SELECT COUNT(id) AS 'Total Product', category
FROM products
GROUP BY category;
SELECT MAX(price) AS 'Product Termahal', category 
FROM products 
GROUP BY category;
SELECT MIN(price) AS 'Product Termurah', category 
FROM products 
GROUP BY category;
SELECT AVG(price) AS 'Rata-rata Harga', category 
FROM products 
GROUP BY category;
SELECT SUM(quantity) AS 'Total Stock', category 
FROM products 
GROUP BY category;

-- HAVING CLAUSE (khusus aggregate, tidak bisa menggunakan where)
SELECT COUNT(id) AS total, category
FROM products
GROUP BY category
HAVING total > 5;

## UNIQUE CONSTRAINT
-- MEMBUAT Unique Constraint
CREATE TABLE customers
(
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(200) NOT NULL,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email)
) ENGINE = InnoDB;
-- Describe
DESCRIBE customers;
-- MENGHILANGKAN Unique Constraint (pada suatu field)
ALTER TABLE customers 
DROP INDEX email_unique;
-- MENAMBAHKAN Unique Constraint (pada suatu field)
ALTER TABLE customers
ADD CONSTRAINT email_unique UNIQUE (email);
-- TEST Unique Constraint (menginput duplikat unique data)
INSERT INTO customers (email, first_name, last_name)
VALUES ('budidarmawan@gmail.com', 'Budi', 'Darmawan'); -- jika dieksekusi lebih dari satu kali akan error
-- ----------
SELECT * FROM customers;
-- ----------

## CHECK CONSTRAINT
-- ----------
SELECT * FROM products;
-- ----------
INSERT INTO products (id, name, category, price, quantity)
VALUES ('P0016', 'Permen', 'Lain-lain', 500, 1000); --  menambahkan data yang harganya 500
-- MENAMBAHKAN Check Constraint (pada suatu field)
ALTER TABLE products
ADD CONSTRAINT price_check CHECK (price >= 1000);
-- Show Create
SHOW CREATE TABLE products;

## INDEX
-- MEMBUAT Index
CREATE TABLE sellers
(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    name2 VARCHAR(100),
    name3 VARCHAR(100),
    email VARCHAR(100) NOT NULL,
	PRIMARY KEY (id),
    UNIQUE KEY email_unique (email),
    INDEX name_index (name),
	INDEX name2_index (name2),
	INDEX name3_index (name3),
	INDEX name1_name2_name3_index (name, name2, name3)
) ENGINE = InnoDB;
-- Describe
DESCRIBE sellers;
-- Show Create
SHOW CREATE TABLE sellers;
-- PENGGUNAAN Index
SELECT * FROM sellers WHERE name = 'X';
SELECT * FROM sellers WHERE name = 'X' AND name2 = 'X';
SELECT * FROM sellers WHERE name = 'X' AND name2 = 'X'AND name3 = 'X';
SELECT * FROM sellers WHERE name2 = 'X';
SELECT * FROM sellers WHERE name = 'X';
-- MENGHILANGKAN Index (pada suatu field)
ALTER TABLE sellers
DROP INDEX name_index;
-- MENAMBAHKAN Index (pada suatu field)
ALTER TABLE sellers
ADD INDEX name_index (name);
-- ----------
SELECT * FROM sellers;
-- ----------

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