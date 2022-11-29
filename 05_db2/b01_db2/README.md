# IBM DB2

## Instalasi & Konfigurasi
* Instalasi IBM Db2 Database
    * Kunjungi https://www.ibm.com/products/db2/pricing
    * Klik `Download free edition` 
    * Lakukan Sign in atau Sign up untuk melakukan download
    * Ikuti stepnya dan klik `Download` paket installer sesuai OS
    * Ekstrak file dan masuk kedalam folder SERVER_DEC
    * Klik `setup.exe`
    * Klik tab `Install a Product` scroll ke bawah dan klik `Install New`
    * Ikuti stepnya, pilih `Typical`
    * Pilih `Install DB2 Connect Server on this computer`
    * Masukkan password dan confirmnya untuk akun db2admin (misan: admin)
    * Hilangkan centang pada `Set up your DB2 server to send notification`
    * Hilangkan centang pada `Enable operating system security`
    * Previw hasil konfigurasi dan klik `Install`

* Konfigurasi IBM Db2 Database
    * Buka CMD dan eksekusi perintah `db2cmd` maka akan terbuka terminal baru (DB2COPY1)
    * Pada terminal baru eksekusi perintah `db2` maka akan masuk ke shell db2
    * Eksekusi perintah `db2 get dbm cfg` untuk mendapatkan Database Management Configuration
    * Perhatikan SVCENAME, jika belum berisi port 50000 lakukan update ke port 50000
    * Eksekusi perintah `db2 update dbm cfg using SVCENAME 5000` untuk mengganti SVCENAME ke 5000
    * Eksekusi perintah `db2 get dbm cfg` untuk mengecek SVCENAME = 50000
    * Untuk menutup terminal gunakan perintah `quit`

## Menggunakan IBM Db2 Database
* Dengan Terminal (CLI) `db2`    
    * Database
        * Membuat Database Baru
            * Short sintaks `CREATE DATABASE dbtes1`
            * Complete `CREATE DATABASE dbtes1 AUTOMATIC STORAGE YES ON C: DBPATH ON C: USING CODESET UTF-8 TERRITORY US PAGESIZE 8192`
        * Melihat Daftar Database `LIST DATABASE DIRECTORY`
        * Menggunakan Database `CONNECT TO dbtes1`

    * Schema
        * Membuat Schema `CREATE SCHEMA sctes1`
        * Melihat Daftar Schema `SELECT SCHEMANAME FROM SYSCAT.SCHEMATA`
        * Menggunakan Schema `SET CURRENT SCHEMA = sctes1`

    * Table
        * Membuat Table `CREATE TABLE student (sid integer NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1), sname varchar(30), PRIMARY KEY (sid));`
        * Lemihat Table pada Schema `LIST TABLES FOR SCHEMA sctes1`
        * Melihat Struktur Table `DESCRIBE TABLE student` atau `DESCRIBE TABLE sctes1.student`

        * Insert `INSERT INTO sctes1.student (sname) VALUES ('Budi'), ('Darmawan');`
        * Select `SELECT * FROM sctest1.student`
        * Update `UPDATE sctes1.student SET sname='Iwan' WHERE sid=2`
        * Delete `DELETE FROM sctest1.student WHERE sid=2`

* Dengan DBeaver (Universal Database Tool) & Koneksi ke DB2
    * Kunjungi https://dbeaver.io/download/
    * Pilih DBeaver Community dan klik installer sesuai OS untuk mendownload
    * Jalankan installer dan ikuti stepnya
    * Setelah selesai buka aplikasi DBeaver
    * Klik `Icon Plug +` (New Database Connection)
    * Pilih DB2 LUW
    * Masukkan konfigurasi:
        * Host : localhost
        * POrt : 50000 (sesuai SVCENAME)
        * Database : dbtes1 (sesuai database yang dibuat sebelumnya)
        * Username : db2admin (sesuai akun yang didaftarkan saat instalasi)
        * Password : (sesuai password yang didaftarkan saat instalasi)
    * Klik `Test Connection` jika tampil pop up succes klik `Ok`
    * Klik `Finish`
    * Buka connection `dbtes1` pada Schema klik kanan dan klik `Create New Schema`
    * Masukkan nama schema (misal: DB2ADMIN) lalu klik `OK`
    * Buka `DB2ADMIN` akan tampil struktur foldernya
    * Buka `Open SQL Script` (F3) dan buat table baru, misalnya seperti dibawah ini
        ```sql
        CREATE TABLE student (
            sid integer NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
            sname varchar(30),
            PRIMARY KEY (sid)
        );
        ```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update README.md'
git push

```