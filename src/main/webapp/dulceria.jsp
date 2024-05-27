<%@page import="modelo.dto.itemDulceria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dulceria</title>
    </head>
    <body>
        <h1>Dulceria</h1>
        
        <% 
            List<itemDulceria> itemsDulceria = (List<itemDulceria>) request.getAttribute("itemsDulceria"); 
            if (itemsDulceria != null) {
                for (itemDulceria item : itemsDulceria) {
        %>
        <div class="container">
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
    </body>
</html>
