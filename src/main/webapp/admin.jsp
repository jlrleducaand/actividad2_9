<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Gestión de Usuarios</title>
</head>
<body>
<h1 class="text-center">Gestión de Usuarios</h1>
<%
    Connection conexion=null;
    Statement s=null;
    ResultSet rs =null;

    try{
        //conexion
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejercicio_2_9","root", "1234");
        s = conexion.createStatement();
        //listar
        rs = s.executeQuery ("SELECT * FROM usuario");
%>
<table class="container">
    <tr><th class="text-center">Usuario</th><th class="text-center">Contraseña</th>
        <th class="text-center"><form action="formularioUsuario.jsp">
            <input type="submit" value="Añadir Usuario" class="btn btn-primary">
        </form></th>
        <th class="text-center"><form action="validation.jsp">
            <input type="submit" value="Volver a Usuarios" class="btn btn-primary">
        </form></th>
    </tr>
    <%
        //imprimir
        while (rs.next()) {
            out.println("<tr><td>"+ rs.getString("usuario") + "</td>");
            out.println("<td>" + rs.getString("contrasena") + "</td>");
            //si es admin no tendra la opcion de borrar
            if (!rs.getString("usuario").equals("admin")){
    %>
        <td>
        <form method="get" action="borrarUsuario.jsp">
            <input type="hidden" name="codigo" value="<%=rs.getString("usuario") %>"/>
            <input type="submit" value="borrar">
        </form>
        </td>
    <%}%>
    </tr>
    <%
        }
            conexion.close();
            s.close();
            rs.close();
        }catch (Exception e){
            out.println("Error");
        }  finally {
            try {
                conexion.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                s.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                rs.close();
            } catch (Exception e) { /* Ignored */ }
        }
    %>
</table>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
