# String Funtion

## String Function
Untuk lebih lengkapnya bisa dilihat [Disini](https://dev.mysql.com/doc/refman/8.0/en/string-functions.htm)

## Function LOWER, UPPER, Dan LENGTH
```sql
SELECT 	id,
		LOWER(name) AS 'Name Lower',
		UPPER(name) AS 'Name Lower',
        LENGTH(name) AS 'Name Length'
FROM products;
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p17_string_function.md'
git push

```