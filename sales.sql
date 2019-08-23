-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Sales
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Sales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Sales` DEFAULT CHARACTER SET utf8 ;
USE `Sales` ;

-- -----------------------------------------------------
-- Table `Sales`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales`.`Product` (
  `produc_idt` VARCHAR(10) NOT NULL,
  `product_name` VARCHAR(20) NULL,
  `manufacturer_name` VARCHAR(20) NULL,
  `roduct_rate` DECIMAL(9,4) NULL,
  `sell_price` DECIMAL(9,4) NULL,
  `product_description` VARCHAR(25) NULL,
  PRIMARY KEY (`produc_idt`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sales`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales`.`Client` (
  `client_id` VARCHAR(10) NOT NULL,
  `client_name` CHAR(20) NULL,
  `address` VARCHAR(45) NULL,
  `city` CHAR(15) NULL,
  `pin` DECIMAL(8) NULL,
  `state` CHAR(15) NULL,
  `bal_due` DECIMAL(9,4) NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sales`.`Salesman`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales`.`Salesman` (
  `salesman_id` VARCHAR(10) NOT NULL,
  `salesman_name` CHAR(20) NULL,
  `address` VARCHAR(45) NULL,
  `city` CHAR(15) NULL,
  `pin` DECIMAL(8) NULL,
  `state` CHAR(15) NULL,
  `salary` DECIMAL(9,4) NULL,
  PRIMARY KEY (`salesman_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sales`.`sales_order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales`.`sales_order_details` (
  `idsales_order_details` VARCHAR(10) NOT NULL,
  `sales_order_date` DATE NULL,
  `client_id` VARCHAR(45) NULL,
  `salesman_id` VARCHAR(45) NULL,
  `bill_payby_party` CHAR(5) NULL,
  `delivery_date` DATE NULL,
  `product_rate` DECIMAL(9,4) NULL,
  `tot_quantity_order` DECIMAL(8) NULL,
  `cancel_date` DATE NOT NULL,
  PRIMARY KEY (`idsales_order_details`),
  INDEX `client_id_idx` (`client_id` ASC) VISIBLE,
  INDEX `salesman_id_idx` (`salesman_id` ASC) VISIBLE,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `Sales`.`Client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `salesman_id`
    FOREIGN KEY (`salesman_id`)
    REFERENCES `Sales`.`Salesman` (`salesman_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

Select * from client;
Select * from product;
Select * from salesman;
Select * from sales_order_details;
