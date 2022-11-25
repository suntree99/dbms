# Delete data

## Menambahkan Data Untuk Dihapus
```sql
INSERT INTO products (id, name, price, quantity)
VALUES ('P0009', 'Mie Ayam Original', 15000, 100);
```

## Cek Data Sebelum Dihapus
Untuk menghapus data pastikan WHERE clause menghasilkan data yang ditentukan dengan benar
```sql
SELECT * FROM products WHERE id = 'P0009';
```

## Menghapus Data
```sql
DELETE FROM products
WHERE id = 'P0009'; -- hati-hati dengan WHERE clause ini, perhatikan dengan cermat
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p09_delete_data.md.'
git push

```