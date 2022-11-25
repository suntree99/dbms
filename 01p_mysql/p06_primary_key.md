# Judul

## Membuat Table Yang Mengandung Kolom Primary Key
```sql
CREATE TABLE
(
    id          VARCHAR(10) NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    price       INT UNSIGNED NOT NULL,
    quantity    INT UNSIGNED NOT NULL DEFAULT 0,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    PRIMARY KEY (id) -- mengeset kolom 'id' sebagai PRIMARY KEY
)
Engine = InnoDB;
```

## Mengubah Table Agar Memiliki Primary Key
```sql
ALTER TABLE products
ADD PRIMARY KEY (id); -- mengeset PRIMARY KEY pada kolom 'id'
```

## Mengecek Primary Key
```sql
DESCRIBE products; -- akan tampil pada kolom KEY = PRI
```
```sql
SHOW CREATE TABLE products; -- akan tanmpil pada bagian bawah
```

## Test Duplikat Primary Key
```sql
INSERT INTO products (id, name, price, quantity) 
VALUES ('P0001', 'Mie Ayam Original', 15000, 100); -- mencoba memasukkan data dengan primary key yang sama --> error
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p06_primary_key.md.'
git push

```