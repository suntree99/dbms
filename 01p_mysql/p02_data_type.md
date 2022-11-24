# Tipe Data Pada MySQL

## Tipe Data Number
Nilianya bisa SIGNED (dari negatif sampai positif) dan UNSIGNED (digeser ke positif semua dari 0)
* Integer
    * TINYINT -> (-127 .. 182)
    * SMALLINT -> (+- 32 ribuan)
    * MEDIUMINT -> (+- 8 jutaan)
    * INT -> (+- 2 milyaran)
    * BIGINT -> (lebih dari INT)

* Floating Point
    * FLOAT -> (+- 3.4 E38)
    * DOUBLE -> (+- 1.8 E308)

* Decimal
    * DECIMAL(total digit, decimal digit)
    * DECIMAL(5,2) -> (-999.99 .. 999.99)
    * DECIMAL(5,0) -> (-99999 .. 99999)
    * DECIMAL(3,1) -> (-99.9 .. 99.9)
    * DECIMAL(3) -> (-999 .. 999)

* Number Atribute
    * TYPE(N) -> INT(7) -> Tipe data INT yang dibatasi hanya 7 digit
    * ZEROFIL -> INT(3) ZEROFILL -> angka 7 akan ditampilkan 007

## Tipe Data String
* Char & Varchar
    * CHAR() & VARCHAR() -> Maksimal 65535 karakter
    * CHAR(10 & VARCHAR(10) -> String yang dibatasi 10 karakter
    * CHAR(4) -> 'ab  ' -> Char akan selalu menggunakn memori maksimal (4 bytes)
    * VARCHAR(4) -> 'ab' -> Varchar menggunakan memori seusuai kebutuhan (3 bytes)

* Text
    * TINYTEXT -> 255 karakter (256 bytes)
    * TEXT -> 65535 karakter (64 kb)
    * MEDIUMTEXT -> 16 jutaan karakter (16 MB)
    * LONGTEXT -> 4 milyaran karakter (4 GB)

* Enum (Pilihan)
    * ENUM('Pria','Wanita')
    * ENUM('Belum Menikah','Menikah','Cerai')

## Tipe Data Date & Time dan Boolean
* Date & Time
    * DATE -> YYYY-MM-DD
    * DATETIME -> YYYY-MM-DD HH:MM:SS (Penggunaan umum)
    * TIMESTAMP -> YYYY-MM-DD HH:MM:SS (Untuk pencatatan)
    * TIME -> HH:MM:SS
    * YEAR -> YYYY

* Boolean
    * TRUE & FALSE
    * true & false

## Tipe Data Lainnya
* Tipe Data Advance Untuk Kasus Khusus [Lihat Disini](https://dev.mysql.com/doc/refman/8.0/en/data-types.html)
    * BLOB
    * SPATIAL
    * JSON
    * SET, dll

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p02_data_type.md.'
git push

```