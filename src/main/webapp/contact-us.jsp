<%-- 
    Document   : contacto
    Created on : 21 abr. 2024, 19:15:29
    Author     : ztomz
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
        <title>Contacto/Mundo Cine</title>
        <link href="resources/css/contact-us.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/home.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/piePagina.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/navbar.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>

        <jsp:include page="components/navbar.jsp"/>


        <div style="
             max-width: 1280px;
             width: 100%;
             height: auto;
             margin: auto;">

            <div class="contactUs">
                <div class="tittle">
                    <h1>Contáctanos</h1>
                </div>
                <div class="mlps-header" style="margin: 12px 0px 24px 0px">
                    <div class="mlps-h-b"></div>
                    <div style="padding: 0px 0px 0px 12px">¡Estamos aquí para escucharte! Ponte en contacto con nosotros y déjanos saber cómo podemos ayudarte.</div>
                </div>
                <div class="box">
                    <!-- Formulario -->
                    <div class="contact form">
                        <h3>Envíanos un mensaje.</h3>
                        <form action="<%= request.getContextPath()%>/cntContact" method="post" class="formulario" id="formContacto">
                            <div class="formBox">
                                <div class="row50">
                                    <div class="inputBox">
                                        <span>Nombre Completo</span>
                                        <input type="text" name="nombre" id="nombre"
                                               placeholder="Carla Soto" value="${nombre}">
                                    </div>

                                    <div class="row50">
                                        <div class="inputBox">
                                            <span>Correo Electrónico</span>
                                            <input type="text" name="correo" id="correo"
                                                   placeholder="carlas@gmail.com" value="${correo}">
                                        </div>
                                        <div class="inputBox">
                                            <span>Teléfono</span>
                                            <input type="text" name="telefono" id="telefono"
                                                   placeholder="+51990215364" value="${telefono}">
                                        </div>
                                    </div>

                                    <div class="row100">
                                        <div class="inputBox">
                                            <span>Mensaje</span>
                                            <textarea type="text" name="mensaje" id="mensaje"
                                                      placeholder="Escriba su mensaje aquí..." value="${mensaje}"></textarea>
                                        </div>
                                    </div>

                                    <div class="row100">
                                        <div class="inputBox">
                                            <input type="submit"  style="border-radius: 5px;" value="Enviar" name="accion">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>


                    <!-- <Información -->
                    <div class="contact info" style="border-radius: 5px;">
                        <h3>Información de contacto</h3>
                        <div class="infoBox">
                            <div>
                                <span><ion-icon name="location"></ion-icon></span>
                                <p>Mega Plaza <br>Perú</p>
                            </div>
                            <div>
                                <span><ion-icon name="mail"></ion-icon></span>
                                <a href="mailto:mundocine@gmail.com">mundocine@gmail.com</a>
                            </div>
                            <div>
                                <span><ion-icon name="call"></ion-icon></span>
                                <a href="tel:+51928238009">+51 928 238 009</a>
                            </div>
                            <!-- social media link -->
                            <ul class="sci">
                                <li><a href="#"><ion-icon name="logo-facebook"></ion-icon></a></li>
                                <li><a href="#"><ion-icon name="logo-twitter"></ion-icon></a></li>
                                <li><a href="#"><ion-icon name="logo-linkedin"></ion-icon></a></li>
                                <li><a href="#"><ion-icon name="logo-instagram"></ion-icon></a></li>
                            </ul>
                        </div>
                    </div>


                    <!-- Mapa -->
                    <div class="contact map" style="border-radius: 5px;">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d213048.8542996019!2d-70.98739590546874!3d-33.4522153!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9662c4f7ec05471f%3A0xa5e94f358ef42c6d!2sCinemundo!5e0!3m2!1ses-419!2spe!4v1713747129319!5m2!1ses-419!2spe"
                                style="border:0;border-radius: 5px;"
                                allowfullscreen=""
                                loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade">          
                        </iframe>
                    </div>
                </div>
            </div>

            <script  type = "module"  src = "https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js" ></script> 
            <script  nomodule  src = "https://unpkg .com/ionicons@7.1.0/dist/ionicons/ionicons.js" ></script> 
            
            
            <jsp:include page="components/footer.jsp"/>
            
            
        </div>
    </body>
</html>
