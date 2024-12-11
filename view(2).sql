CREATE VIEW RaportSiswa AS
SELECT s.Nama, m.Nama AS Mapel, n.Nilai 
FROM Siswa s
JOIN Nilai n ON s.IDSiswa = n.IDSiswa
JOIN Mapel m ON m.IDMapel = n.IDMapel;

SELECT * FROM RaportSiswa;