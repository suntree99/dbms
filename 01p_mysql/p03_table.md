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

## Membuat Table (CREATE)
```sql
CREATE TABLE barang -- membuat table dengan nama 'barang' 
(
    id      INT,
    nama    VARCHAR(100),
    harga   INT,
    jumlah  INT
)
ENGINE = InnoDB;
```

## Melihat Struktur Table (DESCRIBE / DESC)
```sql
DESCRIBE barang;
```
Atau
```sql
DESC barang;
```

## Melihat Format Pembuatan Table (SHOW CREATE TABLE)
```sql
show CREATE TABLE barang;
```

## Mengubah Table (ALTER TABLE)
```sql
ALTER TABLE barang
    ADD COLUMN column_baru TEXT,
    DROP COLUMN nama,
    RENAME COLUMN nama TO nama_baru,
    MODIFY nama VARCHAR(100) AFTER jumlah,
    MODIFY nama VARCHAR(100) FIRST; 
```

* Menambah Kolom (ADD)
    ```sql
    ALTER TABLE barang
    ADD COLUMN deskripsi TEXT;
    ```

* Menghapus kolom (DROP)
    ```sql
    ALTER TABLE barang
    ADD COLUMN salah TEXT; -- contoh manambahkan kolok 'salah'
    ```
    ```sql
    ALTER TABLE barang
    DROP COLUMN salah; -- menghapus kolom 'salah'
    ```

* Mengubah Tipe Data
    ```sql
    ALTER TABLE barang
    MODIFY nama VARCHAR(200); -- mengubah menjadi VARCHAR(200)
    ```

* Mengubah Posisi Kolom
    ```sql
    ALTER TABLE barang
    MODIFY nama VARCHAR(200) AFTER jumlah; -- memodifikasi posisi kolom setelah kolom tertentu
    ```
    ```sql
    ALTER TABLE barang
    MODIFY nama VARCHAR(200) FIRST; -- memodifikasi posisi kolom menjadi di awal

## Null Value 
Secara default kolom akan diset menjadi DEFAULT NULL (nullable)
* Membuat Kolom dengan NOT NULL
    ```sql
    CREATE TABLE barang
    (
        id      INT NOT NULL, -- diset NOT NULL
        nama    VARCHAR (100) NOT NULL, -- diset NOT NULL
        harga   INT NOT NULL, -- diset NOT NULL
        jumlah  INT NOT NULL -- diset NOT NULL
    )
    ENGINE = InnoDB;
    ```

* Mengubah Kolom menjadi NOT NULL
    ```sql
    ALTER TABLE barang
    MODIFY id INT NOT NULL; -- memodifikasi kolom 'id' tidak boleh null
    ```
    ```sql
    ALTER TABLE barang
    MODIFY nama VARCHAR(200) NOT NULL; -- memodifikasi kolom 'nama' tidak boleh null

## Default Value
* Membuat Kolom dengan Nilai Default
    ```sql
    CREATE TABLE barang
    (
        id      INT NOT NULL,
        nama    VARCHAR (100) NOT NULL,
        harga   INT NOT NULL DEFAULT 0, -- diset memiliki nilai DEAFULT = 0
        jumlah  INT NOT NULL DEFAULT 0 -- diset memiliki nilai DEAFULT = 0
    )
    ENGINE = InnoDB;
    ```

* Mengubah Kolom Agar Memiliki Nilai Default
    ```sql
    ALTER TABLE barang
    MODIFY jumlah INT NOT NULL DEFAULT 0; -- mengubah kolom 'jumlah' memiliki nilai DEAFULT = 0
    ```
    ```sql
    ALTER TABLE barang
    MODIFY harga INT NOT NULL DEFAULT 0; -- mengubah kolom 'harga' memiliki nilai DEAFULT = 0
    ```
    ```sql
    ALTER TABLE barang
    ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
    -- mengubah kolom 'waktu_dibuat' memiliki nilai DEAFULT = CURRENT_TIMESTAMP
    ```

## Test NOT NULL Dan Default Value
* Menginput Data (INSERT INTO)
    ```sql
    INSERT INTO barang (id, nama) VALUES (1, 'Apel');
    ```

* Menampilkan Data
    ```sql
    SELECT * FROM barang;
    -- akan ditampilkan nilai default pada kolom yang diset NOT NULL dan memiliki nilai DEFAULT
    ```

## Mengosongkan Table (TRUNCATE)
```sql
TRUNCATE barang;
```

## Menghapus Table (DROP)
```sql
DROP TABLE barang;
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p03_table.md.'
git push

```