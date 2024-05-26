/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ServLets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.dao.CustomerDAO;
import modelo.dto.Customer;

/**
 *
 * @author usuario
 */
public class cntCustomer extends HttpServlet{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion-customer");
        if (accion != null) {
            if (accion.equals("Enviar-customer")) {
               
                String nombre = request.getParameter("nombre");
                String apepaterno = request.getParameter("apepaterno");
                String apematerno= request.getParameter("apematerno");
                String dni= request.getParameter("dni");
                String fechanacimiento= request.getParameter("fechanacimiento");
                String usuario= request.getParameter("usuario");
                String correo= request.getParameter("correo");
                String contraseña= request.getParameter("contraseña");
                
                request.setAttribute("nombre", nombre);
                request.setAttribute("apepaterno", apepaterno);
                request.setAttribute("apematerno", apematerno);
                request.setAttribute("dni", dni);
                request.setAttribute("fechanacimiento", fechanacimiento);
                request.setAttribute("usuario", usuario);
                request.setAttribute("correo", correo);
                request.setAttribute("contraseña", contraseña);
                
                // Limpiar los atributos antes de reenviar
                request.setAttribute("nombre", "");
                request.setAttribute("apepaterno", "");
                request.setAttribute("apematerno", "");
                request.setAttribute("dni", "");
                request.setAttribute("fechanacimiento", "");
                request.setAttribute("usuario", "");
                request.setAttribute("correo", "");
                request.setAttribute("contraseña", "");

                Customer cst = new Customer();
                cst.setNombre(nombre);
                cst.setApepaterno(apepaterno);
                cst.setApematerno(apematerno);
                cst.setDni(dni);
                cst.setFechanacimiento(fechanacimiento);
                cst.setUsuario(usuario);
                cst.setCorreo(correo);
                cst.setContraseña(contraseña);
                String resp = new CustomerDAO().insert(cst);
                
                request.getRequestDispatcher("./create-account.jsp").forward(request, response);
            }
            
        }
    }
}
