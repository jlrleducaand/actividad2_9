<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Control de acceso2</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="estilos.css">
    <title>Acceso</title>
</head>
<body class="text-center">
<%
    //Obtener los parametros
    String usuario = request.getParameter("usuario");
    String password = request.getParameter("password");

    //Comprobar que no son nulos o vacios
    if (usuario != null && password != null && !usuario.isBlank() && !password.isBlank()) {
        try {

            //Conectar con base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejercicio_2_9", "root", "1234");
            Statement statement = conexion.createStatement();

            //Listar resultado de la querry
            ResultSet listado = statement.executeQuery("SELECT * FROM usuario");

            //Buscar el usuario en el listado
            boolean encontradoUsuario = false;
            while (listado.next()) {
                if (usuario.equals(listado.getString("usuario"))) {
                    if (!password.equals(listado.getString("contrasena"))) {
                        //Error en la contraseña
                        session.setAttribute("error", "contraseña incorrecta");
                    }
                        encontradoUsuario = true;
                        //ya que usuario hay solo uno, una vez encontrado ya se puede salir,
                        // tambien se puede poner un && !encontrado en el while
                        break;
                    }

            }
            //Error en el usuario
            if (!encontradoUsuario) {
                session.setAttribute("error", "usuario incorrecto");
            }
        //Error al conectar con la  BBDD
        } catch (Exception e) {
            session.setAttribute("error", e);
            e.printStackTrace();
        }
    // Error en en campos de formulario enviado
    } else {
        session.setAttribute("error", "Campo vacío o null");
    }
    //Si hay algun error, osea que no hay ningun usuario y contraseñas correctas
    if (session.getAttribute("error") != null) {
        response.sendRedirect("index.jsp");

    } else {
        //si el usuario es admin
        if (usuario.equals("admin")) {
%>
<h1>Control de Acceso</h1>
<p>Acceso concedido a las áreas de gestion de Usuarios y de Clientes</p>

<form action="admin.jsp">
    <input id="usuario" type="text" name="usuario" value="<%= request.getParameter("usuario")%>" hidden>
    <input id="password" type="password" name="password" value="<%= request.getParameter("password")%>" hidden>
    <input type="submit" value="Gestion de Usuarios" class="btn btn-primary">
</form>
<form action="http://localhost:8080/actividad2_9_war_exploded/ListarClienteServlet">
    <input id="usuario" type="text" name="usuario" value="<%= request.getParameter("usuario")%>" hidden>
    <input id="password" type="password" name="password" value="<%= request.getParameter("password")%>" hidden>
    <input type="submit" value="Gestion de Clientes" class="btn btn-primary">
</form>
<form action="index.jsp">
    <input type="submit" value="Salir" class="btn btn-primary">
</form>
<%
} else {
    //si es un usuario normal
%>
<h1>Control de Acceso</h1>
<p>Acceso permitido a la aplicacion</p>
<form action="piramide.jsp">
    <input type="submit" value="Aceptar" class="bg-primary">
</form>
<%
        }
    }
%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
