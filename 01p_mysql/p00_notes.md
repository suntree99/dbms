
# DELETE
## 29. Menghapus Data
```sql
DELETE FROM products
WHERE id = 'P0009'; -- hati-hati dengan WHERE clause ini, perhatikan dengan cermat
```

# ALIAS
## 30. Alias Pada Field
```sql
SELECT 	id AS Kode,
		name AS Nama,
		category AS Kategory,
        price AS Harga,
        quantity AS Jumlah
FROM products;
```

## 31. Alias Pada Table
```sql
SELECT 	p.id AS Kode,
		p.name AS Nama,
		p.category AS Kategory,
        p.price AS Harga,
        p.quantity AS Jumlah
FROM products AS p;
```

# OPERATOR
## 32. Operator Pada MySQL
* Operator Perbandingan
    * = (Sama dengan)
    * <> atau != (Tidak sama dengan)
    * < (Kurang dari)
    * \> (lebih dari)
    * <= (Kurang dari atau sama dengan)
    * \>= (Lebih dari atau sama dengan)

* Operator AND & OR
    * AND (Operator DAN)
    * OR (Operator ATAU)

## 33. Menambah Dan Melengkapi Data
```sql
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
```
```sql
UPDATE products SET category = 'Makanan' WHERE id = 'p0002';
UPDATE products SET category = 'Makanan' WHERE id = 'p0004';
UPDATE products SET category = 'Makanan' WHERE id = 'p0005';
```

## 33. Operator Perbandingan
```sql
SELECT * FROM products 
WHERE quantity > 100; --  menampilkan data yang quantitynya lebih dari 100
```
```sql
SELECT * FROM products 
WHERE quantity >= 100; --  menampilkan data yang quantitynya lebih dari 100
```
```sql
SELECT * FROM products 
WHERE category != 'Makanan'; --  menampilkan data yang categorinya bukan makanan
```
```sql
SELECT * FROM products 
WHERE category <> 'Minuman'; --  menampilkan data yang categorinya bukan minuman
```

## 34. Operator AND
```sql
SELECT * FROM products 
WHERE quantity > 100 AND price > 20000; -- menampilkan data dengan operasi boolean
```
```sql
SELECT * FROM products 
WHERE category = 'Makanan' AND price < 20000; -- menampilkan data dengan operasi boolean
```

## 35. Operator OR
```sql
SELECT * FROM products 
WHERE quantity > 100 OR price > 20000; -- menampilkan data dengan operasi boolean
```

## 36. Prioritas Pada Operator AND & OR
```sql
SELECT * FROM products 
WHERE (category = 'Makanan' OR quantity > 500) AND price > 20000; -- menampilkan data dengan operasi boolean
-- secara default diprioritaskan operator AND
```

## 37. Operator LIKE
```sql
SELECT * FROM products 
WHERE name LIKE 'mie%'; -- menampilkan data yang kata depannya 'mie'
```
```sql
SELECT * FROM products 
WHERE name LIKE '%bakso'; -- menampilkan data yang kata belakangnya 'bakso'
```
```sql
SELECT * FROM products 
WHERE name LIKE '%usu%'; -- menampilkan data yang mengandung kata 'usu'
```

## 38. Operator IS NULL 
```sql
SELECT * FROM products 
WHERE description IS NULL; -- menampilkan data yang description nya NULL
```
```sql
SELECT * FROM products 
WHERE description IS NOT NULL; -- menampilkan data yang description nya TIDAK NULL
```

## 39. Operator BETWEEN
```sql
SELECT * FROM products 
WHERE price BETWEEN 10000 AND 20000; -- menampilkan data yang harganya antara 10000 - 20000
```
```sql
SELECT * FROM products 
WHERE price NOT BETWEEN 10000 AND 20000; -- menampilkan data yang harganya diluar antara 10000 - 20000
```

## 40. Operator IN 
```sql
SELECT * FROM products 
WHERE category IN ('Makanan', 'Minuman'); -- menampilkan data yang categorinya berada dalam kurung IN
```
```sql
SELECT * FROM products 
WHERE category NOT IN ('Makanan', 'Minuman'); -- menampilkan data yang categorinya selain dalam kurung IN
```
# CLAUSE
## 41. ORDER BY Clause
```sql
SELECT * FROM products 
ORDER BY category; -- menampilkan data dengan mengurutkan berdasarkan category (defaultnya ASCENDING)
```
```sql
SELECT id, category, name 
FROM products ORDER BY category; -- menampilkan data dengan field tertentu dan mengurutkan berdasarkan category
```
```sql
SELECT id, category, price, name 
FROM products ORDER BY category ASC, price DESC; -- menampilkan data dengan beberapa pengurutan
```

## 42. LIMIT Clause
```sql
SELECT * FROM products 
ORDER BY id LIMIT 5; -- menampilkan data pertama dengan jumlah 5
```
```sql
SELECT * FROM products 
ORDER BY id LIMIT 3; -- menampilkan data dengan jumlah 3
```
```sql
SELECT * FROM products 
ORDER BY id LIMIT 0, 5; -- sama seperrti LIMIT 5
```
```sql
SELECT * FROM products 
ORDER BY id LIMIT 10, 5; -- menampilkan data dengan dengan offset atau diskip 5, berjumlah 5 (pagination)
```
```sql
SELECT * FROM products 
ORDER BY id LIMIT 15, 5; -- menampilkan data dengan dengan offset atau diskip 10, berjumlah 5 (pagination)
```

