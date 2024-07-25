<%@page import="modelo.dto.Locales"%>
<%@page import="modelo.dto.ItemDulceria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="resources/css/dulceria.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome -->

        <link href="resources/css/navbar.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/piePagina.css" rel="stylesheet" type="text/css"/>
        <title>Dulceria</title>
    </head>
    <body>
        <!-- ESTO ES EL NAVBAR -->
        <jsp:include page="components/navbar.jsp"/>
        <div class="container">
            <form class="form-inline" id="compra-options">
                <div class="info-title" id="cine-Local"><span>Local</span></div>
                <div class="info-locals">
                    <select id="select-locals">
                        <option value="0">---</option>
                    </select>
                </div>

                <div class="btn-group mr-2" role="group" aria-label="First group">
                    <button type="button" class="btn btn-outline-primary" 
                            data-toggle="modal" data-target="#CompraModal" onclick="buildResumenCompra()">
                        Resumen de Compra
                    </button>
                </div>
                <div class="btn-group" role="group" aria-label="Third group">
                    <a href="HistorialCompras.jsp" class="btn btn-outline-dark" id="compra-history">Historial Compras</a></div>
            </form>
            
            <nav>

                <div class="nav nav-tabs p-3 mb-2 bg-secondary text-white" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-canchita-tab" data-toggle="tab" href="#nav-canchita" role="tab" aria-controls="nav-canchita" aria-selected="true">Canchita</a>
                    <a class="nav-item nav-link" id="nav-bebida-tab" data-toggle="tab" href="#nav-bebida" role="tab" aria-controls="nav-bebida" aria-selected="false">Bebidas</a>
                    <a class="nav-item nav-link" id="nav-snack-tab" data-toggle="tab" href="#nav-snack" role="tab" aria-controls="nav-snack" aria-selected="false">Snacks</a>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-canchita" role="tabpanel" aria-labelledby="nav-canchita-tab">
                    <div class="card-deck">
                    </div>
                </div>

                <div class="tab-pane fade" id="nav-bebida" role="tabpanel" aria-labelledby="nav-bebida-tab">
                    <div class="card-deck">
                    </div>
                </div>

                <div class="tab-pane fade" id="nav-snack" role="tabpanel" aria-labelledby="nav-snack-tab">
                    <div class="card-deck">  
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="CompraModal" tabindex="-1" role="dialog" aria-labelledby="CompraModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content" id="compra-content">
                    <div class="modal-header">
                        <h3 class="modal-title fs-5">Resumen Compra</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <!-- Campo Local -->
                        <div class="mb-3 form-group">
                            <label class="form-label"><i class="fa-solid fa-building"></i> Local</label><br>
                            <label class="form-label compra-local"></label>
                        </div>
                        
                        <!-- Campo DNI -->
                        <div class="mb-3 form-group dni-field">
                            <label for="user-dni" class="form-label"><i class="fas fa-id-card"></i> DNI</label>
                            <input class="form-control" type="number" id="user-dni">
                        </div>
                        
                        <!-- Campo Clave -->
                        <div class="mb-3 form-group pass-field">
                            <label for="user-pass" class="form-label"><i class="fa-solid fa-lock"></i> Clave</label><br>
                            <input class="form-control" type="password"   id="user-pass" name="user-pass" required="">
                        </div>
                        
                        <!-- Campo Compra -->
                        <div class="mb-3 form-group">
                            <label class="form-label"><i class="fa-solid fa-utensils"></i> Dulceria</label><br>
                        </div>
                        <!-- Tabla de los productos seleccionados -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Cantidad</th>
                                    <th scope="col">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Contenido de los productos seleccionados-->
                            </tbody>
                        </table>

                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success" onclick="realizarCompra()">Realizar Compra</button>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="components/footer.jsp"/>

        <script src="javascript/dulceria/DulceriaInfo.js" type="text/javascript"></script>
        <script src="javascript/dulceria/ResumenCompra.js" type="text/javascript"></script>
        <script src="javascript/dulceria/CompraDulceria.js" type="text/javascript"></script>
        <script>

            (function RemoveBtn() {
                const hisotryCompras = document.getElementById('compra-history');
                const dniField = document.getElementById('compra-content').querySelector('.dni-field');
                const passField = document.getElementById('compra-content').querySelector('.pass-field');
                
                const usserLogged = document.getElementById('userLogged');
                if (!usserLogged) { //si no esta logeado borra el btn de ver historial
                  hisotryCompras.remove();
                }else{ //si esta logeado borra el campo de dni porque no es necesario
                    dniField.remove();
                    passField.remove();
                }
          })();
        </script>
    </body>

</html>
