--Table Proyek--
CREATE TABLE Proyek (
    ID_Proyek INT PRIMARY KEY IDENTITY(1,1),
    Nama_Proyek VARCHAR(255) NOT NULL,
    Lokasi VARCHAR(255) NOT NULL,
    Tanggal_Mulai DATE NOT NULL,
    Tanggal_Selesai DATE NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Created_at DATETIME DEFAULT GETDATE(),
    Updated_at DATETIME DEFAULT GETDATE()
);

--Table Jabatan--
CREATE TABLE Jabatan (
    ID_Jabatan INT PRIMARY KEY IDENTITY(1,1),
    Jabatan VARCHAR(50) NOT NULL,
    Gaji_Harian DECIMAL(10,2) NOT NULL,
    Created_at DATETIME DEFAULT GETDATE(),
    Updated_at DATETIME DEFAULT GETDATE()
);

--Tabel Material--
CREATE TABLE Material (
    ID_Material INT PRIMARY KEY IDENTITY(1,1),
    Nama_Material VARCHAR(255) NOT NULL,
    Jenis_Material VARCHAR(255) NOT NULL,
    Harga_Per_Unit DECIMAL(10,2) NOT NULL,
    Stok VARCHAR(20) NOT NULL,
    Created_at DATETIME DEFAULT GETDATE(),
    Updated_at DATETIME DEFAULT GETDATE()
);

--Table Pekerja--
CREATE TABLE Pekerja (
	ID_Pekerja INT PRIMARY KEY IDENTITY(1,1),
	ID_Proyek INT  NOT NULL
	FOREIGN KEY (ID_Proyek) REFERENCES Proyek (ID_Proyek)
	ON UPDATE CASCADE ON DELETE CASCADE,
	ID_Jabatan INT NOT NULL
	FOREIGN KEY (ID_Jabatan) REFERENCES Jabatan (ID_Jabatan)
	ON UPDATE CASCADE ON DELETE CASCADE,
	Nama_Pekerja VARCHAR(255) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	No_Telepon VARCHAR(15)NOT NULL,
	Tugas VARCHAR(255) NOT NULL,
	Created_at DATETIME DEFAULT GETDATE(),
    Updated_at DATETIME DEFAULT GETDATE()
);

--Table Absensi--
CREATE TABLE Absensi (
	ID_Pekerja INT NOT NULL
	FOREIGN KEY (ID_Pekerja) REFERENCES Pekerja (ID_Pekerja)
	ON UPDATE CASCADE ON DELETE CASCADE,
	Tanggal_Absensi DATE NOT NULL,
	Kehadiran VARCHAR (50) NOT NULL,
	Created_at DATETIME DEFAULT GETDATE(),
    Updated_at DATETIME DEFAULT GETDATE()
);

--Table Biaya_Proyek--
CREATE TABLE Biaya_Proyek (
	ID_Proyek INT NOT NULL
	FOREIGN KEY (ID_Proyek) REFERENCES Proyek (ID_Proyek)
	ON UPDATE CASCADE ON DELETE CASCADE,
	Penggunaan_Biaya VARCHAR(100) NOT NULL,
	Jumlah_Biaya DECIMAL(10,2) NOT NULL,
	Tanggal_Transaksi DATE NOT NULL,
	Created_at DATETIME DEFAULT GETDATE(),
    Updated_at DATETIME DEFAULT GETDATE()
);

--Table Laporan_Progres--
CREATE TABLE Laporan_Progres (
	ID_Proyek INT NOT NULL
	FOREIGN KEY (ID_Proyek) REFERENCES Proyek (ID_Proyek),
	Tanggal_Laporan DATE NOT NULL,
	Deskripsi TEXT NOT NULL,
	Persentase_Progres DECIMAL(5,2) NOT NULL,
	Created_at DATETIME DEFAULT GETDATE(),
    Updated_at DATETIME DEFAULT GETDATE()
);

--Table Penggunaan_Material--
CREATE TABLE Penggunaan_Material (
	ID_Proyek INT NOT NULL
	FOREIGN KEY (ID_Proyek) REFERENCES Proyek (ID_Proyek),
	ID_Material INT NOT NULL
	FOREIGN KEY (ID_Material) REFERENCES Material (ID_Material)
	ON UPDATE CASCADE ON DELETE CASCADE,
	Kuantitas VARCHAR(20) NOT NULL,
	Tanggal_Penggunaan DATE NOT NULL,
	Created_at DATETIME DEFAULT GETDATE(),
    Updated_at DATETIME DEFAULT GETDATE()
);

--Pengganti (ENUM) Untuk Status Di Table Proyek--
ALTER TABLE Proyek
ADD CONSTRAINT CK_Status CHECK (Status IN ('Belum dimulai', 'Dalam proses', 'Selesai'));

--Pengganti (ENUM) Untuk Kehadiran Di Table Absensi--
ALTER TABLE Absensi
ADD CONSTRAINT CK_Kehadiran CHECK (Kehadiran IN ('Hadir', 'Izin', 'Sakit', 'Alfa'));


