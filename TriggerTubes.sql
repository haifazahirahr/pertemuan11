-- TRIGGER 
-- proyek - laporan progres
--Trigger ON UPDATE, Trigger ini memastikan bahwa jika kolom ID_Proyek di tabel Proyek diperbarui, maka nilai yang terkait di tabel Laporan_Progres juga diperbarui.
CREATE TRIGGER TR_Update_Proyek_LaporanProgres
ON Proyek
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Laporan_Progres
    SET ID_Proyek = inserted.ID_Proyek
    FROM Laporan_Progres
    INNER JOIN deleted ON Laporan_Progres.ID_Proyek = deleted.ID_Proyek
    INNER JOIN inserted ON deleted.ID_Proyek = inserted.ID_Proyek;
END;

-- Trigger ON DELETE, Trigger ini memastikan bahwa jika baris di tabel Proyek dihapus, maka baris terkait di tabel Laporan_Progres juga dihapus.
CREATE TRIGGER TR_Delete_Proyek_LaporanProgres
ON Proyek
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Laporan_Progres
    WHERE ID_Proyek IN (SELECT ID_Proyek FROM deleted);
END;


-- proyek - penggunaan material
-- Trigger ON UPDATE, Trigger ini akan memperbarui ID_Proyek di tabel Penggunaan_Material jika ID_Proyek di tabel Proyek diperbarui.
CREATE TRIGGER TR_Update_Proyek_PenggunaanMaterial
ON Proyek
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Penggunaan_Material
    SET ID_Proyek = inserted.ID_Proyek
    FROM Penggunaan_Material
    INNER JOIN deleted ON Penggunaan_Material.ID_Proyek = deleted.ID_Proyek
    INNER JOIN inserted ON deleted.ID_Proyek = inserted.ID_Proyek;
END;

-- Trigger ON DELETE, Trigger ini akan menghapus data di tabel Penggunaan_Material jika baris terkait di tabel Proyek dihapus.
CREATE TRIGGER TR_Delete_Proyek_PenggunaanMaterial
ON Proyek
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Penggunaan_Material
    WHERE ID_Proyek IN (SELECT ID_Proyek FROM deleted);
END;



