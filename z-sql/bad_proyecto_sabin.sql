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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bad_proyecto.deduccionbeneficio
DROP TABLE IF EXISTS `deduccionbeneficio`;
CREATE TABLE IF NOT EXISTS `deduccionbeneficio` (
  `IDDEDUCBENEF` int NOT NULL AUTO_INCREMENT,
  `NOMBREDEDUCBENEF` varchar(75) NOT NULL,
  `TIPO` enum('D','B') NOT NULL,
  PRIMARY KEY (`IDDEDUCBENEF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bad_proyecto.departamento
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `IDDEPARTAMENTO` int NOT NULL AUTO_INCREMENT,
  `NOMBREDEPARTAMENTO` varchar(50) NOT NULL,
  PRIMARY KEY (`IDDEPARTAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bad_proyecto.estadocivil
DROP TABLE IF EXISTS `estadocivil`;
CREATE TABLE IF NOT EXISTS `estadocivil` (
  `IDESTADOCIVIL` int NOT NULL AUTO_INCREMENT,
  `NOMBREESTADO` varchar(20) NOT NULL,
  PRIMARY KEY (`IDESTADOCIVIL`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bad_proyecto.permiso
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE IF NOT EXISTS `permiso` (
  `IDPERMISO` int NOT NULL AUTO_INCREMENT,
  `NOMBREPERMISO` varchar(100) NOT NULL,
  PRIMARY KEY (`IDPERMISO`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bad_proyecto.permisolicencia
DROP TABLE IF EXISTS `permisolicencia`;
CREATE TABLE IF NOT EXISTS `permisolicencia` (
  `IDPERMISOLICENCIA` int NOT NULL AUTO_INCREMENT,
  `TIPO` enum('P','L') NOT NULL,
  `CAUSA` varchar(75) NOT NULL,
  PRIMARY KEY (`IDPERMISOLICENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bad_proyecto.profesionoficio
DROP TABLE IF EXISTS `profesionoficio`;
CREATE TABLE IF NOT EXISTS `profesionoficio` (
  `IDPROFOFC` int NOT NULL AUTO_INCREMENT,
  `NOMBREPROFOFC` varchar(50) NOT NULL,
  PRIMARY KEY (`IDPROFOFC`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bad_proyecto.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `IDROL` int NOT NULL AUTO_INCREMENT,
  `NOMBREROL` varchar(25) NOT NULL,
  `ESTADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`IDROL`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bad_proyecto.tipounidad
DROP TABLE IF EXISTS `tipounidad`;
CREATE TABLE IF NOT EXISTS `tipounidad` (
  `IDTIPOUNIDAD` int NOT NULL AUTO_INCREMENT,
  `NOMBRETIPOUNIDAD` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTIPOUNIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

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
