-- 3a. verbundende Tabellen mit UNIQUE
-- Vorbereitung
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE IF NOT EXISTS mydb;

-- Mastertabelle unervändert
CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Struktur Mastertabelle:
DESCRIBE `mydb`.`cats`;

-- INSTERTS Mastertabelle 
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (NULL, "Grizabella", "white");
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (NULL, "Alonzo", "grey");
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (NULL, "Mausi", "striped");

-- Inhalte Mastertabelle
SELECT * FROM `mydb`.`cats`;

-- Detailtabelle: Verbindung zu Mastertabelle über Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  `cats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_servants_cats_idx` (`cats_id` ASC) VISIBLE,
  UNIQUE INDEX `cats_id_UNIQUE` (`cats_id` ASC) VISIBLE, #UNIQUE!!
  CONSTRAINT `fk_servants_cats`
    FOREIGN KEY (`cats_id`)
    REFERENCES `mydb`.`cats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Struktur Detailtabelle
DESCRIBE `mydb`.`servants`;

-- INSERTS Detailtabelle
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`, `cats_id`) VALUES (DEFAULT, "Peter", 5, 1);
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`, `cats_id`) VALUES (DEFAULT, "Junaid", 2, 2);
-- Aktuell ist eine Doppelte Belegung der FOREIN ID möglich, das darf nicht sein! ---> Lösung UNIQUIE cats_id in Detailtabelle
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`, `cats_id`) VALUES (DEFAULT, "Holger", 3, 1);

-- Inhalte Mastertabelle
SELECT * FROM `mydb`.`servants`;
