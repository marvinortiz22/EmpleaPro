/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     27/3/2024 10:17:05 p.�m.                     */
/*==============================================================*/


drop table if exists DATOSEMPRESA;

drop table if exists DEPARTAMENTO;

drop table if exists EMPLEADO;

drop table if exists ESTADOCIVIL;

drop table if exists MUNICIPIO;

drop table if exists PERMISO;

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
   ESTADO               bool default true,
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
/* Table: PERMISO                                               */
/*==============================================================*/
create table PERMISO
(
   IDPERMISO            int not null auto_increment,
   NOMBREPERMISO        varchar(50) not null,
   primary key (IDPERMISO)
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
   ESTADO               bool default true,
   primary key (IDPUESTO)
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL
(
   IDROL                int not null auto_increment,
   NOMBREROL            varchar(25) not null,
   ESTADO               bool default true,
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
   ESTADO               bool default true,
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
   PASSWORD             varchar(255) not null,
   ESTADO               bool default true,
   INTENTOSLOGIN        int default 0,
   primary key (IDUSUARIO)
);

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

alter table MUNICIPIO add constraint FK_PERTENECE_A_DEPARTAMENTO foreign key (IDDEPARTAMENTO)
      references DEPARTAMENTO (IDDEPARTAMENTO) on delete restrict on update restrict;

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

INSERT INTO permiso VALUES (1,"ROLE_Ver_empleados");
INSERT INTO permiso VALUES (2,"ROLE_Ver_puestos");
INSERT INTO permiso VALUES (3,"ROLE_Ver_profesiones_y_oficios");
INSERT INTO permiso VALUES (4,"ROLE_Ver_unidades");
INSERT INTO permiso VALUES (5,"ROLE_Ver_demografía_y_estado_civil");
INSERT INTO permiso VALUES (6,"ROLE_Ver_departamentos");
INSERT INTO permiso VALUES (7,"ROLE_Ver_municipios");
INSERT INTO permiso VALUES (8,"ROLE_Ver_estados_civiles");
INSERT INTO permiso VALUES (9,"ROLE_Ver_seguridad");
INSERT INTO permiso VALUES (10,"ROLE_Ver_usuarios");
INSERT INTO permiso VALUES (11,"ROLE_Ver_roles");

INSERT INTO rol VALUES (1,"usuario",1);

INSERT INTO rol_permiso VALUES (1,1);
INSERT INTO rol_permiso VALUES (2,1);
INSERT INTO rol_permiso VALUES (3,1);
INSERT INTO rol_permiso VALUES (4,1);
INSERT INTO rol_permiso VALUES (5,1);
INSERT INTO rol_permiso VALUES (6,1);
INSERT INTO rol_permiso VALUES (7,1);
INSERT INTO rol_permiso VALUES (8,1);
INSERT INTO rol_permiso VALUES (9,1);
INSERT INTO rol_permiso VALUES (10,1);
INSERT INTO rol_permiso VALUES (11,1);

