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
        <title>Navbar</title>
        <script>
            window.addEventListener('click', function (event) {
                var dropdownMenu = document.getElementById("dropdown-navbar-menu");
                var toggleButton = document.getElementById("togglebtn-dropdown");
                var toggleButton2 = document.getElementById("togglebtn-dropdown2");
                var toggleButtonIcon = document.getElementById("togglebtn-icon");
                // Verificar si el clic no fue dentro del menú ni en el botón de alternancia
                if (!dropdownMenu.contains(event.target) && event.target !== toggleButton && event.target !== toggleButton2 && event.target !== toggleButtonIcon) {
                    dropdownMenu.classList.remove("show"); // Ocultar el menú
                }
            });

            function toggleMenu() {
                var dropdownMenu = document.getElementById("dropdown-navbar-menu");
                dropdownMenu.classList.toggle("show"); // Agregar o eliminar la clase "show"
            }
            function redirigirHome() {
                // Redirigir a la página deseada
                window.location.href = "home.jsp";
            }
            function redirigirHelpCenter() {
                // Redirigir a la página deseada
                window.location.href = "HelpCenter.jsp";
            }
            function redirigirSuggestions() {
                // Redirigir a la página deseada
                window.location.href = "suggestions.jsp";
            }
            function redirigirContactUs() {
                // Redirigir a la página deseada
                window.location.href = "contact-us.jsp";
            }
            
            function redirigirReclamos() {
                // Redirigir a la página deseada
                window.location.href = "claims.jsp";
            }           
            
        </script>
    </head>
    <body><!-- ESTO ES EL NAVBAR -->
        <div class="navbar">
            <div class="container-options">
                <div class="options">
                    <diV style="display: flex; flex-direction: row; gap: 24px; width: 90%;">
                        <div style="display: grid; place-items: center; width: fit-content; height: 36px">                        
                            <button onclick="redirigirHome()" style='display: flex; place-items: center; background: #16B3D6;
                                    font-weight: bold; font-size: 1.5rem; border: transparent;
                                    border-radius: 4px; cursor: pointer; height: 32px; padding: 0px 10px;
                                    font-size: 1.25rem;'>
                                MundoCine
                            </button>                        
                        </div>

                        <div id="btn-menu-container">
                            <button id="togglebtn-dropdown" class="btnnavbar btn-color" onclick="toggleMenu()">
                                <div id="togglebtn-dropdown2" style="display: flex; flex-direction: row; place-items: center; padding: 0px 16px; cursor: pointer;">
                                    <svg id="togglebtn-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" alt="menu barras icono" style="display: grid; place-items: center; padding-right: 10px">
                                        <g id="SVGRepo_bgCarrier" stroke-width="0"/>
                                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>
                                        <g id="SVGRepo_iconCarrier"> <path d="M4 7H20M4 12H20M4 17H20" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/> </g>
                                    </svg>
                                    Menú
                                </div>
                            </button> 
                            <div id="dropdown-navbar-menu"> 
                                <div class="dropdown-btn-option" onclick="redirigirHome()">
                                    <svg class="svg-btndropdown" style="pointer-events: none; height: 24px; width: 24px; margin: 0px 12px 0px 0px;stroke-width:1.5px;" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g clip-path="url(#clip0_15_3)"> <rect width="24" height="24" fill="transparent"></rect> <path d="M9 21H4C3.44772 21 3 20.5523 3 20V12.4142C3 12.149 3.10536 11.8946 3.29289 11.7071L11.2929 3.70711C11.6834 3.31658 12.3166 3.31658 12.7071 3.70711L20.7071 11.7071C20.8946 11.8946 21 12.149 21 12.4142V20C21 20.5523 20.5523 21 20 21H15M9 21H15M9 21V15C9 14.4477 9.44772 14 10 14H14C14.5523 14 15 14.4477 15 15V21" stroke="#B3B3B3" stroke-linejoin="round"></path> </g> <defs> <clipPath id="clip0_15_3"> <rect width="24" height="24" fill=" "></rect> </clipPath> </defs> </g></svg>
                                    <div style="height: fit-content;pointer-events: none;">Inicio</div>
                                </div>

                                <!-- style="height: 24px; width: 24px; margin: 0px 12px 0px 0px;stroke-width:1.5px" -->
                                <!-- #B3B3B3 -->

                                <div class="dropdown-btn-option" onclick="redirigirHelpCenter()">
                                    <svg class="svg-btndropdown" style="height: 24px; width: 24px; margin: 0px 12px 0px 0px;stroke-width:1.5px;pointer-events: none;" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <circle class="circle-svg-questionsbtn" cx="12" cy="12" r="10" stroke="#B3B3B3" stroke-width="1.5"></circle> <path d="M10.125 8.875C10.125 7.83947 10.9645 7 12 7C13.0355 7 13.875 7.83947 13.875 8.875C13.875 9.56245 13.505 10.1635 12.9534 10.4899C12.478 10.7711 12 11.1977 12 11.75V13" stroke="#B3B3B3" stroke-width="1.5" stroke-linecap="round"></path> <circle class="svg-questioningpoint" cx="12" cy="16" r="1" fill="#B3B3B3"></circle> </g></svg>
                                    <div style="height: fit-content;pointer-events: none;">Preguntas Frecuentes</div>
                                </div>

                                <div class="dropdown-btn-option" onclick="redirigirContactUs()">
                                    <svg class="svg-contactus" style="height: 24px; width: 24px; margin: 0px 12px 0px 0px;stroke-width:1.5px;pointer-events: none;" fill="#B3B3B3" version="1.1" id="XMLID_276_" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 24 24" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g id="contact-us"> <g> <path d="M4,24v-5H0V0h23v19h-9.3L4,24z M2,17h4v3.7l7.3-3.7H21V2H2V17z"></path> </g> <g> <rect x="5" y="8" width="3" height="3"></rect> </g> <g> <rect x="10" y="8" width="3" height="3"></rect> </g> <g> <rect x="15" y="8" width="3" height="3"></rect> </g> </g> </g></svg>
                                    <div style="height: fit-content;pointer-events: none;">Contáctenos</div>
                                </div>
                                
                                <div class="dropdown-btn-option" onclick="redirigirSuggestions()">
                                    <svg class="svg-suggest" style="height: 24px; width: 24px; margin: 0px 12px 0px 0px;pointer-events: none;" version="1.1" id="IDEA" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="186px" height="186px" viewBox="0 0 1800.00 1800.00" enable-background="new 0 0 1800 1800" xml:space="preserve" fill="#B3B3B3" stroke="#B3B3B3" stroke-width="27"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC" stroke-width="3.6"></g><g id="SVGRepo_iconCarrier"> <g> <path fill="#B3B3B3" d="M900.114,54.882c-329.509,0-597.583,268.077-597.583,597.59c0,219.592,118.159,418.518,309.714,523.794 v152.835h-0.127v122.121h-0.172v185.238h172.682c3.58,60.518,53.924,108.656,115.315,108.656 c61.39,0,111.736-48.139,115.31-108.656h172.571v-122.122h0.177v-185.237h-0.019v-152.835 c191.557-105.276,309.715-304.203,309.715-523.794C1497.697,322.959,1229.623,54.882,900.114,54.882z M675.235,1392.218h449.649 v59.005H675.235V1392.218z M899.943,1682.002c-29.441,0-48.627-22.507-51.876-45.541h103.788 C948.464,1662.119,926.504,1682.002,899.943,1682.002z M1124.708,1573.344H675.063v-59.005h449.645V1573.344z M1142.116,1129.132 l-17.25,8.778v189.457H931.559V861l187.201-187.21c12.323-12.323,12.323-32.302-0.005-44.63 c-12.318-12.318-32.302-12.323-44.629,0.004L900,803.299L725.875,629.165c-12.323-12.323-32.307-12.328-44.63-0.004 c-12.328,12.328-12.328,32.307-0.005,44.63L868.441,861v466.367H675.362V1137.91l-17.249-8.778 c-180.4-91.778-292.465-274.427-292.465-476.66c0-294.71,239.761-534.471,534.466-534.471 c294.706,0,534.466,239.761,534.466,534.471C1434.58,854.705,1322.516,1037.354,1142.116,1129.132z"></path> <path fill="#B3B3B3" d="M1066.667,246.225c-17.43,0-31.558,14.128-31.558,31.559s14.128,31.558,31.558,31.558 c49.641,0,165.99,59.634,165.99,175.279c0,17.431,14.128,31.559,31.558,31.559c17.431,0,31.559-14.128,31.559-31.559 C1295.773,328.101,1146.624,246.225,1066.667,246.225z"></path> <path fill="#B3B3B3" d="M209.331,712.881c0-17.43-14.128-31.558-31.558-31.558H34.686c-17.43,0-31.558,14.128-31.558,31.558 s14.128,31.558,31.558,31.558h143.087C195.203,744.439,209.331,730.312,209.331,712.881z"></path> <path fill="#B3B3B3" d="M220.157,300.096c6.164,6.163,14.239,9.245,22.317,9.245c8.075,0,16.153-3.082,22.313-9.241 c12.328-12.328,12.328-32.307,0.004-44.629L163.623,154.297c-12.318-12.319-32.303-12.323-44.63-0.004 c-12.327,12.327-12.327,32.307-0.004,44.63L220.157,300.096z"></path> <path fill="#B3B3B3" d="M220.17,1125.662l-101.178,101.174c-12.327,12.327-12.327,32.307-0.004,44.634 c6.164,6.164,14.238,9.246,22.317,9.246c8.074,0,16.153-3.082,22.312-9.246l101.179-101.173 c12.327-12.327,12.327-32.307,0.004-44.625C252.478,1113.344,232.493,1113.344,220.17,1125.662z"></path> <path fill="#B3B3B3" d="M1765.314,681.323h-143.083c-17.43,0-31.559,14.128-31.559,31.558s14.129,31.558,31.559,31.558h143.083 c17.43,0,31.558-14.128,31.558-31.558S1782.744,681.323,1765.314,681.323z"></path> <path fill="#B3B3B3" d="M1557.521,309.341c8.074,0,16.153-3.082,22.316-9.241l101.174-101.173 c12.322-12.327,12.322-32.307,0-44.634c-12.328-12.319-32.307-12.319-44.635,0l-101.173,101.173 c-12.323,12.328-12.323,32.307,0,44.634C1541.368,306.259,1549.447,309.341,1557.521,309.341z"></path> <path fill="#B3B3B3" d="M1579.829,1125.662c-12.318-12.318-32.302-12.318-44.63,0.01c-12.323,12.318-12.323,32.298,0.005,44.625 l101.178,101.173c6.159,6.164,14.238,9.246,22.312,9.246c8.075,0,16.154-3.082,22.318-9.246 c12.322-12.327,12.322-32.307-0.005-44.634L1579.829,1125.662z"></path> </g> </g></svg>
                                    <div style="height: fit-content;pointer-events: none;">Sugerencias</div>
                                </div>    
                                
                                <div class="dropdown-btn-option" onclick="redirigirReclamos()">
                                    <svg class="svg-suggest" style="height: 24px; width: 24px; margin: 0px 12px 0px 0px;pointer-events: none;" fill="#b3b3b3" height="200px" width="200px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 386.187 386.187" xml:space="preserve" stroke="#b3b3b3"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M48.626,131.93c0.418,4.952,4.745,8.635,9.723,8.215c0.327-0.028,0.647-0.072,0.963-0.133 c6.549,36.481,38.521,64.251,76.858,64.251s70.31-27.77,76.858-64.251c0.314,0.061,0.635,0.104,0.961,0.133 c4.965,0.416,9.307-3.261,9.724-8.214l1.171-13.919c0.416-4.953-3.262-9.307-8.214-9.724c-1.532-0.128-3.003,0.134-4.319,0.703 c-3.458-15.338-11.44-28.979-22.469-39.443c-0.032-0.036-0.064-0.071-0.098-0.106c-0.34-0.366-0.703-0.697-1.085-0.993 c-13.88-12.643-32.32-20.358-52.529-20.358c-37.154,0-68.331,26.084-76.181,60.901c-1.315-0.569-2.78-0.83-4.318-0.703 c-4.953,0.417-8.631,4.77-8.215,9.723L48.626,131.93z M136.17,66.09c11.915,0,23.03,3.485,32.381,9.491 c-9.601,6.155-20.789,9.466-32.381,9.466c-5.385,0-10.727-0.713-15.876-2.119c-4.79-1.311-9.743,1.517-11.053,6.313 c-1.309,4.795,1.518,9.743,6.313,11.053c6.693,1.827,13.63,2.754,20.616,2.754c16.78,0,32.907-5.337,46.26-15.176 c8.633,10.406,13.826,23.759,13.826,38.305c0,33.132-26.954,60.087-60.086,60.087s-60.086-26.955-60.086-60.087 S103.039,66.09,136.17,66.09z M144.559,124c0-4.971,4.029-9,9-9h10.001c4.971,0,9,4.029,9,9s-4.029,9-9,9h-10.001 C148.588,133,144.559,128.971,144.559,124z M133.671,151h4.998c4.971,0,9,4.029,9,9s-4.029,9-9,9h-4.998c-4.971,0-9-4.029-9-9 S128.701,151,133.671,151z M100.263,124c0-4.971,4.029-9,9-9h10c4.971,0,9,4.029,9,9s-4.029,9-9,9h-10 C104.292,133,100.263,128.971,100.263,124z M291.887,92.778c0.04,4.971-3.956,9.222-8.927,9.222c-0.025,0-0.05,0-0.075,0 c-4.937,0-8.958-4.13-8.998-9.076c-0.079-9.746,7.034-15.867,12.749-20.666c4.485-3.767,7.426-6.417,7.426-8.842 c0-4.91-3.993-8.904-8.902-8.904c-4.913,0-8.906,3.994-8.906,8.904c0,4.971-4.029,9-9,9s-9-4.029-9-9 c0-14.835,12.068-26.904,26.902-26.904c14.838,0,26.906,12.069,26.906,26.904c0,10.997-8.006,17.719-13.852,22.627 C295.998,87.902,291.876,91.511,291.887,92.778z M260.624,376.292c0.134,1.157,0.039,2.295-0.254,3.372 c-0.241,0.891-0.615,1.717-1.1,2.475c-0.002,0.003-0.004-0.014-0.007-0.01c-1.071,1.676-2.695,2.961-4.69,3.635 c-0.291,0.099-0.587,0.103-0.89,0.171c-0.765,0.176-1.533,0.064-2.278,0.064h-75.252c-4.971,0-9-4.029-9-9s4.029-9,9-9h64.078 l-23.773-97.646c-3.654-15.023-22.957-27.718-43.359-29.327c-6.951,11.05-21.069,18.31-36.688,18.31s-29.736-7.32-36.688-18.37 c-20.402,1.609-39.705,14.374-43.357,29.397L32.591,368h64.076c4.971,0,9,4.029,9,9s-4.029,9-9,9h-75.25 c-0.09,0-0.179,0.164-0.27,0.164c-0.663,0-1.336,0.085-2.01-0.068c-0.304-0.069-0.603-0.152-0.894-0.252 c-1.979-0.67-3.595-1.98-4.665-3.639c-0.508-0.785-0.897-1.65-1.142-2.578c-0.277-1.048-0.369-2.149-0.244-3.272 c0.05-0.466,0.136-0.905,0.254-1.346l26.428-108.676C44.791,241.999,73.396,223,103.997,223h1.237c3.845,0,7.265,2.395,8.513,6.032 c2.119,6.173,10.584,12.376,22.664,12.376s20.545-6.218,22.664-12.391c1.248-3.637,4.668-6.017,8.513-6.017h1.236 c30.6,0,59.205,18.999,65.124,43.332l26.428,108.65C260.49,375.409,260.573,375.843,260.624,376.292z M291.991,118.74 c0,4.971-4.029,9.035-9,9.035s-8.943-3.995-8.943-8.966v-0.069c0-4.971,3.972-9,8.943-9S291.991,113.77,291.991,118.74z M374.048,39.052v86.867c0,21.275-17.757,39.081-39.032,39.081H251.8l-26.912,35.664c-1.768,2.358-4.472,3.37-7.208,3.37 c-1.879,0-3.773-0.555-5.392-1.769c-3.978-2.981-4.784-8.561-1.803-12.537l29.612-39.375c1.7-2.268,4.368-3.353,7.201-3.353h87.717 c11.35,0,21.032-9.731,21.032-21.081V39.052c0-11.35-9.683-21.052-21.032-21.052h-104.82c-11.351,0-20.585,9.41-20.585,20.759 c0,4.971-4.029,9.175-9,9.175s-9-4.146-9-9.117C191.611,17.542,208.92,0,230.196,0h104.82C356.291,0,374.048,17.776,374.048,39.052z "></path> </g></svg>                                    
                                    <div style="height: fit-content;pointer-events: none;">Reclamos</div>
                                </div> 
                                
                                <%--AQUI FALTA AGREGAR LA FUNCIONA REDIRIGIRDULCERIA() --%>
                                <div class="dropdown-btn-option" onclick="redirigirDulceria()">
                                    <svg class="svg-suggest" style="height: 24px; width: 24px; margin: 0px 12px 0px 0px;pointer-events: none;" fill="#b3b3b3" height="200px" width="200px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512.001 512.001" xml:space="preserve" stroke="#b3b3b3"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> <g> <path d="M146.242,145.375c2.185,0,4.369-0.836,6.033-2.5c6.434-6.434,15.906-8.986,24.721-6.63 c4.574,1.212,9.233-1.485,10.445-6.05c1.22-4.557-1.493-9.224-6.042-10.436c-14.694-3.908-30.464,0.316-41.19,11.051 c-3.337,3.336-3.337,8.738,0,12.066C141.873,144.538,144.058,145.375,146.242,145.375z"></path> <path d="M302.534,101.008c1.442,0.939,3.055,1.391,4.659,1.391c2.782,0,5.513-1.365,7.151-3.866 c1.442-2.202,5.589-4.557,10.453-4.599c2.662,0.162,6.818,0.785,9.472,4.71c2.637,3.9,7.945,4.932,11.836,2.295 c3.908-2.645,4.941-7.945,2.295-11.853c-5.299-7.842-13.653-12.553-23.731-12.22c-10.112,0.085-19.772,4.924-24.61,12.331 C297.473,93.149,298.583,98.431,302.534,101.008z"></path> <path d="M200.134,83.942c1.442,0.939,3.055,1.391,4.659,1.391c2.782,0,5.513-1.365,7.151-3.866 c1.442-2.202,5.589-4.557,10.453-4.599c3.004-0.017,6.81,0.794,9.472,4.71c2.628,3.9,7.936,4.932,11.836,2.295 c3.908-2.645,4.941-7.945,2.295-11.853c-5.291-7.842-13.892-12.109-23.731-12.22c-10.112,0.085-19.772,4.924-24.61,12.331 C195.073,76.082,196.183,81.365,200.134,83.942z"></path> <path d="M251.334,143.604c1.442,0.939,3.055,1.391,4.659,1.391c2.782,0,5.513-1.365,7.151-3.866 c1.442-2.202,5.589-4.557,10.453-4.599c2.825-0.026,6.818,0.794,9.472,4.71c2.637,3.9,7.936,4.932,11.836,2.296 c3.908-2.645,4.941-7.945,2.295-11.853c-5.299-7.842-14.259-12.143-23.731-12.22c-10.112,0.085-19.772,4.924-24.61,12.331 C246.273,135.745,247.383,141.027,251.334,143.604z"></path> <path d="M442.531,163.328c5.99-7.347,9.737-16.597,9.737-26.795c0-20.855-15.044-38.272-34.859-41.95 c-2.603-13.918-12.041-25.702-25.165-31.3c-2.287-19.55-17.835-35.106-37.393-37.393C348.237,10.368,332.963,0,315.734,0 c-11.324,0-21.999,4.557-29.867,12.382C277.999,4.557,267.324,0,256,0c-10.078,0-19.695,3.575-27.273,9.899 c-0.205-0.205-0.452-0.35-0.666-0.546c-1.033-0.964-2.133-1.826-3.277-2.662c-0.589-0.435-1.152-0.887-1.766-1.28 c-1.195-0.759-2.458-1.391-3.746-2.005c-0.631-0.299-1.237-0.657-1.894-0.913c-1.417-0.572-2.893-0.981-4.395-1.357 c-0.58-0.145-1.135-0.367-1.724-0.486C209.152,0.239,207.002,0,204.8,0c-15.881,0-29.269,10.906-33.058,25.617 c-21.427-0.836-39.279,14.686-43.025,34.833c-17.263,3.209-30.925,16.862-34.133,34.133c-19.806,3.686-34.85,21.094-34.85,41.95 c0,10.197,3.746,19.447,9.737,26.795c-10.53,3.174-18.27,12.851-18.27,24.405c0,11.255,7.347,20.727,17.459,24.149 l15.309,267.938c1.033,18.039,16,32.179,34.074,32.179h0.341l-7.526-298.667h17.084L135.467,512h24.969l-9.907-298.667h17.075 L177.502,512h44.365V374.767c-20.369-11.827-34.133-33.835-34.133-59.034s13.764-47.206,34.133-59.034v-43.366h17.067v36.318 c0.307-0.077,0.623-0.102,0.93-0.179c2.005-0.486,4.036-0.879,6.101-1.186c0.691-0.102,1.365-0.23,2.057-0.316 c2.62-0.307,5.274-0.503,7.979-0.503c2.705,0,5.359,0.196,7.979,0.503c0.691,0.085,1.365,0.213,2.057,0.316 c2.065,0.307,4.096,0.7,6.101,1.186c0.307,0.077,0.623,0.102,0.93,0.179v-36.318h17.067V256.7 c20.369,11.827,34.133,33.835,34.133,59.034s-13.764,47.206-34.133,59.034V512h44.22l13.688-298.667h17.084L351.437,512h25.284 l10.991-298.667h17.075L393.797,512h0.162c18.074,0,33.041-14.14,34.074-32.179l15.309-267.938 c10.112-3.422,17.459-12.894,17.459-24.149C460.8,176.179,453.061,166.502,442.531,163.328z M102.4,110.933 c4.719,0,8.533-3.823,8.533-8.533c0-14.114,11.486-25.6,25.6-25.6c9.105,0,17.604,4.907,22.178,12.8 c1.579,2.731,4.437,4.258,7.39,4.258c1.451,0,2.918-0.375,4.267-1.152c4.07-2.364,5.47-7.578,3.106-11.656 c-5.948-10.274-15.906-17.442-27.213-20.113c3.174-10.53,12.851-18.27,24.405-18.27c1.929,0,3.985,0.307,6.485,0.964 c2.611,0.708,5.41,0.094,7.518-1.596c2.108-1.69,3.285-4.292,3.183-6.997c-0.017-0.461-0.068-0.904-0.111-0.904h-0.008 c0-9.412,7.654-17.067,17.067-17.067c1.459,0,2.85,0.256,4.215,0.606c0.358,0.085,0.708,0.179,1.058,0.299 c1.271,0.41,2.5,0.947,3.627,1.647c0.222,0.136,0.418,0.307,0.631,0.452c1.084,0.751,2.108,1.596,3.004,2.594 c0.077,0.085,0.171,0.162,0.247,0.256c1.024,1.186,1.92,2.526,2.62,4.019c0,0,0,0.008,0.009,0.008 c0.683,1.459,1.229,3.004,1.476,4.659c0.623,4.241,4.267,7.287,8.431,7.287c0.41,0,0.828-0.026,1.254-0.094 c4.659-0.683,7.885-5.026,7.194-9.685c-0.205-1.365-0.606-2.654-0.964-3.959c4.804-5.043,11.366-8.09,18.398-8.09 c9.276,0,17.852,5.163,22.374,13.474c2.987,5.495,11.998,5.495,14.985,0c4.523-8.311,13.099-13.474,22.374-13.474 c8.431,0,16.043,4.198,20.719,10.803c-9.762,3.26-18.253,9.916-23.535,19.063c-2.364,4.079-0.964,9.293,3.106,11.656 c1.348,0.777,2.816,1.143,4.267,1.143c2.953,0,5.82-1.527,7.39-4.267c4.437-7.654,12.587-12.416,21.393-12.698 c0.461-0.017,0.888-0.06,0.794-0.102c14.114,0,25.6,11.486,25.626,25.045c-0.043,0.282-0.128,1.084-0.137,1.365 c-0.162,4.028,2.509,7.629,6.417,8.627c8.858,2.261,15.573,8.96,18.133,17.314c-8.559,1.997-16.384,6.588-22.306,13.295 c-3.115,3.533-2.773,8.926,0.76,12.041c1.613,1.434,3.635,2.133,5.641,2.133c2.355,0,4.719-0.973,6.4-2.884 c4.855-5.513,11.861-8.67,19.2-8.67c14.114,0,25.6,11.486,25.6,25.6s-11.486,25.6-25.6,25.6H102.4 c-14.114,0-25.6-11.486-25.6-25.6S88.286,110.933,102.4,110.933z M435.2,196.267H281.6h-51.2H76.8 c-4.71,0-8.533-3.831-8.533-8.533c0-4.702,3.823-8.533,8.533-8.533h25.6h307.2h25.6c4.71,0,8.533,3.831,8.533,8.533 C443.734,192.435,439.911,196.267,435.2,196.267z"></path> <path d="M265.901,383.199c-0.623,0.094-1.246,0.213-1.877,0.29c-2.637,0.307-5.308,0.512-8.021,0.512 c-2.722,0-5.393-0.205-8.03-0.512c-0.623-0.077-1.246-0.196-1.869-0.29c-2.116-0.307-4.198-0.708-6.246-1.212 c-0.307-0.068-0.623-0.094-0.922-0.171v130.185h34.133V381.816c-0.307,0.077-0.623,0.102-0.922,0.171 C270.099,382.49,268.017,382.892,265.901,383.199z"></path> <path d="M307.2,315.733c0-20.429-12.058-38.05-29.397-46.259c-1.673-0.785-3.371-1.485-5.094-2.082 c-0.043-0.017-0.085-0.034-0.137-0.051c-10.76-3.712-22.383-3.712-33.143,0c-0.043,0.017-0.085,0.034-0.128,0.043 c-1.724,0.606-3.43,1.297-5.103,2.091c-17.34,8.209-29.397,25.83-29.397,46.259c0,20.429,12.058,38.05,29.397,46.259 c1.673,0.794,3.379,1.485,5.103,2.091c0.043,0.008,0.085,0.026,0.128,0.043c10.76,3.712,22.383,3.712,33.143,0 c0.051-0.017,0.094-0.034,0.137-0.051c1.724-0.597,3.422-1.297,5.094-2.082C295.143,353.784,307.2,336.162,307.2,315.733z M256,349.867c-18.825,0-34.133-15.309-34.133-34.133c0-4.71,3.814-8.533,8.533-8.533c4.719,0,8.533,3.823,8.533,8.533 c0,9.412,7.654,17.067,17.067,17.067c4.719,0,8.533,3.823,8.533,8.533S260.719,349.867,256,349.867z M281.6,324.267 c-4.719,0-8.533-3.823-8.533-8.533c0-9.412-7.654-17.067-17.067-17.067c-4.719,0-8.533-3.823-8.533-8.533 s3.814-8.533,8.533-8.533c18.825,0,34.133,15.309,34.133,34.133C290.134,320.444,286.319,324.267,281.6,324.267z"></path> </g> </g> </g> </g></svg>
                                    <div style="height: fit-content;pointer-events: none;">Dulceria</div>
                                </div> 
                                
                                <%--AQUI FALTA AGREGAR LA FUNCIONA REDIRIGIRLOCALES() --%>
                                <div class="dropdown-btn-option" onclick="redirigirLocales()">                                    
                                    <svg class="svg-suggest" style="height: 24px; width: 24px; margin: 0px 12px 0px 0px;pointer-events: none;" fill="#B3B3B3" height="800px" width="800px" version="1.1" id="Local" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" 
                                    viewBox="0 0 297 297" xml:space="preserve"><g>
                                            <path d="M148.5,0C87.43,0,37.747,49.703,37.747,110.797c0,91.026,99.729,179.905,103.976,183.645
                                                    c1.936,1.705,4.356,2.559,6.777,2.559c2.421,0,4.841-0.853,6.778-2.559c4.245-3.739,103.975-92.618,103.975-183.645
                                                    C259.253,49.703,209.57,0,148.5,0z M148.5,272.689c-22.049-21.366-90.243-93.029-90.243-161.892
                                                    c0-49.784,40.483-90.287,90.243-90.287s90.243,40.503,90.243,90.287C238.743,179.659,170.549,251.322,148.5,272.689z"/>
                                            <path d="M148.5,59.183c-28.273,0-51.274,23.154-51.274,51.614c0,28.461,23.001,51.614,51.274,51.614
                                                    c28.273,0,51.274-23.153,51.274-51.614C199.774,82.337,176.773,59.183,148.5,59.183z M148.5,141.901
                                                    c-16.964,0-30.765-13.953-30.765-31.104c0-17.15,13.801-31.104,30.765-31.104c16.964,0,30.765,13.953,30.765,31.104
                                                    C179.265,127.948,165.464,141.901,148.5,141.901z"/></g></svg>
                                    <div style="height: fit-content;pointer-events: none;">Locales</div>
                                </div>
                            </div>
                        </div>



                        <div class="Ccontainer-search">
                            <div class="search">
                                <button class="buttonall" style="display: flex; flex-direction: row; place-items: center">                                
                                    Todo
                                    <svg style="display: grid; place-items: center;" width="8" height="8" viewBox="0 0 512 512" alt="Triangle Down Pointer" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000" transform="rotate(180)" translate="10px">
                                        <g id="SVGRepo_bgCarrier" stroke-width="0"/>
                                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"/>
                                        <g id="SVGRepo_iconCarrier"> <title>triangle-filled</title> <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="drop" fill="#000000" transform="translate(32.000000, 42.666667)"> <path d="M246.312928,5.62892705 C252.927596,9.40873724 258.409564,14.8907053 262.189374,21.5053731 L444.667042,340.84129 C456.358134,361.300701 449.250007,387.363834 428.790595,399.054926 C422.34376,402.738832 415.04715,404.676552 407.622001,404.676552 L42.6666667,404.676552 C19.1025173,404.676552 7.10542736e-15,385.574034 7.10542736e-15,362.009885 C7.10542736e-15,354.584736 1.93772021,347.288125 5.62162594,340.84129 L188.099293,21.5053731 C199.790385,1.04596203 225.853517,-6.06216498 246.312928,5.62892705 Z" id="Combined-Shape"> </path> </g> </g> </g>
                                    </svg>
                                </button>
                                <input type="text" class="searcher" placeholder="Buscar en MundoCine">
                                <button class="buttonlens">                                
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#757575"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" id="lupa"/></svg>
                                </button>
                            </div>
                        </div>

                    </diV>

                    <button class="btnnavbar btn-color" style="padding: 0px 16px; cursor: pointer; height: 36px">
                        <%= isLoggedIn ? welcomeMessage : "<a href='login.jsp'>" + welcomeMessage + "</a>"%>
                    </button>

                    <% if (isLoggedIn) { %>
                    <button class="btnnavbar btn-color" style="padding: 0px 16px; cursor: pointer; height: 36px">
                        <a href="logout">Cerrar sesión</a>
                    </button>
                    <% }%>
                </div>
            </div>
        </div>
    </body>
</html>
