<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="estilos.css">
    <title>index - ejercicio2_9</title>
</head>
<body class="text-center">
<h1>Control de acceso1</h1>
<form action="validation.jsp">
    <label for="usuario"><i class="fas fa-user"></i></label>
    <input id="usuario" type="text" placeholder="usuario" name="usuario" value=""><br>
    <label for="password"><i class="fas fa-key"></i></label>
    <input id="password" type="password" placeholder="contraseña" name="password" value=""><br>
    <input class="bg-primary" type="submit" value="Aceptar" >
</form>
<%=
/*Errores*/
session.getAttribute("error") == null ?
        "" : session.getAttribute("error")
%>
<% session.removeAttribute("error"); %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>