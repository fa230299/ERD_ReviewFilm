-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ReviewFilm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ReviewFilm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ReviewFilm` DEFAULT CHARACTER SET utf8 ;
USE `ReviewFilm` ;

-- -----------------------------------------------------
-- Table `ReviewFilm`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ReviewFilm`.`profile` (
  `idprofile` INT NOT NULL,
  `Biodata` VARCHAR(45) NULL,
  `Usia` INT NULL,
  `Alamat` VARCHAR(45) NULL,
  PRIMARY KEY (`idprofile`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReviewFilm`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ReviewFilm`.`User` (
  `idUser` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `profile_idprofile` INT NOT NULL,
  PRIMARY KEY (`idUser`, `profile_idprofile`),
  INDEX `fk_User_profile1_idx` (`profile_idprofile` ASC) VISIBLE,
  CONSTRAINT `fk_User_profile1`
    FOREIGN KEY (`profile_idprofile`)
    REFERENCES `ReviewFilm`.`profile` (`idprofile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReviewFilm`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ReviewFilm`.`Movie` (
  `idMovie` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `release_year` INT NOT NULL,
  `summary` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idMovie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReviewFilm`.`Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ReviewFilm`.`Review` (
  `idReview` INT NOT NULL,
  `rating` VARCHAR(45) NOT NULL,
  `critics` VARCHAR(45) NOT NULL,
  `Movie_idMovie` INT NOT NULL,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idReview`, `Movie_idMovie`, `idUser`),
  INDEX `fk_Review_Movie1_idx` (`Movie_idMovie` ASC) VISIBLE,
  INDEX `fk_Review_User1_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Review_Movie1`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `ReviewFilm`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `ReviewFilm`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReviewFilm`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ReviewFilm`.`Genre` (
  `idGenre` INT NOT NULL,
  `nama` VARCHAR(45) NULL,
  `Movie_idMovie` INT NOT NULL,
  PRIMARY KEY (`idGenre`, `Movie_idMovie`),
  INDEX `fk_Genre_Movie1_idx` (`Movie_idMovie` ASC) VISIBLE,
  CONSTRAINT `fk_Genre_Movie1`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `ReviewFilm`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReviewFilm`.`cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ReviewFilm`.`cast` (
  `idcast` INT NOT NULL,
  `biodata` VARCHAR(45) NOT NULL,
  `usia` INT NULL,
  `nama` VARCHAR(45) NULL,
  PRIMARY KEY (`idcast`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ReviewFilm`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ReviewFilm`.`role` (
  `idrole` INT NOT NULL,
  `Biodata` VARCHAR(45) NULL,
  `Usia` INT NULL,
  PRIMARY KEY (`idrole`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `ReviewFilm`.`Movie_has_cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ReviewFilm`.`Movie_has_cast` (
  `Movie_idMovie` INT NOT NULL,
  `cast_idcast` INT NOT NULL,
  `role_idrole` INT NOT NULL,
  PRIMARY KEY (`Movie_idMovie`, `cast_idcast`, `role_idrole`),
  INDEX `fk_Movie_has_cast_cast1_idx` (`cast_idcast` ASC) VISIBLE,
  INDEX `fk_Movie_has_cast_Movie1_idx` (`Movie_idMovie` ASC) VISIBLE,
  INDEX `fk_Movie_has_cast_role1_idx` (`role_idrole` ASC) VISIBLE,
  CONSTRAINT `fk_Movie_has_cast_Movie1`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `ReviewFilm`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_cast_cast1`
    FOREIGN KEY (`cast_idcast`)
    REFERENCES `ReviewFilm`.`cast` (`idcast`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_cast_role1`
    FOREIGN KEY (`role_idrole`)
    REFERENCES `ReviewFilm`.`role` (`idrole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
