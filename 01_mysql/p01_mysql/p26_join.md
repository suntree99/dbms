# Join

## Join (JOIN - ON)
```sql
SELECT * FROM wishlist 
JOIN products ON (wishlist.id_product = products.id);
```

## Memilih Field Tertentu
```sql
SELECT wishlist.id, products.id, products.name, wishlist.description 
FROM wishlist
JOIN products ON (wishlist.id_product = products.id);
```

## Menggunakan Alias
```sql
SELECT 	w.id AS id_wishlist,
		p.id AS id_product,
        p.name AS product_name,
        w.description AS wishlist_description
FROM wishlist AS w
JOIN products AS p ON (w.id_product = p.id);
```

## Relasi Ke 2 Table
* Menambah Field id_customer
    ```sql
    ALTER TABLE wishlist
    ADD COLUMN id_customer INT;
    ```

* Update id_customer
    ```sql
    UPDATE wishlist
    SET id_customer = 1
    WHERE id = 1;
    ```

* Menambah Foreign Key Kedua
    ```sql
    ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_customer
    FOREIGN KEY (id_customer) REFERENCES customers(id);
    ```

## Test
* Memilih field tertentu
    ```sql
    SELECT customers.email, products.id, products.name, wishlist.description 
    FROM wishlist
    JOIN products ON (wishlist.id_product = products.id)
    JOIN customers ON (wishlist.id_customer = customers.id);
    ```

* Menggunakan Alias
    ```sql
    SELECT 	w.id AS id_wishlist,
            p.id AS id_product,
            p.name AS product_name,
            w.description AS wishlist_description
    FROM wishlist AS w
    JOIN products AS p ON (w.id_product = p.id);
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p26_join.md'
git push

```