--INSERT INTO Table Proyek--
INSERT INTO Proyek (Nama_Proyek, Lokasi, Tanggal_Mulai, Tanggal_Selesai, Status)
VALUES
('Pembangunan Gedung A', 'Jakarta', '2024-01-10', '2024-12-31', 'Dalam proses'),
('Proyek Jalan Tol B', 'Bandung', '2024-02-01', '2024-11-30', 'Belum dimulai'),
('Renovasi Sekolah C', 'Surabaya', '2023-11-01', '2024-05-31', 'Selesai'),
('Pembangunan Rumah D', 'Yogyakarta', '2024-03-01', '2024-08-31', 'Dalam proses'),
('Proyek Jembatan E', 'Medan', '2024-04-01', '2025-03-31', 'Belum dimulai'),
('Renovasi Taman Kota F', 'Bogor', '2024-05-01', '2024-10-30', 'Dalam proses'),
('Pembangunan Bandara G', 'Makassar', '2023-09-01', '2024-12-31', 'Selesai'),
('Proyek Bendungan H', 'Palembang', '2024-02-15', '2025-01-15', 'Belum dimulai'),
('Proyek Perumahan I', 'Batam', '2024-03-01', '2025-02-28', 'Dalam proses'),
('Renovasi Museum J', 'Semarang', '2023-10-01', '2024-04-30', 'Selesai');

SELECT * FROM Proyek;

--INSERT INTO Table Jabatan--
INSERT INTO Jabatan (Jabatan, Gaji_Harian)
VALUES
('Tukang', 250000.00),
('Manajer Proyek', 750000.00),
('Supervisor', 500000.00),
('Logistik', 350000.00),
('Mandor', 350000.00),
('Keuangan', 350000.00),
('Pengawas Lapangan', 450000.00),
('Admin', 450000.00),
('Arsitek', 700000.00),
('Safety Officer', 400000.00),
('Planner', 500000.00),
('quality control', 300000.00)

SELECT * FROM Jabatan;


--INSERT INTO Table Material--
INSERT INTO Material (Nama_Material, Jenis_Material, Harga_Per_Unit, Stok)
VALUES
('Semen Portland', 'Bahan Bangunan', 65000.00, '100 sak'),
('Pasir Beton', 'Bahan Bangunan', 200000.00, '50 m3'),
('Besi Beton', 'Bahan Bangunan', 120000.00, '200 batang'),
('Batu Bata Merah', 'Bahan Bangunan', 750.00, '10000 buah'),
('Kayu Balok', 'Material Kayu', 50000.00, '150 batang'),
('Triplek', 'Material Kayu', 75000.00, '300 lembar'),
('Keramik Lantai', 'Material Interior', 75000.00, '500 dus'),
('Cat Tembok', 'Material Finishing', 95000.00, '200 kaleng'),
('Pipa PVC', 'Material Plumbing', 25000.00, '300 batang'),
('Kawat Bendrat', 'Material Baja', 15000.00, '100 gulung'),
('Paku', 'Material Kecil', 20000.00, '50 kg'),
('Atap Seng', 'Material Atap', 150000.00, '75 lembar'),
('Gipsum', 'Material Interior', 90000.00, '200 lembar'),
('Pintu Kayu', 'Material Kayu', 500000.00, '50 unit'),
('Jendela Aluminium', 'Material Aluminium', 750000.00, '30 unit'),
('Pasir Urug', 'Bahan Bangunan', 175000.00, '40 m3'),
('Batu Split', 'Bahan Bangunan', 250000.00, '60 m3'),
('Beton Precast', 'Bahan Bangunan', 600000.00, '80 unit'),
('Kaca', 'Material Interior', 300000.00, '100 lembar'),
('Plafon PVC', 'Material Interior', 125000.00, '150 lembar'),
('Handle Pintu', 'Material Aksesoris', 50000.00, '300 unit'),
('Engsel Pintu', 'Material Aksesoris', 25000.00, '500 unit'),
('Kabel Listrik', 'Material Elektrik', 35000.00, '1000 meter'),
('Lampu LED', 'Material Elektrik', 50000.00, '400 unit'),
('Stop Kontak', 'Material Elektrik', 30000.00, '250 unit'),
('Semen Putih', 'Bahan Bangunan', 75000.00, '120 sak'),
('Bata Ringan', 'Bahan Bangunan', 10000.00, '5000 buah'),
('Batu Alam', 'Material Finishing', 150000.00, '70 m2'),
('Tangga Aluminium', 'Material Alat', 1200000.00, '10 unit'),
('Waterproofing', 'Material Finishing', 250000.00, '50 kaleng');

SELECT* FROM Material;

