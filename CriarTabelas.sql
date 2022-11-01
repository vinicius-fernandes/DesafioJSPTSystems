-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blogs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blogs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blogs` DEFAULT CHARACTER SET utf8 ;
USE `blogs` ;

-- -----------------------------------------------------
-- Table `blogs`.`TiposUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs`.`TiposUsuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blogs`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs`.`Usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `TiposUsuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Usuarios_TiposUsuario_idx` (`TiposUsuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_TiposUsuario`
    FOREIGN KEY (`TiposUsuario_id`)
    REFERENCES `blogs`.`TiposUsuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blogs`.`Postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs`.`Postagens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `corpo` VARCHAR(3000) NOT NULL,
  `dataCriacao` DATETIME  DEFAULT CURRENT_TIMESTAMP,
  `UsuarioCriador_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Postagens_Usuarios1_idx` (`UsuarioCriador_id` ASC) VISIBLE,
  CONSTRAINT `fk_Postagens_Usuarios1`
    FOREIGN KEY (`UsuarioCriador_id`)
    REFERENCES `blogs`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blogs`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogs`.`Comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Postagens_id` INT NOT NULL,
  `Usuarios_id` INT NOT NULL,
`corpo` VARCHAR(255) NOT NULL,
  `dataCriacao` DATETIME  DEFAULT CURRENT_TIMESTAMP,
  `aprovado` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comentarios_Postagens1_idx` (`Postagens_id` ASC) VISIBLE,
  INDEX `fk_Comentarios_Usuarios1_idx` (`Usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comentarios_Postagens1`
    FOREIGN KEY (`Postagens_id`)
    REFERENCES `blogs`.`Postagens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_Usuarios1`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `blogs`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
