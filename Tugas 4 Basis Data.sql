CREATE TABLE Warga (
    warga_id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    nik VARCHAR(20) UNIQUE,
    alamat TEXT,
    no_hp VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Kategori_Aduan (
    kategori_id INT PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(50) NOT NULL
);

CREATE TABLE Admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Petugas (
    petugas_id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    bidang VARCHAR(50),
    no_hp VARCHAR(15)
);

CREATE TABLE Aduan (
    aduan_id INT PRIMARY KEY AUTO_INCREMENT,
    warga_id INT,
    kategori_id INT,
    admin_id INT,
    petugas_id INT,
    deskripsi TEXT,
    lokasi VARCHAR(255),
    lampiran VARCHAR(255),
    tanggal_lapor DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_terakhir VARCHAR(50) DEFAULT 'Baru',
    FOREIGN KEY (warga_id) REFERENCES Warga(warga_id),
    FOREIGN KEY (kategori_id) REFERENCES Kategori_Aduan(kategori_id),
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id),
    FOREIGN KEY (petugas_id) REFERENCES Petugas(petugas_id)
);

CREATE TABLE Status_Aduan (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    aduan_id INT,
    status VARCHAR(50),
    keterangan TEXT,
    tanggal_update DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aduan_id) REFERENCES Aduan(aduan_id)
);

CREATE TABLE Tindak_Lanjut (
    tindak_id INT PRIMARY KEY AUTO_INCREMENT,
    aduan_id INT,
    petugas_id INT,
    deskripsi TEXT,
    bukti_lampiran VARCHAR(255),
    tanggal_tindak DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aduan_id) REFERENCES Aduan(aduan_id),
    FOREIGN KEY (petugas_id) REFERENCES Petugas(petugas_id)
);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    aduan_id INT,
    warga_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    komentar TEXT,
    tanggal_feedback DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aduan_id) REFERENCES Aduan(aduan_id),
    FOREIGN KEY (warga_id) REFERENCES Warga(warga_id)
);
