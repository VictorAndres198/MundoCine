<%@ page import="java.util.List" %>
<%@ page import="modelo.dto.Claims" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/adminDasboard.css" rel="stylesheet" type="text/css"/>      
        <link href="resources/css/Admin.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/Admin-Display.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
        <title>Reclamos</title>
        <style>
            .dataTables_wrapper {
                width: 90%;
                margin: 0 auto;
            }
        </style>
        <script>
            $(document).ready(function() {
                var table = $('#claimsTable').DataTable({
                    ajax: {
                        url: 'SvAdmClaims',
                        data: function(d) {
                            d.codLocal = $('#codLocal').val(); // Add codLocal parameter to the request
                        },
                        dataSrc: ''
                    },
                    columns: [
                        { data: 'id_reclamos' },
                        { data: 'nombre_cliente' },
                        { data: 'correo_reclamo' },
                        { data: 'dni_reclamo' },
                        { data: 'fecha_reclamo' },
                        { data: 'asunto_reclamo' },
                        { data: 'contenido_reclamo' },
                        {
                            data: null,
                            className: 'dt-center',
                            defaultContent: '<button class="btn btn-primary btn-sm edit-btn"><i class="fa fa-edit"></i> Editar</button> <button class="btn btn-danger btn-sm delete-btn"><i class="fa fa-trash"></i> Borrar</button>',
                            orderable: false
                        }
                    ]
                });

                $('#codLocal').change(function() {
                    table.ajax.reload();
                });

                $('#claimsTable tbody').on('click', '.edit-btn', function() {
                    var data = table.row($(this).parents('tr')).data();
                    $.ajax({
                        url: 'SvAdmClaims',
                        type: 'GET',
                        data: { action: 'getClaim', id: data.id_reclamos },
                        success: function(data) {
                            $('#editClaimModal input[name="id_reclamos"]').val(data.id_reclamos);
                            $('#editClaimModal input[name="nombre_cliente"]').val(data.nombre_cliente);
                            $('#editClaimModal input[name="correo_reclamo"]').val(data.correo_reclamo);
                            $('#editClaimModal input[name="dni_reclamo"]').val(data.dni_reclamo);
                            $('#editClaimModal input[name="fecha_reclamo"]').val(data.fecha_reclamo);
                            $('#editClaimModal input[name="asunto_reclamo"]').val(data.asunto_reclamo);
                            $('#editClaimModal textarea[name="contenido_reclamo"]').val(data.contenido_reclamo);
                            $('#editClaimModal').modal('show');
                        }
                    });
                });

                $('#claimsTable tbody').on('click', '.delete-btn', function() {
                    var data = table.row($(this).parents('tr')).data();
                    $('#confirmDeleteModal input[name="id_reclamos"]').val(data.id_reclamos);
                    $('#confirmDeleteModal').modal('show');
                });

                $('#editClaimForm').submit(function(e) {
                    e.preventDefault();
                    $.ajax({
                        url: 'SvAdmClaims',
                        type: 'POST',
                        data: $(this).serialize() + '&action=update',
                        success: function() {
                            $('#editClaimModal').modal('hide');
                            table.ajax.reload(); // Refresh the table after editing
                        }
                    });
                });

                $('#confirmDeleteForm').submit(function(e) {
                    e.preventDefault();
                    $.ajax({
                        url: 'SvAdmClaims',
                        type: 'POST',
                        data: { action: 'delete', id: $('#confirmDeleteModal input[name="id_reclamos"]').val() },
                        success: function() {
                            $('#confirmDeleteModal').modal('hide');
                            table.ajax.reload(); // Refresh the table after deletion
                        }
                    });
                });
            });
        </script>
    </head>
    <body class="parent-container">
        <jsp:include page="components/navegadorAdm.jsp"/>
        <script src="resources/scrip/AdmPng.js" type="text/javascript"></script>
        <div class="box-content">
            <div class="container">
                <h2 class="mt-5">Lista de Reclamos</h2>
                <form class="mb-3">
                    <label for="codLocal">Seleccionar Sede:</label>
                    <select id="codLocal" name="codLocal" class="form-control" style="width: 200px; display: inline-block;">
                        <option value="1">MundoCine Angamos</option>
                        <option value="2">MundoCine Gamarra</option>
                        <option value="3">MundoCine San Miguel</option>
                    </select>
                </form>
                <table id="claimsTable" class="table table-bordered mt-3 display">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Correo</th>
                            <th>DNI</th>
                            <th>Fecha</th>
                            <th>Asunto</th>
                            <th>Contenido</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- El contenido se llenará dinámicamente con AJAX -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Edit Claim Modal -->
        <div class="modal fade" id="editClaimModal" tabindex="-1" role="dialog" aria-labelledby="editClaimModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editClaimModalLabel">Editar Reclamo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editClaimForm">
                            <input type="hidden" name="id_reclamos">
                            <div class="form-group">
                                <label for="nombre_cliente">Nombre</label>
                                <input type="text" class="form-control" name="nombre_cliente" required>
                            </div>
                            <div class="form-group">
                                <label for="correo_reclamo">Correo</label>
                                <input type="email" class="form-control" name="correo_reclamo" required>
                            </div>
                            <div class="form-group">
                                <label for="dni_reclamo">DNI</label>
                                <input type="text" class="form-control" name="dni_reclamo" required>
                            </div>
                            <div class="form-group">
                                <label for="fecha_reclamo">Fecha</label>
                                <input type="date" class="form-control" name="fecha_reclamo" required>
                            </div>
                            <div class="form-group">
                                <label for="asunto_reclamo">Asunto</label>
                                <input type="text" class="form-control" name="asunto_reclamo" required>
                            </div>
                            <div class="form-group">
                                <label for="contenido_reclamo">Contenido</label>
                                <textarea class="form-control" name="contenido_reclamo" rows="3" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Guardar cambios</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Confirm Delete Modal -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmar Eliminación</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ¿Está seguro de que desea eliminar este reclamo?
                        <form id="confirmDeleteForm">
                            <input type="hidden" name="id_reclamos">
                            <button type="submit" class="btn btn-danger">Eliminar</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>