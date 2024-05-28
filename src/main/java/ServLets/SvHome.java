package ServLets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dto.Movie;

public class SvHome extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Simular una lista de películas
        List<Movie> movies = new ArrayList<>();
        movies.add(new Movie("Amigos Imaginarios", "resources/img/cartelera/AmigosImaginarios.jpg", "8.5"));
        movies.add(new Movie("El Especialista", "resources/img/cartelera/ElEspecialista.jpg", "7.2"));
        movies.add(new Movie("Furiosa", "resources/img/cartelera/Furiosa.jpg", "8.5"));
        movies.add(new Movie("Garfield", "resources/img/cartelera/Garfield.jpg", "7.2"));
        movies.add(new Movie("El reino del planeta de los simios", "resources/img/cartelera/PlanetaSimios.jpg", "8.5"));
        movies.add(new Movie("Tarot", "resources/img/cartelera/Tarot.jpg", "7.2"));        
        // Añade más películas según sea necesario

        // Pasar la lista de películas al JSP
        request.setAttribute("movies", movies);

        // Redirigir al JSP
        request.getRequestDispatcher("home.jsp").forward(request, response);
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