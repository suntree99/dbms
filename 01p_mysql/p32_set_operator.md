# Set Operator

## 4 Jenis Set Operator
* UNION (Default Join)
* UNION ALL
* INTERSECT
* MINUS

## Setup Table Baru
* Membuuat Tabel Baru
    ```sql
    CREATE TABLE guestbook
    (
        id		INT NOT NULL AUTO_INCREMENT,
        email 	VARCHAR(100),
        title	VARCHAR(200),
        content	TEXT,
        PRIMARY KEY (id)
    )
    ENGINE = InnoDB;
    ```

* Insert Data
    ```sql
    INSERT INTO guestbook(email, title, content)
    VALUES 	('guest@gmail.com', 'Hello', 'Hello'),
            ('guest2@gmail.com', 'Hello', 'Hello'),
            ('guest3@gmail.com', 'Hello', 'Hello'),
            ('budidarmawan@gmail.com', 'Hello', 'Hello'),
            ('budidarmawan@gmail.com', 'Hello', 'Hello'),
            ('budidarmawan@gmail.com', 'Hello', 'Hello');
    ```

## UNION (Menggabungkan isi 2 Tabel tanpa data duplikat)
```sql
SELECT email FROM customers
UNION
SELECT email FROM guestbook;
```

## UNION ALL (Menggabungkan isi 2 Tabel dengan data duplikat)
```sql
SELECT email FROM customers
UNION ALL
SELECT email FROM guestbook;
```

* Count UNION ALL Di Subquery
    ```sql
    SELECT emails.email, COUNT(emails.email)
    FROM (	SELECT email FROM customers
            UNION ALL
            SELECT email FROM guestbook ) as emails
    GROUP BY emails.email;
    ```

## INTERSECT (Tidak ada sintaks khusus di MySQL, disiasati dengan cara berikut)
* Intersect dengan SUBQUERY
    ```sql
    SELECT DISTINCT email from customers
    WHERE email IN (SELECT DISTINCT email from guestbook);
    ```

* Intersect dengan JOIN
    ```sql
    SELECT DISTINCT customers.email from customers
    INNER JOIN guestbook ON (guestbook.email = customers.email);
    ```

## MINUS (Tidak ada sintaks khusus di MySQL, disiasati dengan cara berikut)
```sql
SELECT DISTINCT customers.email, guestbook.email from customers
LEFT JOIN guestbook ON (customers.email = guestbook.email) -- left Join
WHERE guestbook.email IS NULL; -- dihilangkan irisannya
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p32_set_operator.md'
git push

```