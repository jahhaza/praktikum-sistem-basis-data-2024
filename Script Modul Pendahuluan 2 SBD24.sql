CREATE DATABASE bandara_horizon_air;

CREATE TABLE BANDARA (
    ID_Bandara INT PRIMARY KEY,
    Nama VARCHAR(50),
    Kota VARCHAR(50),
    Negara VARCHAR(50),
    Kode_IATA CHAR(3)
);

INSERT INTO BANDARA (ID_Bandara, Nama, Kota, Negara, Kode_IATA) VALUES
(1, 'Soekarno-Hatta', 'Jakarta', 'Indonesia', 'CGK'),
(2, 'Ngurah Rai', 'Denpasar', 'Indonesia', 'DPS'),
(3, 'Changi', 'Singapore', 'Singapore', 'SIN'),
(4, 'Haneda', 'Tokyo', 'Japan', 'HND');


CREATE TABLE BAGASI (
    ID_Bagasi INT PRIMARY KEY,
    Berat INT,
    Ukuran CHAR(1),
    Warna VARCHAR(50),
    Jenis VARCHAR(50)
);

INSERT INTO BAGASI (ID_Bagasi, Berat, Ukuran, Warna, Jenis) VALUES
(1, 20, 'M', 'Hitam', 'Koper'),
(2, 15, 'S', 'Merah', 'Ransel'),
(3, 25, 'L', 'Biru', 'Koper'),
(5, 10, 'S', 'Hijau', 'Ransel');

CREATE TABLE MASKAPAI (
    ID_Maskapai CHAR(5) PRIMARY KEY,
    Nama VARCHAR(50),
    Negara_Asal VARCHAR(50)
);

INSERT INTO MASKAPAI (ID_Maskapai, Nama, Negara_Asal) VALUES
('GA123', 'Garuda Indonesia', 'Indonesia'),
('SQ456', 'Singapore Airlines', 'Singapore'),
('JL789', 'Japan Airlines', 'Japan'),
('QZ987', 'AirAsia', 'Malaysia');

CREATE TABLE PENUMPANG (
    NIK CHAR(16) PRIMARY KEY,
    Nama VARCHAR(50),
    Tanggal_Lahir DATE,
    Alamat VARCHAR(100),
    No_Telepon CHAR(13),
    Jenis_Kelamin CHAR(1),
    Kewarganegaraan VARCHAR(50),
    ID_Bagasi INT
);

INSERT INTO PENUMPANG (NIK, Nama, Tanggal_Lahir, Alamat, No_Telepon, Jenis_Kelamin, Kewarganegaraan, ID_Bagasi) VALUES
('3201123456789012', 'Budi Santoso', '1990-04-15', 'Jl. Merdeka No.1', '081234567890', 'L', 'Indonesia', 1),
('3302134567890123', 'Siti Aminah', '1985-08-20', 'Jl. Kebangsaan No.2', '081298765432', 'P', 'Indonesia', 2),
('3403145678901234', 'John Tanaka', '1992-12-05', 'Shibuya, Tokyo', '080123456789', 'L', 'Japan', 3),
('3504156789012345', 'Li Wei', '1995-03-10', 'Orchard Rd, Singapore', '0658123456789', 'L', 'Singapore', 4);

CREATE TABLE PESAWAT (
    ID_Pesawat CHAR(6) PRIMARY KEY,
    Model VARCHAR(50),
    Kapasitas INT,
    Tahun_Produksi YEAR,
    Status_Pesawat VARCHAR(20),
    ID_Maskapai CHAR(5)
);

INSERT INTO PESAWAT (ID_Pesawat, Model, Kapasitas, Tahun_Produksi, Status_Pesawat, ID_Maskapai) VALUES
('PKABC1', 'Boeing 737', 180, 2018, 'Aktif', 'GA123'),
('PKDEF2', 'Airbus A320', 150, 2020, 'Aktif', 'SQ456'),
('PKGHI3', 'Boeing', 250, 2019, 'Dalam Perawatan', 'JL789'),
('PKJKL4', 'Airbus A330', 280, 2021, 'Aktif', 'QZ987');

