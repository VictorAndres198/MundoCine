<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reclamaciones</title>

        <link href="resources/css/piePagina.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/claims.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/navbar.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

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
                    changeYear: true, // Permitir cambio de año
                    yearRange: "-100:+0", // Rango de años permitidos
                    maxDate: "0" // Fecha máxima seleccionable (hoy)
                });
            });
        </script>
        <style>
            body {
                background-color: #343a40;
                color: #ffffff;
            }
            .form-container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background: #495057;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .form-label {
                color: #ffffff;
            }
            .alert-success {
                background-color: #28a745;
                color: #ffffff;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
            }
            .btn-primary:hover {
                background-color: #364458;
            }
        </style>
    </head>
    <body>
        <!-- ESTO ES EL NAVBAR -->
        <jsp:include page="components/navbar.jsp"/>

        <div class="container mt-5">
            <h1 class="text-center">Reclamos</h1>
            <p class="text-center">¡Nos encantaría escuchar algun inconveniente que hayas tenido! ¿Tienes alguna idea para mejorar nuestro servicio? ¡Déjanos tus comentarios aquí!</p>

            <!-- Mensaje de confirmación -->
            <c:if test="${not empty mensaje}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${mensaje}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="form-container">
                <form action ="<%= request.getContextPath()%>/cntClaims" method="post" id="formClaims" class="row g-3">
                    <div class="col-md-6">
                        <label for="ID" class="form-label">DNI:</label>
                        <input type="text" class="form-control" id="ID" name="ID" required pattern="\d{8}" title="El DNI debe contener 8 dígitos">
                    </div>
                    <div class="col-md-6">
                        <label for="name" class="form-label">Nombre:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="col-md-6">
                        <label for="fecha_reclamo" class="form-label">Fecha:</label>
                        <input type="text" class="form-control" id="fecha_reclamo" name="fecha_reclamo" required>
                    </div>
                    <div class="col-md-6">
                        <label for="email" class="form-label">Correo electrónico:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="col-md-6">
                        <label for="Asunto" class="form-label">Asunto:</label>
                        <input type="text" class="form-control" id="Asunto" name="Asunto" required>
                    </div>
                    <div class="col-md-6">
                        <label for="codLocal" class="form-label">Seleccionar Local:</label>
                        <select class="form-select" id="codLocal" name="codLocal" required>
                            <option value="1">MundoCine Angamos</option>
                            <option value="2">MundoCine Gamarra</option>
                            <option value="3">MundoCine San Miguel</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <label for="ContenidoReclamo" class="form-label">Reclamo:</label>
                        <textarea class="form-control" id="ContenidoReclamo" name="ContenidoReclamo" rows="4" required></textarea>
                    </div>
                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-primary" name="accion" value="Enviar">Enviar</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- ESTO ES EL FOOTER -->
        <jsp:include page="components/footer.jsp"/>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
