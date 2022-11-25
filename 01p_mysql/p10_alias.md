# Alias

## Alias Pada Kolom (AS)
```sql
SELECT 	id AS Kode,
		name AS Nama,
		category AS Kategory,
        price AS Harga,
        quantity AS Jumlah
FROM products;
```
* Jika alisnya lebih dari satu kata gunakan kutip ('') misal 'Kode Produk'

## Alias Pada Table
```sql
SELECT 	p.id AS Kode,
		p.name AS Nama,
		p.category AS Kategory,
        p.price AS Harga,
        p.quantity AS Jumlah
FROM products AS p; -- memberikan alias pada table
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p10_alias.md.'
git push

```