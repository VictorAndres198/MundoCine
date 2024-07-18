<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reclamaciones</title>
        <link href="resources/css/suggestions.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/home.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/piePagina.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/claims.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/navbar.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- jQuery UI -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script>
            $(function () {
                $("#fecha_reclamo").datepicker({
                    dateFormat: 'yy-mm-dd', // Formato de fecha
                    changeMonth: true, // Permitir cambio de mes
                    changeYear: true, // Permitir cambio de a�o
                    yearRange: "-100:+0", // Rango de a�os permitidos
                    maxDate: "0" // Fecha m�xima seleccionable (hoy)
                });
            });
        </script>        
    </head>
    <body>     
        <!-- ESTO ES EL NAVBAR -->
        <jsp:include page="components/navbar.jsp"/>

        <div class="onpremiere">
            <div class="suggestions-container">
                <div class="onpremiere-h1">
                    <div>Reclamos</div>              
                </div>
                <div class="mlps-header">
                    <div class="mlps-h-b"></div>
                    <div style="padding: 0px 0px 0px 12px">�Nos encantar�a escuchar algun inconveniente que hayas tenido! �Tienes alguna idea para mejorar nuestro servicio? �D�janos tus comentarios aqu�!</div>
                </div>
                <div style="display: flex; place-content: center; margin: 50px 0px;">
                    <div class="suggesion-form">
                        <form action ="<%= request.getContextPath()%>/cntClaims" method="post" class="formulario" id="formClaims">
                            <label for="ID">DNI:</label><br>
                            <input class="up" type="text" id="ID" name="ID" required pattern="\d{8}" title="El DNI debe contener 8 d�gitos"><br>
                            <label for="name">Nombre:</label><br>
                            <input class="up" type="text" id="name" name="name" required><br>
                            <label for="fecha_reclamo">Fecha:</label><br>
                            <input class="up" type="text" id="fecha_reclamo" name="fecha_reclamo" required><br>
                            <label for="email">Correo electr�nico:</label><br>
                            <input class="up" type="email" id="email" name="email" required><br>
                            <label for="Asunto">Asunto:</label><br>
                            <input class="up" type="text" id="Asunto" name="Asunto" required><br>
                            <label for="ContenidoReclamo">Reclamo:</label><br>
                            <textarea class="up" id="ContenidoReclamo" name="ContenidoReclamo" rows="4" cols="42" required></textarea><br>
                            <label for="codLocal">Seleccionar Local:</label><br>
                            <select class="up" id="codLocal" name="codLocal" required>
                                <option value="1">MundoCine Angamos</option>
                                <option value="2">MundoCine Gamarra</option>
                                <option value="3">MundoCine San Miguel</option>
                            </select><br>           
                            <input class="upbtn btn-color" type="submit" value="Enviar" name="accion">
                        </form>
                    </div>
                </div>
                <!-- ESTO ES EL FOOTER -->
                <jsp:include page="components/footer.jsp"/>
            </div>
        </div> 
    </body>
</html>