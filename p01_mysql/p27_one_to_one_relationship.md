# One To One Relationship

## 2 Cara Membuat One To One Relationship
* Dengan membuat Foreign Key dan diset UNIQUE (agar tidak duplikat)
* Dengan membuat 2 table dengan Primary Key yang sama (tidak butuh Foreign Key)

## Membuat One To One Relationship
```sql
CREATE TABLE wallet
(
	id INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY id_customer_unique (id_customer),
    FOREIGN KEY fk_wallet_customer (id_customer) REFERENCES customers (id)
)
ENGINE = InnoDB;
```

## Test One To One Relationship
* Menambahkan Data Pada Wallet
    ```sql
    INSERT INTO wallet (id_customer)
    VALUES (1), (3); -- jika dieksekusi lebih dari satu kali, maka akan error
    ```

* Melihat Relasi
    ```sql
    SELECT customers.email, wallet.balance
    FROM wallet JOIN customers ON (wallet.id_customer = customers.id);
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