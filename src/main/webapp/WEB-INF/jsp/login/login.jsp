<%@ include file="../base/head.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .span{
         color:red;
    }
</style>
<title>Iniciar sesión</title>
</head>
<div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Iniciar sesión</h3></div>
                                    <div class="card-body">
                                    <p class="span mb-3 text-center">${errorMessage}</p>
                                        <form:form action="/login" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="username" name="username" required/>
                                                <label for="username">Nombre de usuario</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" type="password" name="password" required/>
                                                <label for="inputPassword">Contraseña</label>
                                            </div>

                                            <div class="d-flex align-items-center justify-content-center mt-4 mb-0">
                                                <input type="submit" value="Ingresar" class="btn btn-primary"/>
                                            </div>
                                        </form:form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="/registro">Registrarse</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<%@ include file="../base/footer.jsp" %>
