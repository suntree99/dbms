# One To Many Relationship

## Cara Membuat One To Many Relationship
* Dengan membuat Foreign Key namun TIDAK diset UNIQUE (agar bisa dibuat banyak)

## Membuat One To One Relationship
```sql
CREATE TABLE categories
(
	id VARCHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
)
ENGINE = InnoDB;
```

## Test One Many One Relationship
* Membuang Field Category Di Tabel Products
    ```sql
    ALTER TABLE products
    DROP COLUMN category;
    ```

* Menambahkan Field id_category
    ```sql
    ALTER TABLE products
    ADD COLUMN id_category VARCHAR(10);
    ```

* Membuat Constraint
    ```sql
    ALTER TABLE products
    ADD CONSTRAINT fk_product_categories
    FOREIGN KEY (id_category) REFERENCES categories (id);
    ```

* Menambah Data
    ```sql
    INSERT INTO categories (id, name)
    VALUES	('C0001', 'Makanan'),
            ('C0002', 'Minuman'),
            ('C0003', 'Lain-lain');
    ```

* Update products
    ```sql
    UPDATE products
    SET id_category = 'C0001'
    WHERE id IN ('P0001', 'P0002', 'P0003', 'P0004', 'P0005', 'P0006', 'P0013', 'P0014', 'P0015');
    ```
    ```sql
    UPDATE products
    SET id_category = 'C0002'
    WHERE id IN ('P0007', 'P0008', 'P0009');
    ```
    ```sql
    UPDATE products
    SET id_category = 'C0003'
    WHERE id IN ('P0010', 'P0011', 'P0012', 'P0016' );
    ```

* Join Table
    ```sql
    SELECT products.id, products.name, categories.name
    FROM products
    JOIN categories ON (categories.id = products.id_category);
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p27_one_to_one_relationship.md'
git push

```