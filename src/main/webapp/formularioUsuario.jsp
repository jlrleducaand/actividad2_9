<%@ page import="java.util.ArrayList" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Formulario Socio</title>
</head>
<body>
<h2>Introduzca los datos del nuevo cliente:</h2>
<td>
<form method="post" action="grabarUsuario.jsp">
    <label class="col-2">Usuario</label><input type="text" name="usuario" class="col-2"/></br>
    <label class="col-2">Password</label><input type="password" name="p1" class="col-2"/></br>
    <label class="col-2">Repita Password</label><input type="password" name="p2"/></br>
    <input type="submit" value="Aceptar" class="btn btn-primary m-2 col-4">
</form>
</td>
<table>
    <tr>
        <%//Errores
            ArrayList<String> errores = (ArrayList<String>) session.getAttribute("error");
            if(errores==null){
                out.println("");
            }else{
                for (String errore : errores) {
                    out.println("<td>" + errore + "</td>");
                }
            }
        %>
        <% session.removeAttribute("error"); %>
    </tr>
</table>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
