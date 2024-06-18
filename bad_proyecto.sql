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
  `IDDEDUCBENEF_EMP` int NOT NULL,
  `IDDEDUCBENEF` int NOT NULL,
  `IDEMPLEADO` int DEFAULT NULL,
  `PROPORCIONALALSUELDO` tinyint(1) NOT NULL,
  `MONTOOPORCENTAJE` decimal(10,2) NOT NULL,
  `ESTADO` tinyint NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.auditoria_deduccionbeneficioempleado: ~11 rows (aproximadamente)
DELETE FROM `auditoria_deduccionbeneficioempleado`;
INSERT INTO `auditoria_deduccionbeneficioempleado` (`IDAUDITORIA_DEDUCBENEFEMP`, `IDDEDUCBENEF_EMP`, `IDDEDUCBENEF`, `IDEMPLEADO`, `PROPORCIONALALSUELDO`, `MONTOOPORCENTAJE`, `ESTADO`, `FECHADEOPERACION`, `TIPODEOPERACION`, `USUARIOREGISTRA`) VALUES
	(1, 1, 3, 1, 1, 3.00, 0, '2024-06-16', 'Inserción', 1),
	(2, 1, 3, 1, 1, 3.00, 1, '2024-06-16', 'Actualización', 1),
	(3, 1, 3, 1, 1, 3.00, 0, '2024-06-16', 'Actualización', 1),
	(4, 1, 3, 1, 1, 3.00, 0, '2024-06-16', 'Actualización', 1),
	(5, 1, 3, 1, 1, 3.00, 1, '2024-06-16', 'Actualización', 1),
	(7, 3, 8, 1, 0, 50.00, 1, '2024-06-16', 'Inserción', 1),
	(8, 1, 3, 1, 1, 3.00, 0, '2024-06-16', 'Actualización', NULL),
	(9, 1, 3, 1, 1, 3.00, 1, '2024-06-16', 'Actualización', NULL),
	(10, 3, 8, 1, 0, 50.00, 0, '2024-06-17', 'Actualización', NULL),
	(11, 3, 8, 1, 0, 50.50, 0, '2024-06-17', 'Actualización', NULL),
	(12, 3, 8, 1, 0, 50.50, 1, '2024-06-17', 'Actualización', NULL);

