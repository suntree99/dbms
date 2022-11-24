# Database & Table

## Menampilkan Seluruh Database
```sql
show databases;
```

## Membuat Database
```sql
create database belajar_mysql; -- membuat database dengan nama 'belajar_mysql'
```

## Menghapus Database
```sql
drop database belajar_mysql;
```

## Menggunakan Database
```sql
use belajar_mysql; -- perlu memilih database sebelum membuat table
```

## Menampilkan Seluruh Table Dalam Database
```sql
show tables;
```

## Membuat Table
```sql
create table barang -- membuat table dengan nama 'barang' 
(
id int,
nama varchar(100),
harga int,
jumlah int
);
```

describe barang; -- menampikan field tabel
show create table barang; -- menampilan format pembuatan tabel

-- MENGUBAH TABLE
alter table barang add column salah text; -- menambahkan field baru di akhir kolom
alter table barang drop column salah; --  menghapus field
alter table barang modify nama varchar(200) after deskripsi; -- memodifikasi posisi field
alter table barang modify nama varchar(200) first; -- memodifikasi posisi field menjadi di awal
-- NULL VALUE
alter table barang modify id int not null; -- memodifikasi field tidak boleh null
alter table barang modify nama varchar(200) not null; -- memodifikasi field tidak boleh null
-- DEFAULT VALUE
alter table barang modify harga int not null default 0; -- memodifikasi field dengan menambahkan nilai default
alter table barang modify jumlah int not null default 0; -- memodifikasi field dengan menambahkan nilai default
alter table barang add column waktu_dibuat timestamp not null default current_timestamp; -- menambahkan field timestamp dan memberi nilai default
-- MENGINPUT DATA
insert into barang (id, nama) value (1, 'Apel'); -- menginput data
-- MENAMPILKAN DATA
select * from barang; -- menampilkan seluruh data
-- MEMBERSIHKAN TABEL
truncate barang; -- menghapus seluruh data tabel
-- MENGHAPUS TABEL
drop table barang; -- mengapus tabel


##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p01_database.md.'
git push

```