<!DOCTYPE html>

<head>
    <title>Spring Security Example </title>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
</head>
<body>

<form:form action="/login" method="post">
    <div><label> User Name : </label><input type="text" name="username" value=""/> </div>
    <div><label> Password:</label> <input type="password" name="password" value=""/> </div>
    <div><input type="submit" value="Sign In"/></div>
</form:form>
<a href="/usuario/agregar">No tienes un usuario? crealo</a>
</body>
</html>