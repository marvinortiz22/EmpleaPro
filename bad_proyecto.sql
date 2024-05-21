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
   SALARIO              decimal not null,
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
   SALARIOMIN           decimal not null,
   SALARIOMAX           decimal not null,
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

insert into permiso VALUES (NULL,"ROLE_Administrador");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_empleados");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_puestos");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_profesiones_y_oficios");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_unidades");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_demografía_y_estado_civil");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_demografía");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_estados_civiles");
-- Deducciones y Beneficios Globales
insert into permiso values (null, 'ROLE_Ver_deducciones_y_beneficios_globales');
insert into permiso values (null, 'ROLE_Agregar_deducciones_y_beneficios_globales');
insert into permiso values (null, 'ROLE_Editar_deducciones_y_beneficios_globales');

-- Deducciones y Beneficios de Empleados
insert into permiso values (null, 'ROLE_Ver_deducciones_y_beneficios_de_empleados');
insert into permiso values (null, 'ROLE_Editar_deducciones_y_beneficios_de_empleados');

-- Horas Trabajadas
insert into permiso values (null, 'ROLE_Ver_horas_trabajadas');
insert into permiso values (null, 'ROLE_Editar_horas_trabajadas');

-- Vacaciones
insert into permiso values (null, 'ROLE_Ver_vacaciones');
insert into permiso values (null, 'ROLE_Editar_vacaciones');

-- Permisos y Licencias
insert into permiso values (null, 'ROLE_Ver_permisos_y_licencias');
insert into permiso values (null, 'ROLE_Agregar_permisos_y_licencias');
insert into permiso values (null, 'ROLE_Editar_permisos_y_licencias');

-- Boleta de Pago
insert into permiso values (null, 'ROLE_Ver_boletas_de_pago');

-- Auditoría de Empleados
insert into permiso values (null, 'ROLE_Ver_auditoria_de_empleados');

-- Auditoría de Deducciones y Beneficios Globales
insert into permiso values (null, 'ROLE_Ver_auditoria_de_deducciones_y_beneficios_globales');

-- Auditoría de Deducciones y Beneficios de Empleados
insert into permiso values (null, 'ROLE_Ver_auditoria_de_deducciones_y_beneficios_de_empleados');

-- Planilla
insert into permiso values (null, 'ROLE_Ver_planilla');

-- Empleados
insert into permiso values (null, 'ROLE_Agregar_empleados');
insert into permiso values (null, 'ROLE_Editar_empleados');
insert into permiso values (null, 'ROLE_Cambiar_estado_empleados');

-- Puestos
insert into permiso values (null, 'ROLE_Agregar_puestos');
insert into permiso values (null, 'ROLE_Editar_puestos');
insert into permiso values (null, 'ROLE_Cambiar_estado_puestos');

-- Oficios
insert into permiso values (null, 'ROLE_Agregar_oficios');
insert into permiso values (null, 'ROLE_Editar_oficios');

-- Datos Empresa
insert into permiso values (null, 'ROLE_Ver_datos_empresa');
insert into permiso values (null, 'ROLE_Editar_datos_empresa');

-- Unidades
insert into permiso values (null, 'ROLE_Agregar_unidades');
insert into permiso values (null, 'ROLE_Editar_unidades');
insert into permiso values (null, 'ROLE_Cambiar_estado_unidades');

-- Presupuesto de Unidades
insert into permiso values (null, 'ROLE_Ver_presupuesto_de_unidades');
insert into permiso values (null, 'ROLE_Editar_presupuesto_de_unidades');

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
