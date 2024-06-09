drop database if exists bad_proyecto;
create database if not exists bad_proyecto;
use bad_proyecto;

/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     18/5/2024 06:57:13 p. m.                     */
/*==============================================================*/


drop table if exists DATOSEMPRESA;

drop table if exists DEDUCCIONBENEFICIO;

drop table if exists DEDUCCIONBENEFICIOGLOBAL;

drop table if exists DEDUCCIONBENEFICIO_EMPLEADO;

drop table if exists DEPARTAMENTO;

drop table if exists EMPLEADO;

drop table if exists ESTADOCIVIL;

drop table if exists HORASEMPLEADO;

drop table if exists MUNICIPIO;

drop table if exists PERLIC_EMPLEADO;

drop table if exists PERMISO;

drop table if exists PERMISOLICENCIA;

drop table if exists PRESUPUESTOANUAL;

drop table if exists PROFESIONOFICIO;

drop table if exists PROFOFC_EMPLEADO;

drop table if exists PUESTO;

drop table if exists ROL;

drop table if exists ROL_PERMISO;

drop table if exists TIPODOCUMENTO;

drop table if exists TIPOUNIDAD;

drop table if exists UNIDAD;

drop table if exists USUARIO;

drop table if exists VACACION;

/*==============================================================*/
/* Table: DATOSEMPRESA                                          */
/*==============================================================*/
create table DATOSEMPRESA
(
   IDEMPRESA            int not null,
   NOMBREEMPRESA        varchar(50) not null,
   DIRECCION            varchar(150) not null,
   NOMBREREPRESENTANTE  varchar(100) not null,
   NIT                  varchar(20),
   NIC                  varchar(20),
   TELEFONO             varchar(20) not null,
   PAGINAWEB            varchar(100),
   EMAIL                varchar(50) not null,
   primary key (IDEMPRESA)
);

/*==============================================================*/
/* Table: DEDUCCIONBENEFICIO                                    */
/*==============================================================*/
create table DEDUCCIONBENEFICIO
(
   IDDEDUCBENEF         int not null auto_increment,
   NOMBREDEDUCBENEF     varchar(75) not null,
   TIPO                 char(1) not null,
   primary key (IDDEDUCBENEF)
);

/*==============================================================*/
/* Table: DEDUCCIONBENEFICIOGLOBAL                              */
/*==============================================================*/
create table DEDUCCIONBENEFICIOGLOBAL
(
   IDDEDUCBENEF         int not null,
   PROPORCIONALALSUELDO bool not null,
   MONTOOPORCENTAJE     decimal not null,
   ESTADO               bool not null default true,
   primary key (IDDEDUCBENEF)
);

