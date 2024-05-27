
package ServLets;

import Services.ServiceDulceria;
import java.io.IOException;
import static java.util.Collections.list;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dto.itemDulceria;


@WebServlet(name = "Dulceria", urlPatterns = {"/Dulceria"})
public class SvDulceria extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServiceDulceria servDulceria = new ServiceDulceria();
        
        List<itemDulceria> itemsDulceria = servDulceria.FindAll();
        
        request.setAttribute("itemsDulceria", itemsDulceria);
        
        response.setContentType("text/html;charset=UTF-8");
        getServletContext().getRequestDispatcher("/dulceria.jsp").include(request, response);
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
