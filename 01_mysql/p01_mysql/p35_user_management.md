# User Management

## Definition
User Manajement adalah pengaturan USER database terhadap HAK AKSESnya, ada banyak hak akses dapat dilihat [Disini](https://dev.mysql.com/doc/refman/8.0/en/grant.html)

## Membuat User
```sql
CREATE USER 'budi'@'localhost'; -- dapat didaftarkan pada IP address terntentu
CREATE USER 'darmawan'@'%'; -- % berarti dapat mengakses dari mana saja
```

## Menghapus User
```sql
DROP USER 'budi'@'localhost';
DROP USER 'darmawan'@'%';
```

## Mendaftarkan Hak Akses User
```sql
GRANT SELECT ON belajar_mysql.* TO  'budi'@'localhost';

GRANT SELECT ON belajar_mysql.* TO  'darmawan'@'%'; -- dapat ditambah beberapa kali
GRANT INSERT, UPDATE, DELETE ON belajar_mysql.* TO  'darmawan'@'%'; -- akan digabungkan
```

## Menampilkan Hak Akses USer
```sql
SHOW GRANTS FOR 'budi'@'localhost';
SHOW GRANTS FOR 'darmawan'@'%';
```

## Mengeset Password User
```sql
SET PASSWORD FOR 'budi'@'localhost' = 'rahasia';
SET PASSWORD FOR 'darmawan'@'%' = 'rahasiajuga';
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p35_user_management.md'
git push

```