CREATE TABLE PENERBANGAN (
    ID_Penerbangan CHAR(6) PRIMARY KEY,
    Waktu_Keberangkatan DATETIME,
    Waktu_Sampai DATETIME,
    Status_Penerbangan VARCHAR(20),
    ID_Pesawat CHAR(6)
);

INSERT INTO PENERBANGAN (ID_Penerbangan, Waktu_Keberangkatan, Waktu_Sampai, Status_Penerbangan, ID_Pesawat) VALUES
('FL0001', '2024-12-15 10:00:00', '2024-12-15 12:30:00', 'Jadwal', 'PKABC1'),
('FL0002', '2024-12-16 08:00:00', '2024-12-16 10:45:00', 'Jadwal', 'PKDEF2'),
('FL0003', '2024-12-17 14:00:00', '2024-12-17 16:30:00', 'Ditunda', 'PKGHI3'),
('FL0004', '2024-12-18 18:00:00', '2024-12-18 20:30:00', 'Jadwal', 'PKJKL4');

CREATE TABLE BANDARA_PENERBANGAN (
    Bandara_ID INT,
    Penerbangan_ID CHAR(6),
    PRIMARY KEY (Bandara_ID, Penerbangan_ID)
);

INSERT INTO BANDARA_PENERBANGAN (Bandara_ID, Penerbangan_ID) VALUES
(1, 'FL0001'),
(2, 'FL0002'),
(3, 'FL0003'),
(4, 'FL0004');

CREATE TABLE TIKET (
    ID_Tiket CHAR(6) PRIMARY KEY,
    Nomor_Kursi VARCHAR(5),
    Harga INT,
    Waktu_Pembelian DATETIME,
    Kelas_Penerbangan VARCHAR(20),
    NIK_Penumpang CHAR(16),
    ID_Penerbangan CHAR(6)
);

INSERT INTO TIKET (ID_Tiket, Nomor_Kursi, Harga, Waktu_Pembelian, Kelas_Penerbangan, NIK_Penumpang, ID_Penerbangan) VALUES
('TIK001', '12A', 1200000, '2024-11-01 08:00:00', 'Ekonomi', '3201123456789012', 'FL0001'),
('TIK002', '14B', 1500000, '2024-11-02 09:30:00', 'Bisnis', '3302134567890123', 'FL0002'),
('TIK003', '16C', 2000000, '2024-11-03 10:15:00', 'Ekonomi', '3403145678901234', 'FL0003'),
('TIK004', '18D', 1000000, '2024-11-04 11:45:00', 'Ekonomi', '3504156789012345', 'FL0004');


ALTER TABLE PENUMPANG ADD email VARCHAR(50);
ALTER TABLE BAGASI MODIFY Jenis VARCHAR(50);
ALTER TABLE BANDARA DROP PRIMARY KEY;
ALTER TABLE BANDARA ADD PRIMARY KEY (Kode_IATA);
ALTER TABLE PENUMPANG DROP COLUMN email;

UPDATE PENERBANGAN
SET Waktu_Keberangkatan = '2024-12-15 11:00:00', Waktu_Sampai = '2024-12-15 13:30:00'
WHERE ID_Penerbangan = 'FL0001';

UPDATE PENUMPANG
SET No_Telepon = '081223344556'
WHERE NIK = '3302134567890123';

UPDATE PESAWAT
SET Status_Pesawat = 'Aktif'
WHERE ID_Pesawat = 'PKGHI3';

DELETE FROM TIKET
WHERE NIK_Penumpang = '3504156789012345' AND ID_Penerbangan = 'FL0004';

DELETE FROM BAGASI
WHERE ID_Bagasi = 2;

DELETE FROM PENERBANGAN
WHERE Status_Penerbangan = 'Ditunda';






