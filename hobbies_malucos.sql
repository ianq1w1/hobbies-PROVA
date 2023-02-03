-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hobbies_malucos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hobbies_malucos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hobbies_malucos` DEFAULT CHARACTER SET utf8 ;
USE `hobbies_malucos` ;

-- -----------------------------------------------------
-- Table `hobbies_malucos`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hobbies_malucos`.`USUARIO` (
  `USUARIO_ID` INT NOT NULL AUTO_INCREMENT,
  `USUARIO_NOME` VARCHAR(45) NOT NULL,
  `USUARIO_EMAIL` VARCHAR(45) NOT NULL,
  `USUARIO_SENHA` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`USUARIO_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hobbies_malucos`.`HOBBIE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hobbies_malucos`.`HOBBIE` (
  `HOBBIE_ID` INT NOT NULL AUTO_INCREMENT,
  `HOBBIE_NOME` VARCHAR(45) NOT NULL,
  `HOBBIE_DESCRICAO` VARCHAR(255) NOT NULL,
  `HOBBIE_FREQUENCIA` VARCHAR(255) NOT NULL,
  `HOBBIE_USUARIO_ID` INT NULL,
  PRIMARY KEY (`HOBBIE_ID`),
  INDEX `fk_HOBBIE_USUARIO_idx` (`HOBBIE_USUARIO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_HOBBIE_USUARIO`
    FOREIGN KEY (`HOBBIE_USUARIO_ID`)
    REFERENCES `hobbies_malucos`.`USUARIO` (`USUARIO_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
