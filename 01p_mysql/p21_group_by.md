# Group By

## Group By
Untuk lebih lengkapnya bisa dilihat [Disini](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html)

## Group By Clause (Khusus Aggregate)
```sql
SELECT COUNT(id) AS 'Total Product', category
FROM products
GROUP BY category;
```
```sql
SELECT MAX(price) AS 'Product Termahal', category 
FROM products 
GROUP BY category;
```
```sql
SELECT MIN(price) AS 'Product Termurah', category 
FROM products 
GROUP BY category;
```
```sql
SELECT AVG(price) AS 'Rata-rata Harga', category 
FROM products 
GROUP BY category;
```
```sql
SELECT SUM(quantity) AS 'Total Stock', category 
FROM products 
GROUP BY category;
```

## Having Clause (Khusus Aggregate, Tidak Bisa Menggunakan WHERE)
```sql
SELECT COUNT(id) AS total, category
FROM products
GROUP BY category
HAVING total > 5;
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p00_template.md'
git push

```