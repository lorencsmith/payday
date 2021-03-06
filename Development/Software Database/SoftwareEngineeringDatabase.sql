-- MySQL Script generated by MySQL Workbench
-- 11/16/14 14:00:59
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Accounting
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Accounting
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Accounting` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Accounting` ;

-- -----------------------------------------------------
-- Table `Accounting`.`BusinessTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Accounting`.`BusinessTable` (
  `businessId` INT NOT NULL,
  `businessName` VARCHAR(45) NOT NULL,
  `streetAddress` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zipcode` INT NOT NULL,
  `phoneNumber` INT NOT NULL,
  PRIMARY KEY (`businessId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Accounting`.`TransactionsTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Accounting`.`TransactionsTable` (
  `businessId` INT NOT NULL,
  `transactionsId` INT NOT NULL,
  `timeStamp` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `amount` INT NOT NULL,
  `BusinessTable_businessId` INT NOT NULL,
  PRIMARY KEY (`businessId`, `transactionsId`, `BusinessTable_businessId`),
  INDEX `fk_TransactionsTable_BusinessTable_idx` (`BusinessTable_businessId` ASC),
  CONSTRAINT `fk_TransactionsTable_BusinessTable`
    FOREIGN KEY (`BusinessTable_businessId`)
    REFERENCES `Accounting`.`BusinessTable` (`businessId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Accounting`.`UserTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Accounting`.`UserTable` (
  `businessId` INT NOT NULL,
  `userId` INT NOT NULL,
  `userEmail` VARCHAR(45) NOT NULL,
  `userFirstName` VARCHAR(45) NOT NULL,
  `userLastName` VARCHAR(45) NOT NULL,
  `userPassword` VARCHAR(45) NOT NULL,
  `userImage` LONGBLOB NOT NULL,
  `userBio` VARCHAR(45) NOT NULL,
  `userBankRouting` INT NOT NULL,
  `userBankAccount` INT NOT NULL,
  `isManager` VARCHAR(45) NOT NULL,
  `phoneNumber` INT NOT NULL,
  `BusinessTable_businessId` INT NOT NULL,
  PRIMARY KEY (`businessId`, `userId`, `userEmail`),
  INDEX `fk_UserTable_BusinessTable1_idx` (`BusinessTable_businessId` ASC),
  CONSTRAINT `fk_UserTable_BusinessTable1`
    FOREIGN KEY (`BusinessTable_businessId`)
    REFERENCES `Accounting`.`BusinessTable` (`businessId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Accounting`.`WorktimeTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Accounting`.`WorktimeTable` (
  `userId` INT NOT NULL,
  `worktimeId` INT NOT NULL,
  `timeStampIn` INT NOT NULL,
  `timeStampOut` INT NOT NULL,
  `UserTable_userId` INT NOT NULL,
  `UserTable_userEmail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userId`, `worktimeId`),
  INDEX `fk_worktimeTable_UserTable1_idx` (`UserTable_userId` ASC, `UserTable_userEmail` ASC),
  CONSTRAINT `fk_worktimeTable_UserTable1`
    FOREIGN KEY (`UserTable_userId` , `UserTable_userEmail`)
    REFERENCES `Accounting`.`UserTable` (`userId` , `userEmail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Accounting`.`CategoryTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Accounting`.`CategoryTable` (
  `businessId` INT NOT NULL,
  `categoryId` INT NOT NULL,
  `categoryName` VARCHAR(45) NOT NULL,
  `BusinessTable_businessId` INT NOT NULL,
  PRIMARY KEY (`businessId`),
  INDEX `fk_CategoryTable_BusinessTable1_idx` (`BusinessTable_businessId` ASC),
  CONSTRAINT `fk_CategoryTable_BusinessTable1`
    FOREIGN KEY (`BusinessTable_businessId`)
    REFERENCES `Accounting`.`BusinessTable` (`businessId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
