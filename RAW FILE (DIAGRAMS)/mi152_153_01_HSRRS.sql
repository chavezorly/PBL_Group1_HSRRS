-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ems
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ems
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ems` DEFAULT CHARACTER SET utf8 ;
USE `ems` ;

-- -----------------------------------------------------
-- Table `ems`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`department` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `dept_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ems`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`position` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `pos_name` VARCHAR(25) NOT NULL,
  `pos_des` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ems`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`employee` (
  `id` INT(11) NOT NULL,
  `emp_lname` VARCHAR(20) NOT NULL,
  `emp_fname` VARCHAR(20) NOT NULL,
  `emp_mname` VARCHAR(15) NOT NULL,
  `emp_contact_no` VARCHAR(15) NOT NULL,
  `position_id` INT(11) NOT NULL,
  `department_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employee_position1_idx` (`position_id` ASC),
  INDEX `fk_employee_department1_idx` (`department_id` ASC),
  CONSTRAINT `fk_employee_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `ems`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_position1`
    FOREIGN KEY (`position_id`)
    REFERENCES `ems`.`position` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ems`.`hierarchy_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`hierarchy_level` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `level_num` VARCHAR(1) NOT NULL,
  `department_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hierarchy_level_department1_idx` (`department_id` ASC),
  CONSTRAINT `fk_hierarchy_level_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `ems`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ems`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`room` (
  `room_no` INT(4) NOT NULL,
  `room_location` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`room_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ems`.`ticket_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`ticket_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(45) NOT NULL,
  `department_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ticket_type_department1_idx` (`department_id` ASC),
  CONSTRAINT `fk_ticket_type_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `ems`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ems`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `auth_key` VARCHAR(32) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `password_reset_token` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `status` SMALLINT(6) NOT NULL,
  `created_at` INT(11) NOT NULL,
  `updated_at` INT(11) NOT NULL,
  `employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_employee1_idx` (`employee_id` ASC),
  CONSTRAINT `fk_user_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `ems`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ems`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`ticket` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tick_request` VARCHAR(45) NULL,
  `tick_priority` VARCHAR(7) NOT NULL,
  `tick_others` VARCHAR(255) NULL,
  `tick_timelimit` TIME NOT NULL,
  `tick_startDate` DATETIME NOT NULL,
  `tick_status` VARCHAR(6) NOT NULL,
  `tick_closed_date` DATETIME NULL DEFAULT NULL,
  `room_room_no` INT(11) NOT NULL,
  `ticket_type_id` INT(11) NOT NULL,
  `created_by` INT(11) NOT NULL,
  `assigned_to` INT(11) NULL,
  `closed_by` INT(11) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ticket_room1_idx` (`room_room_no` ASC),
  INDEX `fk_ticket_ticket_type1_idx` (`ticket_type_id` ASC),
  INDEX `fk_ticket_user1_idx` (`created_by` ASC),
  INDEX `fk_ticket_user2_idx` (`assigned_to` ASC),
  INDEX `fk_ticket_user3_idx` (`closed_by` ASC),
  CONSTRAINT `fk_ticket_room1`
    FOREIGN KEY (`room_room_no`)
    REFERENCES `ems`.`room` (`room_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_ticket_type1`
    FOREIGN KEY (`ticket_type_id`)
    REFERENCES `ems`.`ticket_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_user1`
    FOREIGN KEY (`created_by`)
    REFERENCES `ems`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_user2`
    FOREIGN KEY (`assigned_to`)
    REFERENCES `ems`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_user3`
    FOREIGN KEY (`closed_by`)
    REFERENCES `ems`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ems`.`escalated_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`escalated_ticket` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `esc_date_received` DATE NOT NULL,
  `esc_time_received` TIME NOT NULL,
  `esc_reason` VARCHAR(50) NOT NULL,
  `esc_owner` VARCHAR(45) NOT NULL,
  `esc_status` VARCHAR(10) NOT NULL,
  `esc_priority` VARCHAR(10) NOT NULL,
  `esc_time_closed` TIME NOT NULL,
  `esc_date_closed` DATE NOT NULL,
  `hierarchy_level_id` INT(11) NOT NULL,
  `ticket_id` INT(11) NOT NULL,
  `timelimit` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_escalated_ticket_hierarchy_level1_idx` (`hierarchy_level_id` ASC),
  INDEX `fk_escalated_ticket_ticket1_idx` (`ticket_id` ASC),
  CONSTRAINT `fk_escalated_ticket_hierarchy_level1`
    FOREIGN KEY (`hierarchy_level_id`)
    REFERENCES `ems`.`hierarchy_level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_escalated_ticket_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `ems`.`ticket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ems`.`escalation_ticket_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`escalation_ticket_history` (
  `id` INT NOT NULL,
  `heirarchy_level` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `reason` VARCHAR(45) NULL,
  `timestamp` VARCHAR(45) NULL,
  `escalated_ticket_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_escalation_ticket_history_escalated_ticket1_idx` (`escalated_ticket_id` ASC),
  CONSTRAINT `fk_escalation_ticket_history_escalated_ticket1`
    FOREIGN KEY (`escalated_ticket_id`)
    REFERENCES `ems`.`escalated_ticket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
