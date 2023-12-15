<%@ page import="model.Cliente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalle</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="estilos.css" />
</head>
<body class="container">
<h1 class="text-center">Gestibank</h1>
<table class="container">
    <tr class="text-center"><th>Codigo</th><th>Nombre</th><th>Direccion</th><th>Telefono</th><th>Fecha de Nacimiento</th>

<% String nombreBuscado = request.getParameter("nombre");%>

    <th><form method="post" action="BuscarClienteServlet">
        <input type="text" name="nombre" hidden="true" value="<%=nombreBuscado%>" >
        <input type="submit" value="Volver">
    </form></th></tr>


    <tr>
    <%
        //obtener el cliente e mostrarlo
        Cliente c = (Cliente)request.getAttribute("cliente");
        out.println("<tr><td>"+ c.getCliente_id() + "</td>");
        out.println("<td>" + c.getNombre_completo() + "</td>");
        out.println("<td>" + c.getDireccion() + "</td>");
        out.println("<td>" + c.getTelefono() + "</td>");
        out.println("<td>" + c.getFecha_nacimiento() + "</td>");
    %>
        <td><form method="post" action="ListarClienteServlet">
            <input class="align-item-center" type="submit" value="Acceptar">
        </form></td>
   </tr>
</table>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
