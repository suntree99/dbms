# Update Data

## Menambahkan Enum
```sql
ALTER TABLE products
ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-lain')
AFTER name;
```

## Cek Data Sebelum Diupdate
Untuk mengupdate data pastikan WHERE clause menghasilkan data yang ditentukan
```sql
SELECT * FROM products WHERE id = 'P0001';
```

## Mengupdate 1 Kolom Data (UPDATE - SET)
```sql
UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001';
```

## Mengupdate Beberapa Kolom Data
```sql
UPDATE products
SET category = 'Makanan',
	description = 'Mie Ayam Original + Ceker'
WHERE id = 'P0003';
```

## Mengupdate Data Dengan Data Sebelumnya
```sql
UPDATE products
SET price = price + 5000
WHERE id = 'P0005';
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p08_upsate_data.md.'
git push

```