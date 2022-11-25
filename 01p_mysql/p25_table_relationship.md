# Table Relationship

## MEMBUAT Foreign Key
```sql
CREATE TABLE wishlist
(
	id          INT         NOT NULL AUTO_INCREMENT,
    id_product  VARCHAR(10) NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
)
ENGINE = InnoDB;
```

* Describe
    ```sql
    DESCRIBE wishlist;
    ```

* Show Create
    ```sql
    SHOW CREATE TABLE wishlist;
    ```

## Menghapus Foreign Key
```sql
ALTER TABLE wishlist
DROP FOREIGN KEY fk_wishlist_product; -- untuk MySQL 5.7
```
```sql
ALTER TABLE wishlist
DROP CONSTRAINT fk_wishlist_product; -- untuk MySQL 8.0
```

## Menambahkan Foreign Key
```sql
ALTER TABLE wishlist
ADD CONSTRAINT fk_wishlist_product
FOREIGN KEY (id_product) REFERENCES products (id);
```

## Test Foreign Key
```sql
INSERT INTO wishlist (id_product, description)
VALUES ('P0001', 'Makanan Kesukaan');
```
```sql
INSERT INTO wishlist (id_product, description)
VALUES ('SALAH', 'Makanan Kesukaan'); -- Foreign Key akan menolak data yang tidak ada di tabel yang berelasi
```
```sql
SELECT * FROM wishlist;
```
```sql
DELETE FROM products
WHERE id = 'P0001'; -- Foreign Key akan menolak menghapus data yang berelasi dengan tabel lain
```

## Behaviour Foreign Key
* RESTRICT (Default)
    * ON DELETE : Ditolak 
    * ON UPDATE : Ditolak
* CASCADE
    * ON DELETE : Data akan dihapus
    * ON UPDATE : Data akan ikut diubah
* CASCADE
    * ON DELETE : Data dibiarkan
    * ON UPDATE : Data dibiarkan
* SET NULL
    * ON DELETE : Diubah jadi NULL (Syarat : Nullable)
    * ON UPDATE : Diubah jadi NULL (Syarat : Nullable)

## Foreign Key ON DELETE CASCADE ON UPDATE CASCADE
*  Menghapus Foreign Key
    ```sql
    ALTER TABLE wishlist
    DROP FOREIGN KEY fk_wishlist_product;
    ```

* Insert Data Product
    ```sql
    INSERT INTO products (id, name, category, price, quantity)
    VALUES 	('Pxxxx', 'Permen', 'Lain-lain', 500, 1000);
    ```

    ```sql
    SELECT * FROM products;
    ```

* Menambahkan Foreign Key ON DELETE CASCADE ON UPDATE CASCADE
    ```sql
    ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
    ON DELETE CASCADE ON UPDATE CASCADE;
    ```

## Test Foreign Key ON DELETE CASCADE ON UPDATE CASCADE
```sql
INSERT INTO wishlist (id_product, description)
VALUES ('Pxxxx', 'Makanan Kesukaan'); -- coba insert beberapa kali
```

    ```sql
    SELECT * FROM wishlist;
    ```

* Delete di product
    ```sql
    DELETE FROM products
    WHERE id = 'Pxxxx'; -- Data di product akan hilang dan juga menghilangkan yang di wishlist (yang berelasi)
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p25_table_relationship.md'
git push

```