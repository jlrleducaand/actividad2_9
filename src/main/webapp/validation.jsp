<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Acceso</title>
</head>
<body class="text-center">
    <%
        /*obtener los parametros*/
        String usuario=request.getParameter("usuario");
        String password=request.getParameter("password");
        //comprobar que no son nulos o vacios
        if (usuario!=null && password!=null && !usuario.isBlank() && !password.isBlank()){
            try{

                //conectar
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejercicio_2_9","root", "1234");
                Statement s = conexion.createStatement();
                //listar
                ResultSet listado = s.executeQuery ("SELECT * FROM usuario");
                //buscar
                boolean encontrado=false;
                while (listado.next()) {
                    if (usuario.equals(listado.getString ("usuario"))) {
                        if (!password.equals(listado.getString("contrasena"))) {
                            //contraseña incorrecta
                            session.setAttribute("error", "contraseña incorrecto");
                        }
                        encontrado=true;
                        //ya que usuario hay solo uno, una vez encontrado ya se puede salir, tambien se puede poner un && !encontrado en el while
                        break;
                    }
                }
                //si no encuentra envia el error
                if (!encontrado){
                    session.setAttribute("error","usuario incorrecto");
                }
            }catch (Exception e){
                session.setAttribute("error",e);
                e.printStackTrace();
            }
        }else{
            session.setAttribute("error","Campo vacío");
        }

        if (session.getAttribute("error") != null) {
            //Si hay algun error, osea que no hay ningun usuario y contraseñas correctas
            response.sendRedirect("index.jsp");
        }else{
            //si el usuario es admin
            if (usuario.equals("admin")){
                %>
                <h1>Control de Acceso</h1>
                <p>Tienes acceso al área de gestion de usuarios</p>
                <form action="admin.jsp">
                    <input type="submit" value="Aceptar" class="bg-primary">
                </form>
            <%
            }else{
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
</body>
</html>
