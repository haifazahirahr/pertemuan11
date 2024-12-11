CREATE VIEW RataRataNilai AS
SELECT s.Nama, AVG(n.Nilai) AS RataRataNilai
FROM Siswa s
JOIN Nilai n ON s.IDSiswa = n.IDSiswa
GROUP BY s.Nama;

SELECT * FROM RataRataNilai;