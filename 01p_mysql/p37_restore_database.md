# Backup Database

## 2 Cara Restore Database
* Menggunakan aplikasi `mysql` dan CMD
* Menggunakan perintah SQL : Source

## Restore Database Menggunakan CMD
* Masuk ke mysql melalui CMD
* Buat Table baru, misal: belajar_mysql_import
    ```sql
    CREATE DATABASE belajar_mysql_import;
    ```
* Keluar dari mysql kembali ke CMD 
    ```cmd
    mysql --user=root --password belajar_mysql_import < /Users/Owner/Desktop/belajar_mysql.sql
    ```
    Masukkan passwordnya.
* Cek dengan masuk ke mysql
    ```sql
    SHOW DATABASES;

    USE belajar_mysql_import;
    
    SHOW TABLES;
    ```

## Menggunakan perintah SQL : Source
* Buat Table baru, misal: belajar_mysql_import_source
    ```sql
    CREATE DATABASE belajar_mysql_import;

    USE belajar_mysql_import;
    
    SHOW DATABASES;
    ```
* Backup dengan Source
    ```sql
    SOURCE /Users/Owner/Desktop/belajar_mysql.sql
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p37_restore_database.md'
git push

```