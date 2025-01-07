-- 5 perintah SELECT dengan fungsi agregat (SUM, COUNT, dll.)
-- Menampilkan total biaya setiap proyek (1)
CREATE OR ALTER VIEW TotalBiaya_proyek AS
SELECT ID_Proyek, SUM(Jumlah_Biaya) AS Total_Biaya
FROM Biaya_Proyek 
GROUP BY ID_Proyek;

SELECT * FROM TotalBiaya_proyek;

-- Menampilkan jumlah pekerja setiap proyek (2)
CREATE VIEW JumlahPekerja_SetiapProyek AS
SELECT ID_Proyek, COUNT(ID_Pekerja) AS Jumlah_Pekerja
FROM Pekerja
GROUP BY ID_Proyek;

SELECT * FROM JumlahPekerja_SetiapProyek;

-- Max Gaji Per Jabatan (3)
CREATE OR ALTER VIEW Maksimal_GajiPerJabatan AS
SELECT J.Jabatan, MAX(J.Gaji_Harian) AS Gaji_Tertinggi
FROM Jabatan J
GROUP BY J.Jabatan;

SELECT * FROM Maksimal_GajiPerJabatan;

-- Menampilkan jumlah proyek berdasarkan status (4)
CREATE OR ALTER VIEW JumlahProyek_Status As
SELECT Status, COUNT(ID_Proyek) AS Jumlah_Proyek
FROM Proyek
GROUP BY Status;

SELECT * FROM JumlahProyek_Status;

--MENAMPIKAN PROYEK DENGAN BIAYA TERENDAH
CREATE VIEW Proyek_BiayaTerendah AS
SELECT P.ID_Proyek, P.Nama_Proyek, SUM(BP.Jumlah_Biaya) AS Total_Biaya
FROM Proyek P
JOIN Biaya_Proyek BP ON P.ID_Proyek = BP.ID_Proyek
GROUP BY P.ID_Proyek, P.Nama_Proyek
HAVING SUM(BP.Jumlah_Biaya) = (SELECT MIN(SUM_BP.Total_Biaya) 
FROM  (SELECT ID_Proyek, SUM(Jumlah_Biaya) AS Total_Biaya
FROM Biaya_Proyek
GROUP BY ID_Proyek) SUM_BP
);

 SELECT * FROM Proyek_BiayaTerendah;




-- 5 perintah menggunakan JOIN.
-- Menampilkan IDPekerja, Nama Pekerja, Jabatan dan Tugas (1)
CREATE OR ALTER VIEW pekerja_jabatan AS
SELECT P.ID_Pekerja, P.Nama_Pekerja, J.Jabatan
FROM Pekerja P
JOIN Jabatan J ON P.ID_Jabatan = J.ID_Jabatan;

SELECT * FROM pekerja_jabatan;

-- Menampilkan nama pekerja, nama proyek yang dikerjakan, dan tugas mereka (2)
CREATE VIEW TugasPekerja_dikerjakan AS
SELECT PK.Nama_Pekerja, P.Nama_Proyek, PK.Tugas
FROM Pekerja PK
JOIN Proyek P ON PK.ID_Proyek = P.ID_Proyek;

SELECT * FROM TugasPekerja_dikerjakan;

-- Menampilkan laporan progres proyek dengan nama proyek (3)
CREATE VIEW Progres_Proyek AS
SELECT LP.Tanggal_Laporan, LP.Deskripsi, LP.Persentase_Progres, P.Nama_Proyek
FROM Laporan_Progres LP
JOIN Proyek P ON LP.ID_Proyek = P.ID_Proyek;

SELECT * FROM Progres_Proyek;


-- Menampilkan absensi pekerja dan proyek yang dikerjakan (4)
CREATE VIEW Absensi_DanProyek AS
SELECT A.Tanggal_Absensi, PK.Nama_Pekerja, P.Nama_Proyek, A.Kehadiran
FROM Absensi A
JOIN Pekerja PK ON A.ID_Pekerja = PK.ID_Pekerja
JOIN Proyek P ON PK.ID_Proyek = P.ID_Proyek;

SELECT * FROM Absensi_DanProyek;


-- Menampilkan Stok (5)
CREATE OR ALTER VIEW Material_Stok AS
SELECT P.Nama_Proyek, M.Nama_Material, M.Stok
FROM Material M
JOIN Penggunaan_Material PM ON M.ID_Material = PM.ID_Material
JOIN Proyek P ON PM.ID_Proyek = P.ID_Proyek;

SELECT * FROM Material_Stok;


-- 5 perintah bebas.
-- Menampilkan progres proyek yang selesai 100% (1)
CREATE VIEW Proyek_Selesai_100persen AS
SELECT P.ID_Proyek, P.Nama_Proyek, MAX(LP.Persentase_Progres) AS Persentase_Selesai
FROM Proyek P
JOIN Laporan_Progres LP ON P.ID_Proyek = LP.ID_Proyek
GROUP BY P.ID_Proyek, P.Nama_Proyek
HAVING MAX(LP.Persentase_Progres) = 100;

SELECT * FROM Proyek_Selesai_100persen;

--Menampilkan proyek yang menggunakan lebih dari 5 jenis material (2)
CREATE OR ALTER VIEW Proyek_BanyakMaterial AS
SELECT P.ID_Proyek, P.Nama_Proyek, 
COUNT(DISTINCT PM.ID_Material) AS Jumlah_Material
FROM Proyek P
JOIN Penggunaan_Material PM ON P.ID_Proyek = PM.ID_Proyek
GROUP BY P.ID_Proyek, P.Nama_Proyek
HAVING COUNT(DISTINCT PM.ID_Material) > 3;

SELECT * FROM Proyek_BanyakMaterial;

-- Menampilkan Proyek yang Menggunakan Jenis Material yang Sama Lebih dari Satu Kali (2)
CREATE OR ALTER VIEW Proyek_BahanMaterialDuplikat AS
SELECT P.ID_Proyek, P.Nama_Proyek, M.Nama_Material, COUNT(PM.ID_Material) AS JumlahPenggunaan
FROM Proyek P
JOIN Penggunaan_Material PM ON P.ID_Proyek = PM.ID_Proyek
JOIN Material M ON PM.ID_Material = M.ID_Material
GROUP BY P.ID_Proyek, P.Nama_Proyek, M.Nama_Material
HAVING COUNT(PM.ID_Material) > 1;

SELECT * FROM Proyek_BahanMaterialDuplikat;


--Menampilkan rata-rata biaya proyek per status (4)
CREATE OR ALTER VIEW RataBiaya_ProyekStatus AS
SELECT P.Status, AVG(BP.Jumlah_Biaya) AS RataRata_Biaya
FROM Proyek P
JOIN Biaya_Proyek BP ON P.ID_Proyek = BP.ID_Proyek
GROUP BY P.Status;

SELECT * FROM RataBiaya_ProyekStatus;


-- Menampilkan Jumlah Proyek PerLokasi (5)
CREATE VIEW JumlahProyekPerLokasi AS
SELECT  P.Lokasi, COUNT(P.ID_Proyek) AS Jumlah_Proyek
FROM Proyek P
GROUP BY P.Lokasi;

SELECT * FROM JumlahProyekPerLokasi;


