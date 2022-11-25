# Constraint

## Unique Constraint
* Membuat Unique Constraint
    ```sql
    CREATE TABLE customers
    (
        id          INT          NOT NULL AUTO_INCREMENT,
        email       VARCHAR(100) NOT NULL,
        first_name  VARCHAR(100) NOT NULL,
        last_name   VARCHAR(100),
        PRIMARY KEY (id),
        UNIQUE KEY email_unique (email) -- unique constraint
    )
    ENGINE = InnoDB;
    ```

* Mengecek Unique Constraint
    ```sql
    DESCRIBE customers; -- akan tampil pada kolom Key = UNI
    ```

* Menghilangkan Unique Constraint
    ```sql
    ALTER TABLE customers 
    DROP INDEX email_unique; -- INDEX digunakan pada MySQL 5.7
    ```
        ```sql
    ALTER TABLE customers 
    DROP CONSTRAINT email_unique; -- INDEX digunakan pada MySQL 8.0
    ```

* Menambahkan Unique Constraint
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
    SELECT * FROM customers; -- jika terjadi gagal karena duplikat entry, id tetap tergenerate
    ```

## Check Constraint
* Membuat Check Constraint
    ```sql
    CREATE TABLE products
    (
        id          VARCHAR(10) NOT NULL,
        name        VARCHAR(100) NOT NULL,
        description TEXT,
        price       INT UNSIGNED NOT NULL,
        quantity    INT UNSIGNED NOT NULL DEFAULT 0,
        created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id),
        CONSTRAINT price_check CHECK ( price >= 1000 )
    )
    Engine = InnoDB;
    ```

* Menghilangkan Unique Constraint
    ```sql
    ALTER TABLE customers 
    DROP INDEX price_check; -- INDEX digunakan pada MySQL 5.7
    ```
        ```sql
    ALTER TABLE customers 
    DROP CONSTRAINT price_check; -- INDEX digunakan pada MySQL 8.0
    ```

* Menambahkan Check Constraint
    ```sql
    ALTER TABLE products
    ADD CONSTRAINT price_check CHECK (price >= 1000);
    -- jika ada data sebelumnya ada yang diluar pengecekan akan error, maka harus dipastikan
    ```

* Test Check Constraint
    ```sql
    INSERT INTO products (id, name, category, price, quantity)
    VALUES ('P0016', 'Permen', 'Lain-lain', 500, 1000); --  menambahkan data yang harganya 500 akan error
    ```
    ```sql
    SELECT * FROM products; -- jika terjadi gagal karena duplikat entry, id tetap tergenerate
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