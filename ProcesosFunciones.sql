delimiter $$
CREATE PROCEDURE planilla(fecha1 DATE,fecha2 DATE)
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
	FORMAT(calcularISSS(
	salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	),2) AS "isss",
	FORMAT(
	(salario*calcularHorasNormales(idempleado,fecha1,fecha2)+
	verificarVacacion(idempleado,fecha1,fecha2)*salario*88*0.3+
	calcularHorasExtra(idempleado,fecha1,fecha2)*salario*2+
	diasconpermiso(idempleado)*8*salario+
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"B")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"B")
	)
	*0.0725,2) AS "afp",
	calcularrenta(salario)*calcularHorasNormales(idempleado,fecha1,fecha2) AS renta,
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"D")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"D") AS otrasdeducciones,
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
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"D")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"D")
	) AS totaldeducciones,
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
	calcularDeducBenefGlobales((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),"D")+
	calcularDeducBenefEmpleado((salario*calcularHorasNormales(idempleado,fecha1,fecha2)),idempleado,"D")
	) AS salarioneto
	FROM empleado e 
	JOIN puesto p ON e.idpuesto=p.idpuesto;
	END $$
delimiter ;

DELIMITER $$

CREATE FUNCTION calcularHorasNormales(
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE
) RETURNS INT
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
END$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION calcularHorasExtra(
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE
) RETURNS INT
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
END$$

DELIMITER ;

delimiter $$
CREATE FUNCTION calcularISSS(salario DECIMAL)
RETURNS DECIMAL(10,2)
BEGIN
	DECLARE descuentomonto DECIMAL(10,2);
	set descuentomonto=salario*0.03;
	if descuentomonto>30 then
		set descuentomonto=30;
	END if;
	RETURN descuentomonto;
END $$

DELIMITER ;

delimiter $$
CREATE FUNCTION verificarVacacion(
    empleado_id INT,
    fecha_inicio DATE,
    fecha_fin DATE
) RETURNS TINYINT
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
END$$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION calcularDeducBenefGlobales(salario DECIMAL,tipop CHAR(1))
RETURNS DECIMAL
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE esporcentual INT;
	DECLARE montoporcentaje DECIMAL;
	DECLARE beneficiostotal DECIMAL DEFAULT 0;
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
END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION calcularDeducBenefEmpleado(salario DECIMAL,idempleadop int,tipop CHAR(1))
RETURNS DECIMAL
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE esporcentual INT;
	DECLARE montoporcentaje DECIMAL;
	DECLARE beneficiostotal DECIMAL DEFAULT 0;
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
END $$
DELIMITER ;

DELIMITER $$

CREATE FUNCTION diasconpermiso(idEmpleado INT) 
RETURNS INT
BEGIN
    DECLARE total_dias INT DEFAULT 0;
    DECLARE dias_ajustados INT DEFAULT 0;

    -- Calcular el total de días de permisos aprobados no descontables
    SELECT SUM(DATEDIFF(FECHAFIN, FECHAINICIO) + 1)
    INTO total_dias
    FROM perlic_empleado
    WHERE IDEMPLEADO = idEmpleado
      AND APROBADA = 1
      AND DESCONTABLE = 0;

    -- Aplicar la lógica para restar 2 días por cada 7 días de permiso
    SET dias_ajustados = total_dias - FLOOR(total_dias / 7) * 2;

    RETURN dias_ajustados;
END$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION calcularrenta(salario DECIMAL)
RETURNS DECIMAL(10,2)
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
END$$

DELIMITER ;

-- Auditoria

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SetCurrentUser`(IN `userId` INT)
BEGIN
    SET @current_user_id = userId;
END$$
DELIMITER ;

-- boletas

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `planillaEmpleado`(
	IN `fecha1` DATE,
	IN `fecha2` DATE,
	IN `idempleadop` int
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
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
END$$

DELIMITER ;