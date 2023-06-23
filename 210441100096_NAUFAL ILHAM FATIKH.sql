-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema toko_buku
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema toko_buku
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `toko_buku` DEFAULT CHARACTER SET utf8 ;
USE `toko_buku` ;

-- -----------------------------------------------------
-- Table `toko_buku`.`penulis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `toko_buku`.`penulis` (
  `id_penulis` INT NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(100) NOT NULL,
  `negara` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_penulis`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `toko_buku`.`buku`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `toko_buku`.`buku` (
  `id_buku` INT NOT NULL AUTO_INCREMENT,
  `judul` VARCHAR(45) NOT NULL,
  `harga` INT(11) NOT NULL,
  `stok` INT(11) NOT NULL,
  `id_penulis` INT NOT NULL,
  PRIMARY KEY (`id_buku`),
  INDEX `fk_buku_penulis_idx` (`id_penulis` ASC),
  CONSTRAINT `fk_buku_penulis`
    FOREIGN KEY (`id_penulis`)
    REFERENCES `toko_buku`.`penulis` (`id_penulis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `toko_buku`.`penjualan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `toko_buku`.`penjualan` (
  `id_penjualan` INT NOT NULL AUTO_INCREMENT,
  `tanggal` DATE NULL,
  `jumlah` INT(11) NULL,
  `id_buku` INT NOT NULL,
  PRIMARY KEY (`id_penjualan`),
  INDEX `fk_penjualan_buku1_idx` (`id_buku` ASC),
  CONSTRAINT `fk_penjualan_buku1`
    FOREIGN KEY (`id_buku`)
    REFERENCES `toko_buku`.`buku` (`id_buku`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


USE toko_buku;

insert into penulis (id_penulis, nama, nagara) 
values (1,'dafit', 'jepang'), (1,'roy', 'yunani'), (1, 'edwart', 'jerman');

insert into buku (id_buku, judul, harga, stok, id_penulis)
values ('sangkuriang', 7000, 8, 1);


create VIEW viewBukuPenulis AS select buku.judul, buku.harga, buku.stok, penulis.nama, penulis.negara;
create VIEW viewBukuPenulis AS select buku.judul, buku.harga, buku.stok, penulis.nama, penulis.negara;
