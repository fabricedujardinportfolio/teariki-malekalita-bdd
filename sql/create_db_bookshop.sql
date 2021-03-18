-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bookshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bookshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bookshop` DEFAULT CHARACTER SET utf8 ;
USE `bookshop` ;

-- -----------------------------------------------------
-- Table `bookshop`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookshop`.`books` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `author` VARCHAR(45) NULL,
  `genre` VARCHAR(30) NULL,
  `height` INT NULL,
  `publisher` VARCHAR(30) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookshop`.`librarians`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookshop`.`librarians` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookshop`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookshop`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookshop`.`rentals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookshop`.`rentals` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `books_id` INT NOT NULL,
  `clients_id` INT NOT NULL,
  `librarians_id` INT NOT NULL,
  `reference` VARCHAR(45) NOT NULL,
  `rental_date` DATE NOT NULL,
  `return_date` DATE NULL,
  PRIMARY KEY (`id`, `books_id`, `clients_id`, `librarians_id`),
  INDEX `fk_rentals_librarians_idx` (`librarians_id` ASC) VISIBLE,
  INDEX `fk_rentals_books_idx` (`books_id` ASC) VISIBLE,
  INDEX `fk_rentals_clients_idx` (`clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_rentals_librarians`
    FOREIGN KEY (`librarians_id`)
    REFERENCES `bookshop`.`librarians` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rentals_books`
    FOREIGN KEY (`books_id`)
    REFERENCES `bookshop`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rentals_clients`
    FOREIGN KEY (`clients_id`)
    REFERENCES `bookshop`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookshop`.`reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bookshop`.`reservations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `books_id` INT NOT NULL,
  `clients_id` INT NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id`, `books_id`, `clients_id`),
  INDEX `fk_reservations_books_idx` (`books_id` ASC) VISIBLE,
  INDEX `fk_reservations_clients_idx` (`clients_id` ASC) VISIBLE,
  CONSTRAINT `fk_reservations_books`
    FOREIGN KEY (`books_id`)
    REFERENCES `bookshop`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservations_clients`
    FOREIGN KEY (`clients_id`)
    REFERENCES `bookshop`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
