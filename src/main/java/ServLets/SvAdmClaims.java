package ServLets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.AdmClaimsDAO;
import modelo.dto.Claims;
import com.google.gson.Gson;

public class SvAdmClaims extends HttpServlet {

    private AdmClaimsDAO admClaimsDAO;

    @Override
    public void init() {
        admClaimsDAO = new AdmClaimsDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action != null) {
                if (action.equals("getClaim")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Claims claim = admClaimsDAO.getClaimById(id);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    String json = new Gson().toJson(claim);
                    try (PrintWriter out = response.getWriter()) {
                        out.print(json);
                        out.flush();
                    }
                    return;
                } else if (action.equals("delete")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    admClaimsDAO.deleteClaim(id);
                    return;
                } else if (action.equals("update")) {
                    int id = Integer.parseInt(request.getParameter("id_reclamos"));
                    String nombre_cliente = request.getParameter("nombre_cliente");
                    String correo_reclamo = request.getParameter("correo_reclamo");
                    String dni_reclamo = request.getParameter("dni_reclamo");
                    String fecha_reclamo = request.getParameter("fecha_reclamo");
                    String asunto_reclamo = request.getParameter("asunto_reclamo");
                    String contenido_reclamo = request.getParameter("contenido_reclamo");

                    Claims claim = new Claims();
                    claim.setid_reclamos(id);
                    claim.setnombre_cliente(nombre_cliente);
                    claim.setcorreo_reclamo(correo_reclamo);
                    claim.setdni_reclamo(dni_reclamo);
                    claim.setfecha_reclamo(fecha_reclamo);
                    claim.setasunto_reclamo(asunto_reclamo);
                    claim.setcontenido_reclamo(contenido_reclamo);

                    admClaimsDAO.updateClaim(claim);
                    return;
                }
            }

            int codLocal = Integer.parseInt(request.getParameter("codLocal"));
            List<Claims> claimsList = admClaimsDAO.getClaimsByLocal(codLocal);
            
            boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
            if (isAjax) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                String json = new Gson().toJson(claimsList);
                try (PrintWriter out = response.getWriter()) {
                    out.print(json);
                    out.flush();
                }
            } else {
                request.setAttribute("claimsList", claimsList);
                request.getRequestDispatcher("AdmClaims.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
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