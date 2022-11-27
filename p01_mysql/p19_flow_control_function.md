# Control Flow Function

## Control Flow Function
Untuk lebih lengkapnya bisa dilihat [Disini](https://dev.mysql.com/doc/refman/8.0/en/flow-control-functions.html)

## Function CASE - WHEN, THEN, ELSE, END
```sql
SELECT 	id, category,
        CASE category
			WHEN 'Makanan' THEN 'Enak'
			WHEN 'Minuman' THEN 'Segar'
			ELSE 'Apa Itu?'
			END AS 'Category'
FROM products; -- contoh CASE
```

## Function IF
```sql
SELECT 	id, price,
        IF (price <= 15000, 'Murah', 
			IF (price <= 20000, 'Mahal', 'Mahal Banget')
				) AS 'Mahal?'
FROM products; -- contoh IF
```

## Function IFNULL
```sql
SELECT id, name, 
IFNULL (description, 'Kosong') 
FROM products; -- contoh IFNULL
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p20_aggregate_function.md'
git push

```