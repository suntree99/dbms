# Limit Clause

## Limit Untuk Membatasi Query
```sql
SELECT * FROM products 
ORDER BY id LIMIT 5; -- menampilkan data pertama dengan jumlah 5
```
```sql
SELECT * FROM products 
ORDER BY id LIMIT 3; -- menampilkan data dengan jumlah 3
```

## Limit Untuk Pagination
```sql
SELECT * FROM products 
ORDER BY id LIMIT 0, 5; -- sama seperti LIMIT 5 (0-5)
```
```sql
SELECT * FROM products 
ORDER BY id LIMIT 5, 5; -- menampilkan data dengan dengan offset atau diskip 5, berjumlah 5 (6-10)
```
```sql
SELECT * FROM products 
ORDER BY id LIMIT 10, 5; -- menampilkan data dengan dengan offset atau diskip 10, berjumlah 5 (11-15)
```
```sql
SELECT * FROM products 
ORDER BY id LIMIT 15, 5; -- menampilkan data dengan dengan offset atau diskip 15, berjumlah 5 (16-20)
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p13_limit_clause.md'
git push

```