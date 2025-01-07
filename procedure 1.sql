-- Procedure
-- Insert into Biaya_Proyek
CREATE PROCEDURE InsertBiayaProyek
    @ID_Proyek INT,
    @Penggunaan_Biaya VARCHAR(100),
    @Jumlah_Biaya DECIMAL(10, 2),
    @Tanggal_Transaksi DATE
AS
BEGIN
    INSERT INTO Biaya_Proyek (ID_Proyek, Penggunaan_Biaya, Jumlah_Biaya, Tanggal_Transaksi, Created_at, Updated_at)
    VALUES (@ID_Proyek, @Penggunaan_Biaya, @Jumlah_Biaya, @Tanggal_Transaksi, GETDATE(), GETDATE());
END;

-- Delete from Penggunaan_Material
CREATE PROCEDURE DeletePenggunaanMaterial
    @ID_Proyek INT,
    @ID_Material INT
AS
BEGIN
    DELETE FROM Penggunaan_Material WHERE ID_Proyek = @ID_Proyek AND ID_Material = @ID_Material;
END;

-- Update Laporan_Progres
CREATE PROCEDURE UpdateLaporanProgres
    @ID_Proyek INT,
    @Tanggal_Laporan DATE,
    @Deskripsi TEXT,
    @Persentase_Progress DECIMAL(5, 2)
AS
BEGIN
    UPDATE Laporan_Progres
    SET Tanggal_Laporan = @Tanggal_Laporan,
        Deskripsi = @Deskripsi,
        Persentase_Progres = @Persentase_Progress,
        Updated_at = GETDATE()
    WHERE ID_Proyek = @ID_Proyek;
END;


-- cara manggil procedure update
EXEC UpdateLaporanProgres 
    @ID_Proyek = 3, 
    @Tanggal_Laporan = '2024-01-13', 
    @Deskripsi = 'Pekerjaan dimulai dengan pemasangan fondassi', 
    @Persentase_Progress = 20.00;

-- cara manggil procedure delete
EXEC DeletePenggunaanMaterial 
    @ID_Proyek = 1, 
    @ID_Material = 1;