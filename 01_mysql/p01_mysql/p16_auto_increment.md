# Auto Increment

## Membuat Tabel Dengan Auto Increment
```sql
CREATE TABLE admin
(
	id			INT				NOT NULL AUTO_INCREMENT,
    first_name	VARCHAR(100)	NOT NULL,
	last_name	VARCHAR(100)	NOT NULL,
    PRIMARY KEY (id) -- membuat table dengan AUTO_INCREMENT (harus pada PRIMARY KEY)
) 
ENGINE = InnoDB;
```

## Mengecek Auto Increment
```sql
DESCRIBE admin; -- auto_increment akan tampil pada kolom 'Extra'
```

## Menambah Data Tabel Yang Mengandung Auto Increment
```sql
INSERT INTO admin (first_name, last_name)
VALUES	('Budi', 'Darmawan'),
		('Iwan', 'Setiawan'),
        ('Wati', 'Susanti'); -- menambahkan data tanpa menginput id karena sudah AUTO_INCREMENT
```

## Menghapus Data Tabel Yang Mengandung Auto Increment
```sql
DELETE FROM admin 
WHERE id = 3; -- menghapus data dengan id = 3
```

## Menambahkan Data Kembali Data Tabel Yang Mengandung Auto Increment
```sql
INSERT INTO admin (first_name, last_name)
VALUES	('Wati', 'Susanti'); -- id akan diteruskan walaupun data sudah dihapus (idnya 4, bukan 3)
```

## Mengecek Id Yang Terakhir Dibuat
```sql
SELECT LAST_INSERT_ID(); -- id 4
```

##
```bash
Update This File
```
```bash
git add .
git commit -m 'Update p16_auto_increment.md'
git push

```