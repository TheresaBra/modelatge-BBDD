-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Culo_de_Botella
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Culo_de_Botella
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Culo_de_Botella` DEFAULT CHARACTER SET utf8 ;
USE `Culo_de_Botella` ;

-- -----------------------------------------------------
-- Table `Culo_de_Botella`.`proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Culo_de_Botella`.`proveedor` ;

CREATE TABLE IF NOT EXISTS `Culo_de_Botella`.`proveedor` (
  `id_proveedor` INT NOT NULL,
  `proveedor_nombre` VARCHAR(45) NULL,
  `proveedor_calle` VARCHAR(45) NULL,
  `proveedor_número` INT NULL,
  `proveedor_piso` VARCHAR(45) NULL,
  `proveedor_puerta` INT NULL,
  `proveedor_ciudad` VARCHAR(45) NULL,
  `proveedor_código postañ` INT NULL,
  `proveedor_país` VARCHAR(45) NULL,
  `proveedor_teléfono` INT NULL,
  `proveedor_fax` INT NULL,
  `NIF` VARCHAR(45) NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Culo_de_Botella`.`marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Culo_de_Botella`.`marca` ;

CREATE TABLE IF NOT EXISTS `Culo_de_Botella`.`marca` (
  `id_marca` INT NOT NULL,
  `marca_nombre` VARCHAR(45) NULL,
  `proveedor_id_proveedor` INT NOT NULL,
  PRIMARY KEY (`id_marca`),
  INDEX `fk_marca_proveedor_idx` (`proveedor_id_proveedor` ASC) ,
  CONSTRAINT `fk_marca_proveedor`
    FOREIGN KEY (`proveedor_id_proveedor`)
    REFERENCES `Culo_de_Botella`.`proveedor` (`id_proveedor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Culo_de_Botella`.`empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Culo_de_Botella`.`empleado` ;

CREATE TABLE IF NOT EXISTS `Culo_de_Botella`.`empleado` (
  `id_empleado` INT NOT NULL,
  `empleado_nombre` VARCHAR(45) NULL,
  `empleado_apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Culo_de_Botella`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Culo_de_Botella`.`cliente` ;

CREATE TABLE IF NOT EXISTS `Culo_de_Botella`.`cliente` (
  `id_cliente` INT NOT NULL,
  `cliente_nombre` VARCHAR(45) NULL,
  `cliente_apellido` VARCHAR(45) NULL,
  `cliente_calle` VARCHAR(45) NULL,
  `cliente_número` INT NULL,
  `cliente_piso` VARCHAR(45) NULL,
  `cliente_puerta` INT NULL,
  `cliente_ciudad` VARCHAR(45) NULL,
  `cliente_país` VARCHAR(45) NULL,
  `cliente_código postal` INT NULL,
  `cliente_teléfono` INT NULL,
  `email` VARCHAR(45) NULL,
  `fecha de registro` DATETIME NULL,
  `recomendado por` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Culo_de_Botella`.`gafas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Culo_de_Botella`.`gafas` ;

CREATE TABLE IF NOT EXISTS `Culo_de_Botella`.`gafas` (
  `id_gafas` INT NOT NULL,
  `graduación1` INT NULL,
  `graduación2` INT NULL,
  `montura_flotante` VARCHAR(45) NULL,
  `montura_pasta` VARCHAR(45) NULL,
  `montura_metálico` VARCHAR(45) NULL,
  `color_montura` VARCHAR(45) NULL,
  `color_cristal1` VARCHAR(45) NULL,
  `color_cristal2` VARCHAR(45) NULL,
  `precio` INT NULL,
  `marca_id_marca` INT NOT NULL,
  `empleado_id_empleado` INT NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_gafas`),
  INDEX `fk_gafas_marca1_idx` (`marca_id_marca` ASC) ,
  INDEX `fk_gafas_empleado1_idx` (`empleado_id_empleado` ASC) ,
  INDEX `fk_gafas_cliente1_idx` (`cliente_id_cliente` ASC) ,
  CONSTRAINT `fk_gafas_marca1`
    FOREIGN KEY (`marca_id_marca`)
    REFERENCES `Culo_de_Botella`.`marca` (`id_marca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_gafas_empleado1`
    FOREIGN KEY (`empleado_id_empleado`)
    REFERENCES `Culo_de_Botella`.`empleado` (`id_empleado`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_gafas_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `Culo_de_Botella`.`cliente` (`id_cliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
