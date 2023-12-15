<%@ page import="model.Cliente" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Buscar</title>
</head>
<body class="container">
<h1 class="text-center">Gestibanko</h1>
<table class="container">
    <tr class="text-center">
        <th>Nombre</th>
        <th><a href="http://localhost:8080/actividad2_9_war_exploded/ListarClienteServlet" class="p-2">Volver</a></th>
    </tr>
    <tr>
    <%
        //obtener la lista de los clientes encontrado
        List<Cliente> listado = (List<Cliente>) request.getAttribute("cliente");
        for (Cliente c:listado) {
            //imprimir el nombre y pasar la id
            //(si paso directamente el objeto se convierte en String seria mas facil pasar la id e econtrarlo en vez que crearlo segun esa cadena)
            out.println("<td>" + c.getNombre_completo() + "</td>");
    %>
    <td>
        <form method="get" action="BuscarClienteServlet">
            <input type="hidden" name="codigo" value="<%=c.getCliente_id()%>"/>
            <input type="submit" value="Detalle">

        </form>
    </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
