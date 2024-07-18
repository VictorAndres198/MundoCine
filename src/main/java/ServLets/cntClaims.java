package ServLets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.ClaimsDAO;
import modelo.dto.Claims;

public class cntClaims extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            if (accion.equals("Enviar")) {
                String nombre_cliente = request.getParameter("name");
                String correo_reclamo = request.getParameter("email");
                String dni_reclamo = request.getParameter("ID");
                String fecha_reclamo = request.getParameter("fecha_reclamo");
                String asunto_reclamo = request.getParameter("Asunto");
                String contenido_reclamo = request.getParameter("ContenidoReclamo");
                int cod_local = Integer.parseInt(request.getParameter("codLocal")); // Obtener Cod_local del formulario

                Claims c = new Claims();
                c.setnombre_cliente(nombre_cliente);
                c.setcorreo_reclamo(correo_reclamo);
                c.setdni_reclamo(dni_reclamo);
                c.setfecha_reclamo(fecha_reclamo);
                c.setasunto_reclamo(asunto_reclamo);
                c.setcontenido_reclamo(contenido_reclamo);
                c.setCod_local(cod_local); // Establecer Cod_local

                ClaimsDAO claimsDAO = new ClaimsDAO();
                String resp = claimsDAO.insert(c);

                request.setAttribute("respuesta", resp); // Pasar la respuesta a la vista
                request.getRequestDispatcher("/claims.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}