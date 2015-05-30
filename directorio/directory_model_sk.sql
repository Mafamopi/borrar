-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sql379173
-- -----------------------------------------------------
-- Contact's database.

-- -----------------------------------------------------
-- Schema sql379173
--
-- Contact's database.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql379173` DEFAULT CHARACTER SET utf8 ;
USE `sql379173` ;

-- -----------------------------------------------------
-- Table `sql379173`.`contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql379173`.`contact` ;

CREATE TABLE IF NOT EXISTS `sql379173`.`contact` (
  `contactid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification contact',
  `contactname` VARCHAR(50) NOT NULL COMMENT 'Name contact',
  `contactphone` VARCHAR(13) NULL COMMENT 'Phone contact',
  `contactenable` TINYINT(1) NOT NULL DEFAULT 1 COMMENT 'Enable contact',
  PRIMARY KEY (`contactid`),
  UNIQUE INDEX `uk_contactname` (`contactname` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Contacs with phone number';


-- -----------------------------------------------------
-- Table `sql379173`.`group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql379173`.`group` ;

CREATE TABLE IF NOT EXISTS `sql379173`.`group` (
  `groupid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification group',
  `groupname` VARCHAR(45) NOT NULL COMMENT 'Name group',
  `groupenable` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`groupid`),
  UNIQUE INDEX `uk_groupname` (`groupname` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Group\'s descriptions';


-- -----------------------------------------------------
-- Table `sql379173`.`contact_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql379173`.`contact_group` ;

CREATE TABLE IF NOT EXISTS `sql379173`.`contact_group` (
  `contact_groupid` INT(11) NOT NULL AUTO_INCREMENT,
  `contactid` INT(11) NOT NULL,
  `groupid` INT(11) NOT NULL,
  PRIMARY KEY (`contact_groupid`),
  INDEX `ix_contact_group_groupid` (`groupid` ASC),
  INDEX `ix_contact_group_contactid` (`contactid` ASC),
  UNIQUE INDEX `uk_contact_group` (`contactid` ASC, `groupid` ASC),
  CONSTRAINT `fk_contact_group_contact`
    FOREIGN KEY (`contactid`)
    REFERENCES `sql379173`.`contact` (`contactid`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contact_group_group`
    FOREIGN KEY (`groupid`)
    REFERENCES `sql379173`.`group` (`groupid`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Contact\'s groups';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sql379173`.`contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `sql379173`;
INSERT INTO `sql379173`.`contact` (`contactid`, `contactname`, `contactphone`, `contactenable`) VALUES (DEFAULT, 'Yohanna Pineda', '3165892487', DEFAULT);
INSERT INTO `sql379173`.`contact` (`contactid`, `contactname`, `contactphone`, `contactenable`) VALUES (DEFAULT, 'Marcos Subiria Mesa', '3789786542', DEFAULT);
INSERT INTO `sql379173`.`contact` (`contactid`, `contactname`, `contactphone`, `contactenable`) VALUES (DEFAULT, 'Elsa Muro Blanco', '4591278564', DEFAULT);
INSERT INTO `sql379173`.`contact` (`contactid`, `contactname`, `contactphone`, `contactenable`) VALUES (DEFAULT, 'Sararias Arena del Rio', '8741253265', DEFAULT);
INSERT INTO `sql379173`.`contact` (`contactid`, `contactname`, `contactphone`, `contactenable`) VALUES (DEFAULT, 'Carol Melo Pinto', '3697412533', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sql379173`.`group`
-- -----------------------------------------------------
START TRANSACTION;
USE `sql379173`;
INSERT INTO `sql379173`.`group` (`groupid`, `groupname`, `groupenable`) VALUES (DEFAULT, 'Colegas', DEFAULT);
INSERT INTO `sql379173`.`group` (`groupid`, `groupname`, `groupenable`) VALUES (DEFAULT, 'Amigas', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `sql379173`.`contact_group`
-- -----------------------------------------------------
START TRANSACTION;
USE `sql379173`;
INSERT INTO `sql379173`.`contact_group` (`contact_groupid`, `contactid`, `groupid`) VALUES (DEFAULT,1, 2);
INSERT INTO `sql379173`.`contact_group` (`contact_groupid`, `contactid`, `groupid`) VALUES (DEFAULT,3, 2);
INSERT INTO `sql379173`.`contact_group` (`contact_groupid`, `contactid`, `groupid`) VALUES (DEFAULT,5, 2);
INSERT INTO `sql379173`.`contact_group` (`contact_groupid`, `contactid`, `groupid`) VALUES (DEFAULT,2, 1);
INSERT INTO `sql379173`.`contact_group` (`contact_groupid`, `contactid`, `groupid`) VALUES (DEFAULT,4, 1);
INSERT INTO `sql379173`.`contact_group` (`contact_groupid`, `contactid`, `groupid`) VALUES (DEFAULT,3, 1);
INSERT INTO `sql379173`.`contact_group` (`contact_groupid`, `contactid`, `groupid`) VALUES (DEFAULT,5, 1);

COMMIT;

