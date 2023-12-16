<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Cliente" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Clientes</title>
</head>
<body class="container">
<h1 class="text-center">Gestibanko</h1>
<table>
    <tr class="text-center"><th>Codigo</th><th>Nombre</th><th>Direccion</th><th>Telefono</th><th>Fecha de Nacimiento</th>
    <th><form action="http://localhost:8080/actividad2_9_war_exploded/">
        <input type="submit" value="Salir" class="btn btn-primary ">
    </form></th></tr>

    <%//listar todos
        List<Cliente> listado = (List<Cliente>) request.getAttribute("listado");
        for (Cliente c:listado) {
            int id = c.getCliente_id();
            out.println("<tr><td>"+ id + "</td>");
            out.println("<td>" + c.getNombre_completo() + "</td>");
            out.println("<td>" + c.getDireccion() + "</td>");
            out.println("<td>" + c.getTelefono() + "</td>");
            out.println("<td>" + c.getFecha_nacimiento() + "</td>");
            //Editar y borrar
    %>
    <td>
    <form method="get" action="EditarClienteServlet">
        <input type="hidden" name="codigo" value="<%=id%>"/>
        <input type="submit" value="Editar">
    </form>
    </td>
    <td>
        <form method="post" action="BorrarClienteServlet">
            <input type="hidden" name="codigo" value="<%=id %>"/>
            <input type="submit" value="Borrar">
        </form>
    </td></tr>
    <%
    }
        //añadir cliente
    %>
    <form method="post" action="GrabarClienteServlet">
    <tr>
        <td><input type="number" name="codigo" placeholder="codigo"></td>
        <td><input type="text" name="nombre_completo" placeholder="nombre"></td>
        <td><input type="text" name="direccion" placeholder="direccion"></td>
        <td><input type="text" name="telefono" placeholder="telefono"></td>
        <td><input type="date" name="fecha_nacimiento" placeholder="fecha de nacim."></td>
        <td><input type="submit" value="Añadir"></td>
    </tr>
    </form>
    <tr>
        <%//errores de añadir
            ArrayList<String> errores = (ArrayList<String>) request.getAttribute("error");
            if(errores==null){
                out.println("");
            }else{
                for (String errore : errores) {
                    out.println("<td>" + errore + "</td>");
                }
            }
        %>
    </tr>
</table>
<table>
<form method="post" action="BuscarClienteServlet">
    <tr>
        <td><label>Nombre</label>   </td>
        <td><input type="text" name="nombre"></td>
        <td><input type="submit" value="buscar"></td>
    </tr>
</form>
</table>
<%//errores de buscar
    String error = (String)request.getAttribute("errorBuscar");
    if(error==null){
        out.println("");
    }else{
        out.println(error);
    }
%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
