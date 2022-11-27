# Index

## Pengenalan Index
* Saat kita membuat index, MySQL akan menyimpan data dalam struktur data Balancing Tree / [B-Tree](https://en.wikipedia.org/wiki/B-tre)
* Index dapat mempercepat pencarian / query namun akan memperlambat insert, update, dan delete data
* Index tidak perlu ditambahkan pada field dengan PRIMARY KEY atau UNIQUE Constraint
* Untuk optimisasi Index dapat mengunjungi laman [Ini](https://dev.mysql.com/doc/refman/8.0/en/optimization-indexes.html)
* Jika data sudah besar dan sedang berjalan, tidak disarankan menambahkan index

## Membuat Index
```sql
CREATE TABLE sellers
(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    name2 VARCHAR(100),
    name3 VARCHAR(100),
    email VARCHAR(100) NOT NULL,
	PRIMARY KEY (id),
    UNIQUE KEY email_unique (email),
    INDEX name_index (name), -- ini tidak perlu jia sudah ada index gabungan yang diawali 'name'
	INDEX name2_index (name2),
	INDEX name3_index (name3),
	INDEX name1_name2_name3_index (name, name2, name3) -- index gabungan
) 
ENGINE = InnoDB;
```

* Mengecek Index
    ```sql
    SHOW CREATE TABLE sellers; -- index dapat terlihat
    ```

## Penggunaan Index
```sql
SELECT * FROM sellers WHERE name = 'X'; -- cepat
SELECT * FROM sellers WHERE name2 = 'X'; -- cepat
SELECT * FROM sellers WHERE name3 = 'X'; -- cepat
SELECT * FROM sellers WHERE name = 'X' AND name2 = 'X'; -- cepat
SELECT * FROM sellers WHERE name = 'X' AND name2 = 'X' AND name3 = 'X';  -- cepat
SELECT * FROM sellers WHERE name2 = 'X' AND name3 = 'X'; -- biasa, tidak kena index
SELECT * FROM sellers WHERE name = 'X' AND name3 = 'X'; -- biasa, tidak kena index
```

## Menghilangkan Index
```sql
ALTER TABLE sellers
DROP INDEX name_index;
```

## Menambahkan Index
```sql
ALTER TABLE sellers
ADD INDEX name_index (name);
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p23_index.md'
git push

```