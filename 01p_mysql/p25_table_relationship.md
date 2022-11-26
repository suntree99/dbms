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
* Menambah Wishlist
    ```sql
    INSERT INTO wishlist (id_product, description)
    VALUES ('P0001', 'Makanan Kesukaan');
    ```

* Menambah Wishlist Dengan Id Yang Tidak Ada
    ```sql
    INSERT INTO wishlist (id_product, description)
    VALUES ('SALAH', 'Makanan Kesukaan'); -- Foreign Key akan menolak data yang tidak ada di tabel yang berelasi
    ```

* Menghapus Product Dengan Id Yang Direfer Tabel Lain
    ```sql
    DELETE FROM products
    WHERE id = 'P0001'; -- Foreign Key akan menolak menghapus data yang berelasi dengan tabel lain
    ```

## Behaviour Foreign Key
Beberapa behaviour yang terjadi jika melakukan DELETE atau UPDATE pada field REFERENCE
* RESTRICT (Default)
    * ON DELETE : Ditolak (menghapus reference, maka akan ditolak)
    * ON UPDATE : Ditolak (mengubah reference, maka akan ditolak)
* CASCADE
    * ON DELETE : Data akan dihapus (menghapus reference, yang merefer akan ikut dihapus)
    * ON UPDATE : Data akan ikut diubah (mengubah reference, yang merefer akan ikut diubah)
* NO ACTION
    * ON DELETE : Data dibiarkan (menghapus reference, yang merefer akan dibiarkan - terputus)
    * ON UPDATE : Data dibiarkan (mengubah reference, yang merefer akan dibiarkan - terputus)
* SET NULL (Syarat : Nullable)
    * ON DELETE : Diubah jadi NULL (menghapus reference, yang merefer akan diset menjadi NULL)
    * ON UPDATE : Diubah jadi NULL (mengubah reference, yang merefer akan diset menjadi NULL)

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

* Delete di Product
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