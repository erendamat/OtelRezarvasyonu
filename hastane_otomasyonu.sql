CREATE DATABASE IF NOT EXISTS hastane_db;
USE hastane_db;

CREATE TABLE Poliklinik (
    poliklinik_id INT AUTO_INCREMENT PRIMARY KEY,
    poliklinik_adi VARCHAR(100) NOT NULL
);

CREATE TABLE Hasta (
    hasta_id INT AUTO_INCREMENT PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    tc_kimlik CHAR(11) UNIQUE
);

CREATE TABLE Laboratuvar (
    laboratuvar_id INT AUTO_INCREMENT PRIMARY KEY,
    laboratuvar_adi VARCHAR(100) NOT NULL
);

CREATE TABLE Doktor (
    doktor_id INT AUTO_INCREMENT PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    poliklinik_id INT,
    FOREIGN KEY (poliklinik_id) REFERENCES Poliklinik(poliklinik_id)
); 

CREATE TABLE Servis (
    servis_id INT AUTO_INCREMENT PRIMARY KEY,
    servis_adi VARCHAR(100) NOT NULL,
    poliklinik_id INT,
    FOREIGN KEY (poliklinik_id) REFERENCES Poliklinik(poliklinik_id)
); 

CREATE TABLE Hemsire (
    hemsire_id INT AUTO_INCREMENT PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    servis_id INT,
    FOREIGN KEY (servis_id) REFERENCES Servis(servis_id)
); 

CREATE TABLE Tahlil (
    tahlil_id INT AUTO_INCREMENT PRIMARY KEY,
    tahlil_adi VARCHAR(100) NOT NULL,
    laboratuvar_id INT,
    FOREIGN KEY (laboratuvar_id) REFERENCES Laboratuvar(laboratuvar_id)
); 

CREATE TABLE Muayene (
    muayene_id INT AUTO_INCREMENT PRIMARY KEY,
    hasta_id INT,
    poliklinik_id INT,
    muayene_tarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (hasta_id) REFERENCES Hasta(hasta_id),
    FOREIGN KEY (poliklinik_id) REFERENCES Poliklinik(poliklinik_id)
); 

CREATE TABLE Hasta_Tahlil (
    islem_id INT AUTO_INCREMENT PRIMARY KEY,
    hasta_id INT,
    tahlil_id INT,
    isteyen_doktor_id INT,
    islem_tarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (hasta_id) REFERENCES Hasta(hasta_id),
    FOREIGN KEY (tahlil_id) REFERENCES Tahlil(tahlil_id),
    FOREIGN KEY (isteyen_doktor_id) REFERENCES Doktor(doktor_id)
);