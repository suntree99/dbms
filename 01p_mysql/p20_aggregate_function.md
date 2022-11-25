# Aggregate Function

## Aggregate Function
Untuk lebih lengkapnya bisa dilihat [Disini](https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html)

## Function COUNT
```sql
SELECT COUNT(id) AS 'Total Product'
FROM products;
```

## Function MAX
```sql
SELECT MAX(price) AS 'Product Termahal' 
FROM products;
```

## Function MIN
```sql
SELECT MIN(price) AS 'Product Termurah' 
FROM products;
```

## Function AVG
```sql
SELECT AVG(price) AS 'Rata-rata Harga' 
FROM products;
```

## Function SUM
```sql
SELECT SUM(quantity) AS 'Total Stock' 
FROM products;
```

## Aggregate Function Tidak Dapat Digabungkan Dengan Kolom Biasa
```sql
SELECT COUNT(id), name -- ini akan error karena digabungkan dengan kolom biasa (name)
FROM products;
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p18_date_n_time_function.md'
git push

```