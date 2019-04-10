-- ------------------------------------------
-- Script para creación de BD
-- SGBD MySQL 5.7
-- @author Harold Jair Patiño Moreno
-- ------------------------------------------

CREATE DATABASE `mejor_menu` /*!40100 COLLATE 'utf8_general_ci' */;
USE `mejor_menu`;

CREATE TABLE `Cliente` (
	`IdCliente` INT NOT NULL AUTO_INCREMENT,
	`Nombre` VARCHAR(50) NOT NULL,
	`Apellido1` VARCHAR(50) NOT NULL,
	`Apellido2` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`IdCliente`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `Mesa` (
	`IdMesa` INT NOT NULL AUTO_INCREMENT,
	`NumMaxComensales` INT NOT NULL,
	`Ubicacion` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`IdMesa`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `Camarero` (
	`IdCamarero` INT NOT NULL AUTO_INCREMENT,
	`Nombre` VARCHAR(50) NOT NULL,
	`Apellido1` VARCHAR(50) NOT NULL,
	`Apellido2` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`IdCamarero`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `Cocinero` (
	`IdCocinero` INT NOT NULL AUTO_INCREMENT,
	`Nombre` VARCHAR(50) NOT NULL,
	`Apellido1` VARCHAR(50) NOT NULL,
	`Apellido2` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`IdCocinero`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `Factura` (
	`IdFactura` INT NOT NULL AUTO_INCREMENT,
	`IdCliente` INT NOT NULL,
	`IdCamarero` INT NOT NULL,
	`IdMesa` INT NOT NULL,
	`FechaFactura` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	PRIMARY KEY (`IdFactura`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

CREATE TABLE `DetalleFactura` (
	`IdFactura` INT NOT NULL,
	`IdDetalleFactura` INT NOT NULL,
	`IdCocinero` INT NOT NULL,
	`Plato` VARCHAR(100) NOT NULL,
	`Importe` VARCHAR(100) NOT NULL,
	`FechaFactura` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	PRIMARY KEY (`IdFactura`,`IdDetalleFactura`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

-- -------------------------------------------------

ALTER TABLE `detallefactura`
	ADD CONSTRAINT `FK_cocinero_detallefactura` FOREIGN KEY (`IdCocinero`) REFERENCES `cocinero` (`IdCocinero`) ON UPDATE CASCADE ON DELETE CASCADE,
	ADD CONSTRAINT `FK_factura_detallefactura` FOREIGN KEY (`IdFactura`) REFERENCES `factura` (`IdFactura`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `factura`
	ADD CONSTRAINT `FK_cliente_factura` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`) ON UPDATE CASCADE ON DELETE CASCADE,
	ADD CONSTRAINT `FK_camarero_factura` FOREIGN KEY (`IdCamarero`) REFERENCES `camarero` (`IdCamarero`) ON UPDATE CASCADE ON DELETE CASCADE,
	ADD CONSTRAINT `FK_mesa_factura` FOREIGN KEY (`IdMesa`) REFERENCES `mesa` (`IdMesa`) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE USER 'mejor_cocina'@'localhost' IDENTIFIED BY 'Chaosangels@94';
GRANT USAGE ON *.* TO 'mejor_cocina'@'localhost';
GRANT SELECT, EXECUTE, SHOW VIEW, ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, CREATE VIEW, DELETE, DROP, EVENT, INDEX, INSERT, REFERENCES, TRIGGER, UPDATE, LOCK TABLES  ON `mejor\_menu`.* TO 'mejor_cocina'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- Consulta

SELECT C.IdCliente, SUM(D_F.Importe) AS monto_gastado
FROM cliente C
INNER JOIN factura F ON C.IdCliente = F.IdCliente
INNER JOIN detallefactura D_F ON F.IdFactura = D_F.IdFactura
HAVING SUM(D_F.Importe) > 100000;