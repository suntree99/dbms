# MySQL

## 00. Instalasi & Konfigurasi
* Instalasi pada Windows
    * MySQL Server
    * MySQL Workbench

## 01. Menampilkan Seluruh Database
```sql
show databases;
```

## 02. Membuat Database
```sql
create database belajar_mysql;
```

## 03. Menghapus Database
```sql
drop database belajar_mysql;
```

## 04. Menggunakan Database
```sql
use belajar_mysql;
```

## 05. Menampilkan Seluruh Table Dalam Database
```sql
show tables;
```

## 06. Tipe Data Pada MySQL
* Tipe Data Integer
    * TINYINT -> (-127 .. 182)
    * SMALLINT -> (+- 32 ribuan)
    * MEDIUMINT -> (+- 8 jutaan)
    * INT -> (+- 2 milyaran)
    * BIGINT -> (lebih dari INT)

* Tipe Data Floating POint
    * FLOAT -> (+- 3.4 E38)
    * DOUBLE -> (+- 1.8 E308)

* Tipe Data Decimal
    * DECIMAL(total digit, decimal digit)
    * DECIMAL(5,2) -> (-999.99 .. 999.99)
    * DECIMAL(5,0) -> (-99999 .. 99999)
    * DECIMAL(3,1) -> (-99.9 .. 99.9)
    * DECIMAL(3) -> (-999 .. 999)

* Number Atribute
    * TYPE(N) -> INT(7) -> Tipe data INT yang dibatasi hanya 7 digit
    * ZEROFIL -> INT(3) ZEROFILL -> angka 7 akan ditampilkan 007

* Tipe Data String
    * CHAR() & VARCHAR() -> Maksimal 65535 karakter
    * CHAR(10 & VARCHAR(10) -> String yang dibatasi 10 karakter
    * CHAR(4) -> 'ab  ' -> Char akan selalu menggunakn memori maksimal (4 bytes)
    * VARCHAR(4) -> 'ab' -> Varchar menggunakan memori seusuai kebutuhan (3 bytes)

* Tipe Data Text
    * TINYTEXT -> 255 karakter (256 bytes)
    * TEXT -> 65535 karakter (64 kb)
    * MEDIUMTEXT -> 16 jutaan karakter (16 MB)
    * LONGTEXT -> 4 milyaran karakter (4 GB)

* Tipe Data Enum (Pilihan)
    * ENUM('Pria','Wanita')
    * ENUM('Belum Menikah','Menikah','Cerai')

* Tipe Data Date
    * DATE -> YYYY-MM-DD
    * DATETIME -> YYYY-MM-DD HH:MM:SS (Penggunaan umum)
    * TIMESTAMP -> YYYY-MM-DD HH:MM:SS (Untuk pencatatan)
    * TIME -> HH:MM:SS
    * YEAR -> YYYY

* Tipe Data Boolean
    * TRUE & FALSE
    * true & false

* Tipe Data Lainnya (Kasus Khusus)
    * BLOB
    * SPATIAL
    * JSON
    * SET, dll

## 07. Menampilkan Storage Engine
Storage Engine digunakan untuk mengolah data, saat ini paling populer adalah InnoDB 
```sql
show engines;
```

## 08. Membuat Table
```sql
CREATE TABLE barang
(
    id      INT,
    nama    VARCHAR(100),
    harga   INT,
    jumlah  INT
)
ENGINE = InnoDB;
```

## 09. Melihat Struktur Table
```sql
DESCRIBE barang;
```
```sql
DESC barang;
```
```sql
SHOW CREATE TABLE barang;
```

## 10. Mengubah Table
```sql
ALTER TABLE barang
    ADD COLUMN column_baru TEXT,
    DROP COLUMN nama,
    RENAME COLUMN nama TO nama_baru,
    MODIFY nama VARCHAR(100) AFTER jumlah,
    MODIFY nama VARCHAR(100) FIRST; 
```

* Menambah colom
```sql
ALTER TABLE barang
ADD COLUMN deskripsi TEXT;
```

* Menghapus colom
```sql
ALTER TABLE barang
ADD COLUMN salah TEXT;
```
```sql
ALTER TABLE barang
DROP COLUMN salah;
```

* Mengubah Tipe Data
```sql
ALTER TABLE barang
MODIFY nama VARCHAR(200);
```

* Mengubah Posisi Kolom
```sql
ALTER TABLE barang
MODIFY nama VARCHAR(200) AFTER jumlah;
```
```sql
ALTER TABLE barang
MODIFY nama VARCHAR(200) FIRST;
```

## 11. Null Value 
Secara default kolom yang tidak diset NOT NULL akan menjadi nullable
* Mengeset NOT NUL
```sql
ALTER TABLE barang
MODIFY id INT NOT NULL;
```
```sql
ALTER TABLE barang
MODIFY nama VARCHAR(200) NOT NULL;
```

## 12. Default Value
```sql
ALTER TABLE barang
MODIFY jumlah INT NOT NULL DEFAULT 0;
```
```sql
ALTER TABLE barang
MODIFY harga INT NOT NULL DEFAULT 0;
```
```sql
ALTER TABLE barang
ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
```


## 13. Menginput Data
```sql
INSERT INTO barang (id, nama) VALUES (1, 'Apel');
```

## 14. Menampilkan Data
```sql
SELECT * FROM barang;
```

## 15. Mengosongkan Table
```sql
TRUNCATE barang;
```

## 16. Menghapus Table
```sql
DROP TABLE barang;
```

## 17. Unsign Value
```sql
CREATE TABLE
(
    id          VARCHAR(10) NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    price       INT UNSIGNED NOT NULL,
    quantity    INT UNSIGNED NOT NULL DEFAULT 0,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)
Engine = InnoDB;
```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```

## 01. 
```sql

```


##
##

# Heading 1 / Judul Utama (gunakan #)

## Heading 2 / Sub Judul (gunakan ##)

Text biasa (ditulis biasa tanpa format apapun)

[Hyperlink](https://www.google.com) (nama hyperlink dibungkus kurung siku, urlnya dibungkus tanda kurung biasa)

```bash
git add .
git commit -m "baris code menggunakan backtick 3x di awal(sertakan bahasanya) dan akhir code"
git push
```

Untuk `menyoroti` bungkus text dengan backtick 1x

# Template

## Sub Judul 
```<bahasa>
git add .
git commit -m 'Update README.md'
git push

```

```sql

```

Update README.md