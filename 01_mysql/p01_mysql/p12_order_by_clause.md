# Order By Clause

## Mengurutkan Berdasarkan 1 Kolom
```sql
SELECT * FROM products 
ORDER BY category; -- menampilkan data dengan mengurutkan berdasarkan 'category' (defaultnya ASCENDING)
```
```sql
SELECT id, category, name 
FROM products ORDER BY category; -- menampilkan data dengan field tertentu dan mengurutkan berdasarkan 'category'
```

## Mengurutkan Berdasarkan Beberapa Kolom
```sql
SELECT id, category, price, name 
FROM products ORDER BY category ASC, price DESC; -- menampilkan data dengan beberapa pengurutan
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p12_order_by_clause.md'
git push

```