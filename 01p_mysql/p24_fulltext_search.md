# Full-text Search

## Full-text Search
Untuk lebih lengkapnya bisa dilihat [Disini](https://dev.mysql.com/doc/refman/8.0/en/fulltext-search.html)

## Membuat Full-text Search
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
    FULLTEXT product_search (name, description);
)
Engine = InnoDB;
```

## Menghapus Full-text Search
```sql
ALTER TABLE products
DROP INDEX product_search;
```

## Menambahkan Full-text Search
```sql
ALTER TABLE products
ADD FULLTEXT products_fulltext (name, description);
```

* Show Create
    ```sql
    SHOW CREATE TABLE products; -- full-text dapat dilihat
    ```

* Cara konvensional (LIKE)
    ```sql
    SELECT * FROM products
    WHERE name LIKE '%mie%' OR description LIKE '%mie%'; -- diurutkan berdasarkan id 
    ```

## Test Full-Text Search
* [Natural Languge Mode](https://dev.mysql.com/doc/refman/8.0/en/fulltext-natural-language.html)
    ```sql
    SELECT * FROM Products
    WHERE MATCH (name, description)
    AGAINST ('ayam' IN NATURAL LANGUAGE MODE); -- diurutkan berdasarkan ranking penemuan kata 'ayam'
    ```

* [Boolean Mode](https://dev.mysql.com/doc/refman/8.0/en/fulltext-boolean.html)
    ```sql
    SELECT * FROM Products
    WHERE MATCH (name, description)
    AGAINST ('+ayam -bakso' IN BOOLEAN MODE); -- mencari yang mengandung 'ayam' tanpa mengandung 'bakso'
    ```

* [Query Expansion Mode](https://dev.mysql.com/doc/refman/8.0/en/fulltext-query-expansion.html)
    ```sql
    SELECT * FROM Products
    WHERE MATCH (name, description)
    AGAINST ('bakso' WITH QUERY EXPANSION); -- diurutkan berdasarkan ranking penemuan kata 'bakso' kemudian dilanjutkan dengan yang berhubungan dengan pencarian sebelumnya
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p24_fulltext_search.md'
git push

```