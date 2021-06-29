-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Project_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Project_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Project_database` ;
USE `Project_database` ;

-- -----------------------------------------------------
-- Table `Project_database`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_database`.`City` (
  `Id` INT NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_database`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_database`.`Address` (
  `Id` INT NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `House_Number` INT NOT NULL,
  `Postal_Code` VARCHAR(45) NOT NULL,
  `City_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Address_City1_idx` (`City_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Address_City1`
    FOREIGN KEY (`City_Id`)
    REFERENCES `Project_database`.`City` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_database`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_database`.`Customer` (
  `Id` INT NOT NULL,
  `First_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Date_of_Birth` DATE NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `NIB` INT NOT NULL,
  `Address_Id` INT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Customer_Address1_idx` (`Address_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Address1`
    FOREIGN KEY (`Address_Id`)
    REFERENCES `Project_database`.`Address` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_database`.`Sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_database`.`Sale` (
  `Id` INT NOT NULL,
  `Total` DOUBLE NOT NULL,
  `Date_Sold` DATE NOT NULL,
  `Customer_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `idSale_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Sale_Customer1_idx` (`Customer_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Sale_Customer1`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `Project_database`.`Customer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_database`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_database`.`Product` (
  `Bar_Code` INT NOT NULL,
  `MSRP` DOUBLE NOT NULL,
  `Price` DOUBLE NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Brand` VARCHAR(45) NOT NULL,
  `Release_Date` DATE NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Product_Type` VARCHAR(45) NOT NULL,
  `Aditional_Description` VARCHAR(100) NULL,
  `Average_Rating` DOUBLE NULL,
  `Sale_Id` INT NULL,
  PRIMARY KEY (`Bar_Code`),
  UNIQUE INDEX `Bar_Code_UNIQUE` (`Bar_Code` ASC) VISIBLE,
  INDEX `fk_Product_Sale1_idx` (`Sale_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Sale1`
    FOREIGN KEY (`Sale_Id`)
    REFERENCES `Project_database`.`Sale` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_database`.`Phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_database`.`Phone` (
  `Customer_Id` INT NOT NULL,
  `Phone_Number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Phone_Number`),
  INDEX `fk_Phone_Customer1_idx` (`Customer_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Phone_Customer1`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `Project_database`.`Customer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_database`.`Returned`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_database`.`Returned` (
  `Id` INT NOT NULL,
  `Date_Returned` DATE NOT NULL,
  `Product_Bar_Code` INT NOT NULL,
  `Sale_Id` INT NOT NULL,
  `Customer_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Returned_Product_idx` (`Product_Bar_Code` ASC) VISIBLE,
  INDEX `fk_Returned_Sale1_idx` (`Sale_Id` ASC) VISIBLE,
  INDEX `fk_Returned_Customer1_idx` (`Customer_Id` ASC) VISIBLE,
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  CONSTRAINT `fk_Returned_Product`
    FOREIGN KEY (`Product_Bar_Code`)
    REFERENCES `Project_database`.`Product` (`Bar_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Returned_Sale1`
    FOREIGN KEY (`Sale_Id`)
    REFERENCES `Project_database`.`Sale` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Returned_Customer1`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `Project_database`.`Customer` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
