<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.ClienteDAOImpl" %>
<%@ page import="model.Cliente" %>
<%@ page import="java.util.Optional" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Title</title>
</head>
<body class="container">
<table><tr>
<form method="post" action="EditarClienteServlet">
    <%
        String codigo=request.getParameter("codigo");
        //usado para update.jsp
        //codigo=codigo==null? session.getAttribute("codigo").toString() :codigo;
        ClienteDAOImpl clienteDAO = new ClienteDAOImpl();
        int cod = Integer.parseInt(codigo);
    %>
    <input type="hidden" name="codigo" value="<%=codigo%>">
    <tr><th><label>Codigo: <%=codigo%></label></th></tr>
        <td><input type="text" name="nombre_completo" value="<%=clienteDAO.find(cod).get().getNombre_completo()%>"></td>
        <td><input type="text" name="direccion" value="<%=clienteDAO.find(cod).get().getDireccion()%>"></td>
        <td><input type="text" name="telefono" value="<%=clienteDAO.find(cod).get().getTelefono()%>"></td>
        <td><input type="date" name="fecha_nacimiento" value="<%=clienteDAO.find(cod).get().getFecha_nacimiento()%>"></td>
        <td><input type="submit" value="cambiar"></td>
        <td><a href="http://localhost:8080/actividad2_9_war_exploded/ListarClienteServlet">Volver</a></td>

</form>
</tr></table>
<table>
<tr>
    <%
        ArrayList<String> errores = (ArrayList<String>) request.getAttribute("error");
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
</body>
</html>
