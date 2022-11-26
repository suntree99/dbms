# Subquery

## Subquery di Where
```sql
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products); -- subquery
```

## Subquery di From
* Mencari max price
    ```sql
    SELECT MAX(price) FROM products; -- mencari max price dari semua product
    ```

* Update Product yang tidak memiliki Category
    ```sql
    UPDATE products
    SET price = 1000000
    WHERE id = 'X0003';
    ```

* Subquery di From dengan JOIN
    ```sql
    SELECT MAX(price)
    FROM (SELECT price FROM categories JOIN products ON (products.id_category = categories.id)) as cp;
    -- mencari max price dari product yang memiliki category
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p31_subquery.md'
git push

```