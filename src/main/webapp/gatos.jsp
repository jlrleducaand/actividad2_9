
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gatos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


</head>
<body>
<style>
    td{
        width: 50px;
    }
    tr{
        height: 50px;
    }
    img{
        width: 50px;
        height: 50px;
    }
    table{
        display: flex;
        justify-content: center;
    }
</style>
<%
    try {
        //obtener la altura
        int number=Integer.parseInt(request.getParameter("numero"));
%>
<table>
        <%
        //alto
        for (int i = 0; i < number; i++) {
        %>
        <tr>
            <%
                //ancho
            for (int j = 1; j < number+i+1; j++) {
            %>
                <td>
                <%
                if (!(j+i-number<0)){
                %>
                  <img src="img/gato.jpg" >
                <%
                }
                %>
                </td>
            <%
            }
            %>
        </tr>
        <%
        }
        %>
<table>
<%
    }catch (Exception e){
        e.printStackTrace();
    }

%>
    <div class="d-flex justify-content-center">
    <a id="volver" href="index.jsp" class=" btn btn-primary">Volver</a>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
