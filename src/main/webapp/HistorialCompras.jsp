

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="resources/css/compraDulceria.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/piePagina.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome -->

        <title>Compra Dulceria</title>
    </head>
    <body>
        <!-- ESTO ES EL NAVBAR -->
        <jsp:include page="components/navbar.jsp"/>
        <div style="width: 1280px; margin: auto">
            <div class="Container">
                <h1>Compra Dulceria</h1>
                <div class="compra-itemCompra">
                    <div><h2> HISTORIAL DE COMPRAS</h2></div>
                    <div class="Frm-Table table-responsive">
                        <table class="table table-striped table-sm align-middle" id="Table-Compras">
                            <thead class="align-middle table-header">
                                <tr class="table-primary">
                                    <th>ID</th>
                                    <th>Local</th>
                                    <th>Fecha-Hora</th>
                                    <th>Total</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">


                            </tbody >
                        </table>
                    </div>

                    <div><h2>DETALLE DE LA COMPRA</h2></div>

                    <div class="Frm-Table table-responsive">
                        <table class="table table-striped table-sm align-middle" id="Table-DetalleCompra">
                            <thead class="align-middle table-header">
                                <tr class="table-primary">
                                    <th>ID ITEM</th>
                                    <th>NOMBRE</th>
                                    <th>CANTIDAD</th>
                                    <th>SUBTOTAL</th>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">
                                <tr>
                                    <th>- - -</th>
                                    <th>- - -</th>
                                    <th>- - -</th>
                                    <th>- - -</th>
                                </tr>
                            <br>
                            </tbody >
                        </table>
                    </div>
                </div>

            </div>


            <jsp:include page="components/footer.jsp"/>
        </div>
        
        <script src="javascript/dulceria/HistorialCompras.js" type="text/javascript"></script>
        <script>
            (function showMsj() {
                const usserLogged = document.getElementById('userLogged');
                if (!usserLogged) {
                    const div = document.querySelector('.Container');
                    const span = document.createElement('span');
                    span.innerText = 'No estas logeado, Inicia sesion para ver tu historial de compras';
                    span.style.color = 'blue';  // Ejemplo de estilo
                    div.appendChild(span);
                    
                }else{
                   document.addEventListener('DOMContentLoaded', buildTableCompras);
 
                }
            })();

        </script>
    </body>
</html>
