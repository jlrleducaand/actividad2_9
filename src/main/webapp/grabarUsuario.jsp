
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.Objects" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.DriverManager" %>

    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <title>Grabar</title>
    </head>
    <body>
    <%
    String usuario =null;
    String p1 = null;
    String p2 = null;
    ArrayList<String> errores=new ArrayList<>();
    //comprobaciones de los parametros
    try{
        Objects.requireNonNull(request.getParameter("usuario"));
        if (request.getParameter("usuario").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        usuario = request.getParameter("usuario");
    }catch (NullPointerException e){
        errores.add("usuario no puede ser nulo");
    }catch (RuntimeException e){
        errores.add("usuario no puede estar vacío");
    }
    try{
        Objects.requireNonNull(request.getParameter("p1"));
        Objects.requireNonNull(request.getParameter("p2"));
        if (request.getParameter("p1").isBlank() || request.getParameter("p2").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        p1 = request.getParameter("p1");
        p2 = request.getParameter("p2");
    }catch (NullPointerException e){
        errores.add("Contraseña no puede ser nulo");
    }catch (RuntimeException e){
        errores.add("Contraseña no puede estar vacío");
    }

    //si los parametros valen
    if (errores.isEmpty()) {
        //comprobar contraseña
        if (!p1.equals(p2)){
            errores.add("Contraseñas no iguales");
            session.setAttribute("error", errores);
            response.sendRedirect("formularioUsuario.jsp");
        }else{
            //conextion
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejercicio_2_9", "root", "1234");
                //insert
                String sql = "INSERT INTO usuario VALUES ( " +
                        "?, " + //usuario
                        "?)"; //contrasena
                ps = conn.prepareStatement(sql);
                int idx = 1;
                ps.setString(idx++, usuario);
                ps.setString(idx++, p1);
                int filasAfectadas = ps.executeUpdate();

                System.out.println("SOCIOS GRABADOS:  " + filasAfectadas);
                response.sendRedirect("admin.jsp");
            } catch (Exception ex) {
                //no se ha podido insertar
                errores.add("Error insertar");
                session.setAttribute("error", errores);
                response.sendRedirect("formularioUsuario.jsp");
            } finally {
                try {
                    ps.close();
                } catch (Exception e) { /* Ignored */ }
                try {
                    conn.close();
                } catch (Exception e) { /* Ignored */ }
            }
        }
    } else {
        session.setAttribute("error", errores);
        response.sendRedirect("formularioUsuario.jsp");
    }
%>

</body>
</html>
