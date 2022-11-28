# Date And Time Function

## Date And Time Function
Untuk lebih lengkapnya bisa dilihat [Disini](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html)

## Function EXTRACT
```sql
SELECT 	id, created_at,
		EXTRACT(YEAR FROM created_at) AS YEAR,
		EXTRACT(MONTH FROM created_at) AS MONTH
FROM products; -- mengekstak sebagian data dari date_time
```

## Function YEAR Dan MONTH
```sql
SELECT id, created_at, YEAR(created_at), MONTH(created_at) 
FROM products; -- hasilnya sama dengan extract
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