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

-- -----------------------------------------------------
-- Schema sql379173
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql379173` DEFAULT CHARACTER SET latin1 ;
USE `sql379173` ;

-- -----------------------------------------------------
-- Table `sql379173`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql379173`.`user` ;

CREATE TABLE IF NOT EXISTS `sql379173`.`user` (
  `userid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identification user',
  `username` VARCHAR(50) NOT NULL COMMENT 'Name user',
  `userphone` VARCHAR(13) NULL COMMENT 'Phone user',
  `userenable` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`userid`),
  UNIQUE INDEX `uk_username` (`username` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Users with phone number';


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
-- Table `sql379173`.`user_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql379173`.`user_group` ;

CREATE TABLE IF NOT EXISTS `sql379173`.`user_group` (
  `userid` INT(11) NOT NULL,
  `groupid` INT(11) NOT NULL,
  PRIMARY KEY (`userid`, `groupid`),
  INDEX `ix_user_group_groupid` (`groupid` ASC),
  INDEX `ix_user_group_userid` (`userid` ASC),
  CONSTRAINT `fk_user_group_user`
    FOREIGN KEY (`userid`)
    REFERENCES `sql379173`.`user` (`userid`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_group_group`
    FOREIGN KEY (`groupid`)
    REFERENCES `sql379173`.`group` (`groupid`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'User\'s groups';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sql379173`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `sql379173`;
INSERT INTO `sql379173`.`user` (`userid`, `username`, `userphone`, `userenable`) VALUES (DEFAULT, 'Yohanna Pineda', '3165892487', DEFAULT);
INSERT INTO `sql379173`.`user` (`userid`, `username`, `userphone`, `userenable`) VALUES (DEFAULT, 'Marcos Subiria Mesa', '3789786542', DEFAULT);
INSERT INTO `sql379173`.`user` (`userid`, `username`, `userphone`, `userenable`) VALUES (DEFAULT, 'Elsa Muro Blanco', '4591278564', DEFAULT);
INSERT INTO `sql379173`.`user` (`userid`, `username`, `userphone`, `userenable`) VALUES (DEFAULT, 'Sararias Arena del Rio', '8741253265', DEFAULT);
INSERT INTO `sql379173`.`user` (`userid`, `username`, `userphone`, `userenable`) VALUES (DEFAULT, 'Carol Melo Pinto', '3697412533', DEFAULT);

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
-- Data for table `sql379173`.`user_group`
-- -----------------------------------------------------
START TRANSACTION;
USE `sql379173`;
INSERT INTO `sql379173`.`user_group` (`userid`, `groupid`) VALUES (1, 2);
INSERT INTO `sql379173`.`user_group` (`userid`, `groupid`) VALUES (3, 2);
INSERT INTO `sql379173`.`user_group` (`userid`, `groupid`) VALUES (5, 2);
INSERT INTO `sql379173`.`user_group` (`userid`, `groupid`) VALUES (2, 1);
INSERT INTO `sql379173`.`user_group` (`userid`, `groupid`) VALUES (4, 1);
INSERT INTO `sql379173`.`user_group` (`userid`, `groupid`) VALUES (3, 1);
INSERT INTO `sql379173`.`user_group` (`userid`, `groupid`) VALUES (5, 1);

COMMIT;