--INSERT INTO Table Pekerja--
INSERT INTO Pekerja (ID_Proyek, ID_Jabatan, Nama_Pekerja, Email, No_Telepon, Tugas)
VALUES
	(1, 2, 'Andi Wijaya', 'andi.wijaya@email.com', '081234567890', 'Melakukan pekerjaan konstruksi'),
    (2, 6, 'Siti Aminah', 'siti.aminah@email.com', '081234567891', 'Mengawasi pekerja tukang'),
    (3, 3, 'Budi Santoso', 'budi.santoso@email.com', '081234567892', 'Mengelola seluruh aspek proyek'),
    (4, 4, 'Dewi Lestari', 'dewi.lestari@email.com', '081234567893', 'Mengelola pengadaan material'),
    (5, 8, 'Hendra Kurniawan', 'hendra.kurniawan@email.com', '081234567894', 'Mengatur administrasi proyek'),
    (6, 7, 'Ratna Kusuma', 'ratna.kusuma@email.com', '081234567895', 'Memimpin kegiatan di lapangan'),
    (7, 3, 'Yoga Pratama', 'yoga.pratama@email.com', '081234567896', 'Memastikan pekerjaan sesuai standar'),
    (8, 10, 'Rina Mulyani', 'rina.mulyani@email.com', '081234567897', 'Memastikan keselamatan di proyek'),
    (9, 11, 'Fadli Ramadhan', 'fadli.ramadhan@email.com', '081234567898', 'Membuat perencanaan proyek'),
    (10, 9, 'Lina Permata', 'lina.permata@email.com', '081234567899', 'Mendesain struktur bangunan'),
    (1, 12, 'Doni Saputra', 'doni.saputra@email.com', '081234567800', 'Menjaga keamanan proyek'),
    (2, 8, 'Yuni Kartika', 'yuni.kartika@email.com', '081234567801', 'Mengelola anggaran dan pembayaran'),
    (3, 7, 'Aji Nugroho', 'aji.nugroho@email.com', '081234567802', 'Mengawasi pekerjaan di lapangan'),
    (4, 11, 'Mega Ananda', 'mega.ananda@email.com', '081234567803', 'Merencanakan desain proyek'),
    (5, 12, 'Sukma Dewi', 'sukma.dewi@email.com', '081234567804', 'Memastikan kualitas pekerjaan'),
    (6, 12, 'Eko Supriyadi', 'eko.supriyadi@email.com', '081234567805', 'Melakukan pekerjaan konstruksi'),
    (7, 11, 'Indah Wulandari', 'indah.wulandari@email.com', '081234567806', 'Merencanakan desain proyek'),
    (8, 2, 'Agus Haryanto', 'agus.haryanto@email.com', '081234567807', 'Mengelola seluruh aspek proyek'),
    (9, 4, 'Diana Putri', 'diana.putri@email.com', '081234567808', 'Mengelola pengadaan material'),
    (10, 2, 'Bayu Rahmat', 'bayu.rahmat@email.com', '081234567809', 'Mengatur administrasi proyek'),
    (1, 7, 'Adi Purnama', 'adi.purnama@email.com', '081234567810', 'Memantau kegiatan di lapangan'),
    (2, 3, 'Lestari Widodo', 'lestari.widodo@email.com', '081234567811', 'Memastikan pekerjaan sesuai standar'),
    (3, 10, 'Faisal Hakim', 'faisal.hakim@email.com', '081234567812', 'Memastikan keselamatan di proyek'),
    (4, 11, 'Nurul Huda', 'nurul.huda@email.com', '081234567813', 'Membuat perencanaan proyek'),
    (5, 9, 'Citra Rahayu', 'citra.rahayu@email.com', '081234567814', 'Mendesain struktur bangunan'),
    (6, 11, 'Dewi Anggraini', 'dewi.anggraini@email.com', '081234567815', 'Membuat perencanaan proyek'),
    (7, 6, 'Fajar Setiawan', 'fajar.setiawan@email.com', '081234567816', 'Mengelola anggaran dan pembayaran'),
    (8, 7, 'Gilang Pratama', 'gilang.pratama@email.com', '081234567817', 'Mengawasi pekerjaan di lapangan'),
    (9, 6, 'Sari Dewanti', 'sari.dewanti@email.com', '081234567818', 'Mengelola anggaran dan pembayaran'),
    (10, 12, 'Yuda Kusuma', 'yuda.kusuma@email.com', '081234567819', 'Memastikan kualitas pekerjaan'),
    (1, 2, 'Hana Rahmadani', 'hana.rahmadani@email.com', '081234567820', 'Melakukan pekerjaan konstruksi'),
    (2, 4, 'Rendi Saputra', 'rendi.saputra@email.com', '081234567821', 'Mengawasi pekerja tukang'),
    (3, 2, 'Diana Ramadhani', 'diana.ramadhani@email.com', '081234567822', 'Mengelola seluruh aspek proyek'),
    (4, 4, 'Aditya Pramana', 'aditya.pramana@email.com', '081234567823', 'Mengelola pengadaan material'),
    (5, 8, 'Siska Anggraini', 'siska.anggraini@email.com', '081234567824', 'Mengatur administrasi proyek'),
    (6, 8, 'Rama Setiawan', 'rama.setiawan@email.com', '081234567825', 'Mengelola keuangan proyek'),
    (7, 3, 'Wahyu Firmansyah', 'wahyu.firmansyah@email.com', '081234567826', 'Memastikan pekerjaan sesuai standar'),
    (8, 10, 'Lina Suharti', 'lina.suharti@email.com', '081234567827', 'Memastikan keselamatan di proyek'),
    (9, 11, 'Rini Kartika', 'rini.kartika@email.com', '081234567828', 'Membuat perencanaan proyek'),
    (10, 9, 'Bima Cahya', 'bima.cahya@email.com', '081234567829', 'Mendesain struktur bangunan'),
    (1, 5, 'Hendra Lesmana', 'hendra.lesmana@email.com', '081234567830', 'Mengawasi pekerjaan tukang'),
    (2, 6, 'Tari Andini', 'tari.andini@email.com', '081234567831', 'Mengelola anggaran dan pembayaran'),
    (3, 7, 'Rio Pratomo', 'rio.pratomo@email.com', '081234567832', 'Mengawasi pekerjaan di lapangan'),
    (4, 2, 'Fani Wulandari', 'fani.wulandari@email.com', '081234567833', 'Melakukan pekerjaan konstruksi'),
    (5, 12, 'Dewanto Putra', 'dewanto.putra@email.com', '081234567834', 'Memastikan kualitas pekerjaan'),
    (6, 2, 'Ahmad Fauzi', 'ahmad.fauzi@email.com', '081234567835', 'Melakukan pekerjaan konstruksi'),
    (7, 5, 'Riana Agustin', 'riana.agustin@email.com', '081234567836', 'Mengawasi pekerja tukang'),
    (8, 2, 'Vina Kurnia', 'vina.kurnia@email.com', '081234567837', 'Mengelola seluruh aspek proyek'),
    (9, 4, 'Nanda Kusuma', 'nanda.kusuma@email.com', '081234567838', 'Mengelola pengadaan material'),
    (10, 8, 'Bagas Permadi', 'bagas.permadi@email.com', '081234567839', 'Mengatur administrasi proyek'),
    (1, 8, 'Gina Apriani', 'gina.apriani@email.com', '081234567840', 'Mengelola keuangan proyek'),
    (2, 3, 'Aulia Pratama', 'aulia.pratama@email.com', '081234567841', 'Memastikan pekerjaan sesuai standar'),
    (3, 10, 'Dani Wijaya', 'dani.wijaya@email.com', '081234567842', 'Memastikan keselamatan di proyek'),
    (4, 11, 'Arina Suryani', 'arina.suryani@email.com', '081234567843', 'Membuat perencanaan proyek'),
    (5, 9, 'Widi Santoso', 'widi.santoso@email.com', '081234567844', 'Mendesain struktur bangunan'),
    (6, 2, 'Firman Nugraha', 'firman.nugraha@email.com', '081234567845', 'Melakukan pekerjaan konstruksi'),
    (7, 6, 'Lina Putri', 'lina.putri@email.com', '081234567846', 'Mengelola anggaran dan pembayaran'),
    (8, 7, 'Andri Setiawan', 'andri.setiawan@email.com', '081234567847', 'Mengawasi pekerjaan di lapangan'),
    (9, 8, 'Cindy Rahma', 'cindy.rahma@email.com', '081234567848', 'Mengatur administrasi proyek'),
    (10, 12, 'Eka Yulianti', 'eka.yulianti@email.com', '081234567849', 'Memastikan kualitas pekerjaan'),
    (1, 2, 'Rangga Saputra', 'rangga.saputra@email.com', '081234567850', 'Melakukan pekerjaan konstruksi'),
    (2, 5, 'Indri Kartika', 'indri.kartika@email.com', '081234567851', 'Mengawasi pekerja tukang'),
    (3, 2, 'Tomi Suryadi', 'tomi.suryadi@email.com', '081234567852', 'Mengelola seluruh aspek proyek'),
    (4, 4, 'Dika Pratama', 'dika.pratama@email.com', '081234567853', 'Mengelola pengadaan material'),
    (5, 8, 'Maya Anggraini', 'maya.anggraini@email.com', '081234567854', 'Mengatur administrasi proyek'),
    (6, 2, 'Rizki Ananda', 'rizki.ananda@email.com', '081234567855', 'Memimpin kegiatan di lapangan'),
    (7, 3, 'Aditia Putra', 'aditia.putra@email.com', '081234567856', 'Memastikan pekerjaan sesuai standar'),
    (8, 10, 'Joko Nugroho', 'joko.nugroho@email.com', '081234567857', 'Memastikan keselamatan di proyek'),
    (9, 11, 'Nina Kurniawati', 'nina.kurniawati@email.com', '081234567858', 'Membuat perencanaan proyek'),
    (10, 11, 'Beni Cahyo', 'beni.cahyo@email.com', '081234567859', 'Mendesain struktur bangunan'),
    (1, 1, 'Suryo Lesmana', 'suryo.lesmana@email.com', '081234567860', 'Mendesain struktur bangunan'),
    (2, 6, 'Alya Pratiwi', 'alya.pratiwi@email.com', '081234567861', 'Mengelola anggaran dan pembayaran'),
    (3, 7, 'Roni Saputra', 'roni.saputra@email.com', '081234567862', 'Mengawasi pekerjaan di lapangan'),
    (4, 5, 'Vira Melani', 'vira.melani@email.com', '081234567863', 'Mengawasi pekerjaan tukang'),
    (5, 12, 'Nina Kencana', 'nina.kencana@email.com', '081234567864', 'Memastikan kualitas pekerjaan'),
	(6, 1, 'Andi Setiawan', 'andi.setiawan@example.com', '081234567890', 'Melaksanakan pekerjaan konstruksi sesuai gambar kerja'),
    (7, 1, 'Budi Hartono', 'budi.hartono@example.com', '081234567891', 'Memasang kerangka bangunan sesuai spesifikasi'),
    (8, 1, 'Cahyo Prasetyo', 'cahyo.prasetyo@example.com', '081234567892', 'Melakukan pekerjaan finishing dinding dan lantai'),
    (9, 1, 'Dimas Pratama', 'dimas.pratama@example.com', '081234567893', 'Melakukan pemasangan pintu dan jendela'),
	(10, 5, 'Eko Susanto', 'eko.susanto@example.com', '081234567894', 'Memperbaiki kerusakan kecil di proyek'),
    (1, 5, 'Fajar Nugroho', 'fajar.nugroho@example.com', '081234567895', 'Mengawasi pekerjaan tukang di lapangan'),
    (2, 11, 'Gilang Saputra', 'gilang.saputra@example.com', '081234567896', 'Memastikan pekerjaan selesai sesuai jadwal'),
    (3, 5, 'Hadi Santoso', 'hadi.santoso@example.com', '081234567897', 'Mengatur pembagian tugas harian'),
	(4, 5, 'Iwan Kurniawan', 'iwan.kurniawan@example.com', '081234567898', 'Melaporkan progres pekerjaan kepada manajer lapangan'),
    (5, 4, 'Joko Pramono', 'joko.pramono@example.com', '081234567899', 'Mengawasi pemakaian material proyek'),
    (6, 11, 'Kasim Wijaya', 'kasim.wijaya@example.com', '081234567800', 'Merencanakan dan mengelola proyek dari awal hingga selesai'),
	(7, 2, 'Linda Yuliani', 'linda.yuliani@example.com', '081234567801', 'Koordinasi dengan semua tim proyek'),
    (8, 6, 'Mulyadi Setiono', 'mulyadi.setiono@example.com', '081234567802', 'Mengatur anggaran dan sumber daya proyek'),
    (9, 2, 'Nugroho Budi', 'nugroho.budi@example.com', '081234567803', 'Memantau kemajuan proyek secara keseluruhan'),
	(10, 3, 'Oki Surya', 'oki.surya@example.com', '081234567804', 'Mengatasi kendala teknis dan manajemen proyek'),
    (1, 4, 'Putu Aditya', 'putu.aditya@example.com', '081234567805', 'Mengatur pengadaan material proyek'),
    (2, 4, 'Qori Amalia', 'qori.amalia@example.com', '081234567806', 'Memastikan ketersediaan material sesuai kebutuhan'),
    (3, 4, 'Rudi Santoso', 'rudi.santoso@example.com', '081234567807', 'Mengelola distribusi barang di lokasi proyek'),
	(4, 4, 'Santi Lestari', 'santi.lestari@example.com', '081234567808', 'Melaporkan kondisi logistik secara berkala'),
    (5, 4, 'Toni Wijaya', 'toni.wijaya@example.com', '081234567809', 'Memastikan material tiba tepat waktu'),
    (6, 8, 'Udin Saputra', 'udin.saputra@example.com', '081234567810', 'Mengelola dokumen administrasi proyek'),
    (7, 5, 'Vina Andriani', 'vina.andriani@example.com', '081234567811', 'Membuat laporan harian proyek'),
    (8, 7, 'Wawan Santoso', 'wawan.santoso@example.com', '081234567812', 'Memantau proyek dilapangan'),
	(9, 5, 'Xena Pratama', 'xena.pratama@example.com', '081234567813', 'Menginput data progres proyek'),
    (10, 5, 'Yusuf Efendi', 'yusuf.efendi@example.com', '081234567814', 'Mendokumentasikan laporan dan kontrak'),
    (1, 1, 'Surya Agus', 'Surya.Agus@example.com', '081234567815', 'Melakukan pekerjaan kontruksi'),
    (2, 7, 'Agus Wibowo', 'agus.wibowo@example.com', '081234567816', 'Mengawasi kinerja tim lapangan'),
	(3, 1, 'Beni Pratama', 'beni.pratama@example.com', '081234567817', 'Melakukan pekerjaan kontruksi'),
    (4, 8, 'Cindy Oktavia', 'cindy.oktavia@example.com', '081234567818', 'Melakukan pengecekan teknis secara berkala'),
    (5, 1, 'Doni Sugiarto', 'doni.sugiarto@example.com', '081234567819', 'Melakukan pekerjaan kontruksi'),
    (6, 10, 'Eka Saputra', 'eka.saputra@example.com', '081234567820', 'Memastikan keselamatan kerja di lokasi proyek'),
    (7, 10, 'Faisal Rahman', 'faisal.rahman@example.com', '081234567821', 'Melakukan inspeksi keselamatan rutin di lapangan'),
    (8, 4, 'Gina Marlina', 'gina.marlina@example.com', '081234567822', 'Merancang jadwal proyek dan alokasi sumber daya'),
    (9, 11, 'Hendra Wijaya', 'hendra.wijaya@example.com', '081234567823', 'Mengelola timeline proyek agar tetap sesuai target'),
    (10, 12, 'Indah Pratiwi', 'indah.pratiwi@example.com', '081234567824', 'Memastikan hasil pekerjaan memenuhi standar mutu');

