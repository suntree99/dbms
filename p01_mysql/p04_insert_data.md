# Insert Data

## Unsign Value (UNSIGNED)
Membuat table baru (products) dengan kolom bernilai UNSIGNED
```sql
CREATE TABLE products
(
    id          VARCHAR(10) NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    price       INT UNSIGNED NOT NULL, -- kolom 'price' diset UNSIGNED karena tidak boleh negatif
    quantity    INT UNSIGNED NOT NULL DEFAULT 0, -- kolom 'quantity' diset UNSIGNED karena tidak boleh negatif
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)
Engine = InnoDB;
```

## Insert Single Data (INSERT INTO - VALUE)
Kolom yang akan di INSERT harus ditentukan dan diisi VALUES dengan urutan yang sesuai
```sql
INSERT INTO products (id, name, price, quantity) 
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);
```
```sql
INSERT INTO products (id, name, description, price, quantity) 
VALUES ('P0002', 'Mie Ayam Bakso', 'Mie Ayam Original + Bakso', 20000, 100); 
```

## Insert Multiple Data
```sql
INSERT INTO products (id, name, price, quantity) 
VALUES 	('P0003', 'Mie Ayam Ceker', 20000, 100),
		('P0004', 'Mie Ayam Spesial', 25000, 100),
        ('P0005', 'Mie Ayam Yamin', 15000, 100);
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p04_insert.md'
git push

```