package ServLets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.CustomerDAO;
import modelo.dto.Customer;
import conexion.ConectaBD;
import javax.servlet.http.HttpSession;

public class cntAdmClientes extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) //evalúa las peticiones que ha hecho el usuario
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion != null) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");
        if ("get".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            CustomerDAO customerDAO = new CustomerDAO();
            Customer cliente = customerDAO.ObtenerCliente(id);

            Gson gson = new Gson();
            String jsonCliente = gson.toJson(cliente);

            PrintWriter out = response.getWriter();
            out.print(jsonCliente);
            out.flush();
        } else {
            // Manejo normal de la solicitud GET
            CustomerDAO customerDAO = new CustomerDAO();
            List<Customer> clientes = customerDAO.ListarClientes();

            Gson gson = new Gson();
            String jsonClientes = gson.toJson(clientes);

            PrintWriter out = response.getWriter();
            out.print(jsonClientes);
            out.flush();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            if (accion.equals("Registrar")) {
                String nombre = request.getParameter("nombres");
                String apepaterno = request.getParameter("apepat");
                String apematerno = request.getParameter("apemat");
                String dni = request.getParameter("dni");
                String fechanacimiento = request.getParameter("fechanacimiento");
                String usuario = request.getParameter("usuario");
                String correo = request.getParameter("correo");
                String contrasena = request.getParameter("contrasena");

                // Validar DNI
                String errorMsg = "";
                if (dni == null || !dni.matches("\\d{8}")) {
                    errorMsg = "El DNI debe tener exactamente 8 dígitos.";
                } else {
                    // Crear objeto Customer
                    Customer customer = new Customer();
                    customer.setNombre(nombre);
                    customer.setApepaterno(apepaterno);
                    customer.setApematerno(apematerno);
                    customer.setDni(dni); // Almacenar como cadena
                    customer.setFechanacimiento(fechanacimiento);
                    customer.setUsuario(usuario);
                    customer.setCorreo(correo);
                    customer.setContraseña(contrasena);

                    // Registrar cliente
                    CustomerDAO customerDAO = new CustomerDAO();
                    String resp = customerDAO.RegistrarCliente(customer);

                    // Crear respuesta
                    PrintWriter out = response.getWriter();
                    if (!errorMsg.isEmpty()) {
                        out.print("{\"error\": \"" + errorMsg + "\"}");
                    } else {
                        out.print("{\"success\": \"" + resp + "\"}");
                    }
                    out.flush();
                }
            } else if (accion.equals("Actualizar")) {
                String nombre = request.getParameter("nombres");
                String apepaterno = request.getParameter("apepat");
                String apematerno = request.getParameter("apemat");
                String dni = request.getParameter("dni");
                String fechanacimiento = request.getParameter("fechanacimiento");
                String usuario = request.getParameter("usuario");
                String correo = request.getParameter("correo");
                String contrasena = request.getParameter("contrasena");
                int codcliente = Integer.parseInt(request.getParameter("codcliente")); // Asegúrate de que codcliente esté presente en el formulario

                // Validar DNI
                String errorMsg = "";
                if (dni == null || !dni.matches("\\d{8}")) {
                    errorMsg = "El DNI debe tener exactamente 8 dígitos.";
                } else {
                    // Crear objeto Customer
                    Customer customer = new Customer();
                    customer.setCodcliente(codcliente); // Establecer el código del cliente para la actualización
                    customer.setNombre(nombre);
                    customer.setApepaterno(apepaterno);
                    customer.setApematerno(apematerno);
                    customer.setDni(dni); // Almacenar como cadena
                    customer.setFechanacimiento(fechanacimiento);
                    customer.setUsuario(usuario);
                    customer.setCorreo(correo);
                    customer.setContraseña(contrasena);

                    // Actualizar cliente
                    CustomerDAO customerDAO = new CustomerDAO();
                    String resp = customerDAO.ActualizarCliente(customer);

                    // Crear respuesta
                    PrintWriter out = response.getWriter();
                    if (!errorMsg.isEmpty()) {
                        out.print("{\"error\": \"" + errorMsg + "\"}");
                    } else {
                        out.print("{\"success\": \"" + resp + "\"}");
                    }
                    out.flush();
                }
            } else if ("delete".equals(accion)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CustomerDAO customerDAO = new CustomerDAO();
                String resultado = customerDAO.EliminarCliente(id);
                response.setContentType("application/json");
                response.getWriter().write("{\"message\": \"" + resultado + "\"}");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