SELECT * FROM Pekerja;


--INSERT INTO Table Absensi--
INSERT INTO Absensi (ID_Pekerja, Tanggal_Absensi, Kehadiran)
VALUES
(1, '2024-01-01', 'Hadir'),
(2, '2024-01-01', 'Izin'),
(3, '2024-01-01', 'Sakit'),
(4, '2024-01-01', 'Hadir'),
(5, '2024-01-01', 'Alfa'),
(6, '2024-01-02', 'Hadir'),
(7, '2024-01-02', 'Sakit'),
(8, '2024-01-02', 'Izin'),
(9, '2024-01-02', 'Hadir'),
(10, '2024-01-02', 'Alfa'),
(11, '2024-01-03', 'Hadir'),
(12, '2024-01-03', 'Sakit'),
(13, '2024-01-03', 'Hadir'),
(14, '2024-01-03', 'Izin'),
(15, '2024-01-03', 'Hadir'),
(16, '2024-01-04', 'Sakit'),
(17, '2024-01-04', 'Hadir'),
(18, '2024-01-04', 'Alfa'),
(19, '2024-01-04', 'Izin'),
(20, '2024-01-04', 'Hadir'),
(21, '2024-01-05', 'Hadir'),
(22, '2024-01-05', 'Sakit'),
(23, '2024-01-05', 'Izin'),
(24, '2024-01-05', 'Hadir'),
(25, '2024-01-05', 'Alfa'),
(26, '2024-01-06', 'Hadir'),
(27, '2024-01-06', 'Sakit'),
(28, '2024-01-06', 'Hadir'),
(29, '2024-01-06', 'Izin'),
(30, '2024-01-06', 'Hadir'),
(31, '2023-12-07', 'Hadir'),
(32, '2023-12-07', 'Sakit'),  
(33, '2023-12-07', 'Izin'),    
(34, '2023-12-07', 'Alfa'),
(35, '2023-12-07', 'Hadir'),
(36, '2023-12-01', 'Hadir'),
(37, '2023-12-02', 'Izin'),
(38, '2023-12-03', 'Sakit'),
(39, '2023-12-04', 'Alfa'),
(40, '2023-12-05', 'Hadir'),
(41, '2023-12-06', 'Hadir'),
(42, '2023-12-07', 'Izin'),
(43, '2023-12-08', 'Sakit'),
(44, '2023-12-09', 'Alfa'),
(45, '2023-12-10', 'Hadir'),
(46, '2023-12-11', 'Izin'),
(47, '2023-12-12', 'Sakit'),
(48, '2023-12-13', 'Hadir'),
(49, '2023-12-14', 'Alfa'),
(50, '2023-12-15', 'Hadir'),
(51, '2023-12-16', 'Hadir'),
(52, '2023-12-17', 'Sakit'),
(53, '2023-12-18', 'Izin'),
(54, '2023-12-19', 'Hadir'),
(55, '2023-12-20', 'Alfa'),
(56, '2023-12-21', 'Hadir'),
(57, '2023-12-22', 'Izin'),
(58, '2023-12-23', 'Sakit'),
(59, '2023-12-24', 'Hadir'),
(60, '2023-12-25', 'Alfa'),
(61, '2023-12-26', 'Hadir'),
(62, '2023-12-27', 'Sakit'),
(63, '2023-12-28', 'Izin'),
(64, '2023-12-29', 'Hadir'),
(65, '2023-12-30', 'Alfa'),
(66, '2023-12-31', 'Hadir'),
(67, '2023-12-01', 'Izin'),
(68, '2023-12-02', 'Sakit'),
(69, '2023-12-03', 'Hadir'),
(70, '2023-12-04', 'Alfa'),
(71, '2023-12-05', 'Hadir'),
(72, '2023-12-06', 'Hadir'),
(73, '2023-12-07', 'Izin'),
(74, '2023-12-08', 'Sakit'),
(75, '2023-12-09', 'Alfa'),
(76, '2023-12-10', 'Hadir'),
(77, '2023-12-11', 'Izin'),
(78, '2023-12-12', 'Sakit'),
(79, '2023-12-13', 'Hadir'),
(80, '2023-12-14', 'Alfa'),
(81, '2023-12-15', 'Hadir'),
(82, '2023-12-16', 'Hadir'),
(83, '2023-12-17', 'Sakit'),
(84, '2023-12-18', 'Izin'),
(85, '2023-12-19', 'Hadir'),
(86, '2023-12-20', 'Alfa'),
(87, '2023-12-21', 'Hadir'),
(88, '2023-12-22', 'Izin'),
(89, '2023-12-23', 'Sakit'),
(90, '2023-12-24', 'Hadir'),
(91, '2023-12-25', 'Alfa'),
(92, '2023-12-26', 'Hadir'),
(93, '2023-12-27', 'Sakit'),
(94, '2023-12-28', 'Izin'),
(95, '2023-12-29', 'Hadir'),
(96, '2023-12-30', 'Alfa'),
(97, '2023-12-31', 'Hadir'),
(98, '2023-12-01', 'Izin'),
(99, '2023-12-02', 'Sakit'),
(100, '2023-12-03', 'Hadir'),
(101, '2023-12-04', 'Alfa'),
(102, '2023-12-05', 'Hadir'),
(103, '2023-12-06', 'Hadir'),
(104, '2023-12-07', 'Izin'),
(105, '2023-12-08', 'Sakit'),
(106, '2023-12-09', 'Alfa'),
(107, '2023-12-10', 'Hadir'),
(108, '2023-12-11', 'Izin'),
(109, '2023-12-12', 'Sakit'),
(110, '2023-12-13', 'Hadir');

