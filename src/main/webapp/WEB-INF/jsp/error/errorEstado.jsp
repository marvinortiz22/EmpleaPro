
    <%@ include file="../base/head.jsp" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <title>Error de estado</title>
    </head>
    <body>
    <div class="container">
                <div class="row d-flex justify-content-center mt-5">
                    <div class="alert alert-danger col-8 mt-5 text-center" role="alert">
                        <c:if test="${usuario.solicitoDesbloqueo}">
                            Se ha enviado un correo electrónico para solicitar su desbloqueo
                            <hr>
                            <button class="btn btn-primary" onclick="history.back()">Regresar</button>
                        </c:if>
                        <c:if test="${!usuario.solicitoDesbloqueo}">
                        Lamentablemente este usuario ha sido bloqueado, si lo desea puede solicitar su desbloqueo enviando un correo electrónico
                        <hr>
                        <a href="/solicitarDesbloqueo?id=${usuario.idUsuario}"><button class="btn btn-primary">Enviar correo</button></a>
                        </c:if>
                      </div>
                </div>
            </div>
    </body>
    <%@ include file="../base/footer.jsp" %>