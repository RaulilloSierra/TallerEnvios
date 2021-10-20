-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Envios
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Envios
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Envios` DEFAULT CHARACTER SET utf8 ;
USE `Envios` ;

-- -----------------------------------------------------
-- Table `Envios`.`Conductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Envios`.`Conductor` (
  `idConductor` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConductor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Envios`.`Camion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Envios`.`Camion` (
  `Matricula` INT NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Capacidad` INT NOT NULL,
  `idConductor` VARCHAR(45) NOT NULL,
  INDEX `Matricula_idx` (`idConductor` ASC) VISIBLE,
  CONSTRAINT `Matricula`
    FOREIGN KEY (`idConductor`)
    REFERENCES `Envios`.`Conductor` (`idConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Envios`.`Paquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Envios`.`Paquete` (
  `CodigoPaquete` INT NOT NULL,
  `Destinatario` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `idConductor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodigoPaquete`),
  INDEX `idConductor_idx` (`idConductor` ASC) VISIBLE,
  CONSTRAINT `idConductor`
    FOREIGN KEY (`idConductor`)
    REFERENCES `Envios`.`Conductor` (`idConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Envios`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Envios`.`Persona` (
  `idPersona` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `CodigoPostal` INT NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `CodigoPaquete` INT NOT NULL,
  PRIMARY KEY (`idPersona`),
  INDEX `CodigoPaquete_idx` (`CodigoPaquete` ASC) VISIBLE,
  CONSTRAINT `CodigoPaquete`
    FOREIGN KEY (`CodigoPaquete`)
    REFERENCES `Envios`.`Paquete` (`CodigoPaquete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
