# Database & Table

## Menampilkan Seluruh Database
```sql
show databases; -- menampilkan semua database yanga di dalam server mySQL
```

## Membuat Database
```sql
create database belajar_mysql; -- membuat database
```

## Menggunakan Database
```sql
use belajar_mysql; -- memilih database untuk digunakan 
```

## Menghapus Database
```sql
drop database belajar_mysql; -- menghapus database
```

## Membuat Table
```sql
create table barang -- membuat tabel dalam database yang telah dipilih 
(
id int,
nama varchar(100),
harga int,
jumlah int
);
```

show tables; -- menampikan tabel
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
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```

##  
```sql

```