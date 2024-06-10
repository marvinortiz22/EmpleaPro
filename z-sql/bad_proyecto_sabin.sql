-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.35 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bad_proyecto
DROP DATABASE IF EXISTS `bad_proyecto`;
CREATE DATABASE IF NOT EXISTS `bad_proyecto` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bad_proyecto`;

-- Volcando estructura para tabla bad_proyecto.auditoria_deduccionbeneficioempleado
DROP TABLE IF EXISTS `auditoria_deduccionbeneficioempleado`;
CREATE TABLE IF NOT EXISTS `auditoria_deduccionbeneficioempleado` (
  `IDAUDITORIA_DEDUCBENEFEMP` int NOT NULL AUTO_INCREMENT,
  `IDDEDUCBENEF` int NOT NULL,
  `NOMBREDEDUCBENEF` varchar(50) NOT NULL,
  `TIPO` enum('D','B') NOT NULL,
  `IDDEDUCBENEF_EMP` int NOT NULL,
  `IDEMPLEADO` int DEFAULT NULL,
  `PROPORCIONALALSUELDO` tinyint(1) NOT NULL,
  `MONTOOPORCENTAJE` decimal(10,0) NOT NULL,
  `FECHADEOPERACION` date NOT NULL,
  `TIPODEOPERACION` varchar(25) NOT NULL,
  `USUARIOREGISTRA` int DEFAULT NULL,
  PRIMARY KEY (`IDAUDITORIA_DEDUCBENEFEMP`),
  KEY `FK_DEDUCCIONBENEFICIOEMPAUDI` (`IDDEDUCBENEF`),
  KEY `FK_DEDUCCIONBENEFICIOEMPLEADO` (`IDDEDUCBENEF_EMP`),
  KEY `FK_DEDUCCIONBENEFICIOEMPLEADOAUDIEMP` (`IDEMPLEADO`),
  KEY `FK_AUDI_DEDUFBENEFEMP_USUARIO` (`USUARIOREGISTRA`),
  CONSTRAINT `FK_AUDI_DEDUFBENEFEMP_USUARIO` FOREIGN KEY (`USUARIOREGISTRA`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_DEDUCCIONBENEFICIOEMPAUDI` FOREIGN KEY (`IDDEDUCBENEF`) REFERENCES `deduccionbeneficio` (`IDDEDUCBENEF`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_DEDUCCIONBENEFICIOEMPLEADO` FOREIGN KEY (`IDDEDUCBENEF_EMP`) REFERENCES `deduccionbeneficio_empleado` (`IDDEDUCBENEF_EMP`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_DEDUCCIONBENEFICIOEMPLEADOAUDIEMP` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.auditoria_deduccionbeneficioempleado: ~0 rows (aproximadamente)
DELETE FROM `auditoria_deduccionbeneficioempleado`;

-- Volcando estructura para tabla bad_proyecto.auditoria_deduccionbeneficioglobal
DROP TABLE IF EXISTS `auditoria_deduccionbeneficioglobal`;
CREATE TABLE IF NOT EXISTS `auditoria_deduccionbeneficioglobal` (
  `IDAUDITORIA_IDDEDUCBENEF` int NOT NULL AUTO_INCREMENT,
  `IDDEDUCBENEF` int NOT NULL,
  `NOMBREDEDUCBENEF` varchar(50) NOT NULL,
  `TIPO` enum('D','B') NOT NULL,
  `PROPORCIONALALSUELDO` tinyint(1) NOT NULL,
  `MONTOOPORCENTAJE` decimal(10,0) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT '1',
  `FECHADEOPERACION` date NOT NULL,
  `TIPODEOPERACION` varchar(25) NOT NULL,
  `USUARIOREGISTRA` int DEFAULT NULL,
  PRIMARY KEY (`IDAUDITORIA_IDDEDUCBENEF`),
  KEY `FK_DEDUCCIONBENEFICIOGLOBAL` (`IDDEDUCBENEF`),
  KEY `FK_USUARIOREGISTRA` (`USUARIOREGISTRA`),
  CONSTRAINT `FK_DEDUCCIONBENEFICIOGLOBAL` FOREIGN KEY (`IDDEDUCBENEF`) REFERENCES `deduccionbeneficio` (`IDDEDUCBENEF`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USUARIOREGISTRA` FOREIGN KEY (`USUARIOREGISTRA`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.auditoria_deduccionbeneficioglobal: ~0 rows (aproximadamente)
DELETE FROM `auditoria_deduccionbeneficioglobal`;

-- Volcando estructura para tabla bad_proyecto.auditoria_empleado
DROP TABLE IF EXISTS `auditoria_empleado`;
CREATE TABLE IF NOT EXISTS `auditoria_empleado` (
  `IDAUDITORIA_EMPLEADO` int NOT NULL AUTO_INCREMENT,
  `IDEMPLEADO` int DEFAULT NULL,
  `IDPUESTO` int DEFAULT NULL,
  `IDMUNICIPIO` int DEFAULT NULL,
  `IDESTADOCIVIL` int DEFAULT NULL,
  `EMP_IDEMPLEADO` int DEFAULT NULL,
  `IDTIPODOC` int DEFAULT NULL,
  `NOMBRE1` varchar(20) NOT NULL,
  `NOMBRE2` varchar(20) DEFAULT NULL,
  `APELLIDO1` varchar(20) NOT NULL,
  `APELLIDO2` varchar(20) DEFAULT NULL,
  `APELLIDOCASADA` varchar(25) DEFAULT NULL,
  `SEXO` char(1) NOT NULL,
  `FECHANACIMIENTO` date NOT NULL,
  `FECHAINGRESO` datetime NOT NULL,
  `NUMERODOC` varchar(20) NOT NULL,
  `NIT` varchar(25) DEFAULT NULL,
  `ISSS` varchar(25) NOT NULL,
  `NUP` varchar(25) DEFAULT NULL,
  `SALARIO` decimal(10,0) NOT NULL,
  `CORREOINSTITUCIONAL` varchar(30) NOT NULL,
  `CORREOPERSONAL` varchar(30) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT '1',
  `FECHAMODIFICACION` datetime NOT NULL,
  `TIPODEOPERACION` varchar(25) NOT NULL,
  `USUARIOREGISTRA` int DEFAULT NULL,
  PRIMARY KEY (`IDAUDITORIA_EMPLEADO`),
  KEY `FK_EMPLEADO` (`IDEMPLEADO`),
  KEY `FK_USUARIOMODIFICAEMPLEADO` (`USUARIOREGISTRA`),
  KEY `fk_idmunicipioaudiemp` (`IDMUNICIPIO`),
  KEY `fk_idestadocivilaudiemp` (`IDESTADOCIVIL`),
  KEY `fk_emp_idempleadoaudiemp` (`EMP_IDEMPLEADO`),
  KEY `fk_idtipodocaudiemp` (`IDTIPODOC`),
  KEY `fk_idpuestoaudiemp` (`IDPUESTO`),
  CONSTRAINT `fk_emp_idempleadoaudiemp` FOREIGN KEY (`EMP_IDEMPLEADO`) REFERENCES `empleado` (`EMP_IDEMPLEADO`),
  CONSTRAINT `FK_EMPLEADO` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_idestadocivilaudiemp` FOREIGN KEY (`IDESTADOCIVIL`) REFERENCES `estadocivil` (`IDESTADOCIVIL`),
  CONSTRAINT `fk_idmunicipioaudiemp` FOREIGN KEY (`IDMUNICIPIO`) REFERENCES `municipio` (`IDMUNICIPIO`),
  CONSTRAINT `fk_idpuestoaudiemp` FOREIGN KEY (`IDPUESTO`) REFERENCES `puesto` (`IDPUESTO`),
  CONSTRAINT `fk_idtipodocaudiemp` FOREIGN KEY (`IDTIPODOC`) REFERENCES `tipodocumento` (`IDTIPODOC`),
  CONSTRAINT `FK_USUARIOMODIFICAEMPLEADO` FOREIGN KEY (`USUARIOREGISTRA`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.auditoria_empleado: ~1 rows (aproximadamente)
DELETE FROM `auditoria_empleado`;
INSERT INTO `auditoria_empleado` (`IDAUDITORIA_EMPLEADO`, `IDEMPLEADO`, `IDPUESTO`, `IDMUNICIPIO`, `IDESTADOCIVIL`, `EMP_IDEMPLEADO`, `IDTIPODOC`, `NOMBRE1`, `NOMBRE2`, `APELLIDO1`, `APELLIDO2`, `APELLIDOCASADA`, `SEXO`, `FECHANACIMIENTO`, `FECHAINGRESO`, `NUMERODOC`, `NIT`, `ISSS`, `NUP`, `SALARIO`, `CORREOINSTITUCIONAL`, `CORREOPERSONAL`, `ESTADO`, `FECHAMODIFICACION`, `TIPODEOPERACION`, `USUARIOREGISTRA`) VALUES
	(3, 3, 2, NULL, NULL, NULL, NULL, 'miguel', NULL, 'ortiz', NULL, NULL, 'M', '2024-05-23', '2024-05-23 10:32:09', '3', NULL, '3', NULL, 4, 'c', 'c', 1, '2024-06-09 13:24:39', 'Actualización', NULL),
	(4, 4, 2, NULL, NULL, NULL, NULL, 'f', NULL, 's', NULL, NULL, 'M', '2024-06-08', '2024-06-08 23:19:27', '4', NULL, '4', NULL, 1, 'd', 'd', 1, '2024-06-09 13:24:41', 'Actualización', NULL),
	(5, 5, 2, 127, 1, NULL, 1, 'a', '', 'a', '', NULL, 'M', '2000-01-01', '2024-06-09 00:00:00', '55555555555555555555', NULL, '555555555', NULL, 3, 'e@gmail.com', 'e@gmail.com', 1, '2024-06-09 16:07:37', 'Creación', 8),
	(6, 5, 2, 127, 1, NULL, 1, 'a', '', 'a', '', NULL, 'M', '2000-01-01', '2024-06-09 00:00:00', '5', NULL, '555555555', NULL, 3, 'e@gmail.com', 'e@gmail.com', 1, '2024-06-09 16:21:04', 'Actualización', NULL),
	(7, 5, 2, 127, 1, NULL, 1, 'a', '', 'a', '', NULL, 'M', '2000-01-01', '2024-05-20 00:00:00', '5', NULL, '555555555', NULL, 3, 'e@gmail.com', 'e@gmail.com', 1, '2024-06-09 16:21:21', 'Actualización', NULL),
	(8, 4, 2, NULL, NULL, NULL, NULL, 'f', NULL, 's', NULL, NULL, 'M', '2024-06-08', '2024-06-08 23:19:27', '4', NULL, '4', NULL, 1, 'd', 'd', 0, '2024-06-09 16:23:15', 'Actualización', NULL),
	(9, 4, 2, NULL, NULL, NULL, NULL, 'f', NULL, 's', NULL, NULL, 'M', '2024-06-08', '2024-06-08 23:19:27', '4', NULL, '4', NULL, 1, 'd', 'd', 1, '2024-06-09 16:23:24', 'Actualización', NULL),
	(10, 1, 1, 151, NULL, NULL, NULL, 'pepe', 'david', 'mejia', '', '', 'M', '2024-05-22', '2024-05-07 20:28:18', '1', NULL, '1', NULL, 2, 'a', 'a', 1, '2024-06-09 16:24:01', 'Actualización', NULL),
	(11, 1, 1, 151, NULL, NULL, NULL, 'pepe', 'david', 'mejia', '', '', 'M', '2024-05-22', '2024-05-21 20:28:18', '1', NULL, '1', NULL, 2, 'a', 'a', 1, '2024-06-09 16:24:23', 'Actualización', NULL),
	(12, 1, 1, 151, NULL, NULL, NULL, 'pepe', 'david', 'mejia', '', '', 'M', '2024-05-22', '2024-05-22 20:28:18', '1', NULL, '1', NULL, 2, 'a', 'a', 1, '2024-06-09 19:59:13', 'Actualización', NULL);

-- Volcando estructura para función bad_proyecto.calcularDeducBenefEmpleado
DROP FUNCTION IF EXISTS `calcularDeducBenefEmpleado`;
DELIMITER //
CREATE FUNCTION `calcularDeducBenefEmpleado`(
	`salario` DECIMAL,
	`idempleadop` int,
	`tipop` CHAR(1)
) RETURNS decimal(10,2)
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE esporcentual INT;
	DECLARE montoporcentaje DECIMAL;
	DECLARE beneficiostotal DECIMAL(10,2) DEFAULT 0;
	DECLARE cursorbeneficios CURSOR for
	SELECT proporcionalalsueldo,montooporcentaje FROM deduccionbeneficio_empleado dbe 
	JOIN deduccionbeneficio db ON db.IDDEDUCBENEF=dbe.IDDEDUCBENEF
	JOIN empleado e ON e.IDEMPLEADO=dbe.IDEMPLEADO
	WHERE e.IDEMPLEADO=idempleadop AND tipo=tipop;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cursorbeneficios;

    read_loop: LOOP
        FETCH cursorbeneficios INTO esporcentual,montoporcentaje;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF esporcentual >0 then
        		set beneficiostotal=beneficiostotal+(salario*(montoporcentaje/100));
      	else
      		SET beneficiostotal=beneficiostotal+montoporcentaje;
      	END if;
        
        
    END LOOP;

    CLOSE cursorbeneficios;

    RETURN beneficiostotal;
END//
DELIMITER ;

-- Volcando estructura para función bad_proyecto.calcularDeducBenefGlobales
DROP FUNCTION IF EXISTS `calcularDeducBenefGlobales`;
DELIMITER //
CREATE FUNCTION `calcularDeducBenefGlobales`(
	`salario` DECIMAL,
	`tipop` CHAR(1)
) RETURNS decimal(10,2)
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE esporcentual INT;
	DECLARE montoporcentaje DECIMAL;
	DECLARE beneficiostotal DECIMAL(10,2) DEFAULT 0;
	DECLARE cursorbeneficios CURSOR for
	SELECT proporcionalalsueldo,montooporcentaje FROM deduccionbeneficioglobal dbg 
	JOIN deduccionbeneficio db ON db.IDDEDUCBENEF=dbg.IDDEDUCBENEF
	WHERE estado=1 AND tipo=tipop;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cursorbeneficios;

    read_loop: LOOP
        FETCH cursorbeneficios INTO esporcentual,montoporcentaje;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF esporcentual >0 then
        		set beneficiostotal=beneficiostotal+(salario*(montoporcentaje/100));
      	else
      		SET beneficiostotal=beneficiostotal+montoporcentaje;
      	END if;
        
        
    END LOOP;

    CLOSE cursorbeneficios;

    RETURN beneficiostotal;
END//
DELIMITER ;

-- Volcando estructura para función bad_proyecto.calcularHorasExtra
DROP FUNCTION IF EXISTS `calcularHorasExtra`;
DELIMITER //
CREATE FUNCTION `calcularHorasExtra`(
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE
) RETURNS int
BEGIN
    DECLARE total_horas INT DEFAULT 0;
    DECLARE horas INT;
    DECLARE done INT DEFAULT 0;
    
    DECLARE cursor_horas CURSOR FOR
    SELECT TIMESTAMPDIFF(HOUR, horaingreso, horasalida)
    FROM HORASEMPLEADO
    WHERE IDEMPLEADO = empleado_id
    AND FECHA BETWEEN fecha_inicio AND fecha_fin;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cursor_horas;

    read_loop: LOOP
        FETCH cursor_horas INTO horas;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF horas > 8 THEN
            SET horas = horas-8;
            SET total_horas = total_horas + horas;
        END IF;
        
    END LOOP;

    CLOSE cursor_horas;

    RETURN total_horas;
END//
DELIMITER ;

-- Volcando estructura para función bad_proyecto.calcularHorasNormales
DROP FUNCTION IF EXISTS `calcularHorasNormales`;
DELIMITER //
CREATE FUNCTION `calcularHorasNormales`(
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE
) RETURNS int
BEGIN
    DECLARE total_horas INT DEFAULT 0;
    DECLARE horas INT;
    DECLARE done INT DEFAULT 0;
    
    DECLARE cursor_horas CURSOR FOR
    SELECT TIMESTAMPDIFF(HOUR, horaingreso, horasalida)
    FROM HORASEMPLEADO
    WHERE IDEMPLEADO = empleado_id
    AND FECHA BETWEEN fecha_inicio AND fecha_fin;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cursor_horas;

    read_loop: LOOP
        FETCH cursor_horas INTO horas;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        IF horas > 8 THEN
            SET horas = 8;
        END IF;

        SET total_horas = total_horas + horas;
    END LOOP;

    CLOSE cursor_horas;

    RETURN total_horas;
END//
DELIMITER ;

-- Volcando estructura para función bad_proyecto.calcularHorasTrabajadas
DROP FUNCTION IF EXISTS `calcularHorasTrabajadas`;
DELIMITER //
CREATE FUNCTION `calcularHorasTrabajadas`(
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE
) RETURNS int
BEGIN
    DECLARE total_horas int;
    
    -- Calcular la suma de horas trabajadas para el empleado entre las fechas especificadas
    SELECT sum(TIMESTAMPDIFF(HOUR,horaingreso,horasalida))
    INTO total_horas
    FROM HORASEMPLEADO
    WHERE IDEMPLEADO = empleado_id
    AND FECHA BETWEEN fecha_inicio AND fecha_fin;

    RETURN total_horas;
END//
DELIMITER ;

-- Volcando estructura para función bad_proyecto.calcularISSS
DROP FUNCTION IF EXISTS `calcularISSS`;
DELIMITER //
CREATE FUNCTION `calcularISSS`(salario DECIMAL) RETURNS decimal(10,2)
BEGIN
	DECLARE descuentomonto DECIMAL(10,2);
	set descuentomonto=salario*0.03;
	if descuentomonto>30 then
		set descuentomonto=30;
	END if;
	RETURN descuentomonto;
END//
DELIMITER ;

-- Volcando estructura para función bad_proyecto.calcularrenta
DROP FUNCTION IF EXISTS `calcularrenta`;
DELIMITER //
CREATE FUNCTION `calcularrenta`(salario DECIMAL) RETURNS decimal(10,2)
BEGIN
	DECLARE renta DECIMAL(10,2);
    IF salario >= 0.01 AND salario < 2.68 THEN
    SET renta = 0;
	ELSEIF salario >= 2.68 AND salario < 5.09 THEN
   	SET renta=salario*0.1;
   ELSEIF salario>=5.09 AND salario<11.58 then
   	SET renta=salario*0.2;
   ELSEIF salario>=11.58 then
   	SET renta=salario*0.3;
   END if;
   RETURN renta;
END//
DELIMITER ;

-- Volcando estructura para tabla bad_proyecto.datosempresa
DROP TABLE IF EXISTS `datosempresa`;
CREATE TABLE IF NOT EXISTS `datosempresa` (
  `IDEMPRESA` int NOT NULL,
  `NOMBREEMPRESA` varchar(50) NOT NULL,
  `DIRECCION` varchar(150) NOT NULL,
  `NOMBREREPRESENTANTE` varchar(100) NOT NULL,
  `NIT` varchar(20) DEFAULT NULL,
  `NIC` varchar(20) DEFAULT NULL,
  `TELEFONO` varchar(20) NOT NULL,
  `PAGINAWEB` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  PRIMARY KEY (`IDEMPRESA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.datosempresa: ~1 rows (aproximadamente)
DELETE FROM `datosempresa`;
INSERT INTO `datosempresa` (`IDEMPRESA`, `NOMBREEMPRESA`, `DIRECCION`, `NOMBREREPRESENTANTE`, `NIT`, `NIC`, `TELEFONO`, `PAGINAWEB`, `EMAIL`) VALUES
	(0, 'Empresa sa de cv', 'mi casa', 'marvin', '1111-111111-111-1', '1111111', '1111-1111', 'https://google.com', 'danielmezquino@gmail.com');

-- Volcando estructura para tabla bad_proyecto.deduccionbeneficio
DROP TABLE IF EXISTS `deduccionbeneficio`;
CREATE TABLE IF NOT EXISTS `deduccionbeneficio` (
  `IDDEDUCBENEF` int NOT NULL AUTO_INCREMENT,
  `NOMBREDEDUCBENEF` varchar(75) NOT NULL,
  `TIPO` enum('D','B') NOT NULL,
  PRIMARY KEY (`IDDEDUCBENEF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.deduccionbeneficio: ~6 rows (aproximadamente)
DELETE FROM `deduccionbeneficio`;
INSERT INTO `deduccionbeneficio` (`IDDEDUCBENEF`, `NOMBREDEDUCBENEF`, `TIPO`) VALUES
	(1, 'bono global 1', 'B'),
	(2, 'bono global 2 p', 'B'),
	(3, 'deduccion global 1', 'D'),
	(4, 'deduccion global 2 p', 'D'),
	(5, 'bono por ventas p', 'B'),
	(6, 'cuota alimencia', 'D');

-- Volcando estructura para tabla bad_proyecto.deduccionbeneficioglobal
DROP TABLE IF EXISTS `deduccionbeneficioglobal`;
CREATE TABLE IF NOT EXISTS `deduccionbeneficioglobal` (
  `IDDEDUCBENEF` int NOT NULL AUTO_INCREMENT,
  `PROPORCIONALALSUELDO` tinyint(1) NOT NULL,
  `MONTOOPORCENTAJE` decimal(10,0) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IDDEDUCBENEF`) USING BTREE,
  CONSTRAINT `FK_REFERENCE_23` FOREIGN KEY (`IDDEDUCBENEF`) REFERENCES `deduccionbeneficio` (`IDDEDUCBENEF`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.deduccionbeneficioglobal: ~4 rows (aproximadamente)
DELETE FROM `deduccionbeneficioglobal`;
INSERT INTO `deduccionbeneficioglobal` (`IDDEDUCBENEF`, `PROPORCIONALALSUELDO`, `MONTOOPORCENTAJE`, `ESTADO`) VALUES
	(1, 1, 20002, 1),
	(2, 1, 10, 1),
	(3, 0, 20, 1),
	(4, 1, 10, 1);

-- Volcando estructura para tabla bad_proyecto.deduccionbeneficio_empleado
DROP TABLE IF EXISTS `deduccionbeneficio_empleado`;
CREATE TABLE IF NOT EXISTS `deduccionbeneficio_empleado` (
  `IDDEDUCBENEF_EMP` int NOT NULL AUTO_INCREMENT,
  `IDEMPLEADO` int DEFAULT NULL,
  `IDDEDUCBENEF` int DEFAULT NULL,
  `PROPORCIONALALSUELDO` tinyint(1) NOT NULL,
  `MONTOOPORCENTAJE` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IDDEDUCBENEF_EMP`) USING BTREE,
  KEY `FK_REFERENCE_21` (`IDEMPLEADO`),
  KEY `FK_REFERENCE_22` (`IDDEDUCBENEF`),
  CONSTRAINT `FK_REFERENCE_21` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFERENCE_22` FOREIGN KEY (`IDDEDUCBENEF`) REFERENCES `deduccionbeneficio` (`IDDEDUCBENEF`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.deduccionbeneficio_empleado: ~16 rows (aproximadamente)
DELETE FROM `deduccionbeneficio_empleado`;
INSERT INTO `deduccionbeneficio_empleado` (`IDDEDUCBENEF_EMP`, `IDEMPLEADO`, `IDDEDUCBENEF`, `PROPORCIONALALSUELDO`, `MONTOOPORCENTAJE`) VALUES
	(1, 1, 5, 0, 17.00),
	(2, 1, 6, 1, 20.00),
	(3, 1, 5, 0, 30.00),
	(4, 1, 6, 0, 20.00),
	(5, 1, 5, 1, 17.25),
	(8, 1, 5, 0, 1.00),
	(9, 1, 5, 0, 1.00),
	(10, 1, 5, 0, 1.00),
	(11, 1, 6, 0, 1.00),
	(12, 1, 6, 0, 1.00),
	(13, 1, 6, 0, 2.00),
	(14, 1, 5, 0, 1.00),
	(15, 1, 5, 0, 1.00),
	(16, 1, 5, 0, 1.00),
	(17, 1, 5, 0, 1.00),
	(18, 3, 6, 1, 2.00);

-- Volcando estructura para tabla bad_proyecto.departamento
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `IDDEPARTAMENTO` int NOT NULL AUTO_INCREMENT,
  `NOMBREDEPARTAMENTO` varchar(50) NOT NULL,
  PRIMARY KEY (`IDDEPARTAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.departamento: ~14 rows (aproximadamente)
DELETE FROM `departamento`;
INSERT INTO `departamento` (`IDDEPARTAMENTO`, `NOMBREDEPARTAMENTO`) VALUES
	(1, 'Ahuachapán'),
	(2, 'Santa Ana'),
	(3, 'Sonsonate'),
	(4, 'La Libertad'),
	(5, 'Chalatenango'),
	(6, 'San Salvador'),
	(7, 'Cuscatlán'),
	(8, 'La Paz'),
	(9, 'Cabañas'),
	(10, 'San Vicente'),
	(11, 'Usulután'),
	(12, 'Morazán'),
	(13, 'San Miguel'),
	(14, 'La Unión');

-- Volcando estructura para función bad_proyecto.diasconpermiso
DROP FUNCTION IF EXISTS `diasconpermiso`;
DELIMITER //
CREATE FUNCTION `diasconpermiso`(
	`idEmpleadop` INT
) RETURNS int
BEGIN
    DECLARE total_dias INT DEFAULT 0;
    DECLARE dias_ajustados INT DEFAULT 0;

    -- Calcular el total de días de permisos aprobados no descontables
    SELECT SUM(DATEDIFF(FECHAFIN, FECHAINICIO) + 1)
    INTO total_dias
    FROM perlic_empleado
    WHERE IDEMPLEADO = idEmpleadop
      AND APROBADA = 1
      AND DESCONTABLE = 0;

    -- Aplicar la lógica para restar 2 días por cada 7 días de permiso
    SET dias_ajustados = total_dias - FLOOR(total_dias / 7) * 2;
	 if dias_ajustados IS NULL then
	 	SET dias_ajustados=0;
	 END if;
    RETURN dias_ajustados;
END//
DELIMITER ;

-- Volcando estructura para tabla bad_proyecto.empleado
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `IDEMPLEADO` int NOT NULL AUTO_INCREMENT,
  `IDPUESTO` int DEFAULT NULL,
  `IDMUNICIPIO` int DEFAULT NULL,
  `IDESTADOCIVIL` int DEFAULT NULL,
  `EMP_IDEMPLEADO` int DEFAULT NULL,
  `IDTIPODOC` int DEFAULT NULL,
  `NOMBRE1` varchar(20) NOT NULL,
  `NOMBRE2` varchar(20) DEFAULT NULL,
  `APELLIDO1` varchar(20) NOT NULL,
  `APELLIDO2` varchar(20) DEFAULT NULL,
  `APELLIDOCASADA` varchar(25) DEFAULT NULL,
  `SEXO` enum('M','F') NOT NULL,
  `FECHANACIMIENTO` date NOT NULL,
  `FECHAINGRESO` datetime NOT NULL,
  `NUMERODOC` varchar(20) NOT NULL,
  `NIT` varchar(25) DEFAULT NULL,
  `ISSS` varchar(25) NOT NULL,
  `NUP` varchar(25) DEFAULT NULL,
  `SALARIO` decimal(10,3) NOT NULL,
  `CORREOINSTITUCIONAL` varchar(30) NOT NULL,
  `CORREOPERSONAL` varchar(30) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IDEMPLEADO`),
  UNIQUE KEY `UNIQUE_NUMERODOC` (`NUMERODOC`),
  UNIQUE KEY `UNIQUE_ISSS` (`ISSS`),
  UNIQUE KEY `UNIQUE_CORREOINSTITUCIONAL` (`CORREOINSTITUCIONAL`),
  UNIQUE KEY `UNIQUE_CORREOPERSONAL` (`CORREOPERSONAL`),
  UNIQUE KEY `UNIQUE_NIT` (`NIT`),
  UNIQUE KEY `UNIQUE_NUP` (`NUP`),
  KEY `FK_EMPLEADO_TIENE_TIPODOC` (`IDTIPODOC`),
  KEY `FK_SE_LE_ASIGNA_PUESTO` (`IDPUESTO`),
  KEY `FK_SUPERVISA` (`EMP_IDEMPLEADO`),
  KEY `FK_TIENE_ESTADOCIVIL` (`IDESTADOCIVIL`),
  KEY `FK_VIVE_EN` (`IDMUNICIPIO`),
  CONSTRAINT `FK_EMPLEADO_TIENE_TIPODOC` FOREIGN KEY (`IDTIPODOC`) REFERENCES `tipodocumento` (`IDTIPODOC`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SE_LE_ASIGNA_PUESTO` FOREIGN KEY (`IDPUESTO`) REFERENCES `puesto` (`IDPUESTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SUPERVISA` FOREIGN KEY (`EMP_IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_ESTADOCIVIL` FOREIGN KEY (`IDESTADOCIVIL`) REFERENCES `estadocivil` (`IDESTADOCIVIL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_VIVE_EN` FOREIGN KEY (`IDMUNICIPIO`) REFERENCES `municipio` (`IDMUNICIPIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.empleado: ~3 rows (aproximadamente)
DELETE FROM `empleado`;
INSERT INTO `empleado` (`IDEMPLEADO`, `IDPUESTO`, `IDMUNICIPIO`, `IDESTADOCIVIL`, `EMP_IDEMPLEADO`, `IDTIPODOC`, `NOMBRE1`, `NOMBRE2`, `APELLIDO1`, `APELLIDO2`, `APELLIDOCASADA`, `SEXO`, `FECHANACIMIENTO`, `FECHAINGRESO`, `NUMERODOC`, `NIT`, `ISSS`, `NUP`, `SALARIO`, `CORREOINSTITUCIONAL`, `CORREOPERSONAL`, `ESTADO`) VALUES
	(1, 1, 151, NULL, NULL, NULL, 'pepe', 'david', 'mejia', '', '', 'M', '2024-05-22', '2024-05-22 20:28:18', '1', NULL, '1', NULL, 2.000, 'a', 'a', 1),
	(2, 1, NULL, NULL, NULL, NULL, 'pepe', NULL, 'aguilar', NULL, NULL, 'M', '2024-05-23', '2024-05-23 10:12:13', '2', NULL, '2', NULL, 2.000, 'b', 'b', 1),
	(3, 2, NULL, NULL, NULL, NULL, 'miguel', NULL, 'ortiz', NULL, NULL, 'M', '2024-05-23', '2024-05-23 10:32:09', '3', NULL, '3', NULL, 4.000, 'c', 'c', 1),
	(4, 2, NULL, NULL, NULL, NULL, 'f', NULL, 's', NULL, NULL, 'M', '2024-06-08', '2024-06-08 23:19:27', '4', NULL, '4', NULL, 1.000, 'd', 'd', 1),
	(5, 2, 127, 1, NULL, 1, 'a', '', 'a', '', NULL, 'M', '2000-01-01', '2024-05-20 00:00:00', '5', NULL, '555555555', NULL, 3.000, 'e@gmail.com', 'e@gmail.com', 1);

-- Volcando estructura para tabla bad_proyecto.estadocivil
DROP TABLE IF EXISTS `estadocivil`;
CREATE TABLE IF NOT EXISTS `estadocivil` (
  `IDESTADOCIVIL` int NOT NULL AUTO_INCREMENT,
  `NOMBREESTADO` varchar(20) NOT NULL,
  PRIMARY KEY (`IDESTADOCIVIL`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.estadocivil: ~0 rows (aproximadamente)
DELETE FROM `estadocivil`;
INSERT INTO `estadocivil` (`IDESTADOCIVIL`, `NOMBREESTADO`) VALUES
	(1, 'a');

-- Volcando estructura para tabla bad_proyecto.horasempleado
DROP TABLE IF EXISTS `horasempleado`;
CREATE TABLE IF NOT EXISTS `horasempleado` (
  `IDHORASEMPLEADO` int NOT NULL AUTO_INCREMENT,
  `IDEMPLEADO` int DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORAINGRESO` time DEFAULT NULL,
  `HORASALIDA` time DEFAULT NULL,
  PRIMARY KEY (`IDHORASEMPLEADO`),
  KEY `FK_REFERENCE_17` (`IDEMPLEADO`),
  CONSTRAINT `FK_REFERENCE_17` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.horasempleado: ~17 rows (aproximadamente)
DELETE FROM `horasempleado`;
INSERT INTO `horasempleado` (`IDHORASEMPLEADO`, `IDEMPLEADO`, `FECHA`, `HORAINGRESO`, `HORASALIDA`) VALUES
	(4, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(5, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(6, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(7, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(8, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(9, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(10, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(11, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(12, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(13, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(14, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(15, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(16, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(17, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(18, 1, '2024-05-22', '12:00:00', '22:00:00'),
	(24, 1, '2024-06-07', '17:11:58', '17:13:33'),
	(25, 2, '2024-06-07', '17:35:40', '17:35:45'),
	(26, 2, NULL, NULL, NULL),
	(27, 1, '2024-06-08', '22:44:02', '22:42:04');

-- Volcando estructura para tabla bad_proyecto.municipio
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE IF NOT EXISTS `municipio` (
  `IDMUNICIPIO` int NOT NULL AUTO_INCREMENT,
  `IDDEPARTAMENTO` int DEFAULT NULL,
  `NOMBREMUNICIPIO` varchar(50) NOT NULL,
  PRIMARY KEY (`IDMUNICIPIO`),
  KEY `FK_PERTENECE_A_DEPARTAMENTO` (`IDDEPARTAMENTO`),
  CONSTRAINT `FK_PERTENECE_A_DEPARTAMENTO` FOREIGN KEY (`IDDEPARTAMENTO`) REFERENCES `departamento` (`IDDEPARTAMENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.municipio: ~262 rows (aproximadamente)
DELETE FROM `municipio`;
INSERT INTO `municipio` (`IDMUNICIPIO`, `IDDEPARTAMENTO`, `NOMBREMUNICIPIO`) VALUES
	(1, 1, 'Ahuachapán'),
	(2, 1, 'Jujutla'),
	(3, 1, 'Atiquizaya'),
	(4, 1, 'Concepción de Ataco'),
	(5, 1, 'El Refugio'),
	(6, 1, 'Guaymango'),
	(7, 1, 'Apaneca'),
	(8, 1, 'San Francisco Menéndez'),
	(9, 1, 'San Lorenzo'),
	(10, 1, 'San Pedro Puxtla'),
	(11, 1, 'Tacuba'),
	(12, 1, 'Turín'),
	(13, 2, 'Candelaria de la Frontera'),
	(14, 2, 'Chalchuapa'),
	(15, 2, 'Coatepeque'),
	(16, 2, 'El Congo'),
	(17, 2, 'El Porvenir'),
	(18, 2, 'Masahuat'),
	(19, 2, 'Metapán'),
	(20, 2, 'San Antonio Pajonal'),
	(21, 2, 'San Sebastián Salitrillo'),
	(22, 2, 'Santa Ana'),
	(23, 2, 'Santa Rosa Guachipilín'),
	(24, 2, 'Santiago de la Frontera'),
	(25, 2, 'Texistepeque'),
	(26, 3, 'Acajutla'),
	(27, 3, 'Armenia'),
	(28, 3, 'Caluco'),
	(29, 3, 'Cuisnahuat'),
	(30, 3, 'Izalco'),
	(31, 3, 'Juayúa'),
	(32, 3, 'Nahuizalco'),
	(33, 3, 'Nahulingo'),
	(34, 3, 'Salcoatitán'),
	(35, 3, 'San Antonio del Monte'),
	(36, 3, 'San Julián'),
	(37, 3, 'Santa Catarina Masahuat'),
	(38, 3, 'Santa Isabel Ishuatán'),
	(39, 3, 'Santo Domingo de Guzmán'),
	(40, 3, 'Sonsonate'),
	(41, 3, 'Sonzacate'),
	(42, 11, 'Alegría'),
	(43, 11, 'Berlín'),
	(44, 11, 'California'),
	(45, 11, 'Concepción Batres'),
	(46, 11, 'El Triunfo'),
	(47, 11, 'Ereguayquín'),
	(48, 11, 'Estanzuelas'),
	(49, 11, 'Jiquilisco'),
	(50, 11, 'Jucuapa'),
	(51, 11, 'Jucuarán'),
	(52, 11, 'Mercedes Umaña'),
	(53, 11, 'Nueva Granada'),
	(54, 11, 'Ozatlán'),
	(55, 11, 'Puerto El Triunfo'),
	(56, 11, 'San Agustín'),
	(57, 11, 'San Buenaventura'),
	(58, 11, 'San Dionisio'),
	(59, 11, 'San Francisco Javier'),
	(60, 11, 'Santa Elena'),
	(61, 11, 'Santa María'),
	(62, 11, 'Santiago de María'),
	(63, 11, 'Tecapán'),
	(64, 11, 'Usulután'),
	(65, 13, 'Carolina'),
	(66, 13, 'Chapeltique'),
	(67, 13, 'Chinameca'),
	(68, 13, 'Chirilagua'),
	(69, 13, 'Ciudad Barrios'),
	(70, 13, 'Comacarán'),
	(71, 13, 'El Tránsito'),
	(72, 13, 'Lolotique'),
	(73, 13, 'Moncagua'),
	(74, 13, 'Nueva Guadalupe'),
	(75, 13, 'Nuevo Edén de San Juan'),
	(76, 13, 'Quelepa'),
	(77, 13, 'San Antonio del Mosco'),
	(78, 13, 'San Gerardo'),
	(79, 13, 'San Jorge'),
	(80, 13, 'San Luis de la Reina'),
	(81, 13, 'San Miguel'),
	(82, 13, 'San Rafael Oriente'),
	(83, 13, 'Sesori'),
	(84, 13, 'Uluazapa'),
	(85, 12, 'Arambala'),
	(86, 12, 'Cacaopera'),
	(87, 12, 'Chilanga'),
	(88, 12, 'Corinto'),
	(89, 12, 'Delicias de Concepción'),
	(90, 12, 'El Divisadero'),
	(91, 12, 'El Rosario (Morazán)'),
	(92, 12, 'Gualococti'),
	(93, 12, 'Guatajiagua'),
	(94, 12, 'Joateca'),
	(95, 12, 'Jocoaitique'),
	(96, 12, 'Jocoro'),
	(97, 12, 'Lolotiquillo'),
	(98, 12, 'Meanguera'),
	(99, 12, 'Osicala'),
	(100, 12, 'Perquín'),
	(101, 12, 'San Carlos'),
	(102, 12, 'San Fernando (Morazán)'),
	(103, 12, 'San Francisco Gotera'),
	(104, 12, 'San Isidro (Morazán)'),
	(105, 12, 'San Simón'),
	(106, 12, 'Sensembra'),
	(107, 12, 'Sociedad'),
	(108, 12, 'Torola'),
	(109, 12, 'Yamabal'),
	(110, 12, 'Yoloaiquín'),
	(111, 14, 'La Unión'),
	(112, 14, 'San Alejo'),
	(113, 14, 'Yucuaiquín'),
	(114, 14, 'Conchagua'),
	(115, 14, 'Intipucá'),
	(116, 14, 'San José'),
	(117, 14, 'El Carmen (La Unión)'),
	(118, 14, 'Yayantique'),
	(119, 14, 'Bolívar'),
	(120, 14, 'Meanguera del Golfo'),
	(121, 14, 'Santa Rosa de Lima'),
	(122, 14, 'Pasaquina'),
	(123, 14, 'Anamoros'),
	(124, 14, 'Nueva Esparta'),
	(125, 14, 'El Sauce'),
	(126, 14, 'Concepción de Oriente'),
	(127, 14, 'Polorós'),
	(128, 14, 'Lislique'),
	(129, 4, 'Antiguo Cuscatlán'),
	(130, 4, 'Chiltiupán'),
	(131, 4, 'Ciudad Arce'),
	(132, 4, 'Colón'),
	(133, 4, 'Comasagua'),
	(134, 4, 'Huizúcar'),
	(135, 4, 'Jayaque'),
	(136, 4, 'Jicalapa'),
	(137, 4, 'La Libertad'),
	(138, 4, 'Santa Tecla'),
	(139, 4, 'Nuevo Cuscatlán'),
	(140, 4, 'San Juan Opico'),
	(141, 4, 'Quezaltepeque'),
	(142, 4, 'Sacacoyo'),
	(143, 4, 'San José Villanueva'),
	(144, 4, 'San Matías'),
	(145, 4, 'San Pablo Tacachico'),
	(146, 4, 'Talnique'),
	(147, 4, 'Tamanique'),
	(148, 4, 'Teotepeque'),
	(149, 4, 'Tepecoyo'),
	(150, 4, 'Zaragoza'),
	(151, 5, 'Agua Caliente'),
	(152, 5, 'Arcatao'),
	(153, 5, 'Azacualpa'),
	(154, 5, 'Cancasque'),
	(155, 5, 'Chalatenango'),
	(156, 5, 'Citalá'),
	(157, 5, 'Comapala'),
	(158, 5, 'Concepción Quezaltepeque'),
	(159, 5, 'Dulce Nombre de María'),
	(160, 5, 'El Carrizal'),
	(161, 5, 'El Paraíso'),
	(162, 5, 'La Laguna'),
	(163, 5, 'La Palma'),
	(164, 5, 'La Reina'),
	(165, 5, 'Las Vueltas'),
	(166, 5, 'Nueva Concepción'),
	(167, 5, 'Nueva Trinidad'),
	(168, 5, 'Nombre de Jesús'),
	(169, 5, 'Ojos de Agua'),
	(170, 5, 'Potonico'),
	(171, 5, 'San Antonio de la Cruz'),
	(172, 5, 'San Antonio Los Ranchos'),
	(173, 5, 'San Fernando (Chalatenango)'),
	(174, 5, 'San Francisco Lempa'),
	(175, 5, 'San Francisco Morazán'),
	(176, 5, 'San Ignacio'),
	(177, 5, 'San Isidro Labrador'),
	(178, 5, 'Las Flores'),
	(179, 5, 'San Luis del Carmen'),
	(180, 5, 'San Miguel de Mercedes'),
	(181, 5, 'San Rafael'),
	(182, 5, 'Santa Rita'),
	(183, 5, 'Tejutla'),
	(184, 7, 'Cojutepeque'),
	(185, 7, 'Candelaria'),
	(186, 7, 'El Carmen (Cuscatlán)'),
	(187, 7, 'El Rosario (Cuscatlán)'),
	(188, 7, 'Monte San Juan'),
	(189, 7, 'Oratorio de Concepción'),
	(190, 7, 'San Bartolomé Perulapía'),
	(191, 7, 'San Cristóbal'),
	(192, 7, 'San José Guayabal'),
	(193, 7, 'San Pedro Perulapán'),
	(194, 7, 'San Rafael Cedros'),
	(195, 7, 'San Ramón'),
	(196, 7, 'Santa Cruz Analquito'),
	(197, 7, 'Santa Cruz Michapa'),
	(198, 7, 'Suchitoto'),
	(199, 7, 'Tenancingo'),
	(200, 6, 'Aguilares'),
	(201, 6, 'Apopa'),
	(202, 6, 'Ayutuxtepeque'),
	(203, 6, 'Cuscatancingo'),
	(204, 6, 'Ciudad Delgado'),
	(205, 6, 'El Paisnal'),
	(206, 6, 'Guazapa'),
	(207, 6, 'Ilopango'),
	(208, 6, 'Mejicanos'),
	(209, 6, 'Nejapa'),
	(210, 6, 'Panchimalco'),
	(211, 6, 'Rosario de Mora'),
	(212, 6, 'San Marcos'),
	(213, 6, 'San Martín'),
	(214, 6, 'San Salvador'),
	(215, 6, 'Santiago Texacuangos'),
	(216, 6, 'Santo Tomás'),
	(217, 6, 'Soyapango'),
	(218, 6, 'Tonacatepeque'),
	(219, 8, 'Zacatecoluca'),
	(220, 8, 'Cuyultitán'),
	(221, 8, 'El Rosario (La Paz)'),
	(222, 8, 'Jerusalén'),
	(223, 8, 'Mercedes La Ceiba'),
	(224, 8, 'Olocuilta'),
	(225, 8, 'Paraíso de Osorio'),
	(226, 8, 'San Antonio Masahuat'),
	(227, 8, 'San Emigdio'),
	(228, 8, 'San Francisco Chinameca'),
	(229, 8, 'San Pedro Masahuat'),
	(230, 8, 'San Juan Nonualco'),
	(231, 8, 'San Juan Talpa'),
	(232, 8, 'San Juan Tepezontes'),
	(233, 8, 'San Luis La Herradura'),
	(234, 8, 'San Luis Talpa'),
	(235, 8, 'San Miguel Tepezontes'),
	(236, 8, 'San Pedro Nonualco'),
	(237, 8, 'San Rafael Obrajuelo'),
	(238, 8, 'Santa María Ostuma'),
	(239, 8, 'Santiago Nonualco'),
	(240, 8, 'Tapalhuaca'),
	(241, 9, 'Cinquera'),
	(242, 9, 'Dolores'),
	(243, 9, 'Guacotecti'),
	(244, 9, 'Ilobasco'),
	(245, 9, 'Jutiapa'),
	(246, 9, 'San Isidro (Cabañas)'),
	(247, 9, 'Sensuntepeque'),
	(248, 9, 'Tejutepeque'),
	(249, 9, 'Victoria'),
	(250, 10, 'Apastepeque'),
	(251, 10, 'Guadalupe'),
	(252, 10, 'San Cayetano Istepeque'),
	(253, 10, 'San Esteban Catarina'),
	(254, 10, 'San Ildefonso'),
	(255, 10, 'San Lorenzo'),
	(256, 10, 'San Sebastián'),
	(257, 10, 'San Vicente'),
	(258, 10, 'Santa Clara'),
	(259, 10, 'Santo Domingo'),
	(260, 10, 'Tecoluca'),
	(261, 10, 'Tepetitán'),
	(262, 10, 'Verapaz');

-- Volcando estructura para procedimiento bad_proyecto.obtenerEmpleados
DROP PROCEDURE IF EXISTS `obtenerEmpleados`;
DELIMITER //
CREATE PROCEDURE `obtenerEmpleados`()
BEGIN
    SELECT * FROM Empleado;
END//
DELIMITER ;

-- Volcando estructura para tabla bad_proyecto.perlic_empleado
DROP TABLE IF EXISTS `perlic_empleado`;
CREATE TABLE IF NOT EXISTS `perlic_empleado` (
  `IDPERLIC_EMP` int NOT NULL AUTO_INCREMENT,
  `IDEMPLEADO` int DEFAULT NULL,
  `IDPERMISOLICENCIA` int DEFAULT NULL,
  `APROBADA` tinyint(1) NOT NULL,
  `DESCONTABLE` tinyint(1) NOT NULL,
  `FECHAINICIO` date NOT NULL,
  `FECHAFIN` date NOT NULL,
  `DIRECCIONARCHIVO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDPERLIC_EMP`) USING BTREE,
  KEY `FK_REFERENCE_18` (`IDEMPLEADO`),
  KEY `FK_REFERENCE_19` (`IDPERMISOLICENCIA`),
  CONSTRAINT `FK_REFERENCE_18` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFERENCE_19` FOREIGN KEY (`IDPERMISOLICENCIA`) REFERENCES `permisolicencia` (`IDPERMISOLICENCIA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.perlic_empleado: ~0 rows (aproximadamente)
DELETE FROM `perlic_empleado`;
INSERT INTO `perlic_empleado` (`IDPERLIC_EMP`, `IDEMPLEADO`, `IDPERMISOLICENCIA`, `APROBADA`, `DESCONTABLE`, `FECHAINICIO`, `FECHAFIN`, `DIRECCIONARCHIVO`) VALUES
	(1, 1, 1, 1, 0, '2024-05-23', '2024-06-23', NULL);

-- Volcando estructura para tabla bad_proyecto.permiso
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE IF NOT EXISTS `permiso` (
  `IDPERMISO` int NOT NULL AUTO_INCREMENT,
  `NOMBREPERMISO` varchar(100) NOT NULL,
  PRIMARY KEY (`IDPERMISO`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.permiso: ~44 rows (aproximadamente)
DELETE FROM `permiso`;
INSERT INTO `permiso` (`IDPERMISO`, `NOMBREPERMISO`) VALUES
	(1, 'ROLE_Ver_puestos'),
	(2, 'ROLE_Ver_profesiones_y_oficios'),
	(3, 'ROLE_Ver_unidades'),
	(4, 'ROLE_Ver_empleados'),
	(5, 'ROLE_Ver_horas_trabajadas'),
	(6, 'ROLE_Ver_permisos_y_licencias'),
	(7, 'ROLE_Ver_vacaciones'),
	(8, 'ROLE_Ver_contabilidad'),
	(9, 'ROLE_Ver_planilla'),
	(10, 'ROLE_Ver_boletas_de_pago'),
	(11, 'ROLE_Ver_deducciones_y_beneficios_globales'),
	(12, 'ROLE_Ver_deducciones_y_beneficios_de_empleados'),
	(13, 'ROLE_Ver_demografía_y_estado_civil'),
	(14, 'ROLE_Ver_demografía'),
	(15, 'ROLE_Ver_estados_civiles'),
	(16, 'ROLE_Ver_auditoria'),
	(17, 'ROLE_Ver_auditoria_de_empleados'),
	(18, 'ROLE_Ver_auditoria_de_deducciones_y_beneficios_globales'),
	(19, 'ROLE_Ver_auditoria_de_deducciones_y_beneficios_de_empleados'),
	(20, 'ROLE_Administrador'),
	(21, 'ROLE_Agregar_deducciones_y_beneficios_globales'),
	(22, 'ROLE_Editar_deducciones_y_beneficios_globales'),
	(23, 'ROLE_Editar_deducciones_y_beneficios_de_empleados'),
	(24, 'ROLE_Editar_horas_trabajadas'),
	(25, 'ROLE_Editar_vacaciones'),
	(26, 'ROLE_Agregar_permisos_y_licencias'),
	(27, 'ROLE_Editar_permisos_y_licencias'),
	(28, 'ROLE_Agregar_empleados'),
	(29, 'ROLE_Editar_empleados'),
	(30, 'ROLE_Cambiar_estado_empleados'),
	(31, 'ROLE_Agregar_puestos'),
	(32, 'ROLE_Editar_puestos'),
	(33, 'ROLE_Cambiar_estado_puestos'),
	(34, 'ROLE_Agregar_oficios'),
	(35, 'ROLE_Editar_oficios'),
	(36, 'ROLE_Ver_datos_empresa'),
	(37, 'ROLE_Editar_datos_empresa'),
	(38, 'ROLE_Agregar_unidades'),
	(39, 'ROLE_Editar_unidades'),
	(40, 'ROLE_Cambiar_estado_unidades'),
	(41, 'ROLE_Ver_presupuesto_de_unidades'),
	(42, 'ROLE_Editar_presupuesto_de_unidades'),
	(43, 'ROLE_Agregar_deducciones_y_beneficios_de_empleados'),
	(44, 'ROLE_Agregar_deducciones_y_beneficios_de_empleados');

-- Volcando estructura para tabla bad_proyecto.permisolicencia
DROP TABLE IF EXISTS `permisolicencia`;
CREATE TABLE IF NOT EXISTS `permisolicencia` (
  `IDPERMISOLICENCIA` int NOT NULL AUTO_INCREMENT,
  `TIPO` enum('P','L') NOT NULL,
  `CAUSA` varchar(75) NOT NULL,
  PRIMARY KEY (`IDPERMISOLICENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.permisolicencia: ~1 rows (aproximadamente)
DELETE FROM `permisolicencia`;
INSERT INTO `permisolicencia` (`IDPERMISOLICENCIA`, `TIPO`, `CAUSA`) VALUES
	(1, 'P', 'maternidad');

-- Volcando estructura para procedimiento bad_proyecto.planilla
DROP PROCEDURE IF EXISTS `planilla`;
DELIMITER //
CREATE PROCEDURE `planilla`(
	IN `fecha1` DATE,
	IN `fecha2` DATE
)
BEGIN
	SELECT numerodoc,CONCAT(COALESCE(nombre1,''),' ',COALESCE(nombre2,''),' ',COALESCE(apellido1,''),' ',
	COALESCE(apellido2,''),' ',COALESCE(apellidocasada,'')) AS Nombre,
	p.nombrepuesto as cargo,
	salario AS "salario/hora",
	calcularHorasNormales(idempleado,fecha1,fecha2) AS "horas trabajadas",
	salario*calcularHorasNormales(idempleado,fecha1,fecha2) AS "subtotal devengado",
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3 as vacaciones,
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2 AS "horas_extra",
	diasconpermiso(idempleado)*8*salario AS permisosremunerables,
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B") AS otrosbeneficios,
	(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	) AS "salario+beneficios",
	calcularISSS(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	) AS "isss",
	
	(salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)
	*0.0725 AS "afp",
	calcularrenta(salario)*calcularHorasNormales(idempleado,fecha1,fecha2) AS renta,
	calcularDeducBenefGlobales((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),"D")+
	calcularDeducBenefEmpleado((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),idempleado,"D") AS otrasdeducciones,
	(
	FORMAT(calcularISSS(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),2) +
	FORMAT(
	(salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)
	*0.0725,2)+
	calcularrenta(salario)*calcularHorasNormales(idempleado,fecha1,fecha2)+
	calcularDeducBenefGlobales((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),"D")+
	calcularDeducBenefEmpleado((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),idempleado,"D")	) AS totaldeducciones,
	(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)-
	(
	FORMAT(calcularISSS(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),2) +
	FORMAT(
	(salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)
	*0.0725,2)+
	calcularrenta(salario)*calcularHorasNormales(idempleado,fecha1,fecha2)+
	calcularDeducBenefGlobales((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),"D")+
	calcularDeducBenefEmpleado((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),idempleado,"D")	) AS salarioneto
	FROM empleado e 
	JOIN puesto p ON e.idpuesto=p.idpuesto
	WHERE e.fechaingreso>=fecha1 AND e.ESTADO=1;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento bad_proyecto.planillaEmpleado
DROP PROCEDURE IF EXISTS `planillaEmpleado`;
DELIMITER //
CREATE PROCEDURE `planillaEmpleado`(
	IN `fecha1` DATE,
	IN `fecha2` DATE,
	IN `idempleadop` int
)
BEGIN
	SELECT numerodoc,CONCAT(COALESCE(nombre1,''),' ',COALESCE(nombre2,''),' ',COALESCE(apellido1,''),' ',
	COALESCE(apellido2,''),' ',COALESCE(apellidocasada,'')) AS Nombre,
	p.nombrepuesto as cargo,
	salario AS "salario/hora",
	calcularHorasNormales(idempleado,fecha1,fecha2) AS "horas trabajadas",
	salario*calcularHorasNormales(idempleado,fecha1,fecha2) AS "subtotal devengado",
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3 as vacaciones,
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2 AS "horas_extra",
	diasconpermiso(idempleado)*8*salario AS permisosremunerables,
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B") AS otrosbeneficios,
	(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	) AS "salario+beneficios",
	calcularISSS(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	) AS "isss",
	
	(salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)
	*0.0725 AS "afp",
	calcularrenta(salario)*calcularHorasNormales(idempleado,fecha1,fecha2) AS renta,
	calcularDeducBenefGlobales((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),"D")+
	calcularDeducBenefEmpleado((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),idempleado,"D") AS otrasdeducciones,
	(
	FORMAT(calcularISSS(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),2) +
	FORMAT(
	(salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)
	*0.0725,2)+
	calcularrenta(salario)*calcularHorasNormales(idempleado,fecha1,fecha2)+
	calcularDeducBenefGlobales((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),"D")+
	calcularDeducBenefEmpleado((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),idempleado,"D")	) AS totaldeducciones,
	(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)-
	(
	FORMAT(calcularISSS(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),2) +
	FORMAT(
	(salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)
	*0.0725,2)+
	calcularrenta(salario)*calcularHorasNormales(idempleado,fecha1,fecha2)+
	calcularDeducBenefGlobales((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),"D")+
	calcularDeducBenefEmpleado((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),idempleado,"D")	) AS salarioneto
	FROM empleado e 
	JOIN puesto p ON e.idpuesto=p.idpuesto
	WHERE e.idempleado=idempleadop;
	END//
DELIMITER ;

-- Volcando estructura para tabla bad_proyecto.presupuestoanual
DROP TABLE IF EXISTS `presupuestoanual`;
CREATE TABLE IF NOT EXISTS `presupuestoanual` (
  `IDPRESUPUESTO` int NOT NULL AUTO_INCREMENT,
  `IDUNIDAD` int DEFAULT NULL,
  `ANO` int NOT NULL,
  `MONTO` decimal(10,0) NOT NULL,
  PRIMARY KEY (`IDPRESUPUESTO`),
  KEY `FK_REFERENCE_16` (`IDUNIDAD`),
  CONSTRAINT `FK_REFERENCE_16` FOREIGN KEY (`IDUNIDAD`) REFERENCES `unidad` (`IDUNIDAD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.presupuestoanual: ~3 rows (aproximadamente)
DELETE FROM `presupuestoanual`;
INSERT INTO `presupuestoanual` (`IDPRESUPUESTO`, `IDUNIDAD`, `ANO`, `MONTO`) VALUES
	(1, 1, 2024, 1000000),
	(2, 1, 2019, 155550),
	(3, 1, 2018, 4544552);

-- Volcando estructura para tabla bad_proyecto.profesionoficio
DROP TABLE IF EXISTS `profesionoficio`;
CREATE TABLE IF NOT EXISTS `profesionoficio` (
  `IDPROFOFC` int NOT NULL AUTO_INCREMENT,
  `NOMBREPROFOFC` varchar(50) NOT NULL,
  PRIMARY KEY (`IDPROFOFC`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.profesionoficio: ~1 rows (aproximadamente)
DELETE FROM `profesionoficio`;
INSERT INTO `profesionoficio` (`IDPROFOFC`, `NOMBREPROFOFC`) VALUES
	(1, 'albañi'),
	(2, 'a');

-- Volcando estructura para tabla bad_proyecto.profofc_empleado
DROP TABLE IF EXISTS `profofc_empleado`;
CREATE TABLE IF NOT EXISTS `profofc_empleado` (
  `IDPROFOFC` int NOT NULL,
  `IDEMPLEADO` int NOT NULL,
  PRIMARY KEY (`IDPROFOFC`,`IDEMPLEADO`),
  KEY `FK_PROFOFC_EMPLEADO2` (`IDEMPLEADO`),
  CONSTRAINT `FK_PROFOFC_EMPLEADO` FOREIGN KEY (`IDPROFOFC`) REFERENCES `profesionoficio` (`IDPROFOFC`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PROFOFC_EMPLEADO2` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.profofc_empleado: ~0 rows (aproximadamente)
DELETE FROM `profofc_empleado`;
INSERT INTO `profofc_empleado` (`IDPROFOFC`, `IDEMPLEADO`) VALUES
	(1, 1),
	(2, 1),
	(1, 5),
	(2, 5);

-- Volcando estructura para tabla bad_proyecto.puesto
DROP TABLE IF EXISTS `puesto`;
CREATE TABLE IF NOT EXISTS `puesto` (
  `IDPUESTO` int NOT NULL AUTO_INCREMENT,
  `IDUNIDAD` int DEFAULT NULL,
  `NOMBREPUESTO` varchar(50) NOT NULL,
  `SALARIOMIN` decimal(10,0) NOT NULL,
  `SALARIOMAX` decimal(10,0) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IDPUESTO`),
  KEY `FK_PERTENECE_A_UNIDAD` (`IDUNIDAD`),
  CONSTRAINT `FK_PERTENECE_A_UNIDAD` FOREIGN KEY (`IDUNIDAD`) REFERENCES `unidad` (`IDUNIDAD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.puesto: ~1 rows (aproximadamente)
DELETE FROM `puesto`;
INSERT INTO `puesto` (`IDPUESTO`, `IDUNIDAD`, `NOMBREPUESTO`, `SALARIOMIN`, `SALARIOMAX`, `ESTADO`) VALUES
	(1, 1, 'electricista', 1, 2, 1),
	(2, 2, 'secretario', 3, 4, 1);

-- Volcando estructura para tabla bad_proyecto.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `IDROL` int NOT NULL AUTO_INCREMENT,
  `NOMBREROL` varchar(25) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IDROL`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.rol: ~3 rows (aproximadamente)
DELETE FROM `rol`;
INSERT INTO `rol` (`IDROL`, `NOMBREROL`, `ESTADO`) VALUES
	(1, 'usuario', 1),
	(2, 'admin', 1),
	(14, 'contador', 1);

-- Volcando estructura para tabla bad_proyecto.rol_permiso
DROP TABLE IF EXISTS `rol_permiso`;
CREATE TABLE IF NOT EXISTS `rol_permiso` (
  `IDPERMISO` int NOT NULL,
  `IDROL` int NOT NULL,
  PRIMARY KEY (`IDPERMISO`,`IDROL`),
  KEY `FK_TIENE_PERMISO2` (`IDROL`),
  CONSTRAINT `FK_TIENE_PERMISO` FOREIGN KEY (`IDPERMISO`) REFERENCES `permiso` (`IDPERMISO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_PERMISO2` FOREIGN KEY (`IDROL`) REFERENCES `rol` (`IDROL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.rol_permiso: ~89 rows (aproximadamente)
DELETE FROM `rol_permiso`;
INSERT INTO `rol_permiso` (`IDPERMISO`, `IDROL`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(12, 2),
	(13, 2),
	(14, 2),
	(15, 2),
	(16, 2),
	(17, 2),
	(18, 2),
	(19, 2),
	(20, 2),
	(21, 2),
	(22, 2),
	(23, 2),
	(24, 2),
	(25, 2),
	(26, 2),
	(27, 2),
	(28, 2),
	(29, 2),
	(30, 2),
	(31, 2),
	(32, 2),
	(33, 2),
	(34, 2),
	(35, 2),
	(36, 2),
	(37, 2),
	(38, 2),
	(39, 2),
	(40, 2),
	(41, 2),
	(42, 2),
	(8, 14),
	(9, 14),
	(10, 14);

-- Volcando estructura para procedimiento bad_proyecto.salarioNeto
DROP PROCEDURE IF EXISTS `salarioNeto`;
DELIMITER //
CREATE PROCEDURE `salarioNeto`(
	IN `fecha1` DATE,
	IN `fecha2` DATE,
	IN `idempleadop` int
)
BEGIN
	SELECT (
	(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)-
	(
	FORMAT(calcularISSS(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),2) +
	FORMAT(
	(salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)
	*0.0725,2)+
	calcularrenta(salario)*calcularHorasNormales(idempleado,fecha1,fecha2)+
	calcularDeducBenefGlobales((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),"D")+
	calcularDeducBenefEmpleado((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),idempleado,"D")	)) AS salarioneto
	FROM empleado e 
	JOIN puesto p ON e.idpuesto=p.idpuesto
	WHERE e.idempleado=idempleadop;
	END//
DELIMITER ;

-- Volcando estructura para función bad_proyecto.salarioNeto
DROP FUNCTION IF EXISTS `salarioNeto`;
DELIMITER //
CREATE FUNCTION `salarioNeto`(
	`fecha1` DATE,
	`fecha2` DATE,
	`idempleadop` int
) RETURNS decimal(10,2)
BEGIN
	DECLARE salarioneto DECIMAL(10,2);

	SET salarioneto=(SELECT
	(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)-
	(
	FORMAT(calcularISSS(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),2) +
	(
	FORMAT((salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)
	*0.0725,2))+
	calcularrenta(salario)*calcularHorasNormales(idempleado,fecha1,fecha2)+
	calcularDeducBenefGlobales((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),"D")+
	calcularDeducBenefEmpleado((
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),idempleado,"D")	)
	FROM empleado e 
	JOIN puesto p ON e.idpuesto=p.idpuesto
	WHERE e.idempleado=idempleadop);
	RETURN salarioneto;
	END//
DELIMITER ;

-- Volcando estructura para procedimiento bad_proyecto.SetCurrentUser
DROP PROCEDURE IF EXISTS `SetCurrentUser`;
DELIMITER //
CREATE PROCEDURE `SetCurrentUser`(IN `userId` INT)
BEGIN
    SET @current_user_id = userId;
END//
DELIMITER ;

-- Volcando estructura para tabla bad_proyecto.tipodocumento
DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE IF NOT EXISTS `tipodocumento` (
  `IDTIPODOC` int NOT NULL AUTO_INCREMENT,
  `NOMBREDOC` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTIPODOC`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.tipodocumento: ~0 rows (aproximadamente)
DELETE FROM `tipodocumento`;
INSERT INTO `tipodocumento` (`IDTIPODOC`, `NOMBREDOC`) VALUES
	(1, 'a');

-- Volcando estructura para tabla bad_proyecto.tipounidad
DROP TABLE IF EXISTS `tipounidad`;
CREATE TABLE IF NOT EXISTS `tipounidad` (
  `IDTIPOUNIDAD` int NOT NULL AUTO_INCREMENT,
  `NOMBRETIPOUNIDAD` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTIPOUNIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.tipounidad: ~0 rows (aproximadamente)
DELETE FROM `tipounidad`;
INSERT INTO `tipounidad` (`IDTIPOUNIDAD`, `NOMBRETIPOUNIDAD`) VALUES
	(1, 'unidad');

-- Volcando estructura para tabla bad_proyecto.unidad
DROP TABLE IF EXISTS `unidad`;
CREATE TABLE IF NOT EXISTS `unidad` (
  `IDUNIDAD` int NOT NULL AUTO_INCREMENT,
  `IDTIPOUNIDAD` int DEFAULT NULL,
  `UNI_IDUNIDAD` int DEFAULT NULL,
  `NOMBREUNIDAD` varchar(50) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IDUNIDAD`),
  KEY `FK_GESTIONA_SUBUNIDADES` (`UNI_IDUNIDAD`),
  KEY `FK_TIENE_TIPOUNIDAD` (`IDTIPOUNIDAD`),
  CONSTRAINT `FK_GESTIONA_SUBUNIDADES` FOREIGN KEY (`UNI_IDUNIDAD`) REFERENCES `unidad` (`IDUNIDAD`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_TIPOUNIDAD` FOREIGN KEY (`IDTIPOUNIDAD`) REFERENCES `tipounidad` (`IDTIPOUNIDAD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.unidad: ~0 rows (aproximadamente)
DELETE FROM `unidad`;
INSERT INTO `unidad` (`IDUNIDAD`, `IDTIPOUNIDAD`, `UNI_IDUNIDAD`, `NOMBREUNIDAD`, `ESTADO`) VALUES
	(1, 1, NULL, 'contaduria', 1),
	(2, 1, NULL, 'secretaria', 1);

-- Volcando estructura para tabla bad_proyecto.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `IDUSUARIO` int NOT NULL AUTO_INCREMENT,
  `IDROL` int DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT '1',
  `INTENTOSLOGIN` int DEFAULT '0',
  `SOLICITODESBLOQUEO` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`IDUSUARIO`),
  UNIQUE KEY `UNIQUE_EMAIL` (`EMAIL`),
  UNIQUE KEY `UNIQUE_USERNAME` (`USERNAME`),
  KEY `FK_SE_LE_ASIGNA` (`IDROL`),
  CONSTRAINT `FK_SE_LE_ASIGNA` FOREIGN KEY (`IDROL`) REFERENCES `rol` (`IDROL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.usuario: ~9 rows (aproximadamente)
DELETE FROM `usuario`;
INSERT INTO `usuario` (`IDUSUARIO`, `IDROL`, `USERNAME`, `EMAIL`, `PASSWORD`, `ESTADO`, `INTENTOSLOGIN`, `SOLICITODESBLOQUEO`) VALUES
	(8, 1, 'user', 'marvinortiz192@gmail.com', '$2a$10$XsUZ.NSqJUYY1PsgYzzIq.cSnn95IleR2KUeSE86o7/BaqXY/qpxW', 1, 0, 0),
	(26, 1, 'user2', 'a', '$2a$10$XsUZ.NSqJUYY1PsgYzzIq.cSnn95IleR2KUeSE86o7/BaqXY/qpxW', 1, 0, 0),
	(34, 1, 'user3', 'danielmezquino@gmail.com', '$2a$10$emCfh2hJ4sGVrG2AXaoOzuaXFTdSWDQgPUsOnYxGKW1ahe2JisT22', 1, 0, 0),
	(37, 1, 'user4', '4', '$2a$10$CLXxOXKeWndJNGIp7McXX.wcx6BTOhPjpFy8OWpdsx0Y3nZZoKFEW', 1, 0, 0),
	(38, 1, 'user5', '5', '$2a$10$cQDW.UHQ7ZqEvqRJR6QU7uL.XCiq4.QsR3Wd.Qs7vELngg.WUX0vK', 1, 0, 0),
	(39, 1, 'a', 'as', '$2a$10$KGR02DvEhkERGuvjM0/0meyrHQhcTt2J5ymPPhXLqAiUzhFcoq3Oy', 1, 0, 0),
	(42, 1, 'migue', 'miguel', '$2a$10$pu4A3nLv1aiL8y4fNHYfN.Z10iSRt7AUTU7.TOItImD2SuUobp0A2', 1, 0, 0),
	(43, 1, 'asasasas', 'asas', '$2a$10$xcABjELGGDcqi.nPFqwc8uDUktwBd5SBephS819oqe4M8l4xYSGjG', 1, 0, 0),
	(44, NULL, NULL, '<select></select>', NULL, 1, 0, 0);

-- Volcando estructura para tabla bad_proyecto.vacacion
DROP TABLE IF EXISTS `vacacion`;
CREATE TABLE IF NOT EXISTS `vacacion` (
  `IDVACACION` int NOT NULL AUTO_INCREMENT,
  `IDEMPLEADO` int DEFAULT NULL,
  `FECHAINICIO` date DEFAULT NULL,
  `FECHAFIN` date DEFAULT NULL,
  `PENDIENTE` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IDVACACION`),
  KEY `FK_REFERENCE_20` (`IDEMPLEADO`),
  CONSTRAINT `FK_REFERENCE_20` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.vacacion: ~0 rows (aproximadamente)
DELETE FROM `vacacion`;
INSERT INTO `vacacion` (`IDVACACION`, `IDEMPLEADO`, `FECHAINICIO`, `FECHAFIN`, `PENDIENTE`) VALUES
	(6, 2, '2024-06-16', NULL, 0);

-- Volcando estructura para función bad_proyecto.verificarVacacion
DROP FUNCTION IF EXISTS `verificarVacacion`;
DELIMITER //
CREATE FUNCTION `verificarVacacion`(
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE
) RETURNS tinyint
BEGIN
    DECLARE existe TINYINT;

    SELECT
        COUNT(*)
    INTO
        existe
    FROM
        vacacion
    WHERE
        IDEMPLEADO = empleado_id
        AND FECHAINICIO BETWEEN fecha_inicio AND fecha_fin;

    IF existe > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END//
DELIMITER ;

-- Volcando estructura para vista bad_proyecto.v_administradoresemails
DROP VIEW IF EXISTS `v_administradoresemails`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_administradoresemails` (
	`email` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Volcando estructura para disparador bad_proyecto.after_insert_deduccionbeneficioempleado
DROP TRIGGER IF EXISTS `after_insert_deduccionbeneficioempleado`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_insert_deduccionbeneficioempleado` AFTER INSERT ON `deduccionbeneficio_empleado` FOR EACH ROW BEGIN
    DECLARE user_id INT;
    DECLARE nombre_deduccion VARCHAR(50);
    DECLARE tipo_deduccion CHAR(1);
    SET user_id = @current_user_id;

    SELECT NOMBREDEDUCBENEF, TIPO INTO nombre_deduccion, tipo_deduccion
    FROM DEDUCCIONBENEFICIO
    WHERE IDDEDUCBENEF = NEW.IDDEDUCBENEF;

    INSERT INTO AUDITORIA_DEDUCCIONBENEFICIOEMPLEADO (IDDEDUCBENEF, NOMBREDEDUCBENEF, TIPO, IDDEDUCBENEF_EMP, IDEMPLEADO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, nombre_deduccion, tipo_deduccion, NEW.IDDEDUCBENEF_EMP, NEW.IDEMPLEADO, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NOW(), 'Inserción', user_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bad_proyecto.after_insert_deduccionbeneficioglobal
DROP TRIGGER IF EXISTS `after_insert_deduccionbeneficioglobal`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_insert_deduccionbeneficioglobal` AFTER INSERT ON `deduccionbeneficioglobal` FOR EACH ROW BEGIN
    DECLARE user_id INT;
    DECLARE nombre_deduccion VARCHAR(75);
    DECLARE tipo_deduccion CHAR(1);
    SET user_id = @current_user_id;

    SELECT NOMBREDEDUCBENEF, TIPO INTO nombre_deduccion, tipo_deduccion
    FROM DEDUCCIONBENEFICIO
    WHERE IDDEDUCBENEF = NEW.IDDEDUCBENEF;

    INSERT INTO AUDITORIA_DEDUCCIONBENEFICIOGLOBAL (IDDEDUCBENEF, NOMBREDEDUCBENEF, TIPO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, ESTADO, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, nombre_deduccion, tipo_deduccion, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NEW.ESTADO, NOW(), 'Inserción', user_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bad_proyecto.after_insert_empleado
DROP TRIGGER IF EXISTS `after_insert_empleado`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_insert_empleado` AFTER INSERT ON `empleado` FOR EACH ROW BEGIN
 	DECLARE user_id INT;
    SET user_id = @current_user_id;

INSERT INTO AUDITORIA_EMPLEADO (IDEMPLEADO, IDPUESTO, IDMUNICIPIO, IDESTADOCIVIL, EMP_IDEMPLEADO, IDTIPODOC, NOMBRE1, NOMBRE2, APELLIDO1, APELLIDO2, APELLIDOCASADA, SEXO, FECHANACIMIENTO, FECHAINGRESO, NUMERODOC, NIT, ISSS, NUP, SALARIO, CORREOINSTITUCIONAL, CORREOPERSONAL, ESTADO, FECHAMODIFICACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDEMPLEADO, NEW.IDPUESTO, NEW.IDMUNICIPIO, NEW.IDESTADOCIVIL, NEW.EMP_IDEMPLEADO, NEW.IDTIPODOC, NEW.NOMBRE1, NEW.NOMBRE2, NEW.APELLIDO1, NEW.APELLIDO2, NEW.APELLIDOCASADA, NEW.SEXO, NEW.FECHANACIMIENTO, NEW.FECHAINGRESO, NEW.NUMERODOC, NEW.NIT, NEW.ISSS, NEW.NUP, NEW.SALARIO, NEW.CORREOINSTITUCIONAL, NEW.CORREOPERSONAL, NEW.ESTADO, NOW(), 'Creación', user_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bad_proyecto.after_update_deduccionbeneficioempleado
DROP TRIGGER IF EXISTS `after_update_deduccionbeneficioempleado`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_update_deduccionbeneficioempleado` AFTER UPDATE ON `deduccionbeneficio_empleado` FOR EACH ROW BEGIN
    DECLARE user_id INT;
    DECLARE nombre_deduccion VARCHAR(50);
    DECLARE tipo_deduccion CHAR(1);
    SET user_id = @current_user_id;

    SELECT NOMBREDEDUCBENEF, TIPO INTO nombre_deduccion, tipo_deduccion
    FROM DEDUCCIONBENEFICIO
    WHERE IDDEDUCBENEF = NEW.IDDEDUCBENEF;

    INSERT INTO AUDITORIA_DEDUCCIONBENEFICIOEMPLEADO (IDDEDUCBENEF, NOMBREDEDUCBENEF, TIPO, IDDEDUCBENEF_EMP, IDEMPLEADO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, nombre_deduccion, tipo_deduccion, NEW.IDDEDUCBENEF_EMP, NEW.IDEMPLEADO, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NOW(), 'Actualización', user_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bad_proyecto.after_update_deduccionbeneficioglobal
DROP TRIGGER IF EXISTS `after_update_deduccionbeneficioglobal`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_update_deduccionbeneficioglobal` AFTER UPDATE ON `deduccionbeneficioglobal` FOR EACH ROW BEGIN
    DECLARE user_id INT;
    DECLARE nombre_deduccion VARCHAR(75);
    DECLARE tipo_deduccion CHAR(1);
    SET user_id = @current_user_id;

    SELECT NOMBREDEDUCBENEF, TIPO INTO nombre_deduccion, tipo_deduccion
    FROM DEDUCCIONBENEFICIO
    WHERE IDDEDUCBENEF = NEW.IDDEDUCBENEF;

    INSERT INTO AUDITORIA_DEDUCCIONBENEFICIOGLOBAL (IDDEDUCBENEF, NOMBREDEDUCBENEF, TIPO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, ESTADO, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, nombre_deduccion, tipo_deduccion, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NEW.ESTADO, NOW(), 'Actualización', user_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bad_proyecto.after_update_empleado
DROP TRIGGER IF EXISTS `after_update_empleado`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_update_empleado` AFTER UPDATE ON `empleado` FOR EACH ROW BEGIN
	DECLARE user_id INT;
    SET user_id = @current_user_id;

INSERT INTO AUDITORIA_EMPLEADO (IDEMPLEADO, IDPUESTO, IDMUNICIPIO, IDESTADOCIVIL, EMP_IDEMPLEADO, IDTIPODOC, NOMBRE1, NOMBRE2, APELLIDO1, APELLIDO2, APELLIDOCASADA, SEXO, FECHANACIMIENTO, FECHAINGRESO, NUMERODOC, NIT, ISSS, NUP, SALARIO, CORREOINSTITUCIONAL, CORREOPERSONAL, ESTADO, FECHAMODIFICACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDEMPLEADO, NEW.IDPUESTO, NEW.IDMUNICIPIO, NEW.IDESTADOCIVIL, NEW.EMP_IDEMPLEADO, NEW.IDTIPODOC, NEW.NOMBRE1, NEW.NOMBRE2, NEW.APELLIDO1, NEW.APELLIDO2, NEW.APELLIDOCASADA, NEW.SEXO, NEW.FECHANACIMIENTO, NEW.FECHAINGRESO, NEW.NUMERODOC, NEW.NIT, NEW.ISSS, NEW.NUP, NEW.SALARIO, NEW.CORREOINSTITUCIONAL, NEW.CORREOPERSONAL, NEW.ESTADO, NOW(), 'Actualización', user_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_administradoresemails`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_administradoresemails` AS select `u`.`EMAIL` AS `email` from ((`usuario` `u` join `rol_permiso` `rp` on((`rp`.`IDROL` = `u`.`IDROL`))) join `permiso` `p` on((`p`.`IDPERMISO` = `rp`.`IDPERMISO`))) where (`p`.`NOMBREPERMISO` = 'ROLE_Administrador');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
