SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';



CREATE SCHEMA IF NOT EXISTS `lojaweb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE `lojaweb` ;



-- -----------------------------------------------------

-- Table `lojaweb`.`cliente`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `lojaweb`.`cliente` (

  `idcliente` INT NOT NULL AUTO_INCREMENT ,

  `senha` VARCHAR(45) NOT NULL ,

  `nome` VARCHAR(45) NOT NULL ,

  `cpf` VARCHAR(15) NOT NULL ,

  `endereco` VARCHAR(45) NOT NULL ,

  `cidade` VARCHAR(45) NOT NULL ,

  `email` VARCHAR(45) NOT NULL ,

  `telefone` VARCHAR(15) NULL ,

  PRIMARY KEY (`idcliente`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `lojaweb`.`nota`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `lojaweb`.`nota` (

  `idnota` INT NOT NULL AUTO_INCREMENT ,

  PRIMARY KEY (`idnota`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `lojaweb`.`produto`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `lojaweb`.`produto` (

  `idproduto` INT NOT NULL AUTO_INCREMENT ,

  `descricao` VARCHAR(45) NOT NULL ,

  `preco` DECIMAL(5,2) NOT NULL ,

  `qtd_est` INT NOT NULL ,

  `peso` FLOAT NOT NULL ,

  PRIMARY KEY (`idproduto`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `lojaweb`.`dados_envio`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `lojaweb`.`dados_envio` (

  `iddados_envio` INT NOT NULL AUTO_INCREMENT ,

  `frete` DECIMAL(5,2) NOT NULL ,

  `endereco` VARCHAR(45) NOT NULL ,

  PRIMARY KEY (`iddados_envio`) )

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `lojaweb`.`compra`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `lojaweb`.`compra` (

  `idcompra` INT NOT NULL AUTO_INCREMENT ,

  `data_emitida` VARCHAR(45) NOT NULL ,

  `data_enviada` VARCHAR(45) NOT NULL ,

  `frete` DECIMAL(5,2) NULL ,

  `situacao` VARCHAR(45) NULL ,

  `custo_total` DECIMAL(5,2) NOT NULL ,

  `cliente_fk` INT NOT NULL ,

  `nota_fk` INT NOT NULL ,

  PRIMARY KEY (`idcompra`) ,

  INDEX `fk_compra_cliente_idx` (`cliente_fk` ASC) ,

  INDEX `fk_compra_nota1_idx` (`nota_fk` ASC) ,

  CONSTRAINT `fk_compra_cliente`

    FOREIGN KEY (`cliente_fk` )

    REFERENCES `lojaweb`.`cliente` (`idcliente` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_compra_nota1`

    FOREIGN KEY (`nota_fk` )

    REFERENCES `lojaweb`.`nota` (`idnota` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `lojaweb`.`itens_nota`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `lojaweb`.`itens_nota` (

  `iditens_nota` INT NOT NULL AUTO_INCREMENT ,

  `quantidade` INT NOT NULL ,

  `nota_fk` INT NOT NULL ,

  `produto_fk` INT NOT NULL ,

  PRIMARY KEY (`iditens_nota`) ,

  INDEX `fk_itens_nota_nota1_idx` (`nota_fk` ASC) ,

  INDEX `fk_itens_nota_produto1_idx` (`produto_fk` ASC) ,

  CONSTRAINT `fk_itens_nota_nota1`

    FOREIGN KEY (`nota_fk` )

    REFERENCES `lojaweb`.`nota` (`idnota` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_itens_nota_produto1`

    FOREIGN KEY (`produto_fk` )

    REFERENCES `lojaweb`.`produto` (`idproduto` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `lojaweb`.`administrador`

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `lojaweb`.`administrador` (

  `idadministrador` INT NOT NULL AUTO_INCREMENT ,

  `senha` VARCHAR(45) NOT NULL ,

  `nome` VARCHAR(45) NOT NULL ,

  `cpf` VARCHAR(15) NOT NULL ,

  `endereco` VARCHAR(45) NOT NULL ,

  `cidade` VARCHAR(45) NOT NULL ,

  `email` VARCHAR(45) NOT NULL ,

  `telefone` VARCHAR(15) NULL ,

  PRIMARY KEY (`idadministrador`) )

ENGINE = InnoDB;



USE `lojaweb` ;



-- -----------------------------------------------------

-- Placeholder table for view `lojaweb`.`dadosCompra`

-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `lojaweb`.`dadosCompra` (`idcompra` INT, `data_emitida` INT, `data_enviada` INT, `frete` INT, `custo_total` INT, `descricao` INT, `preco` INT, `quantidade` INT);



-- -----------------------------------------------------

-- procedure calculaFrete

-- -----------------------------------------------------



DELIMITER $$


create procedure calcula_frete(IN peso DOUBLE, INOUT frete FLOAT)
begin

	if (peso >= 5.0) then

		set frete = (peso * 7.35);

	end if;



	if (peso < 5.0) then

		set frete = (peso * 2.85);

	end if;		

end $$



DELIMITER ;



-- -----------------------------------------------------

-- View `lojaweb`.`dadosCompra`

-- -----------------------------------------------------

DROP TABLE IF EXISTS `lojaweb`.`dadosCompra`;

USE `lojaweb`;

CREATE  OR REPLACE VIEW `lojaweb`.`dadosCompra` AS

select c.idcompra, c.data_emitida, c.data_enviada, c.frete, c.custo_total,

p.descricao, p.preco, itn.quantidade from compra as c inner join nota as n

on c.nota_fk = n.idnota

inner join itens_nota as itn on n.idnota = itn.nota_fk

inner join produto as p

on p.idproduto = itn.produto_fk;

;

DELIMITER $$
CREATE TRIGGER atualizaEstoque_Insert AFTER INSERT
ON itens_nota
FOR EACH ROW
BEGIN
UPDATE produto SET qtd_est = qtd_est- NEW.quantidade
WHERE produtoid = NEW.produto_fk;
END $$ ;

DELIMITER $$
CREATE TRIGGER atualizaEstoque_Delete AFTER DELETE
ON itens_nota
FOR EACH ROW
BEGIN
UPDATE produto SET qtd_est = qtd_est+ OLD.quantidade
WHERE produtoid = OLD.produto_fk;
END $$ 


DELIMITER $
CREATE FUNCTION quantidade_produtos (codigoCliente int)
RETURNS INT
BEGIN
DECLARE qtd INT;
SELECT
sum(quantidade) INTO qtd
FROM itens_nota as itn inner join nota as n
on itn.nota_fk = n.idnota 
inner join compra as c on c.nota_fk = n.idnota
inner join  cliente as cli on cli.idcliente = c.cliente_fk;
RETURN qtd;
END $

DELIMITER $
CREATE procedure calcula_preco_total(IN id INT)
BEGIN
DECLARE total DECIMAL(5,2);

SELECT sum(itn.quantidade * p.preco) INTO total
FROM itens_nota as itn inner join produto as p
on itn.produto_fk = p.idproduto
inner join nota as n
on n.idnota = itn.nota_fk
inner join compra as c
on c.nota_fk = n.idnota
where c.idcompra = id;
update compra set custo_total = total where id = idcompra;
commit; 
END $
DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;