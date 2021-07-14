-- Tabellen ohne Daten
-- Vorbereitung
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

/* Servant */
-- Servant: CREATE
CREATE TABLE IF NOT EXISTS `mydb`.`servant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Servant: Struktur
DESCRIBE servant;

-- Servant: INSERT
INSERT INTO `mydb`.`servant` (`id`, `servant_name`, `yrs_served`) VALUES (DEFAULT, "Peter", 4);
INSERT INTO `mydb`.`servant` (`id`, `servant_name`, `yrs_served`) VALUES (DEFAULT, "Dieter", 1);

-- Servant: Inhalt
SELECT * FROM servant;


/* Product */
-- Product: CREATE
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Product: Struktur
DESCRIBE product;

-- Product: INSERT
INSERT INTO `mydb`.`product` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Whiskas - Lachs", 2.75);
INSERT INTO `mydb`.`product` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Whiskas - Huhn", 2.85);
INSERT INTO `mydb`.`product` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Felix - Jelly", 3.75);
INSERT INTO `mydb`.`product` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Felix - Sauce", 3.80);

-- Product: Inhalt
SELECT * FROM product;

/* Purchases */
-- Purchases: CREATE
CREATE TABLE IF NOT EXISTS `mydb`.`purchases` (
  `servant_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  INDEX `fk_product_has_servant_servant1_idx` (`servant_id` ASC) VISIBLE,
  INDEX `fk_product_has_servant_product_idx` (`product_id` ASC) VISIBLE,
  PRIMARY KEY (`servant_id`, `product_id`),
  CONSTRAINT `fk_product_has_servant_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_servant_servant1`
    FOREIGN KEY (`servant_id`)
    REFERENCES `mydb`.`servant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Purchases: Struktur
DESCRIBE purchases;

-- Purchases: INSERTS
INSERT INTO `mydb`.`purchases` (`servant_id`, `product_id`) VALUES (1, 2);
INSERT INTO `mydb`.`purchases` (`servant_id`, `product_id`) VALUES (1, 3);
INSERT INTO `mydb`.`purchases` (`servant_id`, `product_id`) VALUES (2, 1);
INSERT INTO `mydb`.`purchases` (`servant_id`, `product_id`) VALUES (2, 2);
INSERT INTO `mydb`.`purchases` (`servant_id`, `product_id`) VALUES (2, 3);
INSERT INTO `mydb`.`purchases` (`servant_id`, `product_id`) VALUES (2, 4);

-- Purchases: Inhalt
SELECT * FROM purchases;
