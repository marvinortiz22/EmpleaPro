<%@ include file="../base/head.jsp" %>
    <%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <style>
                span{
                    color:red;
                    display:flex;
                    justify-content:center;
                }

            </style>
        <title>Registro</title>
        </head>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-header">
                            <h3 class="text-center font-weight-light my-4">Registrarse</h3>
                        </div>
                        <div class="card-body">
                            <form:form modelAttribute="usuario" action="/registro" method="post">
                                <!--form:input class="form-control" path="rol.idRol" value="1" hidden="true"/-->
                                <div class="form-floating mb-3">
                                    <form:input class="form-control" path="username" required="true" />
                                    <label for="username">Nombre de usuario</label>
                                    <form:errors path="username"/>
                                </div>
                                <div class="form-floating mb-3">
                                    <form:input class="form-control" path="email" type="email" required="true" />
                                    <label for="email">Correo electrónico</label>
                                    <form:errors path="email"/>
                                </div>
                                <div class="form-floating mb-3">
                                    <form:input class="form-control" path="password" type="password"
                                        required="true"/>
                                    <label for="inputPassword">Contraseña</label>
                                    <form:errors path="password"/>
                                </div>
                                <div class="form-floating mb-3">
                                    <form:input class="form-control" type="password" path="password2" required="true" />
                                    <label for="inputPassword">Confirmar contraseña</label>
                                    <form:errors path="password2"/>
                                </div>

                                <div class="d-flex align-items-center justify-content-center mt-4 mb-0">
                                    <input type="submit" value="Ingresar" class="btn btn-primary" />
                                </div>
                            </form:form>
                        </div>
                        <div class="card-footer text-center py-3">
                            <div class="small"><a href="/login">Volver al login</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="../base/footer.jsp" %>