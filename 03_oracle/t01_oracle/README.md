# Oracle

## Instalasi & Konfigurasi
* Instalasi Oracle Database
    * Kunjungi https://www.oracle.com/in/database/technologies/xe-downloads.html
    * Pilih dan download Oracle Database (version) Express Edition for (operating system)
    * Extract file, buka, dan jalankan `setup.exe` (Run as administrator)
    * Lanjutkan proses instalasi dengan setingan default dan masukan password admin yang diinginkan
    * Perhatikan path penginstalan
    * Jika muncul popup, berikan akses
    * Sebelum klik finish, screenshot alamat konfigurasi database untuk keperluan mendatang.

* Instalasi Oracle SQL Developer
    * Kunjungi https://www.oracle.com/database/sqldeveloper/technologies/download/
    * Pilih dan download SQL Developer dengan (os) with (JDK) included
    * Centang agreement dan login ke akun Oracle untuk mulai mendownload
    * Extract file, buka, dan jalankan sqldeveloper
    * Jika ada popup import, Klik no atau sesuai kebutuhan

* Konfigurasi Database
    * Pada aplikasi Oracle SQL Developer, Klik `+` pada sidetab Connection
    * Buat database System
        * Isilkan Name (misal: System)
        * Isilkan Username (misal: system)
        * Isikan Password (misal: admin)
        * Isikan Detail -> Hostname: localhost
        * Isikan Detail -> Port: 1521
        * Isikan Detail -> Dapat memilih, SID : xe ATAU Service name : xepdb1 (sesuai yang discreenshot)
    * Klik `Test` setelah _Success_, Klik `Connect` (koneksi ditandai dengan tanda plug pada database)
    * Lakukan test query `select * from tab;` dan klik tanda play atau _ctrl + enter_

* Import Database (HR Schema)
    * Extract file human_resources dan copy folder yang berisi fil sql
    * Letakan folder di C:\app\/(user)\product\21c\dbhomeXE\demo\schema
    * Masuk ke SQL Developer dan eksekusi file sql
    * Masukkan `@ C:\app\(user)\product\21c\dbhomeXE\demo\schema\hr_main.sql` dan eksekusi
    * Isikan popup dengan data sebagai berikut
        * Parameter 1 : hr
        * Parameter 2 : users
        * Parameter 3 : temp
        * Parameter 4 : admin (password system databse)
        * Parameter 5 : $ORACLE_HOME/demo/schema/log
        * Parameter 6 : localhost:1521/XEPDB1
        * Klik OK
    * Buat database HR
        * Isilkan Name (misal: HR)
        * Isilkan Username (misal: hr)
        * Isikan Password (misal: hr)
        * Isikan Detail -> Hostname: localhost
        * Isikan Detail -> Port: 1521
        * Isikan Detail -> Dapat memilih, SID : xe ATAU Service name : xepdb1 (sesuai yang discreenshot)
    * Klik `Test` setelah _Success_, Klik `Connect` (koneksi ditandai dengan tanda plug pada database)
    * Lakukan test query `select * from tab;` dan klik tanda play atau _ctrl + enter_ (belum ada table)
    * Import table dengan mengeksekusi file sql, masukkan :
        * `@ C:\app\(user)\product\21c\dbhomeXE\demo\schema\hr_cer.sql`
        * `@ C:\app\(user)\product\21c\dbhomeXE\demo\schema\hr_popul.sql`
        * `@ C:\app\(user)\product\21c\dbhomeXE\demo\schema\hr_idx.sql`
        * `@ C:\app\(user)\product\21c\dbhomeXE\demo\schema\hr_code.sql`
        * `@ C:\app\(user)\product\21c\dbhomeXE\demo\schema\hr_comnt.sql`
        * `@ C:\app\(user)\product\21c\dbhomeXE\demo\schema\hr_analz.sql`
    * Run script (F5)
    * Lakukan test query `select * from tab;` dan eksekusi (tampil table hasil import)
    * Lakukan test query `select * from employees;` dan eksekusi (tampil table employees)

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update README.md'
git push

```