SELECT * FROM Absensi;


--INSERT INTO Table Biaya_Proyek--
INSERT INTO Biaya_Proyek (ID_Proyek, Penggunaan_Biaya, Jumlah_Biaya, Tanggal_Transaksi)
VALUES
(1, 'Pembelian material', 1500000.00, '2024-01-15'),
(1, 'Biaya tenaga kerja', 500000.00, '2024-01-16'),
(1, 'Pembelian material', 2000000.00, '2024-01-17'),
(1, 'Biaya tenaga kerja', 600000.00, '2024-01-18'),
(3, 'Pembelian material', 2500000.00, '2024-01-19'),
(3, 'Biaya tenaga kerja', 750000.00, '2024-01-20'),
(4, 'Pembelian material', 1000000.00, '2024-01-21'),
(4, 'Biaya tenaga kerja', 300000.00, '2024-01-22'),
(4, 'Pembelian material', 1200000.00, '2024-01-23'),
(6, 'Biaya tenaga kerja', 400000.00, '2024-01-24'),
(6, 'Pembelian material', 1300000.00, '2024-01-25'),
(6, 'Biaya tenaga kerja', 450000.00, '2024-01-26'),
(7, 'Pembelian material', 1400000.00, '2024-01-27'),
(7, 'Biaya tenaga kerja', 500000.00, '2024-01-28'),
(9, 'Pembelian material', 1700000.00, '2024-02-01'),
(9, 'Biaya tenaga kerja', 600000.00, '2024-02-02'),
(10, 'Pembelian material', 1800000.00, '2024-02-03'),
(10, 'Biaya tenaga kerja', 650000.00, '2024-02-04'),
(1, 'Pembelian material', 1900000.00, '2024-02-05'),
(1, 'Biaya tenaga kerja', 700000.00, '2024-02-06'),
(1, 'Pembelian material', 2000000.00, '2024-02-07'),
(3, 'Biaya tenaga kerja', 750000.00, '2024-02-08'),
(3, 'Pembelian material', 2100000.00, '2024-02-09'),
(3, 'Biaya tenaga kerja', 800000.00, '2024-02-10'),
(4, 'Pembelian material', 2200000.00, '2024-02-11'),
(4, 'Biaya tenaga kerja', 850000.00, '2024-02-12'),
(6, 'Pembelian material', 2300000.00, '2024-02-13'),
(7, 'Biaya tenaga kerja', 900000.00, '2024-02-14'),
(6, 'Pembelian material', 2400000.00, '2024-02-15');