/*==============================================================*/
/* Table: DEDUCCIONBENEFICIO_EMPLEADO                           */
/*==============================================================*/
create table DEDUCCIONBENEFICIO_EMPLEADO
(
   IDDEDUCBENEF_EMP     int not null auto_increment,
   IDEMPLEADO           int,
   IDDEDUCBENEF         int,
   PROPORCIONALALSUELDO bool not null,
   MONTOOPORCENTAJE     decimal not null,
   primary key (IDDEDUCBENEF_EMP)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO
(
   IDDEPARTAMENTO       int not null auto_increment,
   NOMBREDEPARTAMENTO   varchar(50) not null,
   primary key (IDDEPARTAMENTO)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO
(
   IDEMPLEADO           int not null auto_increment,
   IDPUESTO             int,
   IDMUNICIPIO          int,
   IDESTADOCIVIL        int,
   EMP_IDEMPLEADO       int,
   IDTIPODOC            int,
   NOMBRE1              varchar(20) not null,
   NOMBRE2              varchar(20),
   APELLIDO1            varchar(20) not null,
   APELLIDO2            varchar(20),
   APELLIDOCASADA       varchar(25),
   SEXO                 char(1) not null,
   FECHANACIMIENTO      date not null,
   FECHAINGRESO         datetime not null,
   NUMERODOC            varchar(20) not null,
   NIT                  varchar(25),
   ISSS                 varchar(25) not null,
   NUP                  varchar(25),
   SALARIO              decimal(10,2) not null,
   CORREOINSTITUCIONAL  varchar(30) not null,
   CORREOPERSONAL       varchar(30) not null,
   ESTADO               bool not null default true,
   primary key (IDEMPLEADO)
);

/*==============================================================*/
/* Table: ESTADOCIVIL                                           */
/*==============================================================*/
create table ESTADOCIVIL
(
   IDESTADOCIVIL        int not null auto_increment,
   NOMBREESTADO         varchar(20) not null,
   primary key (IDESTADOCIVIL)
);

/*==============================================================*/
/* Table: HORASEMPLEADO                                         */
/*==============================================================*/
create table HORASEMPLEADO
(
   IDHORASEMPLEADO      int not null auto_increment,
   IDEMPLEADO           int,
   FECHA                date,
   HORAINGRESO          time,
   HORASALIDA           time,
   primary key (IDHORASEMPLEADO)
);

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
create table MUNICIPIO
(
   IDMUNICIPIO          int not null auto_increment,
   IDDEPARTAMENTO       int,
   NOMBREMUNICIPIO      varchar(50) not null,
   primary key (IDMUNICIPIO)
);

/*==============================================================*/
/* Table: PERLIC_EMPLEADO                                       */
/*==============================================================*/
create table PERLIC_EMPLEADO
(
   IDPERLIC_EMP         int not null auto_increment,
   IDEMPLEADO           int,
   IDPERMISOLICENCIA    int,
   APROBADA             bool not null,
   DESCONTABLE          bool not null,
   FECHAINICIO          date not null,
   FECHAFIN             date not null,
   DIRECCIONARCHIVO     varchar(100),
   primary key (IDPERLIC_EMP)
);

/*==============================================================*/
/* Table: PERMISO                                               */
/*==============================================================*/
create table PERMISO
(
   IDPERMISO            int not null auto_increment,
   NOMBREPERMISO        varchar(100) not null,
   primary key (IDPERMISO)
);

/*==============================================================*/
/* Table: PERMISOLICENCIA                                       */
/*==============================================================*/
create table PERMISOLICENCIA
(
   IDPERMISOLICENCIA    int not null auto_increment,
   TIPO                 char(1) not null,
   CAUSA                varchar(75) not null,
   primary key (IDPERMISOLICENCIA)
);

/*==============================================================*/
/* Table: PRESUPUESTOANUAL                                      */
/*==============================================================*/
create table PRESUPUESTOANUAL
(
   IDPRESUPUESTO        int not null auto_increment,
   IDUNIDAD             int,
   ANO                  int not null,
   MONTO                decimal not null,
   primary key (IDPRESUPUESTO)
);

/*==============================================================*/
/* Table: PROFESIONOFICIO                                       */
/*==============================================================*/
create table PROFESIONOFICIO
(
   IDPROFOFC            int not null auto_increment,
   NOMBREPROFOFC        varchar(50) not null,
   primary key (IDPROFOFC)
);

/*==============================================================*/
/* Table: PROFOFC_EMPLEADO                                      */
/*==============================================================*/
create table PROFOFC_EMPLEADO
(
   IDPROFOFC            int not null,
   IDEMPLEADO           int not null,
   primary key (IDPROFOFC, IDEMPLEADO)
);

/*==============================================================*/
/* Table: PUESTO                                                */
/*==============================================================*/
create table PUESTO
(
   IDPUESTO             int not null auto_increment,
   IDUNIDAD             int,
   NOMBREPUESTO         varchar(50) not null,
   SALARIOMIN           decimal(10,2) not null,
   SALARIOMAX           decimal(10,2) not null,
   ESTADO               bool not null default true,
   primary key (IDPUESTO)
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL
(
   IDROL                int not null auto_increment,
   NOMBREROL            varchar(25) not null,
   ESTADO               bool not null default true,
   primary key (IDROL)
);

/*==============================================================*/
/* Table: ROL_PERMISO                                           */
/*==============================================================*/
create table ROL_PERMISO
(
   IDPERMISO            int not null,
   IDROL                int not null,
   primary key (IDPERMISO, IDROL)
);

/*==============================================================*/
/* Table: TIPODOCUMENTO                                         */
/*==============================================================*/
create table TIPODOCUMENTO
(
   IDTIPODOC            int not null auto_increment,
   NOMBREDOC            varchar(50) not null,
   primary key (IDTIPODOC)
);

/*==============================================================*/
/* Table: TIPOUNIDAD                                            */
/*==============================================================*/
create table TIPOUNIDAD
(
   IDTIPOUNIDAD         int not null auto_increment,
   NOMBRETIPOUNIDAD     varchar(50) not null,
   primary key (IDTIPOUNIDAD)
);

/*==============================================================*/
/* Table: UNIDAD                                                */
/*==============================================================*/
create table UNIDAD
(
   IDUNIDAD             int not null auto_increment,
   IDTIPOUNIDAD         int,
   UNI_IDUNIDAD         int,
   NOMBREUNIDAD         varchar(50) not null,
   ESTADO               bool not null default true,
   primary key (IDUNIDAD)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   IDUSUARIO            int not null auto_increment,
   IDROL                int,
   USERNAME             varchar(50),
   EMAIL                varchar(50) not null,
   PASSWORD             varchar(255),
   ESTADO               bool not null default true,
   INTENTOSLOGIN        int default 0,
   SOLICITODESBLOQUEO   bool not null default false,
   primary key (IDUSUARIO)
);

/*==============================================================*/
/* Table: VACACION                                              */
/*==============================================================*/
create table VACACION
(
   IDVACACION           int not null auto_increment,
   IDEMPLEADO           int,
   FECHAINICIO          date,
   FECHAFIN             date,
   PENDIENTE            bool not null default true,
   primary key (IDVACACION)
);

create table AUDITORIA_EMPLEADO
(
	IDAUDITORIA_EMPLEADO  int not null auto_increment,
   IDEMPLEADO           INT,
   IDPUESTO             int,
   IDMUNICIPIO          int,
   IDESTADOCIVIL        int,
   EMP_IDEMPLEADO       int,
   IDTIPODOC            int,
   NOMBRE1              varchar(20) not null,
   NOMBRE2              varchar(20),
   APELLIDO1            varchar(20) not null,
   APELLIDO2            varchar(20),
   APELLIDOCASADA       varchar(25),
   SEXO                 char(1) not null,
   FECHANACIMIENTO      date not null,
   FECHAINGRESO         datetime not null,
   NUMERODOC            varchar(20) not null,
   NIT                  varchar(25),
   ISSS                 varchar(25) not null,
   NUP                  varchar(25),
   SALARIO              decimal not null,
   CORREOINSTITUCIONAL  varchar(30) not null,
   CORREOPERSONAL       varchar(30) not null,
   ESTADO               bool not null default true,
   FECHAMODIFICACION 	DATETIME NOT NULL,
   TIPODEOPERACION VARCHAR(25) NOT NULL,
	 USUARIOREGISTRA INT,
   primary key (IDAUDITORIA_EMPLEADO)
);
ALTER TABLE AUDITORIA_EMPLEADO ADD CONSTRAINT FK_EMPLEADO FOREIGN KEY (IDEMPLEADO) REFERENCES EMPLEADO (IDEMPLEADO);
ALTER TABLE AUDITORIA_EMPLEADO ADD CONSTRAINT FK_USUARIOMODIFICAEMPLEADO FOREIGN KEY (USUARIOREGISTRA) REFERENCES usuario(IDUSUARIO);
-- Añadir llave foránea a idpuesto
ALTER TABLE auditoria_empleado
ADD CONSTRAINT fk_idpuestoaudiemp
FOREIGN KEY (idpuesto) REFERENCES puesto(idpuesto);

-- Añadir llave foránea a idmunicipio
ALTER TABLE auditoria_empleado
ADD CONSTRAINT fk_idmunicipioaudiemp
FOREIGN KEY (idmunicipio) REFERENCES municipio(idmunicipio);

-- Añadir llave foránea a idestadocivil
ALTER TABLE auditoria_empleado
ADD CONSTRAINT fk_idestadocivilaudiemp
FOREIGN KEY (idestadocivil) REFERENCES estadocivil(idestadocivil);

-- Añadir llave foránea a emp_idempleado
ALTER TABLE auditoria_empleado
ADD CONSTRAINT fk_emp_idempleadoaudiemp
FOREIGN KEY (emp_idempleado) REFERENCES EMPLEADO (IDEMPLEADO);

-- Añadir llave foránea a idtipodoc
ALTER TABLE auditoria_empleado
ADD CONSTRAINT fk_idtipodocaudiemp
FOREIGN KEY (idtipodoc) REFERENCES tipodocumento(idtipodoc);


CREATE TABLE AUDITORIA_DEDUCCIONBENEFICIOGLOBAL(
	 IDAUDITORIA_IDDEDUCBENEF INT NOT NULL AUTO_INCREMENT,
	 IDDEDUCBENEF INT NOT NULL,
	 NOMBREDEDUCBENEF VARCHAR(50) NOT NULL,
	TIPO ENUM('D','B') NOT NULL,
	PROPORCIONALALSUELDO TINYINT(1) NOT NULL,
	MONTOOPORCENTAJE DECIMAL(10,0) NOT NULL,
	ESTADO TINYINT(1) NOT NULL DEFAULT '1',
	 FECHADEOPERACION DATE NOT NULL,
	 TIPODEOPERACION VARCHAR(25) NOT NULL,
	 USUARIOREGISTRA INT,
	 PRIMARY KEY(IDAUDITORIA_IDDEDUCBENEF)

);
ALTER TABLE AUDITORIA_DEDUCCIONBENEFICIOGLOBAL ADD CONSTRAINT FK_DEDUCCIONBENEFICIOGLOBAL FOREIGN KEY (IDDEDUCBENEF)
REFERENCES deduccionbeneficio(IDDEDUCBENEF) on delete restrict on update RESTRICT;
ALTER TABLE AUDITORIA_DEDUCCIONBENEFICIOGLOBAL ADD CONSTRAINT FK_USUARIOREGISTRA FOREIGN KEY (USUARIOREGISTRA)
REFERENCES usuario(IDUSUARIO) on delete restrict on update RESTRICT;

CREATE TABLE AUDITORIA_DEDUCCIONBENEFICIOEMPLEADO(
	 IDAUDITORIA_DEDUCBENEFEMP INT NOT NULL AUTO_INCREMENT,
	 IDDEDUCBENEF INT NOT NULL,
	 NOMBREDEDUCBENEF VARCHAR(50) NOT NULL,
	TIPO ENUM('D','B') NOT NULL,
	`IDDEDUCBENEF_EMP` INT(10) NOT NULL,
	`IDEMPLEADO` INT(10) NULL DEFAULT NULL,
	PROPORCIONALALSUELDO TINYINT(1) NOT NULL,
	MONTOOPORCENTAJE DECIMAL(10,0) NOT NULL,
	 FECHADEOPERACION DATE NOT NULL,
	 TIPODEOPERACION VARCHAR(25) NOT NULL,
	 USUARIOREGISTRA INT,
	 PRIMARY KEY(IDAUDITORIA_DEDUCBENEFEMP)

);
ALTER TABLE AUDITORIA_DEDUCCIONBENEFICIOEMPLEADO ADD CONSTRAINT FK_DEDUCCIONBENEFICIOEMPAUDI FOREIGN KEY (IDDEDUCBENEF)
REFERENCES deduccionbeneficio(IDDEDUCBENEF) on delete restrict on update RESTRICT;
ALTER TABLE AUDITORIA_DEDUCCIONBENEFICIOEMPLEADO ADD CONSTRAINT FK_AUDI_DEDUFBENEFEMP_USUARIO FOREIGN KEY (USUARIOREGISTRA)
REFERENCES usuario(IDUSUARIO) on delete restrict on update RESTRICT;
ALTER TABLE AUDITORIA_DEDUCCIONBENEFICIOEMPLEADO ADD CONSTRAINT FK_DEDUCCIONBENEFICIOEMPLEADO FOREIGN KEY (IDDEDUCBENEF_EMP)
REFERENCES deduccionbeneficio_empleado(IDDEDUCBENEF_EMP) on delete restrict on update RESTRICT;
ALTER TABLE AUDITORIA_DEDUCCIONBENEFICIOEMPLEADO ADD CONSTRAINT FK_DEDUCCIONBENEFICIOEMPLEADOAUDIEMP FOREIGN KEY (IDEMPLEADO)
REFERENCES empleado(IDEMPLEADO) on delete restrict on update RESTRICT;

alter table DEDUCCIONBENEFICIOGLOBAL add constraint FK_REFERENCE_23 foreign key (IDDEDUCBENEF)
      references DEDUCCIONBENEFICIO (IDDEDUCBENEF) on delete restrict on update restrict;

alter table DEDUCCIONBENEFICIO_EMPLEADO add constraint FK_REFERENCE_21 foreign key (IDEMPLEADO)
      references EMPLEADO (IDEMPLEADO) on delete restrict on update restrict;

alter table DEDUCCIONBENEFICIO_EMPLEADO add constraint FK_REFERENCE_22 foreign key (IDDEDUCBENEF)
      references DEDUCCIONBENEFICIO (IDDEDUCBENEF) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_EMPLEADO_TIENE_TIPODOC foreign key (IDTIPODOC)
      references TIPODOCUMENTO (IDTIPODOC) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_SE_LE_ASIGNA_PUESTO foreign key (IDPUESTO)
      references PUESTO (IDPUESTO) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_SUPERVISA foreign key (EMP_IDEMPLEADO)
      references EMPLEADO (IDEMPLEADO) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_TIENE_ESTADOCIVIL foreign key (IDESTADOCIVIL)
      references ESTADOCIVIL (IDESTADOCIVIL) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_VIVE_EN foreign key (IDMUNICIPIO)
      references MUNICIPIO (IDMUNICIPIO) on delete restrict on update restrict;

alter table HORASEMPLEADO add constraint FK_REFERENCE_17 foreign key (IDEMPLEADO)
      references EMPLEADO (IDEMPLEADO) on delete restrict on update restrict;

alter table MUNICIPIO add constraint FK_PERTENECE_A_DEPARTAMENTO foreign key (IDDEPARTAMENTO)
      references DEPARTAMENTO (IDDEPARTAMENTO) on delete restrict on update restrict;

alter table PERLIC_EMPLEADO add constraint FK_REFERENCE_18 foreign key (IDEMPLEADO)
      references EMPLEADO (IDEMPLEADO) on delete restrict on update restrict;

alter table PERLIC_EMPLEADO add constraint FK_REFERENCE_19 foreign key (IDPERMISOLICENCIA)
      references PERMISOLICENCIA (IDPERMISOLICENCIA) on delete restrict on update restrict;

alter table PRESUPUESTOANUAL add constraint FK_REFERENCE_16 foreign key (IDUNIDAD)
      references UNIDAD (IDUNIDAD) on delete restrict on update restrict;

alter table PROFOFC_EMPLEADO add constraint FK_PROFOFC_EMPLEADO foreign key (IDPROFOFC)
      references PROFESIONOFICIO (IDPROFOFC) on delete restrict on update restrict;

alter table PROFOFC_EMPLEADO add constraint FK_PROFOFC_EMPLEADO2 foreign key (IDEMPLEADO)
      references EMPLEADO (IDEMPLEADO) on delete restrict on update restrict;

alter table PUESTO add constraint FK_PERTENECE_A_UNIDAD foreign key (IDUNIDAD)
      references UNIDAD (IDUNIDAD) on delete restrict on update restrict;

alter table ROL_PERMISO add constraint FK_TIENE_PERMISO foreign key (IDPERMISO)
      references PERMISO (IDPERMISO) on delete restrict on update restrict;

alter table ROL_PERMISO add constraint FK_TIENE_PERMISO2 foreign key (IDROL)
      references ROL (IDROL) on delete restrict on update restrict;

alter table UNIDAD add constraint FK_GESTIONA_SUBUNIDADES foreign key (UNI_IDUNIDAD)
      references UNIDAD (IDUNIDAD) on delete restrict on update restrict;

alter table UNIDAD add constraint FK_TIENE_TIPOUNIDAD foreign key (IDTIPOUNIDAD)
      references TIPOUNIDAD (IDTIPOUNIDAD) on delete restrict on update restrict;

alter table USUARIO add constraint FK_SE_LE_ASIGNA foreign key (IDROL)
      references ROL (IDROL) on delete restrict on update restrict;

alter table VACACION add constraint FK_REFERENCE_20 foreign key (IDEMPLEADO)
      references EMPLEADO (IDEMPLEADO) on delete restrict on update restrict;

ALTER TABLE EMPLEADO
ADD CONSTRAINT UNIQUE_NUMERODOC UNIQUE (NUMERODOC),
ADD CONSTRAINT UNIQUE_NIT UNIQUE (NIT),
ADD CONSTRAINT UNIQUE_ISSS UNIQUE (ISSS),
ADD CONSTRAINT UNIQUE_NUP UNIQUE (NUP),
ADD CONSTRAINT UNIQUE_CORREOINSTITUCIONAL UNIQUE (CORREOINSTITUCIONAL),
ADD CONSTRAINT UNIQUE_CORREOPERSONAL UNIQUE (CORREOPERSONAL);
ALTER TABLE USUARIO
ADD CONSTRAINT UNIQUE_USERNAME UNIQUE (USERNAME),
ADD CONSTRAINT UNIQUE_EMAIL UNIQUE (EMAIL);

INSERT INTO permiso VALUES (NULL,"ROLE_Ver_puestos");
insert into permiso values (null, 'ROLE_Agregar_puestos');
insert into permiso values (null, 'ROLE_Editar_puestos');
insert into permiso values (null, 'ROLE_Cambiar_estado_puestos');
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_profesiones_y_oficios");
insert into permiso values (null, 'ROLE_Agregar_oficios');
insert into permiso values (null, 'ROLE_Editar_oficios');
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_unidades");
insert into permiso values (null, 'ROLE_Agregar_unidades');
insert into permiso values (null, 'ROLE_Editar_unidades');
insert into permiso values (null, 'ROLE_Cambiar_estado_unidades');
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_empleados");
insert into permiso values (null, 'ROLE_Agregar_empleados');
insert into permiso values (null, 'ROLE_Editar_empleados');
insert into permiso values (null, 'ROLE_Cambiar_estado_empleados');
insert into permiso values (null, 'ROLE_Ver_horas_trabajadas');
insert into permiso values (null, 'ROLE_Editar_horas_trabajadas');
insert into permiso values (null, 'ROLE_Ver_permisos_y_licencias');
insert into permiso values (null, 'ROLE_Agregar_permisos_y_licencias');
insert into permiso values (null, 'ROLE_Editar_permisos_y_licencias');
insert into permiso values (null, 'ROLE_Ver_vacaciones');
insert into permiso values (null, 'ROLE_Editar_vacaciones');
insert into permiso values (null, 'ROLE_Ver_contabilidad');
insert into permiso values (null, 'ROLE_Ver_planilla');
insert into permiso values (null, 'ROLE_Ver_boletas_de_pago');
insert into permiso values (null, 'ROLE_Ver_deducciones_y_beneficios_globales');
insert into permiso values (null, 'ROLE_Agregar_deducciones_y_beneficios_globales');
insert into permiso values (null, 'ROLE_Editar_deducciones_y_beneficios_globales');
insert into permiso values (null, 'ROLE_Ver_deducciones_y_beneficios_de_empleados');
insert into permiso values (null, 'ROLE_Editar_deducciones_y_beneficios_de_empleados');
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_demografía_y_estado_civil");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_demografía");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_estados_civiles");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_auditoria");
insert into permiso values (null, 'ROLE_Ver_auditoria_de_empleados');
insert into permiso values (null, 'ROLE_Ver_auditoria_de_deducciones_y_beneficios_globales');
insert into permiso values (null, 'ROLE_Ver_auditoria_de_deducciones_y_beneficios_de_empleados');
insert into permiso VALUES (NULL,"ROLE_Administrador");
insert into permiso values (null, 'ROLE_Ver_datos_empresa');
insert into permiso values (null, 'ROLE_Editar_datos_empresa');
insert into permiso values (null, 'ROLE_Ver_presupuesto_de_unidades');
insert into permiso values (null, 'ROLE_Editar_presupuesto_de_unidades');
insert into permiso values (null, 'ROLE_Agregar_deducciones_y_beneficios_de_empleados');
insert into permiso values (null, 'ROLE_Agregar_deducciones_y_beneficios_de_empleados');

insert into rol values (1,"usuario",1);

insert into rol_permiso VALUES (1, 1);
insert into rol_permiso VALUES (2, 1);
insert into rol_permiso values (3, 1);
insert into rol_permiso VALUES (4, 1);
insert into rol_permiso values (5, 1);
insert into rol_permiso values (6, 1);
insert into rol_permiso values (7, 1);
insert into rol_permiso values (8, 1);
insert into rol_permiso values (9, 1);
insert into rol_permiso VALUES (10, 1);
insert into rol_permiso VALUES (11, 1);
insert into rol_permiso VALUES (12, 1);
insert into rol_permiso VALUES (13, 1);
insert into rol_permiso VALUES (14, 1);
insert into rol_permiso values (15, 1);
insert into rol_permiso values (16, 1);
insert into rol_permiso values (17, 1);
insert into rol_permiso values (18, 1);
insert into rol_permiso values (19, 1);
insert into rol_permiso values (20, 1);
insert into rol_permiso values (21, 1);
insert into rol_permiso values (22, 1);
insert into rol_permiso values (23, 1);
insert into rol_permiso values (24, 1);
insert into rol_permiso values (25, 1);
insert into rol_permiso values (26, 1);
insert into rol_permiso values (27, 1);
insert into rol_permiso values (28, 1);
insert into rol_permiso values (29, 1);
insert into rol_permiso values (30, 1);
insert into rol_permiso values (31, 1);
insert into rol_permiso values (32, 1);
insert into rol_permiso values (33, 1);
insert into rol_permiso values (34, 1);
insert into rol_permiso values (35, 1);
insert into rol_permiso values (36, 1);
insert into rol_permiso values (37, 1);
insert into rol_permiso values (38, 1);
insert into rol_permiso values (39, 1);
insert into rol_permiso values (40, 1);
insert into rol_permiso values (41, 1);
insert into rol_permiso values (42, 1);
insert into rol_permiso values (43, 1);
insert into rol_permiso values (44, 1);

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

-- Trigger para registrar la creación de empleados en la tabla de bitácora
DELIMITER $$
CREATE TRIGGER `after_insert_empleado` AFTER INSERT ON `empleado`
 FOR EACH ROW BEGIN
 	DECLARE user_id INT;
    SET user_id = @current_user_id;

INSERT INTO AUDITORIA_EMPLEADO (IDEMPLEADO, IDPUESTO, IDMUNICIPIO, IDESTADOCIVIL, EMP_IDEMPLEADO, IDTIPODOC, NOMBRE1, NOMBRE2, APELLIDO1, APELLIDO2, APELLIDOCASADA, SEXO, FECHANACIMIENTO, FECHAINGRESO, NUMERODOC, NIT, ISSS, NUP, SALARIO, CORREOINSTITUCIONAL, CORREOPERSONAL, ESTADO, FECHAMODIFICACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDEMPLEADO, NEW.IDPUESTO, NEW.IDMUNICIPIO, NEW.IDESTADOCIVIL, NEW.EMP_IDEMPLEADO, NEW.IDTIPODOC, NEW.NOMBRE1, NEW.NOMBRE2, NEW.APELLIDO1, NEW.APELLIDO2, NEW.APELLIDOCASADA, NEW.SEXO, NEW.FECHANACIMIENTO, NEW.FECHAINGRESO, NEW.NUMERODOC, NEW.NIT, NEW.ISSS, NEW.NUP, NEW.SALARIO, NEW.CORREOINSTITUCIONAL, NEW.CORREOPERSONAL, NEW.ESTADO, NOW(), 'Creación', user_id);
END$$
DELIMITER ;

-- Trigger para registrar la actualización de empleados en la tabla de bitácora
DELIMITER $$
CREATE TRIGGER `after_update_empleado` AFTER UPDATE ON `empleado`
 FOR EACH ROW BEGIN
	DECLARE user_id INT;
    SET user_id = @current_user_id;

INSERT INTO AUDITORIA_EMPLEADO (IDEMPLEADO, IDPUESTO, IDMUNICIPIO, IDESTADOCIVIL, EMP_IDEMPLEADO, IDTIPODOC, NOMBRE1, NOMBRE2, APELLIDO1, APELLIDO2, APELLIDOCASADA, SEXO, FECHANACIMIENTO, FECHAINGRESO, NUMERODOC, NIT, ISSS, NUP, SALARIO, CORREOINSTITUCIONAL, CORREOPERSONAL, ESTADO, FECHAMODIFICACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDEMPLEADO, NEW.IDPUESTO, NEW.IDMUNICIPIO, NEW.IDESTADOCIVIL, NEW.EMP_IDEMPLEADO, NEW.IDTIPODOC, NEW.NOMBRE1, NEW.NOMBRE2, NEW.APELLIDO1, NEW.APELLIDO2, NEW.APELLIDOCASADA, NEW.SEXO, NEW.FECHANACIMIENTO, NEW.FECHAINGRESO, NEW.NUMERODOC, NEW.NIT, NEW.ISSS, NEW.NUP, NEW.SALARIO, NEW.CORREOINSTITUCIONAL, NEW.CORREOPERSONAL, NEW.ESTADO, NOW(), 'Actualización', user_id);
END$$
DELIMITER;

-- Trigger para registrar la creación en la tabla de bitácora deduccion beneficio global
DELIMITER $$
CREATE TRIGGER `after_insert_deduccionbeneficioglobal` AFTER INSERT ON `deduccionbeneficioglobal`
 FOR EACH ROW BEGIN
    DECLARE user_id INT;
    DECLARE nombre_deduccion VARCHAR(75);
    DECLARE tipo_deduccion CHAR(1);
    SET user_id = @current_user_id;

    SELECT NOMBREDEDUCBENEF, TIPO INTO nombre_deduccion, tipo_deduccion
    FROM DEDUCCIONBENEFICIO
    WHERE IDDEDUCBENEF = NEW.IDDEDUCBENEF;

    INSERT INTO AUDITORIA_DEDUCCIONBENEFICIOGLOBAL (IDDEDUCBENEF, NOMBREDEDUCBENEF, TIPO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, ESTADO, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, nombre_deduccion, tipo_deduccion, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NEW.ESTADO, NOW(), 'Inserción', user_id);
END$$
DELIMITER ;

-- Trigger para registrar la actualización en la tabla de bitácora deduccion beneficio global
DELIMITER $$
CREATE TRIGGER `after_update_deduccionbeneficioglobal` AFTER UPDATE ON `deduccionbeneficioglobal`
 FOR EACH ROW BEGIN
    DECLARE user_id INT;
    DECLARE nombre_deduccion VARCHAR(75);
    DECLARE tipo_deduccion CHAR(1);
    SET user_id = @current_user_id;

    SELECT NOMBREDEDUCBENEF, TIPO INTO nombre_deduccion, tipo_deduccion
    FROM DEDUCCIONBENEFICIO
    WHERE IDDEDUCBENEF = NEW.IDDEDUCBENEF;

    INSERT INTO AUDITORIA_DEDUCCIONBENEFICIOGLOBAL (IDDEDUCBENEF, NOMBREDEDUCBENEF, TIPO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, ESTADO, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, nombre_deduccion, tipo_deduccion, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NEW.ESTADO, NOW(), 'Actualización', user_id);
END$$
DELIMITER ;

-- Trigger para registrar la creación en la tabla de bitácora deduccion beneficio empleado
DELIMITER $$
CREATE TRIGGER `after_insert_deduccionbeneficioempleado` AFTER INSERT ON `deduccionbeneficio_empleado`
 FOR EACH ROW BEGIN
    DECLARE user_id INT;
    DECLARE nombre_deduccion VARCHAR(50);
    DECLARE tipo_deduccion CHAR(1);
    SET user_id = @current_user_id;

    SELECT NOMBREDEDUCBENEF, TIPO INTO nombre_deduccion, tipo_deduccion
    FROM DEDUCCIONBENEFICIO
    WHERE IDDEDUCBENEF = NEW.IDDEDUCBENEF;

    INSERT INTO AUDITORIA_DEDUCCIONBENEFICIOEMPLEADO (IDDEDUCBENEF, NOMBREDEDUCBENEF, TIPO, IDDEDUCBENEF_EMP, IDEMPLEADO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, nombre_deduccion, tipo_deduccion, NEW.IDDEDUCBENEF_EMP, NEW.IDEMPLEADO, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NOW(), 'Inserción', user_id);
END$$
DELIMITER ;

-- Trigger para registrar la actualización en la tabla de bitácora deduccion beneficio empleado
DELIMITER $$
CREATE TRIGGER `after_update_deduccionbeneficioempleado` AFTER UPDATE ON `deduccionbeneficio_empleado`
 FOR EACH ROW BEGIN
    DECLARE user_id INT;
    DECLARE nombre_deduccion VARCHAR(50);
    DECLARE tipo_deduccion CHAR(1);
    SET user_id = @current_user_id;

    SELECT NOMBREDEDUCBENEF, TIPO INTO nombre_deduccion, tipo_deduccion
    FROM DEDUCCIONBENEFICIO
    WHERE IDDEDUCBENEF = NEW.IDDEDUCBENEF;

    INSERT INTO AUDITORIA_DEDUCCIONBENEFICIOEMPLEADO (IDDEDUCBENEF, NOMBREDEDUCBENEF, TIPO, IDDEDUCBENEF_EMP, IDEMPLEADO, PROPORCIONALALSUELDO, MONTOOPORCENTAJE, FECHADEOPERACION, TIPODEOPERACION, USUARIOREGISTRA)
    VALUES (NEW.IDDEDUCBENEF, nombre_deduccion, tipo_deduccion, NEW.IDDEDUCBENEF_EMP, NEW.IDEMPLEADO, NEW.PROPORCIONALALSUELDO, NEW.MONTOOPORCENTAJE, NOW(), 'Actualización', user_id);
END$$
DELIMITER ;