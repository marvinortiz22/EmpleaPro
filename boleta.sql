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
	END