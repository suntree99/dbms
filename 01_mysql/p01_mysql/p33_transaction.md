# Transaction

## Definition
* Transaction adalah fitur yang memungkinan beberapa perintah dianggap menjadi sebuah kesatuan
* Satu aksi bisa mengakibatkan banyak query
    * Membuat data pesanan di tabel order
    * Membuat data detail pesanan di tabel order detail
    * Menurunkan quantity di tabel produk
    * Dan yang lainnya
* Jika terdapat satu saja proses gagal, maka otomatis perintah-perintah sebelumnya akan dibatalkan
* Jika sebuah transaction sukses, maka semua perintah akan dipastikan sukses
* DML (Data Manipulation Languange) - Insert, Update, Delete Item - dapat dimasukkan ke Transaction 
* DDL (Data Definition Language) - Cerate, Alter, Drop Table - tidak dapat dimasukkan ke Transaction 

## Transaction With COMMIT
* Start
    ```sql
    START TRANSACTION;
    ```

* Insert
    ```sql
    INSERT INTO guestbook(email, title, content)
    VALUES 	('contoh@gmail.com', 'Hello', 'Hello'),
            ('contoh2@gmail.com', 'Hello', 'Hello'),
            ('contoh3@gmail.com', 'Hello', 'Hello');
    ```

* User Lain Mengecek
    ```sql
    SELECT * FROM guestbook; -- data yang diinsert tidak akan tampil sebelum dicommit
    ```

* COMMIT
    ```sql
    COMMIT;
    ```

## Transaction With ROLLBACK
* Start
    ```sql
    START TRANSACTION;
    ```

* Delete
    ```sql
    DELETE FROM guestbook;
    ```

* ROLLBACK
    ```sql
    ROLLBACK; -- perintah delete akan dibatalkan
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p33_transaction.md'
git push

```