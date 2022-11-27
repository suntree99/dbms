# Many To Many Relationship

## Cara Membuat Many To Many Relationship
* Menambahkan Id Product ke Table Penjualan, bukan solusi
* Menambahkan Id Penjualan ke Table Product, bukan solusi
* Solusinya dengan membuat Table Relasi (ditengah) berisi Id Product dan Id Penjualan

## Membuat Many To Many Relationship
* Membuat Table Orders
    ```sql
    CREATE TABLE orders
    (
        id INT NOT NULL AUTO_INCREMENT,
        total INT NOT NULL,
        order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id)
    )
    ENGINE = InnoDB;
    ```

* Membuat Tabel Perantara
    ```sql
    CREATE TABLE orders_detail
    (
        id_product VARCHAR(10) NOT NULL,
        id_order INT NOT NULL,
        price INT NOT NULL, -- untuk jaga2 perubahan harga
        quantity INT NOT NULL,
        PRIMARY KEY (id_product, id_order)
    )
    ENGINE = InnoDB;
    ```

* Menambahkan Constraint
    ```sql
    ALTER TABLE orders_detail
    ADD CONSTRAINT fk_orders_detail_products
    FOREIGN KEY (id_product) REFERENCES products (id);
    ```
    ```sql
    ALTER TABLE orders_detail
    ADD CONSTRAINT fk_orders_detail_orders
    FOREIGN KEY (id_order) REFERENCES orders (id);
    ```

* Menginput Orders
    ```sql
    INSERT INTO orders (total)
    VALUES (50000); -- exsekusi 3 kali
    ```
    ```sql
    INSERT INTO orders_detail (id_product, id_order, price, quantity)
    VALUES 	('P0001', 1, 25000, 1),
            ('P0002', 1, 25000, 1);
    ```
    ```sql
    INSERT INTO orders_detail (id_product, id_order, price, quantity)
    VALUES 	('P0003', 2, 25000, 1),
            ('P0004', 3, 25000, 1);
    ```
    ```sql
    INSERT INTO orders_detail (id_product, id_order, price, quantity)
    VALUES 	('P0001', 2, 25000, 1),
            ('P0003', 3, 25000, 1);
    ```

* Join Table
    ```sql
    SELECT * FROM orders
    JOIN orders_detail ON (orders_detail.id_order = orders.id)
    JOIN products ON (products.id = orders_detail.id_product);
    ```
    ```sql
    SELECT orders.id, products.id, products.name, orders_detail.quantity, orders_detail.price FROM orders
    JOIN orders_detail ON (orders_detail.id_order = orders.id)
    JOIN products ON (products.id = orders_detail.id_product);
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p29_many_to_many_relationship.md'
git push

```