SELECT * FROM Biaya_Proyek;


--INSERT INTO Table Laporan_Progres--
INSERT INTO Laporan_Progres (ID_Proyek, Tanggal_Laporan, Deskripsi, Persentase_Progres)
VALUES
(1, '2024-01-10', 'Laporan awal proyek, persiapan dimulai', 5.00),
(1, '2024-01-20', 'Pekerjaan struktur mulai, persiapan material selesai', 15.00),
(1, '2024-01-30', 'Proses pengecoran dilakukan, struktur dasar selesai', 30.00),
(3, '2024-02-10', 'Pemasangan dinding dimulai, pengerjaan pondasi selesai', 50.00),
(3, '2024-02-20', 'Pekerjaan atap dimulai, pembangunan selesai 75%', 75.00),
(3, '2024-03-01', 'Pekerjaan finishing dimulai, atap terpasang', 90.00),
(4, '2024-03-10', 'Pekerjaan selesai, tinggal finishing akhir', 100.00),
(4, '2024-01-12', 'Proyek dimulai, tahap perencanaan', 10.00),
(4, '2024-01-22', 'Persiapan material dimulai, penggalian dilakukan', 25.00),
(7, '2024-02-02', 'Struktur dimulai, pekerjaannya berjalan sesuai rencana', 40.00),
(6, '2024-02-12', 'Pemasangan struktur beton selesai, pemasangan atap dimulai', 60.00),
(6, '2024-02-22', 'Pekerjaan atap selesai, pekerjaan finishing dimulai', 80.00),
(7, '2024-03-03', 'Finishing selesai, pengecatan dimulai', 90.00),
(7, '2024-03-12', 'Proyek selesai, semua pekerjaan selesai 100%', 100.00),
(1, '2024-01-15', 'Pembukaan lahan dan pemetaan awal, proyek dimulai', 10.00),
(4, '2024-01-25', 'Penggalian dilakukan, pekerjaan pondasi dimulai', 20.00),
(9, '2024-02-05', 'Struktur beton terpasang, pekerjaannya berjalan lancar', 40.00),
(9, '2024-02-15', 'Pekerjaan atap mulai dilakukan, finishing dimulai', 60.00),
(10, '2024-02-25', 'Finishing sebagian selesai, pengecatan dimulai', 80.00),
(10, '2024-03-05', 'Pekerjaan selesai, pengecatan selesai', 100.00),
(1, '2024-01-18', 'Pekerjaan struktur dimulai, pengerjaan pondasi dilakukan', 15.00),
(3, '2024-01-28', 'Pemasangan dinding selesai, pekerjaan atap dimulai', 40.00),
(3, '2024-02-08', 'Struktur selesai, pemasangan atap berlangsung lancar', 60.00),
(4, '2024-02-18', 'Pekerjaan finishing dimulai, pengecatan dilakukan', 80.00),
(6, '2024-02-28', 'Proyek selesai, pengecatan final selesai', 100.00),
(6, '2024-01-11', 'Tahap persiapan proyek, pembelian material', 10.00),
(7, '2024-01-21', 'Pekerjaan pondasi dimulai, pengukuran tanah selesai', 30.00),
(10, '2024-01-31', 'Pemasangan struktur selesai, pekerjaan atap dimulai', 50.00),
(9, '2024-02-10', 'Pekerjaan finishing dimulai, atap terpasang', 70.00),
(10, '2024-02-20', 'Finishing dilakukan, pengecatan dimulai', 90.00),
(1, '2024-03-02', 'Pekerjaan selesai, pengecatan final selesai', 100.00),
(3, '2024-01-14', 'Pekerjaan dimulai dengan pemasangan fondasi', 20.00);

