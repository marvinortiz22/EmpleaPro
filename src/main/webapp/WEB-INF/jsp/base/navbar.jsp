<%@ page contentType="text/html" pageEncoding="UTF-8" %>

    </head>

    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#!"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                    class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Ver perfil</a></li>
                        <li><a class="dropdown-item" href="/datosEmpresa/listar">Ver información de empresa</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="/logout">Cerrar sesión</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <!----------------------------light/dark-------------------------------->
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <c:forEach var="permiso" items="${usuarioPermisos.permisos}">
                                <c:if test="${permiso.nombrePermiso=='ROLE_Ver_puestos'}">
                                    <a class="nav-link" href="#">
                                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                        Puestos
                                    </a>
                                </c:if>
                                <c:if test="${permiso.nombrePermiso=='ROLE_Ver_profesiones_y_oficios'}">
                                    <a class="nav-link" href="/oficios/listar">
                                        <div class="sb-nav-link-icon"><i class="fas fa-briefcase"></i></div>
                                        Profesiones y oficios
                                    </a>
                                </c:if>
                                <c:if test="${permiso.nombrePermiso=='ROLE_Ver_unidades'}">
                                    <a class="nav-link" href="/unidad/listar">
                                        <div class="sb-nav-link-icon"><i class="fas fa-sitemap"></i></div>
                                        Unidades
                                    </a>
                                </c:if>
                                <c:if test="${permiso.nombrePermiso=='ROLE_Ver_empleados'}">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                        data-bs-target="#collapseLayouts-empleados" aria-expanded="false"
                                        aria-controls="collapseLayouts">
                                        <div class="sb-nav-link-icon"><i class="fa-solid fa-user-group"></i></div>
                                        Empleados
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                        </div>
                                    </a>
                                </c:if>
                                <div class="collapse" id="collapseLayouts-empleados" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_empleados'}">
                                            <a class="nav-link" href="/empleado/listar">Ver empleados</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_horas_trabajadas'}">
                                            <a class="nav-link" href="#">Horas trabajadas</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_permisos_y_licencias'}">
                                            <a class="nav-link" href="#">Permisos y licencias</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_vacaciones'}">
                                            <a class="nav-link" href="#">Vacaciones</a>
                                        </c:if>
                                    </nav>
                                </div>
                                <c:if test="${permiso.nombrePermiso=='ROLE_Ver_contabilidad'}">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                        data-bs-target="#collapseLayouts-contabilidad" aria-expanded="false"
                                        aria-controls="collapseLayouts">
                                        <div class="sb-nav-link-icon"><i class="fa-solid fa-dollar-sign"></i></div>
                                        Contabilidad
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                        </div>
                                    </a>
                                </c:if>
                                <div class="collapse" id="collapseLayouts-contabilidad" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_planilla'}">
                                            <a class="nav-link" href="/contabilidad/planilla">Planilla</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_boletas_de_pago'}">
                                            <a class="nav-link" href="/contabilidad/listarEmpleados">Boletas de pago</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_deducciones_y_beneficios_globales'}">
                                            <a class="nav-link" href="#">Deducciones y beneficios generales</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_deducciones_y_beneficios_de_empleados'}">
                                            <a class="nav-link" href="#">Deducciones y beneficios por empleados</a>
                                        </c:if>
                                    </nav>
                                </div>
                                <c:if test="${permiso.nombrePermiso=='ROLE_Ver_demografía_y_estado_civil'}">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                        data-bs-target="#collapseLayouts-demografia" aria-expanded="false"
                                        aria-controls="collapseLayouts">
                                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                        Demografía y estado civil
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                        </div>
                                    </a>
                                </c:if>
                                <div class="collapse" id="collapseLayouts-demografia" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_demografía'}">
                                            <a class="nav-link" href="/demografia/departamentos">Departamentos y
                                                Municipios</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_estados_civiles'}">
                                            <a class="nav-link" href="#">Estados civiles</a>
                                        </c:if>
                                    </nav>
                                </div>
                                <c:if test="${permiso.nombrePermiso=='ROLE_Ver_auditoria'}">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                        data-bs-target="#collapseLayouts-auditoria" aria-expanded="false"
                                        aria-controls="collapseLayouts">
                                        <div class="sb-nav-link-icon"><i class="fa-solid fa-clock"></i></div>
                                        Auditoria
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                        </div>
                                    </a>
                                </c:if>
                                <div class="collapse" id="collapseLayouts-auditoria" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_auditoria_de_empleados'}">
                                            <a class="nav-link" href="/auditoria/empleados">Empleados</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_auditoria_de_deducciones_y_beneficios_globales'}">
                                            <a class="nav-link" href="#">Deducciones y beneficios globales</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Ver_auditoria_de_deducciones_y_beneficios_de_empleados'}">
                                            <a class="nav-link" href="#">Deducciones y beneficios por empleados</a>
                                        </c:if>
                                    </nav>
                                </div>
                                <c:if test="${permiso.nombrePermiso=='ROLE_Administrador'}">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                        data-bs-target="#collapseLayouts-seguridad" aria-expanded="false"
                                        aria-controls="collapsePages">
                                        <div class="sb-nav-link-icon"><i class="fas fa-lock"></i></div>
                                        Seguridad
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                        </div>
                                    </a>
                                </c:if>
                                <div class="collapse" id="collapseLayouts-seguridad" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Administrador'}">
                                            <a class="nav-link" href="/usuarioEjemplo/listar">Usuarios Ejemplo</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Administrador'}">
                                            <a class="nav-link" href="/usuario/listar">Usuarios Final</a>
                                        </c:if>
                                        <c:if test="${permiso.nombrePermiso=='ROLE_Administrador'}">
                                            <a class="nav-link" href="/rol/listar">Roles</a>
                                        </c:if>
                                    </nav>
                                </div>
                            </c:forEach>


                        </div>
                    </div>

                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <c:if test="${not empty alert}">
                        <div class="alert alert-${alert.type} mt-4 mx-4" role="alert">
                            ${alert.message}
                        </div>
                    </c:if>