-- Volcando estructura para tabla bad_proyecto.auditoria_deduccionbeneficioglobal
DROP TABLE IF EXISTS `auditoria_deduccionbeneficioglobal`;
CREATE TABLE IF NOT EXISTS `auditoria_deduccionbeneficioglobal` (
  `IDAUDITORIA_IDDEDUCBENEF` int NOT NULL AUTO_INCREMENT,
  `IDDEDUCBENEF` int NOT NULL,
  `PROPORCIONALALSUELDO` tinyint(1) NOT NULL,
  `MONTOOPORCENTAJE` decimal(10,2) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT '1',
  `FECHADEOPERACION` date NOT NULL,
  `TIPODEOPERACION` varchar(25) NOT NULL,
  `USUARIOREGISTRA` int DEFAULT NULL,
  PRIMARY KEY (`IDAUDITORIA_IDDEDUCBENEF`),
  KEY `FK_DEDUCCIONBENEFICIOGLOBAL` (`IDDEDUCBENEF`),
  KEY `FK_USUARIOREGISTRA` (`USUARIOREGISTRA`),
  CONSTRAINT `FK_DEDUCCIONBENEFICIOGLOBAL` FOREIGN KEY (`IDDEDUCBENEF`) REFERENCES `deduccionbeneficio` (`IDDEDUCBENEF`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USUARIOREGISTRA` FOREIGN KEY (`USUARIOREGISTRA`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.auditoria_deduccionbeneficioglobal: ~2 rows (aproximadamente)
DELETE FROM `auditoria_deduccionbeneficioglobal`;
INSERT INTO `auditoria_deduccionbeneficioglobal` (`IDAUDITORIA_IDDEDUCBENEF`, `IDDEDUCBENEF`, `PROPORCIONALALSUELDO`, `MONTOOPORCENTAJE`, `ESTADO`, `FECHADEOPERACION`, `TIPODEOPERACION`, `USUARIOREGISTRA`) VALUES
	(1, 1, 1, 3.00, 1, '2024-06-15', 'Inserción', NULL),
	(2, 2, 1, 7.00, 1, '2024-06-15', 'Inserción', NULL);

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
  `SALARIO` decimal(10,2) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.auditoria_empleado: ~16 rows (aproximadamente)
DELETE FROM `auditoria_empleado`;
INSERT INTO `auditoria_empleado` (`IDAUDITORIA_EMPLEADO`, `IDEMPLEADO`, `IDPUESTO`, `IDMUNICIPIO`, `IDESTADOCIVIL`, `EMP_IDEMPLEADO`, `IDTIPODOC`, `NOMBRE1`, `NOMBRE2`, `APELLIDO1`, `APELLIDO2`, `APELLIDOCASADA`, `SEXO`, `FECHANACIMIENTO`, `FECHAINGRESO`, `NUMERODOC`, `NIT`, `ISSS`, `NUP`, `SALARIO`, `CORREOINSTITUCIONAL`, `CORREOPERSONAL`, `ESTADO`, `FECHAMODIFICACION`, `TIPODEOPERACION`, `USUARIOREGISTRA`) VALUES
	(16, 1, NULL, 83, 1, NULL, 1, 'Juan', 'Fernando', 'Perez', 'del Coral', NULL, 'M', '2000-02-20', '2024-06-16 16:05:56', '12981278-1', '1298-192819-821-2', '129812981', '121892819281', 600.00, 'juan@digitalbox.sv', 'juan@gmail.com', 1, '2024-06-17 17:09:03', 'Actualización', NULL),
	(17, 2, NULL, 82, 2, 1, 1, 'Óscar', '', 'de la Renta', '', NULL, 'M', '1995-12-05', '2024-06-16 15:31:54', '29129817-8', '1092-898732-893-8', '129817287', '219827187211', 25.55, 'oscar@digitalbox.sv', 'oscar@gmail.com', 1, '2024-06-17 17:09:03', 'Actualización', NULL),
	(18, 3, NULL, 59, 2, 1, 2, 'Nohemí', '', 'Sierra', 'Ramírez', 'Fernández', 'F', '1999-06-12', '2024-06-16 15:37:48', 'AJ1272831', '2983-629836-827-7', '238273982', '239283827273', 40.00, 'nohemi@digitalbox.sv', 'nohemi@gmail.com', 1, '2024-06-17 17:09:03', 'Actualización', NULL),
	(19, 4, NULL, 252, 3, 1, 2, 'Lina', 'Marcela', 'Jaramillo', 'Jaramillo', NULL, 'F', '2000-12-02', '2024-06-16 16:05:13', 'AS1982718', '2928-387293-691-8', '121027382', '128172918279', 17.50, 'lina@digitalbox.sv', 'lina@gmail.com', 1, '2024-06-17 17:09:03', 'Actualización', NULL),
	(20, 5, NULL, 257, 4, 1, 1, 'Luis', 'Fernando', 'Robio', 'Jaramillo', NULL, 'M', '1999-08-02', '2024-06-16 16:08:31', '19821987-2', '3283-232873-982-6', '293823981', '102972984092', 25.00, 'luis@digitalbox.sv', 'luis@gmail.com', 1, '2024-06-17 17:09:03', 'Actualización', NULL),
	(21, 1, 2, 83, 1, NULL, 1, 'Juan', 'Fernando', 'Perez', 'del Coral', NULL, 'M', '2000-02-20', '2024-06-16 16:05:56', '12981278-1', '1298-192819-821-2', '129812981', '121892819281', 600.00, 'juan@digitalbox.sv', 'juan@gmail.com', 1, '2024-06-17 17:10:51', 'Actualización', NULL),
	(22, 1, 1, 83, 1, NULL, 1, 'Juan', 'Fernando', 'Perez', 'del Coral', NULL, 'M', '2000-02-20', '2024-06-16 16:05:56', '12981278-1', '1298-192819-821-2', '129812981', '121892819281', 600.00, 'juan@digitalbox.sv', 'juan@gmail.com', 1, '2024-06-17 17:11:27', 'Actualización', NULL),
	(23, 2, 2, 82, 2, 1, 1, 'Óscar', '', 'de la Renta', '', NULL, 'M', '1995-12-05', '2024-06-16 15:31:54', '29129817-8', '1092-898732-893-8', '129817287', '219827187211', 25.55, 'oscar@digitalbox.sv', 'oscar@gmail.com', 1, '2024-06-17 17:11:30', 'Actualización', NULL),
	(24, 3, 3, 59, 2, 1, 2, 'Nohemí', '', 'Sierra', 'Ramírez', 'Fernández', 'F', '1999-06-12', '2024-06-16 15:37:48', 'AJ1272831', '2983-629836-827-7', '238273982', '239283827273', 40.00, 'nohemi@digitalbox.sv', 'nohemi@gmail.com', 1, '2024-06-17 17:11:36', 'Actualización', NULL),
	(25, 4, 4, 252, 3, 1, 2, 'Lina', 'Marcela', 'Jaramillo', 'Jaramillo', NULL, 'F', '2000-12-02', '2024-06-16 16:05:13', 'AS1982718', '2928-387293-691-8', '121027382', '128172918279', 17.50, 'lina@digitalbox.sv', 'lina@gmail.com', 1, '2024-06-17 17:11:39', 'Actualización', NULL),
	(26, 5, 5, 257, 4, 1, 1, 'Luis', 'Fernando', 'Robio', 'Jaramillo', NULL, 'M', '1999-08-02', '2024-06-16 16:08:31', '19821987-2', '3283-232873-982-6', '293823981', '102972984092', 25.00, 'luis@digitalbox.sv', 'luis@gmail.com', 1, '2024-06-17 17:11:45', 'Actualización', NULL),
	(27, 1, 1, 83, 1, NULL, 1, 'Juan', 'Fernando', 'Perez', 'del Coral', NULL, 'M', '2000-02-20', '2024-06-16 16:05:56', '12981278-1', '1298-192819-821-2', '129812981', '121892819281', 9000.00, 'juan@digitalbox.sv', 'juan@gmail.com', 1, '2024-06-17 17:14:55', 'Actualización', NULL),
	(28, 2, 2, 82, 2, 1, 1, 'Óscar', '', 'de la Renta', '', NULL, 'M', '1995-12-05', '2024-06-16 15:31:54', '29129817-8', '1092-898732-893-8', '129817287', '219827187211', 4000.00, 'oscar@digitalbox.sv', 'oscar@gmail.com', 1, '2024-06-17 17:15:02', 'Actualización', NULL),
	(29, 3, 3, 59, 2, 1, 2, 'Nohemí', '', 'Sierra', 'Ramírez', 'Fernández', 'F', '1999-06-12', '2024-06-16 15:37:48', 'AJ1272831', '2983-629836-827-7', '238273982', '239283827273', 7000.00, 'nohemi@digitalbox.sv', 'nohemi@gmail.com', 1, '2024-06-17 17:15:09', 'Actualización', NULL),
	(30, 4, 4, 252, 3, 1, 2, 'Lina', 'Marcela', 'Jaramillo', 'Jaramillo', NULL, 'F', '2000-12-02', '2024-06-16 16:05:13', 'AS1982718', '2928-387293-691-8', '121027382', '128172918279', 3000.00, 'lina@digitalbox.sv', 'lina@gmail.com', 1, '2024-06-17 17:15:17', 'Actualización', NULL),
	(31, 5, 5, 257, 4, 1, 1, 'Luis', 'Fernando', 'Robio', 'Jaramillo', NULL, 'M', '1999-08-02', '2024-06-16 16:08:31', '19821987-2', '3283-232873-982-6', '293823981', '102972984092', 4000.00, 'luis@digitalbox.sv', 'luis@gmail.com', 1, '2024-06-17 17:15:23', 'Actualización', NULL);

-- Volcando estructura para función bad_proyecto.calcularDeducBenef
DROP FUNCTION IF EXISTS `calcularDeducBenef`;
DELIMITER //
CREATE FUNCTION `calcularDeducBenef`(
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
	WHERE e.IDEMPLEADO=idempleadop AND tipo=tipop AND dbe.estado=1 UNION 
	
	SELECT proporcionalalsueldo,montooporcentaje FROM deduccionbeneficioglobal dbg 
	JOIN deduccionbeneficio db ON db.IDDEDUCBENEF=dbg.IDDEDUCBENEF
	WHERE estado=1 AND tipo=tipop AND db.NOMBREDEDUCBENEF!='ISSS' AND db.NOMBREDEDUCBENEF!='AFP';
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
	`empleado_id` INT,
	`fecha_inicio` DATE,
	`fecha_fin` DATE
) RETURNS int
BEGIN
    DECLARE total_horas INT DEFAULT 0;
    DECLARE horas INT;
    DECLARE done INT DEFAULT 0;
    
    DECLARE cursor_horas CURSOR FOR
    SELECT TIMESTAMPDIFF(HOUR, horaingreso, horasalida)
    FROM horasempleado
    WHERE IDEMPLEADO = empleado_id
    AND FECHA BETWEEN fecha_inicio AND fecha_fin;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cursor_horas;

    read_loop: LOOP
        FETCH cursor_horas INTO horas;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Descontar una hora si la jornada incluye la hora entre las 12 y la 1 pm
        IF horas > 0 THEN
            IF EXISTS (
                SELECT 1
                FROM horasempleado
                WHERE IDEMPLEADO = empleado_id
                AND FECHA BETWEEN fecha_inicio AND fecha_fin
                AND horaingreso < '12:00:00' AND horasalida > '13:00:00'
            ) THEN
                SET horas = horas - 1;
            END IF;
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
	`empleado_id` INT,
	`fecha_inicio` DATE,
	`fecha_fin` DATE
) RETURNS int
BEGIN
    DECLARE total_horas INT DEFAULT 0;
    DECLARE horas INT;
    DECLARE done INT DEFAULT 0;
    
    DECLARE cursor_horas CURSOR FOR
    SELECT TIMESTAMPDIFF(HOUR, horaingreso, horasalida)
    FROM horasempleado
    WHERE IDEMPLEADO = empleado_id
    AND FECHA BETWEEN fecha_inicio AND fecha_fin;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cursor_horas;

    read_loop: LOOP
        FETCH cursor_horas INTO horas;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Descontar una hora si la jornada incluye la hora entre las 12 y la 1 pm
        IF horas > 0 THEN
            IF EXISTS (
                SELECT 1
                FROM horasempleado
                WHERE IDEMPLEADO = empleado_id
                AND FECHA BETWEEN fecha_inicio AND fecha_fin
                AND horaingreso < '12:00:00' AND horasalida > '13:00:00'
            ) THEN
                SET horas = horas - 1;
            END IF;
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

-- Volcando estructura para función bad_proyecto.calcularISSS
DROP FUNCTION IF EXISTS `calcularISSS`;
DELIMITER //
CREATE FUNCTION `calcularISSS`(
	`salario` DECIMAL
) RETURNS decimal(10,2)
BEGIN
	DECLARE descuentomonto DECIMAL(10,2);
	set descuentomonto=salario*(SELECT montooporcentaje/100 FROM deduccionbeneficioglobal dbg JOIN deduccionbeneficio db ON db.IDDEDUCBENEF=dbg.IDDEDUCBENEF WHERE db.NOMBREDEDUCBENEF='ISSS');
	if descuentomonto>30 then
		set descuentomonto=30;
	END if;
	RETURN descuentomonto;
END//
DELIMITER ;

-- Volcando estructura para función bad_proyecto.calcularRenta
DROP FUNCTION IF EXISTS `calcularRenta`;
DELIMITER //
CREATE FUNCTION `calcularRenta`(
	`salario` DECIMAL,
	`mensual` int
) RETURNS decimal(10,2)
BEGIN
	DECLARE renta DECIMAL(10,2);
    IF salario >= (0.01) AND salario <= (472.00/mensual) THEN
    SET renta = 0;
	ELSEIF salario >= (472.01/mensual) AND salario <= (895.24/mensual) THEN
   	SET renta=(salario-(472.00/mensual))*0.1+(17.67/mensual);
   	
   ELSEIF salario>=(895.25/mensual) AND salario<=(2038.10/mensual) then
   	SET renta=(salario-(895.24/mensual))*0.2+(60.00/mensual);
   	
   ELSEIF salario>=(2038.11/mensual) then
   	SET renta=(salario-(2038.10/mensual))*0.3+(288.57/mensual);
   END if;
   RETURN renta;
END//
DELIMITER ;

-- Volcando estructura para función bad_proyecto.calcular_descuento
DROP FUNCTION IF EXISTS `calcular_descuento`;
DELIMITER //
CREATE FUNCTION `calcular_descuento`(
	`idEmpleadop` INT,
	`fechaIniciop` DATE,
	`fechaFinp` DATE
) RETURNS decimal(10,2)
BEGIN
    DECLARE salariop DECIMAL(10,2);
    DECLARE total_descuento DECIMAL(10,2) DEFAULT 0;
    DECLARE dia DATE;
    DECLARE done INT;
    DECLARE horas_trabajadas DECIMAL(10,2);
    DECLARE horas_faltantes DECIMAL(10,2);
    DECLARE dias_faltados INT DEFAULT 0;
    DECLARE fecha_cursor CURSOR FOR
        SELECT DATE_ADD(fechaIniciop, INTERVAL n DAY)
        FROM (SELECT @row := @row + 1 AS n FROM (SELECT 0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
             (SELECT 0 UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
             (SELECT @row := -1) r
        ) b
        WHERE DATE_ADD(fechaIniciop, INTERVAL n DAY) <= fechaFinp;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Obtener salario del empleado
    SELECT salario INTO salariop FROM empleado WHERE idempleado = idEmpleadop;

    OPEN fecha_cursor;

    read_loop: LOOP
        FETCH fecha_cursor INTO dia;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        

        -- Verificar si es sábado, domingo o festivo
        IF DAYOFWEEK(dia) = 7 OR DAYOFWEEK(dia) = 1 OR EXISTS (SELECT 1 FROM diafestivo WHERE fecha = dia) THEN
            ITERATE read_loop;
        END IF;

        -- Verificar si el empleado tiene permiso o vacaciones en esa fecha     
        IF EXISTS (SELECT 1 FROM perlic_empleado WHERE idempleado = idEmpleadop AND aprobada=1 and descontable=0 and dia BETWEEN fechainicio AND fechafin)OR
           EXISTS (SELECT 1 FROM vacacion WHERE idempleado = idEmpleadop AND dia BETWEEN fechainicio AND DATE_ADD(fechainicio, INTERVAL 14 DAY))  THEN
				ITERATE read_loop;
        END IF;
        
        -- Verificar horas trabajadas
        SELECT COALESCE(SUM(TIMESTAMPDIFF(HOUR, horaingreso, horasalida)), 0) INTO horas_trabajadas
        FROM horasempleado
        WHERE idempleado = idEmpleadop AND fecha = dia;

        -- Calcular horas faltantes
        IF horas_trabajadas < 9 and EXISTS (SELECT 1 FROM horasempleado WHERE idempleado=idempleadop AND fecha=dia) THEN
            SET horas_faltantes = 9 - horas_trabajadas;
            SET total_descuento = total_descuento + ((salariop / 30 / 8) * horas_faltantes);
        END IF;

        -- Verificar si el empleado no marcó ese día
        IF horas_trabajadas = 0 THEN
            SET dias_faltados = dias_faltados + 1;
        END IF;
        
			
    END LOOP;

    CLOSE fecha_cursor;

    -- Calcular descuento por días faltados
    SET total_descuento = total_descuento + (salariop / 30) * dias_faltados;

    RETURN total_descuento;
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
	(0, 'DigitalBoxSV', 'Avenida Las Magnolias #456, Colonia San Benito, San Salvador, El Salvador', 'Edgar Fernando Edgar Fernando', '1982-918302-898-2', '1271223', '2192-8178', 'https://digitalboxsv.com', 'digitalbox@gmail.com');

-- Volcando estructura para tabla bad_proyecto.deduccionbeneficio
DROP TABLE IF EXISTS `deduccionbeneficio`;
CREATE TABLE IF NOT EXISTS `deduccionbeneficio` (
  `IDDEDUCBENEF` int NOT NULL AUTO_INCREMENT,
  `NOMBREDEDUCBENEF` varchar(75) NOT NULL,
  `TIPO` enum('D','B') NOT NULL,
  PRIMARY KEY (`IDDEDUCBENEF`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.deduccionbeneficio: ~8 rows (aproximadamente)
DELETE FROM `deduccionbeneficio`;
INSERT INTO `deduccionbeneficio` (`IDDEDUCBENEF`, `NOMBREDEDUCBENEF`, `TIPO`) VALUES
	(1, 'ISSS', 'D'),
	(2, 'AFP', 'D'),
	(3, 'Créditos personales', 'D'),
	(4, 'Créditos hipótecarios', 'D'),
	(5, 'Ahorros personales', 'D'),
	(6, 'Cuota alimenticia', 'D'),
	(7, 'Cuota de procuraduría', 'D'),
	(8, 'Bono', 'B');

-- Volcando estructura para tabla bad_proyecto.deduccionbeneficioglobal
DROP TABLE IF EXISTS `deduccionbeneficioglobal`;
CREATE TABLE IF NOT EXISTS `deduccionbeneficioglobal` (
  `IDDEDUCBENEF` int NOT NULL AUTO_INCREMENT,
  `PROPORCIONALALSUELDO` tinyint(1) NOT NULL,
  `MONTOOPORCENTAJE` decimal(10,2) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IDDEDUCBENEF`) USING BTREE,
  CONSTRAINT `FK_REFERENCE_23` FOREIGN KEY (`IDDEDUCBENEF`) REFERENCES `deduccionbeneficio` (`IDDEDUCBENEF`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.deduccionbeneficioglobal: ~2 rows (aproximadamente)
DELETE FROM `deduccionbeneficioglobal`;
INSERT INTO `deduccionbeneficioglobal` (`IDDEDUCBENEF`, `PROPORCIONALALSUELDO`, `MONTOOPORCENTAJE`, `ESTADO`) VALUES
	(1, 1, 3.00, 1),
	(2, 1, 7.25, 1);

-- Volcando estructura para tabla bad_proyecto.deduccionbeneficio_empleado
DROP TABLE IF EXISTS `deduccionbeneficio_empleado`;
CREATE TABLE IF NOT EXISTS `deduccionbeneficio_empleado` (
  `IDDEDUCBENEF_EMP` int NOT NULL AUTO_INCREMENT,
  `IDEMPLEADO` int DEFAULT NULL,
  `IDDEDUCBENEF` int DEFAULT NULL,
  `PROPORCIONALALSUELDO` tinyint(1) NOT NULL,
  `MONTOOPORCENTAJE` decimal(10,2) NOT NULL,
  `ESTADO` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`IDDEDUCBENEF_EMP`) USING BTREE,
  KEY `FK_REFERENCE_21` (`IDEMPLEADO`),
  KEY `FK_REFERENCE_22` (`IDDEDUCBENEF`),
  CONSTRAINT `FK_REFERENCE_21` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REFERENCE_22` FOREIGN KEY (`IDDEDUCBENEF`) REFERENCES `deduccionbeneficio` (`IDDEDUCBENEF`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.deduccionbeneficio_empleado: ~2 rows (aproximadamente)
DELETE FROM `deduccionbeneficio_empleado`;
INSERT INTO `deduccionbeneficio_empleado` (`IDDEDUCBENEF_EMP`, `IDEMPLEADO`, `IDDEDUCBENEF`, `PROPORCIONALALSUELDO`, `MONTOOPORCENTAJE`, `ESTADO`) VALUES
	(1, 1, 3, 1, 3.00, 1),
	(3, 1, 8, 0, 50.50, 1);

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

-- Volcando estructura para tabla bad_proyecto.diafestivo
DROP TABLE IF EXISTS `diafestivo`;
CREATE TABLE IF NOT EXISTS `diafestivo` (
  `IDDIAFESTIVO` int NOT NULL AUTO_INCREMENT,
  `NOMBREDIAFESTIVO` varchar(50) NOT NULL,
  `FECHA` date NOT NULL,
  PRIMARY KEY (`IDDIAFESTIVO`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.diafestivo: ~11 rows (aproximadamente)
DELETE FROM `diafestivo`;
INSERT INTO `diafestivo` (`IDDIAFESTIVO`, `NOMBREDIAFESTIVO`, `FECHA`) VALUES
	(1, 'Año Nuevo', '2024-01-01'),
	(2, 'Semana Santa - Jueves Santo', '2024-03-28'),
	(3, 'Semana Santa - Viernes Santo', '2024-03-29'),
	(4, 'Semana Santa - Sábado Santo', '2024-03-30'),
	(5, 'Día del Trabajo', '2024-05-01'),
	(6, 'Día de la Madre', '2024-05-10'),
	(7, 'Día del Padre', '2024-06-17'),
	(8, 'Día del Salvador del Mundo', '2024-08-06'),
	(9, 'Día de la Independencia', '2024-09-15'),
	(10, 'Día de Muertos', '2024-11-02'),
	(11, 'Navidad', '2024-12-25');

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
  `FECHAINGRESO` datetime DEFAULT (curdate()),
  `NUMERODOC` varchar(20) NOT NULL,
  `NIT` varchar(25) DEFAULT NULL,
  `ISSS` varchar(25) NOT NULL,
  `NUP` varchar(25) DEFAULT NULL,
  `SALARIO` decimal(10,2) NOT NULL,
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

-- Volcando datos para la tabla bad_proyecto.empleado: ~5 rows (aproximadamente)
DELETE FROM `empleado`;
INSERT INTO `empleado` (`IDEMPLEADO`, `IDPUESTO`, `IDMUNICIPIO`, `IDESTADOCIVIL`, `EMP_IDEMPLEADO`, `IDTIPODOC`, `NOMBRE1`, `NOMBRE2`, `APELLIDO1`, `APELLIDO2`, `APELLIDOCASADA`, `SEXO`, `FECHANACIMIENTO`, `FECHAINGRESO`, `NUMERODOC`, `NIT`, `ISSS`, `NUP`, `SALARIO`, `CORREOINSTITUCIONAL`, `CORREOPERSONAL`, `ESTADO`) VALUES
	(1, 1, 83, 1, NULL, 1, 'Juan', 'Fernando', 'Perez', 'del Coral', NULL, 'M', '2000-02-20', '2024-06-16 16:05:56', '12981278-1', '1298-192819-821-2', '129812981', '121892819281', 9000.00, 'juan@digitalbox.sv', 'juan@gmail.com', 1),
	(2, 2, 82, 2, 1, 1, 'Óscar', '', 'de la Renta', '', NULL, 'M', '1995-12-05', '2024-06-16 15:31:54', '29129817-8', '1092-898732-893-8', '129817287', '219827187211', 4000.00, 'oscar@digitalbox.sv', 'oscar@gmail.com', 1),
	(3, 3, 59, 2, 1, 2, 'Nohemí', '', 'Sierra', 'Ramírez', 'Fernández', 'F', '1999-06-12', '2024-06-16 15:37:48', 'AJ1272831', '2983-629836-827-7', '238273982', '239283827273', 7000.00, 'nohemi@digitalbox.sv', 'nohemi@gmail.com', 1),
	(4, 4, 252, 3, 1, 2, 'Lina', 'Marcela', 'Jaramillo', 'Jaramillo', NULL, 'F', '2000-12-02', '2024-06-16 16:05:13', 'AS1982718', '2928-387293-691-8', '121027382', '128172918279', 3000.00, 'lina@digitalbox.sv', 'lina@gmail.com', 1),
	(5, 5, 257, 4, 1, 1, 'Luis', 'Fernando', 'Robio', 'Jaramillo', NULL, 'M', '1999-08-02', '2024-06-16 16:08:31', '19821987-2', '3283-232873-982-6', '293823981', '102972984092', 4000.00, 'luis@digitalbox.sv', 'luis@gmail.com', 1);

-- Volcando estructura para tabla bad_proyecto.estadocivil
DROP TABLE IF EXISTS `estadocivil`;
CREATE TABLE IF NOT EXISTS `estadocivil` (
  `IDESTADOCIVIL` int NOT NULL AUTO_INCREMENT,
  `NOMBREESTADO` varchar(20) NOT NULL,
  PRIMARY KEY (`IDESTADOCIVIL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.estadocivil: ~4 rows (aproximadamente)
DELETE FROM `estadocivil`;
INSERT INTO `estadocivil` (`IDESTADOCIVIL`, `NOMBREESTADO`) VALUES
	(1, 'Soltero'),
	(2, 'Casado'),
	(3, 'Viudo'),
	(4, 'Divorciado');

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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.horasempleado: ~101 rows (aproximadamente)
DELETE FROM `horasempleado`;
INSERT INTO `horasempleado` (`IDHORASEMPLEADO`, `IDEMPLEADO`, `FECHA`, `HORAINGRESO`, `HORASALIDA`) VALUES
	(17, 1, NULL, '08:00:00', '17:00:00'),
	(18, 1, '2024-05-17', '08:00:00', '15:00:00'),
	(21, 1, '2024-05-20', '08:00:00', '17:00:00'),
	(22, 1, '2024-05-21', '08:00:00', '17:00:00'),
	(23, 1, '2024-05-22', '08:00:00', '17:00:00'),
	(24, 1, '2024-05-23', '08:00:00', '17:00:00'),
	(25, 1, '2024-05-24', '08:00:00', '17:00:00'),
	(28, 1, '2024-05-27', '08:00:00', '18:00:00'),
	(29, 1, '2024-05-28', '08:00:00', '17:00:00'),
	(33, 2, '2024-05-01', '08:00:00', '17:00:00'),
	(34, 2, '2024-05-02', '08:00:00', '17:00:00'),
	(35, 2, '2024-05-03', '08:00:00', '17:00:00'),
	(38, 2, '2024-05-06', '08:00:00', '17:00:00'),
	(39, 2, '2024-05-07', '08:00:00', '17:00:00'),
	(40, 2, '2024-05-08', '08:00:00', '17:00:00'),
	(41, 2, '2024-05-09', '08:00:00', '17:00:00'),
	(42, 2, '2024-05-10', '08:00:00', '17:00:00'),
	(45, 2, '2024-05-13', '08:00:00', '17:00:00'),
	(46, 2, '2024-05-14', '08:00:00', '17:00:00'),
	(47, 2, '2024-05-15', '08:00:00', '17:00:00'),
	(48, 2, '2024-05-16', '08:00:00', '17:00:00'),
	(49, 2, '2024-05-17', '08:00:00', '17:00:00'),
	(52, 2, '2024-05-20', '08:00:00', '17:00:00'),
	(53, 2, '2024-05-21', '08:00:00', '17:00:00'),
	(54, 2, '2024-05-22', '08:00:00', '18:00:00'),
	(55, 2, '2024-05-23', '08:00:00', '17:00:00'),
	(56, 2, '2024-05-24', '08:00:00', '17:00:00'),
	(59, 2, '2024-05-27', '08:00:00', '17:00:00'),
	(60, 2, '2024-05-28', '08:00:00', '17:00:00'),
	(61, 2, '2024-05-29', '08:00:00', '17:00:00'),
	(62, 2, '2024-05-30', '08:00:00', '16:00:00'),
	(63, 2, '2024-05-31', '08:00:00', '17:00:00'),
	(64, 3, '2024-05-01', '08:00:00', '17:00:00'),
	(65, 3, '2024-05-02', '08:00:00', '17:00:00'),
	(66, 3, '2024-05-03', '08:00:00', '17:00:00'),
	(69, 3, '2024-05-06', '08:00:00', '17:00:00'),
	(70, 3, '2024-05-07', '08:00:00', '17:00:00'),
	(71, 3, '2024-05-08', '08:00:00', '17:00:00'),
	(72, 3, '2024-05-09', '08:00:00', '17:00:00'),
	(73, 3, '2024-05-10', '08:00:00', '17:00:00'),
	(76, 3, '2024-05-13', '08:00:00', '17:00:00'),
	(77, 3, '2024-05-14', '08:00:00', '18:00:00'),
	(78, 3, '2024-05-15', '08:00:00', '17:00:00'),
	(79, 3, '2024-05-16', '08:00:00', '17:00:00'),
	(80, 3, '2024-05-17', '08:00:00', '17:00:00'),
	(83, 3, '2024-05-20', '08:00:00', '17:00:00'),
	(84, 3, '2024-05-21', '08:00:00', '17:00:00'),
	(85, 3, '2024-05-22', '08:00:00', '17:00:00'),
	(86, 3, '2024-05-23', '08:00:00', '17:00:00'),
	(87, 3, '2024-05-24', '08:00:00', '17:00:00'),
	(90, 3, '2024-05-27', '08:00:00', '17:00:00'),
	(91, 3, '2024-05-28', '08:00:00', '17:00:00'),
	(92, 3, '2024-05-29', '08:00:00', '17:00:00'),
	(93, 3, '2024-05-30', '08:00:00', '17:00:00'),
	(94, 3, '2024-05-31', '08:00:00', '17:00:00'),
	(95, 4, '2024-05-01', '08:00:00', '17:00:00'),
	(96, 4, '2024-05-02', '08:00:00', '17:00:00'),
	(97, 4, '2024-05-03', '08:00:00', '17:00:00'),
	(100, 4, '2024-05-06', '08:00:00', '17:00:00'),
	(101, 4, '2024-05-07', '08:00:00', '17:00:00'),
	(102, 4, '2024-05-08', '08:00:00', '17:00:00'),
	(103, 4, '2024-05-09', '08:00:00', '17:00:00'),
	(104, 4, '2024-05-10', '08:00:00', '17:00:00'),
	(107, 4, '2024-05-13', '08:00:00', '17:00:00'),
	(108, 4, '2024-05-14', '08:00:00', '17:00:00'),
	(109, 4, '2024-05-15', '08:00:00', '17:00:00'),
	(110, 4, '2024-05-16', '08:00:00', '17:00:00'),
	(111, 4, '2024-05-17', '08:00:00', '17:00:00'),
	(114, 4, '2024-05-20', '08:00:00', '17:00:00'),
	(115, 4, '2024-05-21', '08:00:00', '17:00:00'),
	(116, 4, '2024-05-22', '08:00:00', '17:00:00'),
	(117, 4, '2024-05-23', '08:00:00', '17:00:00'),
	(118, 4, '2024-05-24', '08:00:00', '17:00:00'),
	(121, 4, '2024-05-27', '08:00:00', '17:00:00'),
	(122, 4, '2024-05-28', '08:00:00', '17:00:00'),
	(123, 4, '2024-05-29', '08:00:00', '18:00:00'),
	(124, 4, '2024-05-30', '08:00:00', '17:00:00'),
	(125, 4, '2024-05-31', '08:00:00', '17:00:00'),
	(126, 5, '2024-05-01', '08:00:00', '17:00:00'),
	(127, 5, '2024-05-02', '08:00:00', '17:00:00'),
	(128, 5, '2024-05-03', '08:00:00', '17:00:00'),
	(131, 5, '2024-05-06', '08:00:00', '17:00:00'),
	(132, 5, '2024-05-07', '08:00:00', '17:00:00'),
	(133, 5, '2024-05-08', '08:00:00', '17:00:00'),
	(134, 5, '2024-05-09', '08:00:00', '17:00:00'),
	(135, 5, '2024-05-10', '08:00:00', '17:00:00'),
	(138, 5, '2024-05-13', '08:00:00', '17:00:00'),
	(139, 5, '2024-05-14', '08:00:00', '17:00:00'),
	(140, 5, '2024-05-15', '08:00:00', '17:00:00'),
	(141, 5, '2024-05-16', '08:00:00', '18:00:00'),
	(142, 5, '2024-05-17', '08:00:00', '17:00:00'),
	(145, 5, '2024-05-20', '08:00:00', '17:00:00'),
	(146, 5, '2024-05-21', '08:00:00', '19:00:00'),
	(147, 5, '2024-05-22', '08:00:00', '17:00:00'),
	(148, 5, '2024-05-23', '08:00:00', '17:00:00'),
	(149, 5, '2024-05-24', '08:00:00', '17:00:00'),
	(152, 5, '2024-05-27', '08:00:00', '17:00:00'),
	(153, 5, '2024-05-28', '08:00:00', '17:00:00'),
	(154, 5, '2024-05-29', '08:00:00', '17:00:00'),
	(155, 5, '2024-05-30', '08:00:00', '17:00:00'),
	(156, 5, '2024-05-31', '08:00:00', '17:00:00');

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

-- Volcando estructura para función bad_proyecto.obtenerAFP
DROP FUNCTION IF EXISTS `obtenerAFP`;
DELIMITER //
CREATE FUNCTION `obtenerAFP`() RETURNS decimal(10,4)
BEGIN
	DECLARE afp DECIMAL(10,4);
	set afp=(SELECT montooporcentaje/100 FROM deduccionbeneficioglobal dbg JOIN deduccionbeneficio db ON db.IDDEDUCBENEF=dbg.IDDEDUCBENEF WHERE db.NOMBREDEDUCBENEF='AFP' );
	RETURN afp;
END//
DELIMITER ;

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

-- Volcando datos para la tabla bad_proyecto.perlic_empleado: ~1 rows (aproximadamente)
DELETE FROM `perlic_empleado`;
INSERT INTO `perlic_empleado` (`IDPERLIC_EMP`, `IDEMPLEADO`, `IDPERMISOLICENCIA`, `APROBADA`, `DESCONTABLE`, `FECHAINICIO`, `FECHAFIN`, `DIRECCIONARCHIVO`) VALUES
	(1, 1, 8, 1, 0, '2024-05-29', '2024-05-31', NULL);

-- Volcando estructura para tabla bad_proyecto.permiso
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE IF NOT EXISTS `permiso` (
  `IDPERMISO` int NOT NULL AUTO_INCREMENT,
  `NOMBREPERMISO` varchar(100) NOT NULL,
  PRIMARY KEY (`IDPERMISO`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.permiso: ~46 rows (aproximadamente)
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
	(44, 'ROLE_Agregar_deducciones_y_beneficios_de_empleados'),
	(45, 'ROLE_Agregar_presupuesto_de_unidades'),
	(46, 'ROLE_Autorizar_nuevos_usuarios');

-- Volcando estructura para tabla bad_proyecto.permisolicencia
DROP TABLE IF EXISTS `permisolicencia`;
CREATE TABLE IF NOT EXISTS `permisolicencia` (
  `IDPERMISOLICENCIA` int NOT NULL AUTO_INCREMENT,
  `TIPO` enum('P','L') NOT NULL,
  `CAUSA` varchar(75) NOT NULL,
  PRIMARY KEY (`IDPERMISOLICENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.permisolicencia: ~8 rows (aproximadamente)
DELETE FROM `permisolicencia`;
INSERT INTO `permisolicencia` (`IDPERMISOLICENCIA`, `TIPO`, `CAUSA`) VALUES
	(1, 'P', 'Enfermedad'),
	(2, 'P', 'Maternidad'),
	(3, 'P', 'Paternidad'),
	(4, 'P', 'Enfermedad de familiar'),
	(5, 'P', 'Duelo'),
	(6, 'P', 'Tiempo compensatorio'),
	(7, 'P', 'Permiso oficial'),
	(8, 'P', 'Particular');

-- Volcando estructura para procedimiento bad_proyecto.planilla
DROP PROCEDURE IF EXISTS `planilla`;
DELIMITER //
CREATE PROCEDURE `planilla`(
	IN `fecha1` DATE,
	IN `fecha2` DATE
)
BEGIN
	DECLARE mensual INT DEFAULT 1;
	if DATEDIFF(fecha2, fecha1)<=15 then set mensual=2; END if;
	SELECT
	numerodoc,
	 TRIM(CONCAT_WS(' ',
	        nombre1,
	        nombre2,
	        apellido1,
	        IF(apellidocasada IS NOT NULL AND apellidocasada != '', CONCAT('de ', apellidocasada), apellido2)
	    )) AS Nombre,
	p.nombrepuesto as cargo,
	salario AS salariobase,
	calcular_descuento(idempleado,fecha1,fecha2) AS faltas,
	salario-calcular_descuento(idempleado,fecha1,fecha2) AS "salario-faltas",
	verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3 as vacaciones,
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2 AS "horas_extra",
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B") AS otrosbeneficios,
	(
	verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B")
	) AS totalbeneficios,
	((salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))) AS "salario-faltas+beneficios",
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	) AS isss,
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP() AS afp,
	calcularRenta(
	-- salario - faltas + beneficios
	((salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B")))-
	-- isss
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)-
	-- afp
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP()
	,mensual) AS renta,
	calcularDeducBenef(
	-- salario
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	),idempleado,"D") AS "otrasdeducciones",
	(
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	) +
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP() +
	calcularRenta(
	-- salario - faltas + beneficios
	((salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B")))-
	-- isss
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)-
	-- afp
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP()
	,mensual) +
	calcularDeducBenef(
	-- salario
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	),idempleado,"D")
	) AS totaldeducciones,
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)-
	(
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	) +
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP() +
	calcularRenta(
	-- salario - faltas + beneficios
	((salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B")))-
	-- isss
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)-
	-- afp
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP()
	,mensual) +
	calcularDeducBenef(
	-- salario
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	),idempleado,"D")
	) AS salarioneto
	FROM empleado e JOIN puesto p ON e.idpuesto=p.idpuesto
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
	DECLARE mensual INT DEFAULT 1;
	if DATEDIFF(fecha2, fecha1)<=15 then set mensual=2; END if;
	SELECT
	numerodoc,
	 TRIM(CONCAT_WS(' ',
	        nombre1,
	        nombre2,
	        apellido1,
	        IF(apellidocasada IS NOT NULL AND apellidocasada != '', CONCAT('de ', apellidocasada), apellido2)
	    )) AS Nombre,
	p.nombrepuesto as cargo,
	salario AS salariobase,
	calcular_descuento(idempleado,fecha1,fecha2) AS faltas,
	salario-calcular_descuento(idempleado,fecha1,fecha2) AS "salario-faltas",
	verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3 as vacaciones,
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2 AS "horas_extra",
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B") AS otrosbeneficios,
	(
	verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B")
	) AS totalbeneficios,
	((salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))) AS "salario-faltas+beneficios",
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	) AS isss,
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP() AS afp,
	calcularRenta(
	-- salario - faltas + beneficios
	((salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B")))-
	-- isss
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)-
	-- afp
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP()
	,mensual) AS renta,
	calcularDeducBenef(
	-- salario
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	),idempleado,"D") AS "otrasdeducciones",
	(
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	) +
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP() +
	calcularRenta(
	-- salario - faltas + beneficios
	((salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B")))-
	-- isss
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)-
	-- afp
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP()
	,mensual) +
	calcularDeducBenef(
	-- salario
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	),idempleado,"D")
	) AS totaldeducciones,
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)-
	(
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	) +
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP() +
	calcularRenta(
	-- salario - faltas + beneficios
	((salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B")))-
	-- isss
	calcularISSS(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)-
	-- afp
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	)*obtenerAFP()
	,mensual) +
	calcularDeducBenef(
	-- salario
	(
	(salario-calcular_descuento(idempleado,fecha1,fecha2))+
	(verificarVacacion(idempleado,fecha1,fecha2)*(salario/2)*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*(salario/30/8)*2+
	calcularDeducBenef((salario-calcular_descuento(idempleado,fecha1,fecha2)),idempleado,"B"))
	),idempleado,"D")
	) AS salarioneto
	FROM empleado e JOIN puesto p ON e.idpuesto=p.idpuesto
	WHERE e.idempleado=idempleadop;
	END//
DELIMITER ;

-- Volcando estructura para tabla bad_proyecto.presupuestoanual
DROP TABLE IF EXISTS `presupuestoanual`;
CREATE TABLE IF NOT EXISTS `presupuestoanual` (
  `IDPRESUPUESTO` int NOT NULL AUTO_INCREMENT,
  `IDUNIDAD` int DEFAULT NULL,
  `ANO` int NOT NULL,
  `MONTO` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IDPRESUPUESTO`),
  KEY `FK_REFERENCE_16` (`IDUNIDAD`),
  CONSTRAINT `FK_REFERENCE_16` FOREIGN KEY (`IDUNIDAD`) REFERENCES `unidad` (`IDUNIDAD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.presupuestoanual: ~32 rows (aproximadamente)
DELETE FROM `presupuestoanual`;
INSERT INTO `presupuestoanual` (`IDPRESUPUESTO`, `IDUNIDAD`, `ANO`, `MONTO`) VALUES
	(1, 1, 2022, 1200000.00),
	(2, 1, 2023, 1250000.00),
	(3, 2, 2022, 1000000.00),
	(4, 2, 2023, 1050000.00),
	(5, 3, 2022, 950000.00),
	(6, 3, 2023, 1000000.00),
	(7, 4, 2022, 1100000.00),
	(8, 4, 2023, 1150000.00),
	(9, 5, 2022, 900000.00),
	(10, 5, 2023, 950000.00),
	(11, 6, 2022, 850000.00),
	(12, 6, 2023, 900000.00),
	(13, 7, 2022, 870000.00),
	(14, 7, 2023, 920000.00),
	(15, 8, 2022, 880000.00),
	(16, 8, 2023, 930000.00),
	(17, 9, 2022, 860000.00),
	(18, 9, 2023, 910000.00),
	(19, 10, 2022, 870000.00),
	(20, 10, 2023, 920000.00),
	(21, 11, 2022, 820000.00),
	(22, 11, 2023, 850000.00),
	(23, 12, 2022, 830000.00),
	(24, 12, 2023, 860000.00),
	(25, 13, 2022, 810000.00),
	(26, 13, 2023, 840000.00),
	(27, 14, 2022, 820000.00),
	(28, 14, 2023, 850000.00),
	(29, 15, 2022, 800000.00),
	(30, 15, 2023, 830000.00),
	(31, 1, 2024, 1100000.00),
	(32, 2, 2024, 1100000.00);

-- Volcando estructura para tabla bad_proyecto.profesionoficio
DROP TABLE IF EXISTS `profesionoficio`;
CREATE TABLE IF NOT EXISTS `profesionoficio` (
  `IDPROFOFC` int NOT NULL AUTO_INCREMENT,
  `NOMBREPROFOFC` varchar(50) NOT NULL,
  PRIMARY KEY (`IDPROFOFC`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.profesionoficio: ~28 rows (aproximadamente)
DELETE FROM `profesionoficio`;
INSERT INTO `profesionoficio` (`IDPROFOFC`, `NOMBREPROFOFC`) VALUES
	(1, 'Carpintero'),
	(2, 'Electricista'),
	(3, 'Plomero'),
	(4, 'Mecánico'),
	(5, 'Albañil'),
	(6, 'Panadero'),
	(7, 'Cocinero'),
	(8, 'Jardinero'),
	(9, 'Fontanero'),
	(10, 'Pintor'),
	(11, 'Sastre'),
	(12, 'Soldador'),
	(13, 'Cerrajero'),
	(14, 'Herrería'),
	(15, 'Barbero'),
	(16, 'Peluquero'),
	(18, 'Zapatero'),
	(19, 'Contador'),
	(20, 'Programador'),
	(21, 'Ingeniero Civil'),
	(22, 'Médico'),
	(23, 'Abogado'),
	(24, 'Arquitecto'),
	(25, 'Psicólogo'),
	(26, 'Profesor'),
	(27, 'Contador Público'),
	(28, 'Enfermero'),
	(29, 'Economista');

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

-- Volcando datos para la tabla bad_proyecto.profofc_empleado: ~6 rows (aproximadamente)
DELETE FROM `profofc_empleado`;
INSERT INTO `profofc_empleado` (`IDPROFOFC`, `IDEMPLEADO`) VALUES
	(19, 1),
	(20, 1),
	(19, 2),
	(29, 3),
	(27, 4),
	(26, 5);

-- Volcando estructura para tabla bad_proyecto.puesto
DROP TABLE IF EXISTS `puesto`;
CREATE TABLE IF NOT EXISTS `puesto` (
  `IDPUESTO` int NOT NULL AUTO_INCREMENT,
  `IDUNIDAD` int DEFAULT NULL,
  `NOMBREPUESTO` varchar(50) NOT NULL,
  `SALARIOMIN` decimal(10,2) NOT NULL,
  `SALARIOMAX` decimal(10,2) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IDPUESTO`),
  KEY `FK_PERTENECE_A_UNIDAD` (`IDUNIDAD`),
  CONSTRAINT `FK_PERTENECE_A_UNIDAD` FOREIGN KEY (`IDUNIDAD`) REFERENCES `unidad` (`IDUNIDAD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.puesto: ~35 rows (aproximadamente)
DELETE FROM `puesto`;
INSERT INTO `puesto` (`IDPUESTO`, `IDUNIDAD`, `NOMBREPUESTO`, `SALARIOMIN`, `SALARIOMAX`, `ESTADO`) VALUES
	(1, 1, 'Gerente General', 8000.00, 10000.00, 1),
	(2, 1, 'Asistente de Gerencia', 3500.00, 5200.00, 1),
	(3, 2, 'Gerente Comercial', 6100.00, 8000.00, 1),
	(4, 2, 'Asesor de Ventas', 2600.00, 4300.00, 1),
	(5, 2, 'Ejecutivo de Cuentas', 3500.00, 5200.00, 1),
	(6, 5, 'Jefe de Ventas', 4300.00, 6100.00, 1),
	(7, 5, 'Vendedor', 1700.00, 3100.00, 1),
	(8, 5, 'Promotor de Ventas', 1400.00, 2600.00, 1),
	(9, 6, 'Director de Publicidad', 5200.00, 6900.00, 1),
	(10, 6, 'Diseñador Gráfico', 2100.00, 3500.00, 1),
	(11, 6, 'Especialista en Marketing', 2600.00, 4300.00, 1),
	(12, 3, 'Gerente Financiero', 6100.00, 8000.00, 1),
	(13, 3, 'Contador', 3100.00, 4800.00, 1),
	(14, 3, 'Analista Financiero', 3500.00, 5200.00, 1),
	(15, 7, 'Jefe de Contaduría', 4300.00, 6100.00, 1),
	(16, 7, 'Auxiliar Contable', 1400.00, 2600.00, 1),
	(17, 7, 'Técnico en Contabilidad', 1700.00, 3100.00, 1),
	(18, 4, 'Gerente de Producción', 6100.00, 8000.00, 1),
	(19, 4, 'Supervisor de Producción', 3500.00, 5200.00, 1),
	(20, 4, 'Operador de Máquina', 2100.00, 3500.00, 1),
	(21, 9, 'Jefe de Montaje', 4300.00, 6100.00, 1),
	(22, 9, 'Técnico de Montaje', 2600.00, 4300.00, 1),
	(23, 9, 'Ayudante de Montaje', 1400.00, 2600.00, 1),
	(24, 10, 'Jefe de Ensamblaje', 4300.00, 6100.00, 1),
	(25, 10, 'Técnico de Ensamblaje', 2600.00, 4300.00, 1),
	(26, 10, 'Ayudante de Ensamblaje', 1400.00, 2600.00, 1),
	(27, 8, 'Jefe de Tesorería', 4300.00, 6100.00, 1),
	(28, 8, 'Tesorero', 3100.00, 4800.00, 1),
	(29, 8, 'Auxiliar de Tesorería', 1700.00, 3100.00, 1),
	(30, 11, 'Coordinador de Ventas Norte', 3500.00, 5200.00, 1),
	(31, 11, 'Representante de Ventas Norte', 2100.00, 3500.00, 1),
	(32, 12, 'Coordinador de Ventas Sur', 3500.00, 5200.00, 1),
	(33, 12, 'Representante de Ventas Sur', 2100.00, 3500.00, 1),
	(34, 13, 'Coordinador de Contabilidad General', 3500.00, 5200.00, 1),
	(35, 13, 'Contador General', 2600.00, 4300.00, 1);

-- Volcando estructura para tabla bad_proyecto.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `IDROL` int NOT NULL AUTO_INCREMENT,
  `NOMBREROL` varchar(25) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IDROL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.rol: ~4 rows (aproximadamente)
DELETE FROM `rol`;
INSERT INTO `rol` (`IDROL`, `NOMBREROL`, `ESTADO`) VALUES
	(1, 'Sin permisos', 1),
	(2, 'Admin', 1),
	(3, 'Usuario', 1),
	(4, 'Super admin', 1);

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

-- Volcando datos para la tabla bad_proyecto.rol_permiso: ~135 rows (aproximadamente)
DELETE FROM `rol_permiso`;
INSERT INTO `rol_permiso` (`IDPERMISO`, `IDROL`) VALUES
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
	(43, 2),
	(44, 2),
	(45, 2),
	(1, 3),
	(2, 3),
	(3, 3),
	(4, 3),
	(5, 3),
	(6, 3),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 3),
	(11, 3),
	(12, 3),
	(13, 3),
	(14, 3),
	(15, 3),
	(16, 3),
	(17, 3),
	(18, 3),
	(19, 3),
	(21, 3),
	(22, 3),
	(23, 3),
	(24, 3),
	(25, 3),
	(26, 3),
	(27, 3),
	(28, 3),
	(29, 3),
	(30, 3),
	(31, 3),
	(32, 3),
	(33, 3),
	(34, 3),
	(35, 3),
	(36, 3),
	(37, 3),
	(38, 3),
	(39, 3),
	(40, 3),
	(41, 3),
	(42, 3),
	(43, 3),
	(44, 3),
	(45, 3),
	(1, 4),
	(2, 4),
	(3, 4),
	(4, 4),
	(5, 4),
	(6, 4),
	(7, 4),
	(8, 4),
	(9, 4),
	(10, 4),
	(11, 4),
	(12, 4),
	(13, 4),
	(14, 4),
	(15, 4),
	(16, 4),
	(17, 4),
	(18, 4),
	(19, 4),
	(20, 4),
	(21, 4),
	(22, 4),
	(23, 4),
	(24, 4),
	(25, 4),
	(26, 4),
	(27, 4),
	(28, 4),
	(29, 4),
	(30, 4),
	(31, 4),
	(32, 4),
	(33, 4),
	(34, 4),
	(35, 4),
	(36, 4),
	(37, 4),
	(38, 4),
	(39, 4),
	(40, 4),
	(41, 4),
	(42, 4),
	(43, 4),
	(44, 4),
	(45, 4),
	(46, 4);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.tipodocumento: ~2 rows (aproximadamente)
DELETE FROM `tipodocumento`;
INSERT INTO `tipodocumento` (`IDTIPODOC`, `NOMBREDOC`) VALUES
	(1, 'DUI'),
	(2, 'Pasaporte');

-- Volcando estructura para tabla bad_proyecto.tipounidad
DROP TABLE IF EXISTS `tipounidad`;
CREATE TABLE IF NOT EXISTS `tipounidad` (
  `IDTIPOUNIDAD` int NOT NULL AUTO_INCREMENT,
  `NOMBRETIPOUNIDAD` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTIPOUNIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.tipounidad: ~6 rows (aproximadamente)
DELETE FROM `tipounidad`;
INSERT INTO `tipounidad` (`IDTIPOUNIDAD`, `NOMBRETIPOUNIDAD`) VALUES
	(1, 'Unidad'),
	(2, 'Departamento'),
	(3, 'Área'),
	(4, 'Sección'),
	(5, 'Módulo'),
	(6, 'Sector');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.unidad: ~15 rows (aproximadamente)
DELETE FROM `unidad`;
INSERT INTO `unidad` (`IDUNIDAD`, `IDTIPOUNIDAD`, `UNI_IDUNIDAD`, `NOMBREUNIDAD`, `ESTADO`) VALUES
	(1, 1, NULL, 'Gerencia', 1),
	(2, 2, 1, 'Comercial', 1),
	(3, 2, 1, 'Financiero', 1),
	(4, 2, 1, 'Producción', 1),
	(5, 3, 2, 'Ventas', 1),
	(6, 3, 2, 'Publicidad', 1),
	(7, 3, 3, 'Contaduría', 1),
	(8, 3, 3, 'Tesorería', 1),
	(9, 3, 4, 'Montaje', 1),
	(10, 3, 4, 'Ensamblaje', 1),
	(11, 4, 5, 'Ventas Norte', 1),
	(12, 4, 5, 'Ventas Sur', 1),
	(13, 4, 7, 'Contabilidad General', 1),
	(14, 4, 7, 'Contabilidad Analítica', 1),
	(15, 4, 9, 'Montaje de Componentes', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.usuario: ~5 rows (aproximadamente)
DELETE FROM `usuario`;
INSERT INTO `usuario` (`IDUSUARIO`, `IDROL`, `USERNAME`, `EMAIL`, `PASSWORD`, `ESTADO`, `INTENTOSLOGIN`, `SOLICITODESBLOQUEO`) VALUES
	(1, 4, 'marvin', 'oc20013@ues.edu.sv', '$2a$10$g8tr2pL2xdT1ayDEYdnI5.syj.eqTJbI88qXEixvU0RpErnlAJN9S', 1, 0, 0),
	(2, 2, 'alexander', 'hs19011@ues.edu.sv', '$2a$10$uYkaNbeE2jPeN4uXRekFUuZWUcEy0Dg2KwBthbGhAjdn4utbcoyuO', 1, 0, 0),
	(3, 2, 'julio', 'mr20084@ues.edu.sv', '$2a$10$P0oUFKcexNk4mZ7mUnLTM.SO9fJUavfAxY9gLKbo3Yk8ev0a6ag4C', 1, 0, 0),
	(4, 2, 'daniel', 'cm20028@ues.edu.sv', '$2a$10$Q8PGgogeS5D/FVWPFDDDAu1xElMsVCYxIh2ji6BanR4OQAD6CVsPq', 1, 0, 0),
	(5, 3, 'usuario', 'marvincubias22@gmail.com', '$2a$10$pg2/MUHlPC7M0vajPPlGGOwIFkJ8Sph.hhhV.52ZVZi544J.XC/H.', 1, 0, 0);

-- Volcando estructura para tabla bad_proyecto.vacacion
DROP TABLE IF EXISTS `vacacion`;
CREATE TABLE IF NOT EXISTS `vacacion` (
  `IDVACACION` int NOT NULL AUTO_INCREMENT,
  `IDEMPLEADO` int DEFAULT NULL,
  `FECHAINICIO` date DEFAULT NULL,
  PRIMARY KEY (`IDVACACION`),
  KEY `FK_REFERENCE_20` (`IDEMPLEADO`),
  CONSTRAINT `FK_REFERENCE_20` FOREIGN KEY (`IDEMPLEADO`) REFERENCES `empleado` (`IDEMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bad_proyecto.vacacion: ~3 rows (aproximadamente)
DELETE FROM `vacacion`;
INSERT INTO `vacacion` (`IDVACACION`, `IDEMPLEADO`, `FECHAINICIO`) VALUES
	(1, 1, '2024-05-01'),
	(2, 5, '2024-08-24'),
	(3, 3, '2024-06-01');

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

-- Volcando estructura para disparador bad_proyecto.after_insert_deduccionbeneficioempleado
DROP TRIGGER IF EXISTS `after_insert_deduccionbeneficioempleado`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_insert_deduccionbeneficioempleado` AFTER INSERT ON `deduccionbeneficio_empleado` FOR EACH ROW BEGIN
    DECLARE user_id INT;
    SET user_id = @current_user_id;

    INSERT INTO auditoria_deduccionbeneficioempleado (IDDEDUCBENEF, IDDEDUCBENEF_EMP, IDEMPLEADO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA,ESTADO)
    VALUES (NEW.IDDEDUCBENEF, NEW.IDDEDUCBENEF_EMP, NEW.IDEMPLEADO, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NOW(), 'Inserción', user_id,NEW.ESTADO);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bad_proyecto.after_insert_deduccionbeneficioglobal
DROP TRIGGER IF EXISTS `after_insert_deduccionbeneficioglobal`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_insert_deduccionbeneficioglobal` AFTER INSERT ON `deduccionbeneficioglobal` FOR EACH ROW BEGIN
    DECLARE user_id INT;
    SET user_id = @current_user_id;

    INSERT INTO auditoria_deduccionbeneficioglobal (IDDEDUCBENEF, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, ESTADO, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NEW.ESTADO, NOW(), 'Inserción', user_id);
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

INSERT INTO auditoria_empleado (IDEMPLEADO, IDPUESTO, IDMUNICIPIO, IDESTADOCIVIL, EMP_IDEMPLEADO, IDTIPODOC, NOMBRE1, NOMBRE2, APELLIDO1, APELLIDO2, APELLIDOCASADA, SEXO, FECHANACIMIENTO, FECHAINGRESO, NUMERODOC, NIT, ISSS, NUP, SALARIO, CORREOINSTITUCIONAL, CORREOPERSONAL, ESTADO, FECHAMODIFICACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDEMPLEADO, NEW.IDPUESTO, NEW.IDMUNICIPIO, NEW.IDESTADOCIVIL, NEW.EMP_IDEMPLEADO, NEW.IDTIPODOC, NEW.NOMBRE1, NEW.NOMBRE2, NEW.APELLIDO1, NEW.APELLIDO2, NEW.APELLIDOCASADA, NEW.SEXO, NEW.FECHANACIMIENTO, NEW.FECHAINGRESO, NEW.NUMERODOC, NEW.NIT, NEW.ISSS, NEW.NUP, NEW.SALARIO, NEW.CORREOINSTITUCIONAL, NEW.CORREOPERSONAL, NEW.ESTADO, NOW(), 'Inserción', user_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bad_proyecto.after_update_deduccionbeneficioempleado
DROP TRIGGER IF EXISTS `after_update_deduccionbeneficioempleado`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_update_deduccionbeneficioempleado` AFTER UPDATE ON `deduccionbeneficio_empleado` FOR EACH ROW BEGIN
    DECLARE user_id INT;
    SET user_id = @current_user_id;

    INSERT INTO auditoria_deduccionbeneficioempleado  (IDDEDUCBENEF, IDDEDUCBENEF_EMP, IDEMPLEADO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA,ESTADO)
    VALUES (NEW.IDDEDUCBENEF, NEW.IDDEDUCBENEF_EMP, NEW.IDEMPLEADO, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NOW(), 'Actualización', user_id,NEW.ESTADO);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador bad_proyecto.after_update_deduccionbeneficioglobal
DROP TRIGGER IF EXISTS `after_update_deduccionbeneficioglobal`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_update_deduccionbeneficioglobal` AFTER UPDATE ON `deduccionbeneficioglobal` FOR EACH ROW BEGIN
    DECLARE user_id INT;
    SET user_id = @current_user_id;

    INSERT INTO auditoria_deduccionbeneficioglobal (IDDEDUCBENEF, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, ESTADO, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NEW.ESTADO, NOW(), 'Actualización', user_id);
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

INSERT INTO auditoria_empleado (IDEMPLEADO, IDPUESTO, IDMUNICIPIO, IDESTADOCIVIL, EMP_IDEMPLEADO, IDTIPODOC, NOMBRE1, NOMBRE2, APELLIDO1, APELLIDO2, APELLIDOCASADA, SEXO, FECHANACIMIENTO, FECHAINGRESO, NUMERODOC, NIT, ISSS, NUP, SALARIO, CORREOINSTITUCIONAL, CORREOPERSONAL, ESTADO, FECHAMODIFICACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDEMPLEADO, NEW.IDPUESTO, NEW.IDMUNICIPIO, NEW.IDESTADOCIVIL, NEW.EMP_IDEMPLEADO, NEW.IDTIPODOC, NEW.NOMBRE1, NEW.NOMBRE2, NEW.APELLIDO1, NEW.APELLIDO2, NEW.APELLIDOCASADA, NEW.SEXO, NEW.FECHANACIMIENTO, NEW.FECHAINGRESO, NEW.NUMERODOC, NEW.NIT, NEW.ISSS, NEW.NUP, NEW.SALARIO, NEW.CORREOINSTITUCIONAL, NEW.CORREOPERSONAL, NEW.ESTADO, NOW(), 'Actualización', user_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