## 43. DISTINCT Data
```sql
SELECT category 
FROM products; --  menampilkan data berdasarkan category (termasuk yang duplikat)
```
```sql
SELECT DISTINCT category 
FROM products; -- DISTINCT menghilangkan yang duplikat (hanya 1 kali ditampikan)
```

# FUNCTION
## 44. Operator Aritmatika pada MySQL
* % atau MOD (Operator Modulo)
* \* (Operator perkalian)
* \+ (Oerator penjumlahan)
* \- (Oerator pengurangan)
* \- (Mengubah nilai menjadi negatif)
* / (Oerator pembagian)
* DIV (Operator pembagian integer)

## 44. Numeric Function
```sql
SELECT 10 * 10 AS Hasil;
```
```sql
SELECT 10 AS P, 10 AS L, 10 * 10 AS Hasil;
```
```sql
SELECT id, name, price, price DIV 1000 AS 'Price in K' FROM products;
```

## 45. Mathematical Function
```sql
SELECT PI();
```
```sql
SELECT POWER(10,2);
```
```sql
SELECT id, COS(price), SIN(price), TAN(price) FROM products;
```
```sql
SELECT id, name, price
FROM products
WHERE price DIV 1000 > 15 ;
```

# AUTO INCREMENT
## 46. Membuat Tabel Dengan Auto Increment
```sql
CREATE TABLE admin
(
	id			INT				NOT NULL AUTO_INCREMENT,
    first_name	VARCHAR(100)	NOT NULL,
	last_name	VARCHAR(100)	NOT NULL,
    PRIMARY KEY (id)
) 
ENGINE = InnoDB; --  membuat table dengan AUTO_INCREMENT (harus pada PRIMARY KEY)
```

## 47. Menambah Data Tabel Yang Mengandung Auto Increment
```sql
INSERT INTO admin (first_name, last_name)
VALUES	('Budi', 'Darmawan'),
		('Iwan', 'Setiawan'),
        ('Wati', 'Susanti'); -- menambahkan data tanpa menginput id karena sudah AUTO_INCREMENT
```

## 48. Menghapus Data Tabel Yang Mengandung Auto Increment
```sql
DELETE FROM admin 
WHERE id = 3; -- menghapus data dengan id = 3
```

## 49. Menambahkan Data Kembali Data Tabel Yang Mengandung Auto Increment
```sql
INSERT INTO admin (first_name, last_name)
VALUES	('Wati', 'Susanti'); -- id akan diteruskan walaupun data sudah dihapus
```

## 50. Menampilkan Id Yang Terakhir Dibuat
```sql
SELECT LAST_INSERT_ID(); -- id 4
```

## 51. String Function
```sql
SELECT 	id,
		LOWER(name) AS 'Name Lower',
		UPPER(name) AS 'Name Lower',
        LENGTH(name) AS 'Name Length'
FROM products;
```

## 52. Date And Time Function
```sql
SELECT 	id, created_at,
		EXTRACT(YEAR FROM created_at) AS YEAR,
		EXTRACT(MONTH FROM created_at) AS MONTH
FROM products; -- mengekstak sebagian data dari date_time
```
```sql
SELECT id, created_at, YEAR(created_at), MONTH(created_at) 
FROM products; -- hasilnya sama dengan extract
```

## 53. Flow Control Function
```sql
SELECT 	id,
		category,
        CASE category
        WHEN 'Makanan' THEN 'Enak'
        WHEN 'Minuman' THEN 'Segar'
        ELSE 'Apa Itu?'
        END AS 'Category'
FROM products; -- contoh CASE
```
```sql
SELECT 	id,
		price,
        IF (price <= 15000, 'Murah', IF (price <= 20000, 'Mahal', 'Mahal Banget')) AS 'Mahal?'
FROM products; -- contoh IF
```
```sql
SELECT id, name, IFNULL(description, 'Kosong') 
FROM products; -- contoh IFNULL
```

## 54. Aggregate Function (tidak dapat digabungkan dengan field biasa)
```sql
SELECT COUNT(id) AS 'Total Product'
FROM products;
```
```sql
SELECT MAX(price) AS 'Product Termahal' 
FROM products;
```
```sql
SELECT MIN(price) AS 'Product Termurah' 
FROM products;
```
```sql
SELECT AVG(price) AS 'Rata-rata Harga' 
FROM products;
```
```sql
SELECT SUM(quantity) AS 'Total Stock' 
FROM products;
```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```


##
##

# Heading 1 / Judul Utama (gunakan #)

## Heading 2 / Sub Judul (gunakan ##)

Text biasa (ditulis biasa tanpa format apapun)

[Hyperlink](https://www.google.com) (nama hyperlink dibungkus kurung siku, urlnya dibungkus tanda kurung biasa)

```bash
git add .
git commit -m "baris code menggunakan backtick 3x di awal(sertakan bahasanya) dan akhir code"
git push
```

Untuk `menyoroti` bungkus text dengan backtick 1x

# Template



```sql

```

Update README.md