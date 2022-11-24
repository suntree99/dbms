# MySQL

## Instalasi & Konfigurasi pada Windows
* MySQL Server
    * Kunjungi https://www.mysql.com/downloads/ -> Klik MySQL Community (GPL) Downloads »
    * Pilih MySQL Community Server
    * Tentukan sistem operasi (biasanya otomatis membaca OS) -> Klik *Download* pada installer yang sesuai
    * Jalankan installer -> Pilih Server Only (sesuai kebutuhan) -> Klik *Execute* (tunggu sampai selesai)
    * Pilih Config Type : Development Computer (sesuai kebutuhan) dan tentukan Portnya -> Klik *Next*
    * Pilih Authentication Method yang *Recommended* -> Klik *Next*
    * Tentukan Password untuk super user default (root) -> Klik *Next*
    * Install Windows Service (biarkan default setting) -> Klik *Next* dan *Execute* (tunggu sampai selesai)
    * Cek Installasi MySQL, Klik Windows dan ketikkan `Service` dan buka, Pastikan ada MySQL
    * Setting di Evironment Variable dan masukan direktory MySQL (sampai folder 'bin') ke `Path`
    * Cek pada CMD, ketikan `mysql --version` (untuk client) dan `mysqld --version` (untuk server)

* MySQL Workbench
    * Kunjungi https://www.mysql.com/products/workbench/ -> Klik *Download Now*
    * Lakukan instalasi secara default (atau sesuai kebutuhan)

* JetBrains DataGrip (Aplikasi *berbayar* seperti MySQL Workbench, Mendukung database jenis lain)
    * Kunjungi https://www.jetbrains.com/datagrip/ -> Klik *Download Now*
    * Lakukan instalasi secara default (atau sesuai kebutuhan)

## Pengenalan MySQL
* MySQL adalah salah satu DBMS (Database Management System) yaitu apliksai untuk mengelola data.
* Contoh DBMS yang populer seperti MySQL, PostgreSQL, MongoDB, Oracle, dll. [Kunjungi](https://db-engines.com/en/ranking/relational+dbms)
* Sintaks SQL tidak case sensitive (incasesensitive), antara show dengan SHOW sama saja.
    * `show engines;` -- menampilkan engines yang tersedia di dalam server 
    * `SHOW DATABASES;` -- menampilkan semua database yanga di dalam server mySQL

## Update README.md 
```git
git add .
git commit -m 'Update README.md'
git push

```