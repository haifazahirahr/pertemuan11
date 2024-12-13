CREATE VIEW MapelGuru AS
SELECT g.Nama, m.Nama AS Mapel 
FROM Guru g
JOIN Mapel m ON m.IDMapel = m.IDMapel

SELECT * FROM MapelGuru;