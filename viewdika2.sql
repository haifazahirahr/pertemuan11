CREATE VIEW NilaiMaksimumPerMapel AS
SELECT 
    m.Nama AS NamaMapel,
    MAX(n.Nilai) AS NilaiMaksimum
FROM 
    Mapel m
JOIN 
    Nilai n ON m.IDMapel = n.IDMapel
GROUP BY 
    m.Nama;

SELECT * FROM NilaiMaksimumPerMapel;


