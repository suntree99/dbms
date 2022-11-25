# Numeric Function

## Operator Aritmatika pada MySQL
* % atau MOD (Operator Modulo)
* \* (Operator perkalian)
* \+ (Oerator penjumlahan)
* \- (Oerator pengurangan)
* \- (Mengubah nilai menjadi negatif)
* / (Oerator pembagian)
* DIV (Operator pembagian integer)

## Arithmetic Operator
```sql
SELECT 10 * 10 AS Hasil;
```
```sql
SELECT 10 AS P, 10 AS L, 10 * 10 AS Hasil;
```
```sql
SELECT id, name, price, price DIV 1000 AS 'Price in K' FROM products;
```

## Mathematical Function
Untuk lebih lengkapnya bisa dilihat [Disini](https://dev.mysql.com/doc/refman/8.0/en/mathematical-functions.html)
```sql
SELECT PI();
```
```sql
SELECT POWER(10,2);
```
```sql
SELECT id, COS(price), SIN(price), TAN(price) FROM products;
```
```sql
SELECT id, name, price
FROM products
WHERE price DIV 1000 > 15 ; -- numeric dan mathematical function bisa digunakan pada where clause
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p15_numeric_function.md'
git push

```