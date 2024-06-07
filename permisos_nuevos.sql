use bad_proyecto;
DROP TABLE rol_permiso;
DROP TABLE permiso;
create table PERMISO
(
   IDPERMISO            int not null auto_increment,
   NOMBREPERMISO        VARCHAR(100) not null,
   primary key (IDPERMISO)
);
create table ROL_PERMISO
(
   IDPERMISO            int not null,
   IDROL                int not null,
   primary key (IDPERMISO, IDROL)
);
alter table ROL_PERMISO add constraint FK_TIENE_PERMISO foreign key (IDPERMISO)
      references PERMISO (IDPERMISO) on delete restrict on update restrict;

alter table ROL_PERMISO add constraint FK_TIENE_PERMISO2 foreign key (IDROL)
      references ROL (IDROL) on delete restrict on update restrict;


INSERT INTO permiso VALUES (NULL,"ROLE_Ver_puestos");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_profesiones_y_oficios");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_unidades");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_empleados");
insert into permiso values (null, 'ROLE_Ver_horas_trabajadas');
insert into permiso values (null, 'ROLE_Ver_permisos_y_licencias');
insert into permiso values (null, 'ROLE_Ver_vacaciones');
insert into permiso values (null, 'ROLE_Ver_contabilidad');
insert into permiso values (null, 'ROLE_Ver_planilla');
insert into permiso values (null, 'ROLE_Ver_boletas_de_pago');
insert into permiso values (null, 'ROLE_Ver_deducciones_y_beneficios_globales');
insert into permiso values (null, 'ROLE_Ver_deducciones_y_beneficios_de_empleados');
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_demografía_y_estado_civil");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_demografía");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_estados_civiles");
INSERT INTO permiso VALUES (NULL,"ROLE_Ver_auditoria");
insert into permiso values (null, 'ROLE_Ver_auditoria_de_empleados');
insert into permiso values (null, 'ROLE_Ver_auditoria_de_deducciones_y_beneficios_globales');
insert into permiso values (null, 'ROLE_Ver_auditoria_de_deducciones_y_beneficios_de_empleados');
insert into permiso VALUES (NULL,"ROLE_Administrador");

-- Editar,agregar,etc

-- Deducciones y Beneficios Globales

insert into permiso values (null, 'ROLE_Agregar_deducciones_y_beneficios_globales');
insert into permiso values (null, 'ROLE_Editar_deducciones_y_beneficios_globales');

-- Deducciones y Beneficios de Empleados

insert into permiso values (null, 'ROLE_Editar_deducciones_y_beneficios_de_empleados');

-- Horas Trabajadas
insert into permiso values (null, 'ROLE_Editar_horas_trabajadas');

-- Vacaciones

insert into permiso values (null, 'ROLE_Editar_vacaciones');

-- Permisos y Licencias

insert into permiso values (null, 'ROLE_Agregar_permisos_y_licencias');
insert into permiso values (null, 'ROLE_Editar_permisos_y_licencias');

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