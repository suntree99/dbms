# Table

## Menampilkan Seluruh Table
```sql
show tables;
```

## Menampilkan Storage Engine
Untuk membuat table perlu menentukan storage engine yang digunakan untuk mengolah data.
Saat ini yang paling populer adalah InnoDB.
```sql
show engines;
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
git commit -m 'Update p03_table.md.'
git push

```