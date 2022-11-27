# Locking

## Definition
Locking adalah fitur mengunci yang dilakukan oleh Transaction agar tidak terjadi RACE CONDITION dari banyak user

## Locking
* Transaction Oleh User 1
    ```sql
    START TRANSACTION;

    UPDATE guestbook
    SET title = 'Diubah oleh User 1'
    WHERE id = 9; -- proses dilock sampai dilakukan commit
    
    SELECT * FROM guestbook;
    
    COMMIT;
    ```

* Transaction Oleh User 2
    ```sql
    START TRANSACTION;

    UPDATE guestbook
    SET title = 'Diubah oleh User 2'
    WHERE id = 9; -- proses ini akan menunggu sampai user 1 melakukan commit
    
    SELECT * FROM guestbook;
    
    COMMIT;
    ```

## Locking Manul dengan FOR UPDATE
* Transaction Oleh User 1
    ```sql
    START TRANSACTION;

    SELECT * FROM products
    WHERE id = 'P0001'
    FOR UPDATE; -- locking agar user lain tidak bisa mengubah item yang sama
    
    UPDATE products
    SET quantity = quantity - 100 -- user 1 melakukan update
    WHERE id = 'P0001';

    COMMIT;
    ```

* Transaction Oleh User 2
    ```sql
    START TRANSACTION;

    SELECT * FROM products
    WHERE id = 'P0001'
    FOR UPDATE; -- menunggu commit user 1
    
    UPDATE products
    SET quantity = quantity - 100 -- jika item habis (quantity = 0), maka user 2 tidak bisa melakukan hal ini (dengan syarat quantity bernilai UNSIGNED)
    WHERE id = 'P0001';

    COMMIT;
    ```

## Deadlock
* Transaction Oleh User 1
    ```sql
    START TRANSACTION;

    SELECT * FROM products WHERE id = 'P0001' FOR UPDATE; -- (kejadian 1) P0001 dilock user 1
    
    SELECT * FROM products WHERE id = 'P0002' FOR UPDATE; -- (kejadian 3) menunggu user 2

* Transaction Oleh User 2
    ```sql
    START TRANSACTION;

    SELECT * FROM products WHERE id = 'P0002' FOR UPDATE; -- (kejadian 3) P0002 dilock user 2
    
    SELECT * FROM products WHERE id = 'P0001' FOR UPDATE; -- (kejadian 4) terjadi deadlock, sema transaksi dibatalkan
    ```


## Lock Table READ
    ```sql
    LOCK TABLES products READ; -- table dilock user 1, user lain masih bisa read tidak bisa write 

    SELECT * FROM products;
    UPDATE products
    SET quantity = 100
    WHERE id = 'P0001'; -- uzer 1 dapat melakukan READ, tidak bisa WRITE (update)

    UNLOCK TABLES; -- untuk membuka lock
    ```

## Lock Table WRITE
    ```sql
    LOCK TABLES products WRITE; -- table dilock user 1, user lain tidak bisa read dan write

    SELECT * FROM products;
    UPDATE products
    SET quantity = 150
    WHERE id = 'P0001'; -- user 1 dapat melakukan READ & WRITE (update)

    UNLOCK TABLES; -- untuk membuka lock
    ```

## Lok Instance Fof Backup (MySQL Version 8)
    ```sql
    LOCK INSTANCE FOR BACKUP; -- lock instance untuk melakukan backup, user lain tidak dapar mengubah DDL, DML masih bisa
    UNLOCK INSTANCE; -- untuk membuka lock instance
    ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p34_locking.md'
git push

```