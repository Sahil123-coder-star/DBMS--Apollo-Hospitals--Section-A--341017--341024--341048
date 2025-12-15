-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `patient_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `dob` DATE NOT NULL,
  `phone` CHAR(10) NULL,
  `city` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`patient_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`doctor` (
  `doctor_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(25) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  `specialty` VARCHAR(80) NOT NULL,
  `status` INT NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `dept_id` INT NOT NULL,
  PRIMARY KEY (`doctor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`appointment` (
  `appointment_id` INT NOT NULL AUTO_INCREMENT,
  `patient_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  `appt_datetime` DATETIME NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  `reason` VARCHAR(200) NULL,
  PRIMARY KEY (`appointment_id`))
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `mydb`.`visit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`visit` (
  `visit_id` INT NOT NULL AUTO_INCREMENT,
  `patient_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  `visit_datetime` DATETIME NOT NULL,
  `visit_type` VARCHAR(10) NOT NULL,
  `complaint` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`visit_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prescription` (
  `prescription_id` INT NOT NULL AUTO_INCREMENT,
  `visit_id` INT NOT NULL,
  `issued_by` INT NOT NULL,
  `instructions` VARCHAR(200) NULL,
  PRIMARY KEY (`prescription_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medication` (
  `med_code` INT NOT NULL,
  `med_name` VARCHAR(100) NOT NULL,
  `strength` VARCHAR(30) NOT NULL,
  `quantity` INT NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`med_code`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `visit_id` INT NOT NULL,
  `patient_id` INT NOT NULL,
  `total_amount` DECIMAL(10,2) NOT NULL,
  `paid_amount` DECIMAL(10,2) NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`invoice_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`department` (
  `dept_id` INT NOT NULL AUTO_INCREMENT,
  `dept_name` VARCHAR(80) NOT NULL,
  `floor` INT NOT NULL,
  PRIMARY KEY (`dept_id`))
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `mydb`.`ward`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ward` (
  `ward_id` INT NOT NULL AUTO_INCREMENT,
  `ward_name` VARCHAR(50) NOT NULL,
  `total_beds` INT NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ward_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`prescription_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prescription_item` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `prescription_id` INT NOT NULL,
  `med_code` INT NOT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
