<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ServLets.cntAdmClientes"%>
<%@page import="modelo.dao.CustomerDAO"%>
<%@page import="modelo.dto.Customer"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="resources/css/AdmClientes.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/Admin.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/Admin-Display.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Clientes</title>
    </head>
    <body class="parent-container-admclientes">
        <jsp:include page="components/navegadorAdm.jsp"/>

        <div class="box-content-admclientes">
            <header class="header-admclientes">
                <h1>Gestión de Clientes</h1>
            </header>
            <div class="box-content-admclientes">
                <main class="main-content-admclientes">
                    <br>
                    <div class="registrar-clientes">
                        <div class="form-prod-admclientes">
                            <button type="button" class="btn-agregarcli btn-primary mt-2 mb-4" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="setAgregarContext()">
                                <i class="fa-sharp fa-regular fa-file"></i>
                                Agregar Nuevo Cliente
                            </button>
                        </div>
                        <div class="modal fade" id="exampleModal" tabindex="1" aria labellebdy="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="contenido-registrar-admclientes">
                                        <div class="modal-header">
                                            <h1 class="modal-tittle fs-5" id="exampleModalLabel">Formulario de Clientes</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="${pageContext.request.contextPath}/cntAdmClientes" method="post" class="formulario-admproductos" id="formProductos">
                                            <fieldset class="campos-admproductos">
                                                <br>
                                                <label for="nombres" class="etiqueta-admclientes">(*)Nombres</label>
                                                <input type="text" name="nombres" value="${nombres}" placeholder="Insertar Nombre(s)" class="entrada-admclientes" id="nombres"/>

                                                <label for="apepat" class="etiqueta-admclientes">(*)Apellido Paterno</label>
                                                <input type="text" name="apepat" value="${apepat}" placeholder="Insertar Apellido Paterno" class="entrada-admclientes" id="apepat"/>

                                                <label for="apemat" class="etiqueta-admclientes">(*)Apellido Materno</label>
                                                <input type="text" name="apemat" value="${apemat}" placeholder="Insertar Apellido Materno" class="entrada-admclientes" id="apemat"/>

                                                <label for="dni" class="etiqueta-admclientes">(*)DNI</label>
                                                <input type="number" name="dni" id="dni" value="${dni}" placeholder="Insertar DNI" class="entrada-admclientes" id="dni">

                                                <label for="fechanacimiento" class="etiqueta-admclientes">(*)Fecha de Nacimiento</label>
                                                <input type="date" name="fechanacimiento" value="${fechanacimiento}" placeholder="DD-MM-YYYY" class="entrada-admclientes" id="fechanacimiento">

                                                <label for="usuario" class="etiqueta-admclientes">(*)Usuario</label>
                                                <input type="text" name="usuario" value="${usuario}" placeholder="Insertar Usuario" class="entrada-admclientes" id="usuario"/>

                                                <label for="correo" class="etiqueta-admclientes">(*)Correo</label>
                                                <input type="email" name="correo" value="${correo}" placeholder="ejemplo@email.com" class="entrada-admclientes" id="correo"/>

                                                <label for="contrasena" class="etiqueta-admclientes">(*)Contraseña</label>
                                                <input type="text" name="contrasena" value="${contrasena}" placeholder="Insertar Contraseña" class="entrada-admclientes" id="contrasena"/>

                                                <input type="hidden" name="codcliente" value="${codcliente}" />

                                                <label class="nota" id="lblObligatorio">No olvide que los campos con (*) son <b>obligatorios</b></label>
                                                <label class="nota" id="lblDesea">¿Desea eliminar este producto?</label>
                                                <input type="submit" value="Registrar" name="accion" class="button-admclientes" id="btnRegistrar" />
                                                <input type="submit" value="Actualizar" name="accion" class="button-admclientes" id="btnActualizar" />
                                                <input type="submit" value="Eliminar" name="accion" class="button-admclientes" id="btnEliminar" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mostrar-clientes">
                        <div class="contenedor-tabla-admclientes">
                            <table class="tabla-admclientes">
                                <thead class="cabeza-tabla-admclientes">
                                    <tr class="fila-cabeza-tabla-admclientes"">
                                        <td class="cuadro-cabeza-tabla-admclientes">Código</td>
                                        <td class="cuadro-cabeza-tabla-admclientes">Nombre</td>
                                        <td class="cuadro-cabeza-tabla-admclientes">A. Paterno</td>
                                        <td class="cuadro-cabeza-tabla-admclientes">A. Materno</td>
                                        <td class="cuadro-cabeza-tabla-admclientes">DNI</td>
                                        <td class="cuadro-cabeza-tabla-admclientes">Fecha de Nacimiento</td>
                                        <td class="cuadro-cabeza-tabla-admclientes">Usuario</td>
                                        <td class="cuadro-cabeza-tabla-admclientes">Correo</td>
                                        <td class="cuadro-cabeza-tabla-admclientes">Contraseña</td>
                                        <td class="cuadro-cabeza-tabla-admclientes">Acciones</td>
                                    </tr>
                                </thead>
                                <tbody class="cuerpo-tabla-admclientes">

                                </tbody>
                            </table>
                        </div>
                    </div>                            
                </main>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>
                                $(document).ready(function () {
                                    loadClientes(); // Cargar datos de clientes al cargar la página

                                    // Manejar el envío del formulario
                                    $("#formProductos").on("submit", function (event) {
                                        event.preventDefault();
                                        var dni = $("#dni").val().trim();

                                        // Validar DNI
                                        if (!/^\d{8}$/.test(dni)) {
                                            toastr.error("El DNI debe tener exactamente 8 dígitos.");
                                            return; // Detener el envío del formulario
                                        }

                                        submitForm(); // Enviar formulario
                                    });

                                    // Editar cliente
                                    $(".cuerpo-tabla-admclientes").on("click", ".btn-editar-admclientes", function () {
                                        var clienteId = $(this).data("id");
                                        $.ajax({
                                            url: 'cntAdmClientes',
                                            method: 'GET',
                                            data: {accion: 'get', id: clienteId},
                                            success: function (data) {
                                                // Rellenar el formulario con los datos del cliente
                                                $("#codcliente").val(data.codcliente);
                                                $("#nombres").val(data.nombre);
                                                $("#apepat").val(data.apepaterno);
                                                $("#apemat").val(data.apematerno);
                                                $("#dni").val(data.dni);
                                                $("#fechanacimiento").val(data.fechanacimiento);
                                                $("#usuario").val(data.usuario);
                                                $("#correo").val(data.correo);
                                                $("#contrasena").val(data.contrasena);

                                                setEditarContext(); // Cambiar el contexto a editar
                                                $("#exampleModal").modal('show'); // Mostrar el modal
                                            },
                                            error: function (xhr, status, error) {
                                                toastr.error("Error al obtener los datos del cliente.");
                                            }
                                        });
                                    });

                                    // Eliminar cliente
                                    $(".cuerpo-tabla-admclientes").on("click", ".btn-eliminar-admclientes", function () {
                                        var clienteId = $(this).data("id");
                                        if (confirm("¿Está seguro que desea eliminar este cliente?")) {
                                            $.ajax({
                                                url: 'cntAdmClientes',
                                                method: 'POST',
                                                data: {accion: 'delete', id: clienteId},
                                                success: function (response) {
                                                    if (response.error) {
                                                        toastr.error("Error al eliminar el cliente: " + response.error);
                                                    } else {
                                                        toastr.success("Cliente eliminado exitosamente.");
                                                        loadClientes(); // Recargar la lista de clientes
                                                    }
                                                },
                                                error: function (xhr, status, error) {
                                                    toastr.error("Error en la solicitud AJAX: " + status + " - " + error);
                                                }
                                            });
                                        }
                                    });

                                    // Limpia el formulario cuando el modal se cierra
                                    $('#exampleModal').on('hidden.bs.modal', function () {
                                        clearForm();
                                    });
                                });

                                function loadClientes() {
                                    $.ajax({
                                        url: 'cntAdmClientes',
                                        method: 'GET',
                                        success: function (data) {
                                            var tbody = $(".cuerpo-tabla-admclientes");
                                            tbody.empty(); // Limpiar la tabla antes de agregar los datos
                                            $.each(data, function (i, cliente) {
                                                var row = "<tr class='fila-cuerpo-tabla-admclientes'>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'>" + cliente.codcliente + "</td>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'>" + cliente.nombre + "</td>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'>" + cliente.apepaterno + "</td>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'>" + cliente.apematerno + "</td>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'>" + cliente.dni + "</td>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'>" + cliente.fechanacimiento + "</td>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'>" + cliente.usuario + "</td>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'>" + cliente.correo + "</td>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'>" + cliente.contrasena + "</td>" +
                                                        "<td class='cuadro-cuerpo-tabla-admclientes'><button class='btn-editar-admclientes' data-id='" + cliente.codcliente + "'>Editar</button> <button class='btn-eliminar-admclientes' data-id='" + cliente.codcliente + "'>Eliminar</button></td>" +
                                                        "</tr>";
                                                tbody.append(row);
                                            });
                                        },
                                        error: function (xhr, status, error) {
                                            console.log("Error en la solicitud AJAX: " + status + " - " + error);
                                        }
                                    });
                                }

                                function submitForm() {
                                    $.ajax({
                                        url: 'cntAdmClientes',
                                        method: 'POST',
                                        data: $("#formProductos").serialize(),
                                        success: function (response) {
                                            if (response.error) {
                                                toastr.error("Error al registrar el cliente: " + response.error);
                                            } else {
                                                toastr.success("Cliente registrado exitosamente");
                                                $("#exampleModal").modal('hide');
                                                loadClientes(); // Recargar la lista de clientes
                                            }
                                        },
                                        error: function (xhr, status, error) {
                                            toastr.error("Error en la solicitud AJAX: " + status + " - " + error);
                                        }
                                    });
                                }

                                function clearForm() {
                                    $("#formProductos")[0].reset(); // Limpia todos los campos del formulario
                                }

                                function setAgregarContext() {
                                    document.getElementById('btnActualizar').style.display = 'none';
                                    document.getElementById('btnEliminar').style.display = 'none';
                                    document.getElementById('lblDesea').style.display = 'none';
                                    document.getElementById('btnRegistrar').style.display = 'inline-block';
                                }

                                function setEditarContext() {
                                    document.getElementById('btnActualizar').style.display = 'inline-block';
                                    document.getElementById('btnEliminar').style.display = 'none';
                                    document.getElementById('lblDesea').style.display = 'none';
                                    document.getElementById('btnRegistrar').style.display = 'none';
                                }
        </script>
    </body>
</html>
