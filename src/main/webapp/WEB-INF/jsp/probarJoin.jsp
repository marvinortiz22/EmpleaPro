<%@ include file="base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>probar join</title>
<%@ include file="base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">probar join</h1>
        </div>

        <div class="card mb-4">

            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th>nombre rol</th>
                            <th>n de empleados</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="rol" items="${roles}">
                        <tr>
                        <td>${rol[0]}</td>
                        <td>${rol[1]}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<%@ include file="base/footer.jsp" %>
