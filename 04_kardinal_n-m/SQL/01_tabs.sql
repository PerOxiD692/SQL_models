-- Tabellen ohne Daten

-- Servants (kein Fremdschlüssel)
CREATE TABLE IF NOT EXISTS `mydb`.`servant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Products (kein Fremdschlüssel)
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_price` DECIMAL(4,2) NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- ServantsProducts (purchases)
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
