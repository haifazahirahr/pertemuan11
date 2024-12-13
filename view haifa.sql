CREATE VIEW NilaiSiswa AS
SELECT s.Nama, n.Nilai AS NilaiSiswa 
FROM Siswa s
JOIN Nilai n ON s.IDSiswa = n.IDSiswa

SELECT * FROM NilaiSiswa;