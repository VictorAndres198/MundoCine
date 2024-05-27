<%-- 
    Document   : Suggestions
    Created on : 21 abr. 2024, 20:29:36
    Author     : Victor
--%>

<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="modelo.dto.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    String welcomeMessage = (customer != null) ? "Bienvenido " + customer.getUsuario() : "Iniciar sesión";
    boolean isLoggedIn = (customer != null);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sugerencias</title>
        <link href="resources/css/suggestions.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/home.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/piePagina.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/navbar.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>     
        <!-- ESTO ES EL NAVBAR -->
        <jsp:include page="components/navbar.jsp"/>
        <div style="display: flex;flex-direction: column; place-items: center">
        <div class="suggestions-principal-container">
        <div class="suggestionsUs">
            <div class="tittle">
                <h1>Sugerencias</h1>
            </div>
            <div class="mlps-header" style="margin: 12px 0px 24px 0px">
                <div class="mlps-h-b"></div>
                <div style="padding: 0px 0px 0px 12px">¡Estamos aquí para escucharte! Déjanos tu sugerencia.</div>
            </div>
            <!-- Formulario -->
            <div class="boxForm">
                <div class="suggestions form">
                    <h3>Envíanos tu sugerencia.</h3>
                    <form action="<%= request.getContextPath()%>/cntSuggestions" method="post" class="formulario" id="formSugerencias">
                        <div class ="form">
                            <div class="row50">
                                <div class="inputForm">
                                    <span>Nombre Completo</span>
                                    <input type="text" name="nombre" id="nombre"
                                           placeholder="Carla Soto">
                                    <span>Correo Electrónico</span>
                                    <input type="text" name="correo" id="correo"
                                           placeholder="carlas@gmail.com">
                                    <span>Asunto</span>
                                    <input type="text" name="asunto" id="asunto"
                                           placeholder="Mejora de ofertas..." value="${asunto}">
                                </div>
                                <div class="row100">
                                    <div class="inputForm">
                                        <span>Sugerencia</span>
                                        <textarea type="text" name="sugerencia" id="sugerencia"
                                                  placeholder="Escriba su sugerencia aquí..." value="${sugerencia}">
                                        </textarea>
                                    </div>
                                </div>
                                <div class="row100">
                                    <div class="inputForm">
                                        <input type="submit"  style="border-radius: 5px;" value="Enviar" name="accion">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- ESTO ES EL FOOTER -->
        <div style="width: 1280px;">
            <jsp:include page="components/footer.jsp"/>
        </div>
        </div>
        </div>
    </body>
</html>