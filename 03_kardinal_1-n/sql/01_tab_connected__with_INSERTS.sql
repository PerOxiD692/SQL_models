-- Tabellen Verbunden + INSERT
-- Vorbereitung
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

-- Mastertabelle cats
CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Struktur Mastertabelle
DESCRIBE cats;

-- INSERTS Mastertabelle
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, "Grizabella", "white");
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, "Mausi", "striped");

-- Inhalte Mastertabelle
SELECT * FROM cats;


-- Detailtabelle kittens
CREATE TABLE IF NOT EXISTS `mydb`.`kittens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kitten_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  `cats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_kittens_cats_idx` (`cats_id` ASC) VISIBLE,
  CONSTRAINT `fk_kittens_cats`
    FOREIGN KEY (`cats_id`)
    REFERENCES `mydb`.`cats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Struktur Detailtabelle
DESCRIBE kittens;

-- INSERTS Detailtabelle
INSERT INTO `mydb`.`kittens` (`id`, `kitten_name`, `fur_color`, `cats_id`) VALUES (DEFAULT, "Grizzi_1", "white", 1);
INSERT INTO `mydb`.`kittens` (`id`, `kitten_name`, `fur_color`, `cats_id`) VALUES (DEFAULT, "Grizzi_2", "white", 1);
INSERT INTO `mydb`.`kittens` (`id`, `kitten_name`, `fur_color`, `cats_id`) VALUES (DEFAULT, "Mausini_1", "striped", 2);
INSERT INTO `mydb`.`kittens` (`id`, `kitten_name`, `fur_color`, `cats_id`) VALUES (DEFAULT, "Mausini_2", "striped", 2);

-- Inhalte Detailtabelle
SELECT * FROM kittens;

