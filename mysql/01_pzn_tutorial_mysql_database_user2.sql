use belajar_mysql;

## LOCKING
-- User 2
START TRANSACTION;
SELECT * FROM guestbook;
UPDATE guestbook
SET title = 'Diubah User 2'
WHERE id = 27;
COMMIT;

## LOCKING MANUAL dengan FOR UPDATE
START TRANSACTION;
SELECT * FROM products;
SELECT * FROM products
WHERE id = 'P0001'
FOR UPDATE;
UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';
COMMIT;

## DEADLOCK
START TRANSACTION;
SELECT * FROM products WHERE id = 'P0002' FOR UPDATE;
SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

## LOCK TABLES READ
SELECT * FROM products; -- User lain BISA READ
UPDATE products
SET quantity = 100
WHERE id = 'P0001'; -- User lain TIDAK BISA WRITE sampai di unlock

## LOCK TABLES WRITE
SELECT * FROM products; -- User lain TIDAK BISA READ sampai di unlock
UPDATE products
SET quantity = 200
WHERE id = 'P0001'; -- User lain TIDAK BISA WRITE sampai di unlock