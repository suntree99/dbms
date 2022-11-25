# Where Operator

## Operator Pada MySQL
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

## Menambah Dan Melengkapi Data
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

## Operator Perbandingan
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

## Operator AND
```sql
SELECT * FROM products 
WHERE quantity > 100 AND price > 20000; -- menampilkan data dengan operasi boolean
```
```sql
SELECT * FROM products 
WHERE category = 'Makanan' AND price < 20000; -- menampilkan data dengan operasi boolean
```

## Operator OR
```sql
SELECT * FROM products 
WHERE quantity > 100 OR price > 20000; -- menampilkan data dengan operasi boolean
```

## Prioritas Pada Operator AND & OR
```sql
SELECT * FROM products 
WHERE (category = 'Makanan' OR quantity > 500) AND price > 20000;
-- menampilkan data operasi boolean dengan memproiritaskan yang berada dalam kurung
-- secara default (jika tidak diberi kurung) diprioritaskan operator AND
```

## Operator LIKE, NOT LIKE, Dan Posisi Wild Card (%)
* Operator LIKE sangat lambat, tidak disarankan jika datanya terlalu besar
* Operator LIKE tidak case sensitive, huruf besar dan kecil tidak berpengaruh
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
```sql
SELECT * FROM products 
WHERE name NOT LIKE '%usu%'; -- menampilkan data yang tidak mengandung kata 'usu'
```

## Operator IS NULL Dan IS NOT NULL
```sql
SELECT * FROM products 
WHERE description IS NULL; -- menampilkan data yang description nya NULL
```
```sql
SELECT * FROM products 
WHERE description IS NOT NULL; -- menampilkan data yang description nya TIDAK NULL
```

## Operator BETWEEN
```sql
SELECT * FROM products 
WHERE price BETWEEN 10000 AND 20000; -- menampilkan data yang harganya antara 10000 - 20000
```
```sql
SELECT * FROM products 
WHERE price NOT BETWEEN 10000 AND 20000; -- menampilkan data yang harganya diluar antara 10000 - 20000
```

## Operator IN Dan NOT IN
```sql
SELECT * FROM products 
WHERE category IN ('Makanan', 'Minuman'); -- menampilkan data yang categorinya berada dalam kurung IN
```
```sql
SELECT * FROM products 
WHERE category NOT IN ('Makanan', 'Minuman'); -- menampilkan data yang categorinya selain dalam kurung IN
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p11_where_operator.md'
git push

```