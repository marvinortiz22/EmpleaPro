
    <%@ include file="base/head.jsp" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>Error de acceso</title>
    </head>
    <body>
    <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="alert alert-danger col-8 mt-5 text-center" role="alert">
                    Error en el servidor, algo salió mal
                    <hr>
                    <button class="btn btn-primary" onclick="history.back()">Regresar</button>
                  </div>
            </div>
        </div>
    </body>
    <%@ include file="base/footer.jsp" %>