SELECT * FROM Laporan_Progres;

--INSERT INTO Table Penggunaan_Material--
INSERT INTO Penggunaan_Material (ID_Proyek, ID_Material, Kuantitas, Tanggal_Penggunaan)
VALUES
(1, 1, '50 kg', '2024-01-10'),
(1, 2, '100 pcs', '2024-01-15'),
(1, 3, '30 kg', '2024-01-18'),
(3, 4, '200 pcs', '2024-01-20'),
(3, 5, '150 kg', '2024-01-22'),
(3, 6, '75 pcs', '2024-01-25'),
(4, 1, '60 kg', '2024-01-12'),
(4, 2, '120 pcs', '2024-01-17'),
(4, 3, '40 kg', '2024-01-19'),
(6, 4, '250 pcs', '2024-01-23'),
(6, 5, '180 kg', '2024-01-26'),
(6, 6, '90 pcs', '2024-01-28'),
(7, 1, '55 kg', '2024-01-15'),
(7, 2, '110 pcs', '2024-01-20'),
(7, 3, '35 kg', '2024-01-22'),
(9, 4, '220 pcs', '2024-01-25'),
(9, 5, '160 kg', '2024-01-28'),
(9, 6, '80 pcs', '2024-01-30'),
(10, 1, '70 kg', '2024-01-18'),
(10, 2, '140 pcs', '2024-01-23'),
(1, 3, '45 kg', '2024-01-26'),
(10, 4, '270 pcs', '2024-01-29'),
(3, 5, '190 kg', '2024-02-02'),
(4, 6, '95 pcs', '2024-02-05'),
(5, 1, '65 kg', '2024-01-14'),
(6, 2, '130 pcs', '2024-01-19'),
(7, 3, '50 kg', '2024-01-21'),
(8, 4, '240 pcs', '2024-01-24'),
(9, 5, '200 kg', '2024-01-27'),
(10, 6, '100 pcs', '2024-01-30'),
(1, 1, '80 kg', '2024-01-20'),
(3, 2, '160 pcs', '2024-01-25'),
(3, 3, '60 kg', '2024-01-28');

SELECT * FROM Penggunaan_Material;
