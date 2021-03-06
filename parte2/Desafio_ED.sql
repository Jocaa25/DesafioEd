-- MySQL Script generated by MySQL Workbench
-- Thu Oct 15 12:41:30 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema desafio_ED
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema desafio_ED
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `desafio_ED` DEFAULT CHARACTER SET utf8 ;
USE `desafio_ED` ;

-- -----------------------------------------------------
-- Table `desafio_ED`.`Visitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`Visitante` (
  `fullvisitorId` INT NOT NULL,
  `channelGrouping` VARCHAR(45) NOT NULL,
  `socialEngagementType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`fullvisitorId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ED`.`Sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`Sessao` (
  `visitId` INT NOT NULL,
  `visitNumber` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `visitStartTime` VARCHAR(45) NOT NULL,
  `pageView` VARCHAR(45) NOT NULL,
  `timeOnSite` VARCHAR(45) NOT NULL,
  `Visitante_fullvisitorId` INT NOT NULL,
  PRIMARY KEY (`visitId`),
  INDEX `fk_Sessao_Visitante_idx` (`Visitante_fullvisitorId` ASC) VISIBLE,
  CONSTRAINT `fk_Sessao_Visitante`
    FOREIGN KEY (`Visitante_fullvisitorId`)
    REFERENCES `desafio_ED`.`Visitante` (`fullvisitorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ED`.`Sessao_conveniencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`Sessao_conveniencia` (
  `Data` INT NOT NULL,
  `vitis` INT NOT NULL,
  `newVisits` INT NOT NULL,
  `Sessao_visitId` INT NOT NULL,
  PRIMARY KEY (`Data`, `Sessao_visitId`),
  INDEX `fk_Sessao_conveniencia_Sessao1_idx` (`Sessao_visitId` ASC) VISIBLE,
  CONSTRAINT `fk_Sessao_conveniencia_Sessao1`
    FOREIGN KEY (`Sessao_visitId`)
    REFERENCES `desafio_ED`.`Sessao` (`visitId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ED`.`Trafego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`Trafego` (
  `campaingCode` INT NOT NULL,
  `campaing` VARCHAR(45) NOT NULL,
  `source` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`campaingCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ED`.`dispositivo_Mobile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`dispositivo_Mobile` (
  `mobileDeviceInfo` INT NOT NULL,
  `mobileDeviceModel` VARCHAR(45) NULL,
  `mobileDeviceMarketingName` VARCHAR(45) NULL,
  `mobileDeviceBranding` VARCHAR(45) NULL,
  ` mobileInputSelector` VARCHAR(45) NULL,
  PRIMARY KEY (`mobileDeviceInfo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ED`.`Navegador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`Navegador` (
  `browser` VARCHAR(10) NOT NULL,
  `browserVersion` VARCHAR(45) NULL,
  `browserSize` VARCHAR(45) NULL,
  PRIMARY KEY (`browser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ED`.`Dispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`Dispositivo` (
  `deviceCategory` VARCHAR(10) NOT NULL,
  `operatingSystem` VARCHAR(45) NOT NULL,
  `operatingSystemVersion` VARCHAR(45) NOT NULL,
  `flashVersion` VARCHAR(45) NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  `screnColors` VARCHAR(45) NOT NULL,
  `screenResolution` VARCHAR(45) NOT NULL,
  `Visitante_fullvisitorId` INT NOT NULL,
  `dispositivo_Mobile_mobileDeviceInfo` INT NOT NULL,
  `Navegador_browser` VARCHAR(10) NOT NULL,
  `Trafego_campaingCode` INT NOT NULL,
  PRIMARY KEY (`deviceCategory`),
  INDEX `fk_Dispositivo_Visitante1_idx` (`Visitante_fullvisitorId` ASC) VISIBLE,
  INDEX `fk_Dispositivo_dispositivo_Mobile1_idx` (`dispositivo_Mobile_mobileDeviceInfo` ASC) VISIBLE,
  INDEX `fk_Dispositivo_Navegador1_idx` (`Navegador_browser` ASC) VISIBLE,
  INDEX `fk_Dispositivo_Trafego1_idx` (`Trafego_campaingCode` ASC) VISIBLE,
  CONSTRAINT `fk_Dispositivo_Visitante1`
    FOREIGN KEY (`Visitante_fullvisitorId`)
    REFERENCES `desafio_ED`.`Visitante` (`fullvisitorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dispositivo_dispositivo_Mobile1`
    FOREIGN KEY (`dispositivo_Mobile_mobileDeviceInfo`)
    REFERENCES `desafio_ED`.`dispositivo_Mobile` (`mobileDeviceInfo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dispositivo_Navegador1`
    FOREIGN KEY (`Navegador_browser`)
    REFERENCES `desafio_ED`.`Navegador` (`browser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dispositivo_Trafego1`
    FOREIGN KEY (`Trafego_campaingCode`)
    REFERENCES `desafio_ED`.`Trafego` (`campaingCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ED`.`Continete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`Continete` (
  `idContinete` INT NOT NULL,
  `continet` VARCHAR(45) NOT NULL,
  `subContinet` VARCHAR(45) NOT NULL,
  `Continetecol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idContinete`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ED`.`Localidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`Localidade` (
  `country` VARCHAR(45) NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  `metro` VARCHAR(45) NOT NULL,
  `latitude` VARCHAR(45) NOT NULL,
  `longitude` VARCHAR(45) NOT NULL,
  `Visitante_fullvisitorId` INT NOT NULL,
  `Continete_idContinete` INT NOT NULL,
  PRIMARY KEY (`country`),
  INDEX `fk_Localidade_Visitante1_idx` (`Visitante_fullvisitorId` ASC) VISIBLE,
  INDEX `fk_Localidade_Continete1_idx` (`Continete_idContinete` ASC) VISIBLE,
  CONSTRAINT `fk_Localidade_Visitante1`
    FOREIGN KEY (`Visitante_fullvisitorId`)
    REFERENCES `desafio_ED`.`Visitante` (`fullvisitorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Localidade_Continete1`
    FOREIGN KEY (`Continete_idContinete`)
    REFERENCES `desafio_ED`.`Continete` (`idContinete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ED`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desafio_ED`.`City` (
  `cityId` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `Localidade_country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cityId`, `Localidade_country`),
  INDEX `fk_City_Localidade1_idx` (`Localidade_country` ASC) VISIBLE,
  CONSTRAINT `fk_City_Localidade1`
    FOREIGN KEY (`Localidade_country`)
    REFERENCES `desafio_ED`.`Localidade` (`country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
