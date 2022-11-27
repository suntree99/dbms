# Jenis-Jenis Join

## 4 Jenis Join
* INNER Join (Default Join)
* LEFT Join
* RIGHT Join
* CROSS Join

## Inner Jooin
* Menambah Category yang tidak dipakai
    ```sql
    INSERT INTO categories (id, name)
    VALUES	('C0004', 'Oleh-oleh'),
            ('C0005', 'Gadget');
    ```

* Menambah Product yang tidak memiliki Category
    ```sql
    INSERT INTO products (id, name, price, quantity)
    VALUES 	('X0001', 'X Satu', 25000, 200),
            ('X0002', 'X Dua',  10000, 300),
            ('X0003', 'X Tiga', 15000, 500);
    ```

## JOIN sama degan INNER JOIN (Default)
* Join
    ```sql
    SELECT * FROM categories
    JOIN products ON (products.id_category = categories.id);
    ```
* Inner JOIN
    ```sql
    SELECT * FROM categories
    INNER JOIN products ON (products.id_category = categories.id);
    ```

## LEFT JOIN (data categories semua diambil, product -> null)
    ```sql
    SELECT * FROM categories
    LEFT JOIN products ON (products.id_category = categories.id);
    ```

## RIGHT JOIN (data product semua diambil, category -> null)
    ```sql
    SELECT * FROM categories
    RIGHT JOIN products ON (products.id_category = categories.id);
    ```

## CROSS JOIN (mengalikan data tabel 1 dengan data tabel 2)
    ```sql
    SELECT * FROM categories
    CROSS JOIN products;
    ```


## Test CROSS JOIN
* Membuat Tabel Perkalian
    ```sql
    CREATE TABLE numbers (
    id INT NOT NULL,
    PRIMARY KEY (id)
    )
    ENGINE = InnoDB;
    ```

* Input Data
    ```sql
    INSERT INTO numbers (id) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);
    ```

* Cross Join
    ```sql
    SELECT numbers1.id, numbers2.id, (numbers1.id * numbers2.id)
    FROM numbers AS numbers1
    CROSS JOIN numbers AS numbers2
    ORDER BY numbers1.id, numbers2.id;
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p30_jenis-jenis_join.md'
git push

```