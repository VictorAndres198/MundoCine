<%@page import="modelo.dto.itemDulceria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="resources/css/dulceria.css" rel="stylesheet" type="text/css"/>
       <link href="resources/css/navbar.css" rel="stylesheet" type="text/css"/>
       <link href="resources/css/piePagina.css" rel="stylesheet" type="text/css"/>
        <title>Dulceria</title>
    </head>
    <body>
                <!-- ESTO ES EL NAVBAR -->
        <jsp:include page="components/navbar.jsp"/>
        <div class="container-principal">
        <div class="Container">
            <h1>Dulceria</h1>

            <% 
                List<itemDulceria> itemsDulceria = (List<itemDulceria>) request.getAttribute("itemsDulceria"); 
                if (itemsDulceria != null) {
                    for (itemDulceria item : itemsDulceria) {
            %>
            <div class="content">
                <h3><%= item.getNombre() %></h3>
                <span><%= item.getCategoria().getNombre() %></span>
                <p><%= item.getDescripcion() %></p>
                <span><%= item.getPrecio() %></span>
            </div>

            <% 
                    } 
                }
            %>

            <form action="/MundoCine/CompraDulceria" method="POST">
                <button type="submit">Enviar</button>
            </form>
        </div>
        
        <jsp:include page="components/footer.jsp"/>
        
        </div>
    </body>
</html>
