package ServLets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.CustomerDAO;
import modelo.dto.Customer;

/**
 *
 * @author usuario
 */
public class cntCustomer extends HttpServlet{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            if (accion.equals("Crear Cuenta")) {
               
                String nombre = request.getParameter("nombre");
                String apepaterno = request.getParameter("apepaterno");
                String apematerno= request.getParameter("apematerno");
                String dni= request.getParameter("dni");
                String fechanacimiento= request.getParameter("fechanacimiento");
                String usuario= request.getParameter("usuario");
                String correo= request.getParameter("correo");
                String contrasena= request.getParameter("contrasena");
                
                request.setAttribute("nombre", nombre);
                request.setAttribute("apepaterno", apepaterno);
                request.setAttribute("apematerno", apematerno);
                request.setAttribute("dni", dni);
                request.setAttribute("fechanacimiento", fechanacimiento);
                request.setAttribute("usuario", usuario);
                request.setAttribute("correo", correo);
                request.setAttribute("contrasena", contrasena);
                
                // Limpiar los atributos antes de reenviar
                request.setAttribute("nombre", "");
                request.setAttribute("apepaterno", "");
                request.setAttribute("apematerno", "");
                request.setAttribute("dni", "");
                request.setAttribute("fechanacimiento", "");
                request.setAttribute("usuario", "");
                request.setAttribute("correo", "");
                request.setAttribute("contrasena", "");

                Customer cst = new Customer();
                cst.setNombre(nombre);
                cst.setApepaterno(apepaterno);
                cst.setApematerno(apematerno);
                cst.setDni(dni);
                cst.setFechanacimiento(fechanacimiento);
                cst.setUsuario(usuario);
                cst.setCorreo(correo);
                cst.setContraseña(contrasena);
                String resp = new CustomerDAO().insert(cst);
                
                request.getRequestDispatcher("./create-account.jsp").forward(request, response);
            }
            
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
        processRequest(request, response);
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
        processRequest(request, response);
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
