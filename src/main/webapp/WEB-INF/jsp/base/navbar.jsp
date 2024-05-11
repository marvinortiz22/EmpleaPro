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
                            <li><a class="dropdown-item" href="#!">Ver información de empresa</a></li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>
                            <li><a class="dropdown-item" href="#!">Cerrar sesión</a></li>
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
                                    <c:if test="${permiso.nombrePermiso=='ROLE_Ver_empleados'}">
                                        <a class="nav-link" href="#">
                                            <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                            Empleados
                                        </a>
                                    </c:if>
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
                                        <a class="nav-link" href="#">
                                            <div class="sb-nav-link-icon"><i class="fas fa-sitemap"></i></div>
                                            Unidades
                                        </a>
                                    </c:if>
                                    <c:if test="${permiso.nombrePermiso=='ROLE_Ver_demografía_y_estado_civil'}">
                                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                            data-bs-target="#collapseLayouts" aria-expanded="false"
                                            aria-controls="collapseLayouts">
                                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                            Demografía y estado civil
                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                            </div>
                                        </a>
                                    </c:if>
                                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                                        data-bs-parent="#sidenavAccordion">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <c:if test="${permiso.nombrePermiso=='ROLE_Ver_departamentos'}">
                                                <a class="nav-link" href="/demografia/departamentos">Departamentos y Municipios</a>
                                            </c:if>
                                            <c:if test="${permiso.nombrePermiso=='ROLE_Ver_estados_civiles'}">
                                                <a class="nav-link" href="#">Estados civiles</a>
                                            </c:if>
                                        </nav>
                                    </div>
                                    <c:if test="${permiso.nombrePermiso=='ROLE_Ver_seguridad'}">
                                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                            data-bs-target="#collapsePages" aria-expanded="false"
                                            aria-controls="collapsePages">
                                            <div class="sb-nav-link-icon"><i class="fas fa-lock"></i></div>
                                            Seguridad
                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                            </div>
                                        </a>
                                    </c:if>
                                    <div class="collapse" id="collapsePages" aria-labelledby="headingOne"
                                        data-bs-parent="#sidenavAccordion">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <c:if test="${permiso.nombrePermiso=='ROLE_Ver_usuarios'}">
                                                <a class="nav-link" href="/usuarioEjemplo/listar">Usuarios Ejemplo</a>
                                            </c:if>
                                            <c:if test="${permiso.nombrePermiso=='ROLE_Ver_usuarios'}">
                                                <a class="nav-link" href="/usuario/listar">Usuarios Final</a>
                                            </c:if>
                                            <c:if test="${permiso.nombrePermiso=='ROLE_Ver_roles'}">
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