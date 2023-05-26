-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema DEDUCATION_FINAL_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DEDUCATION_FINAL_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DEDUCATION_FINAL_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `DEDUCATION_FINAL_1` ;

-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`userprofile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`userprofile` (
  `id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`connection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`connection` (
  `user_id1` INT NOT NULL,
  `user_id2` INT NOT NULL,
  `status` VARCHAR(20) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id1`, `user_id2`),
  INDEX `user_id2` (`user_id2` ASC) VISIBLE,
  CONSTRAINT `connection_ibfk_1`
    FOREIGN KEY (`user_id1`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`),
  CONSTRAINT `connection_ibfk_2`
    FOREIGN KEY (`user_id2`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`Contac_person_uni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`Contac_person_uni` (
  `Contac_person_uni_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `userprofile_id` INT NOT NULL,
  PRIMARY KEY (`Contac_person_uni_id`),
  INDEX `fk_Contac_person_uni_userprofile1_idx` (`userprofile_id` ASC) VISIBLE,
  CONSTRAINT `fk_Contac_person_uni_userprofile1`
    FOREIGN KEY (`userprofile_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`university`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`university` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `location` VARCHAR(100) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL,
  `website` VARCHAR(255) NULL DEFAULT NULL,
  `Educational_system_info` VARCHAR(500) NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `Contac_person_uni_Contac_person_uni_id` INT NOT NULL,
  `educational_program_url` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_university_Contac_person_uni1_idx` (`Contac_person_uni_Contac_person_uni_id` ASC) VISIBLE,
  CONSTRAINT `fk_university_Contac_person_uni1`
    FOREIGN KEY (`Contac_person_uni_Contac_person_uni_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`Contac_person_uni` (`Contac_person_uni_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`course` (
  `id` INT NOT NULL,
  `university_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `credits` INT NULL DEFAULT NULL,
  `instructor` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `university_id` (`university_id` ASC) VISIBLE,
  CONSTRAINT `course_ibfk_1`
    FOREIGN KEY (`university_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`university` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`education` (
  `id` INT NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `university_id` INT NULL DEFAULT NULL,
  `degree` VARCHAR(100) NULL DEFAULT NULL,
  `field_of_study` VARCHAR(100) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `university_id` (`university_id` ASC) VISIBLE,
  CONSTRAINT `education_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`),
  CONSTRAINT `education_ibfk_2`
    FOREIGN KEY (`university_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`university` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`experience` (
  `id` INT NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `company_name` VARCHAR(100) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `location` VARCHAR(100) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `experience_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`recommendation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`recommendation` (
  `id` INT NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `recommender_id` INT NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `recommender_id` (`recommender_id` ASC) VISIBLE,
  CONSTRAINT `recommendation_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`),
  CONSTRAINT `recommendation_ibfk_2`
    FOREIGN KEY (`recommender_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`job` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `requirements` TEXT NULL DEFAULT NULL,
  `company_name` VARCHAR(100) NULL DEFAULT NULL,
  `location` VARCHAR(100) NULL DEFAULT NULL,
  `salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `application_deadline` DATE NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `experience_id` INT NOT NULL,
  `recommendation_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_job_experience1_idx` (`experience_id` ASC) VISIBLE,
  INDEX `fk_job_recommendation1_idx` (`recommendation_id` ASC) VISIBLE,
  CONSTRAINT `fk_job_experience1`
    FOREIGN KEY (`experience_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`experience` (`id`),
  CONSTRAINT `fk_job_recommendation1`
    FOREIGN KEY (`recommendation_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`recommendation` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`message` (
  `id` INT NOT NULL,
  `sender_id` INT NULL DEFAULT NULL,
  `recipient_id` INT NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `sender_id` (`sender_id` ASC) VISIBLE,
  INDEX `recipient_id` (`recipient_id` ASC) VISIBLE,
  CONSTRAINT `message_ibfk_1`
    FOREIGN KEY (`sender_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`),
  CONSTRAINT `message_ibfk_2`
    FOREIGN KEY (`recipient_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`professor` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(55) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `field_of_study` VARCHAR(45) NULL DEFAULT NULL,
  `degree` VARCHAR(45) NULL DEFAULT NULL,
  `year_graduated` DATE NULL DEFAULT NULL,
  `current_position` VARCHAR(45) NULL DEFAULT NULL,
  `institution` VARCHAR(45) NULL DEFAULT NULL,
  `teaching_experience` TEXT NULL DEFAULT NULL,
  `profile_picture_url` VARCHAR(255) NULL DEFAULT NULL,
  `phone_number` VARCHAR(20) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `university_id` INT NOT NULL,
  `education_id` INT NULL DEFAULT NULL,
  `userprofile_id` INT NOT NULL,
  PRIMARY KEY (`id`, `phone_number`, `date_of_birth`, `university_id`),
  INDEX `education_id` (`education_id` ASC) VISIBLE,
  INDEX `university_id` (`university_id` ASC) VISIBLE,
  INDEX `fk_professor_userprofile1_idx` (`userprofile_id` ASC) VISIBLE,
  CONSTRAINT `fk_professor_userprofile1`
    FOREIGN KEY (`userprofile_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`),
  CONSTRAINT `professor_ibfk_1`
    FOREIGN KEY (`education_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`education` (`id`),
  CONSTRAINT `professor_ibfk_2`
    FOREIGN KEY (`university_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`university` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`skill` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DEDUCATION_FINAL_1`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEDUCATION_FINAL_1`.`student` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  `birthdate` DATE NULL DEFAULT NULL,
  `country` VARCHAR(100) NULL DEFAULT NULL,
  `preferences` TEXT NULL DEFAULT NULL,
  `profile_picture_url` VARCHAR(255) NULL DEFAULT NULL,
  `userprofile_id` INT NOT NULL,
  `university_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_student_userprofile1_idx` (`userprofile_id` ASC) VISIBLE,
  INDEX `fk_student_university1_idx` (`university_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_userprofile1`
    FOREIGN KEY (`userprofile_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`userprofile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_university1`
    FOREIGN KEY (`university_id`)
    REFERENCES `DEDUCATION_FINAL_1`.`university` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
