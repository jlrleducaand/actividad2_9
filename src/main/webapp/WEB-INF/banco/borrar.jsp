<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //en desuso
    boolean valida = true;
    int codigo = -1;
    try {
        codigo = Integer.parseInt(request.getParameter("codigo"));
    } catch (NumberFormatException nfe) {
        nfe.printStackTrace();
        valida = false;
    }
    //delete
    if (valida) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ejercicio_2_9","user","1234");
            String sql = "DELETE FROM cliente WHERE cliente_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, codigo);
            int filasAfectadas = ps.executeUpdate();
            System.out.println("CLIENTE BORRADOS:  " + filasAfectadas);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try { ps.close(); } catch (Exception e) { /* Ignored */ }
            try { conn.close(); } catch (Exception e) { /* Ignored */ }
        }
    }
%>
<!-- REDIRECCIÓN POR JavaScript EN EL CLIENTE  -->
<script>document.location = "listado.jsp"</script>
</body>
</html>
