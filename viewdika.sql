CREATE VIEW DetailSiswaNilai AS
SELECT 
    s.Nama AS NamaSiswa,
    s.Alamat AS AlamatSiswa,
    s.TanggalLahir AS TanggalLahir,
    m.Nama AS NamaMapel,
    n.Nilai AS Nilai
FROM 
    Siswa s
JOIN 
    Nilai n ON s.IDSiswa = n.IDSiswa
JOIN 
    Mapel m ON n.IDMapel = m.IDMapel;
	select * from DetailSiswaNilai