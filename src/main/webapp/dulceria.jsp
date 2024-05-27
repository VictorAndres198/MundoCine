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
        <div class="container">
            <div class="container-title">
                <h1>Dulceria</h1>
            </div>
            <div class="container-info">
                <span>Local</span>
            </div>
            <div class="container-item-type">
                <span>Combos</span>
                <span>Canchita</span>
                <span>Bebidas</span>
                <span>Golosinas</span>
            </div>
            <div class="container-items">

                <% 
                    List<itemDulceria> itemsDulceria = (List<itemDulceria>) request.getAttribute("itemsDulceria"); 
                    if (itemsDulceria != null) {
                        for (itemDulceria item : itemsDulceria) {
                %>
                <div class="content">
                    <div class="item-img"><img src="" alt="Contenido Img"></div>
                    <h3><%= item.getNombre() %></h3>
                    <span><%= item.getCategoria().getNombre() %></span>
                    <p><%= item.getDescripcion() %></p>
                    <span class="price"><%= item.getPrecio() %></span>
                    <button class="amount-less" ><span>-</span></button>
                    <span class="amount">0</span>
                    <button class="amount-plus" ><span>+</span></button>
                </div>

                <% 
                        } 
                    }
                %>

            </div>
            <form action="/MundoCine/CompraDulceria" method="GET">
                
                <button class="container-item-btn" type="submit">> Enviar</button>
            </form>
                
        </div>
        <jsp:include page="components/footer.jsp"/>
    </div>
        <script src="components/DulceriaItems.js" type="text/javascript"></script>
        
    </body>
</html>
