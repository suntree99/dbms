# Constraint

## Unique Constraint
* Membuat Unique Constraint
```sql
CREATE TABLE customers
(
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(200) NOT NULL,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email) -- unique constraint
) ENGINE = InnoDB;
```

* Mengecek Unique Constraint
```sql
DESCRIBE customers;
```

* Menghilangkan Unique Constraint (Pada Suatu Field)
```sql
ALTER TABLE customers 
DROP INDEX email_unique;
```

* Menambahkan Unique Constraint (Pada Suatu Field)
```sql
ALTER TABLE customers
ADD CONSTRAINT email_unique UNIQUE (email);
```
* Test Unique Constraint (Menginput Duplikat Unique Data)
```sql
INSERT INTO customers (email, first_name, last_name)
VALUES ('budidarmawan@gmail.com', 'Budi', 'Darmawan'); -- jika dieksekusi lebih dari satu kali akan error
```
```sql
SELECT * FROM customers;
```

## Check Constraint
```sql
SELECT * FROM products;
```
```sql
INSERT INTO products (id, name, category, price, quantity)
VALUES ('P0016', 'Permen', 'Lain-lain', 500, 1000); --  menambahkan data yang harganya 500
```
* Menambahkan Check Constraint (Pada Suatu Field)
```sql
ALTER TABLE products
ADD CONSTRAINT price_check CHECK (price >= 1000);
```
-- Show Create
```sql
SHOW CREATE TABLE products;
```

```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p22_constraint.md'
git push

```