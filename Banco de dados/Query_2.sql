-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema familia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema familia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `familia` DEFAULT CHARACTER SET utf8mb3 ;
USE `familia` ;

-- -----------------------------------------------------
-- Table `familia`.`mae`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `familia`.`mae` (
  `id_mae` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `profissao` VARCHAR(80) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_mae`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `familia`.`pai`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `familia`.`pai` (
  `id_pai` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `profissao` VARCHAR(80) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_pai`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `familia`.`filho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `familia`.`filho` (
  `id_filho` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `id_pai` INT NOT NULL,
  `id_mae` INT NOT NULL,
  PRIMARY KEY (`id_filho`, `id_pai`, `id_mae`),
  CONSTRAINT `fk_filho_mae1`
    FOREIGN KEY (`id_mae`)
    REFERENCES `familia`.`mae` (`id_mae`),
  CONSTRAINT `fk_filho_pai`
    FOREIGN KEY (`id_pai`)
    REFERENCES `familia`.`pai` (`id_pai`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
