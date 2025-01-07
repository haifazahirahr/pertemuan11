CREATE VIEW NilaiSiswa AS
SELECT s.Nama, n.Nilai AS NilaiSiswa 
FROM Siswa s
JOIN Nilai n ON s.IDSiswa = n.IDSiswa

SELECT * FROM NilaiSiswa;

CREATE VIEW MapelGuru AS
SELECT g.Nama, m.Nama AS Mapel 
FROM Guru g
JOIN Mapel m ON m.IDMapel = m.IDMapel

SELECT * FROM MapelGuru;

CREATE VIEW RataRataNilai AS
SELECT s.Nama, AVG(n.Nilai) AS RataRataNilai
FROM siswa s
JOIN Nilai n ON s.IDSiswa = n.IDSiswa
GROUP BY s.Nama

SELECT * FROM RataRataNilai;

CREATE VIEW RapotSiswa AS
SELECT s.Nama, m.Nama AS Mapel, n.Nilai 
FROM Siswa s
JOIN Nilai n ON s.IDSiswa = n.IDSiswa
JOIN Mapel m ON m.IDMapel = n.IDMapel;

SELECT * FROM RapotSiswa;

CREATE VIEW KelasSiswa AS
SELECT s.Nama, k.NamaKelas AS kelas
FROM Siswa s
JOIN Kelas k ON s.IDKelas = s.IDKelas

SELECT * FROM KelasSiswa;

CREATE VIEW JurusanSiswa AS
SELECT s.Nama, k.Jurusan AS jurusan
FROM Siswa s
JOIN Kelas k ON s.IDKelas = s.IDKelas

SELECT * FROM JurusanSiswa;

CREATE VIEW JurusandanKelas AS
SELECT s.Nama, k.NamaKelas AS kelas, k.Jurusan AS jurusan
FROM Siswa s
JOIN Kelas k ON s.IDKelas = s.IDKelas

SELECT * FROM JurusandanKelas;

CREATE VIEW KelasGuru AS
SELECT g.Nama, k.NamaKelas AS kelas
FROM Guru g
JOIN Kelas k ON g.GuruID = g.GuruID

SELECT * FROM KelasGuru;





