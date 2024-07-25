package ServLets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import modelo.dto.Movie;
import org.json.JSONException;

public class SvHome extends HttpServlet {

    private static final String API_KEY = "607a22ee6ed0f9f8c1d9e46ad960175f";
    private static final String LANGUAGE = "es-MX";

    private static final String UPCOMING_API_BASE_URL = "https://api.themoviedb.org/3/discover/movie";
    private static final String NOW_PLAYING_API_URL = "https://api.themoviedb.org/3/movie/now_playing";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action != null && action.equals("authenticate")) {
            handleAuthentication(request, response);
        } else if (action != null && action.equals("callback")) {
            handleCallback(request, response);
        } else {
        // Llamada al API y procesamiento de la respuesta
        String upcomingApiUrl = buildUpcomingApiUrl();
        List<Movie> upcomingMovies = fetchMoviesFromMultiplePages(upcomingApiUrl, 4, 0, true);
        List<Movie> nowShowingMovies = fetchMoviesFromAPI(NOW_PLAYING_API_URL + "?api_key=" + API_KEY + "&language=" + LANGUAGE + "&sort_by=popularity.desc&page=1", 1, false);

        // Ordenar ambas listas si es necesario
        // Ordenar upcomingMovies por mes y día
        Collections.sort(upcomingMovies, new Comparator<Movie>() {
            @Override
            public int compare(Movie m1, Movie m2) {
                // Comparar por mes
                int monthComparison = getMonthNumber(m1.getReleaseDate()) - getMonthNumber(m2.getReleaseDate());
                if (monthComparison != 0) {
                    return monthComparison;
                }

                // Si los meses son iguales, comparar por día
                return getDayOfMonth(m1.getReleaseDate()) - getDayOfMonth(m2.getReleaseDate());
            }
        });

        // Ordenar nowShowingMovies si es necesario

        // Pasar la lista de películas al JSP
        request.setAttribute("upcomingMovies", upcomingMovies);
        request.setAttribute("nowShowingMovies", nowShowingMovies);

        // Redirigir al JSP
        request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }
    
    private void handleAuthentication(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String requestToken = getRequestToken();
        String redirectUrl = "https://www.themoviedb.org/authenticate/" + requestToken + "?redirect_to=http://localhost:8080/MundoCine/SvHome?action=callback&request_token=" + requestToken;
        response.sendRedirect(redirectUrl);
    }
    
    private void handleCallback(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String requestToken = request.getParameter("request_token");
        String sessionId = createSession(requestToken);
        if (sessionId != null) {
            request.getSession().setAttribute("session_id", sessionId);
            response.sendRedirect("index.jsp");
        } else {
            response.getWriter().write("Failed to create session");
        }
    }
    
        private String getRequestToken() throws IOException {
        String apiUrl = "https://api.themoviedb.org/3/authentication/token/new?api_key=" + API_KEY;
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            JSONObject jsonResponse = new JSONObject(response.toString());
            return jsonResponse.getString("request_token");
        } else {
            throw new IOException("Failed to get request token");
        }
    }

    private String createSession(String requestToken) throws IOException {
        String apiUrl = "https://api.themoviedb.org/3/authentication/session/new?api_key=" + API_KEY;
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json; utf-8");
        connection.setRequestProperty("Accept", "application/json");
        connection.setDoOutput(true);

        String jsonInputString = new JSONObject().put("request_token", requestToken).toString();
        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder responseStrBuilder = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                responseStrBuilder.append(inputLine);
            }
            in.close();

            JSONObject jsonResponse = new JSONObject(responseStrBuilder.toString());
            return jsonResponse.getString("session_id");
        } else {
            return null;
        }
    }
    
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    // Crear un JSON de respuesta
    JSONObject jsonResponse = new JSONObject();
    jsonResponse.put("status", "success");
    jsonResponse.put("message", "Calificación recibida");

    PrintWriter out = response.getWriter();
    out.print(jsonResponse.toString());
    out.flush();
}

    
    
        private void rateMovie(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // URL de la API para calificar una película
        String movieId = request.getParameter("movieId");
        String apiUrl = "https://api.themoviedb.org/3/movie/" + movieId + "/rating";
        String sessionId = (String) request.getSession().getAttribute("session_id");

        if (sessionId == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User is not authenticated");
            return;
        }

        // Configurar la conexión
        URL url = new URL(apiUrl + "?api_key=" + API_KEY + "&session_id=" + sessionId);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json; utf-8");
        connection.setRequestProperty("Accept", "application/json");
        connection.setDoOutput(true);

        // Crear el JSON de la solicitud
        double rating = Double.parseDouble(request.getParameter("rating"));
        String jsonInputString = new JSONObject()
            .put("value", rating)
            .toString();

        // Enviar la solicitud
        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        // Leer la respuesta
        int responseCode = connection.getResponseCode();
        StringBuilder responseStrBuilder = new StringBuilder();
        if (responseCode == HttpURLConnection.HTTP_OK || responseCode == HttpURLConnection.HTTP_CREATED) {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    responseStrBuilder.append(responseLine.trim());
                }
            }
        } else {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getErrorStream(), "utf-8"))) {
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    responseStrBuilder.append(responseLine.trim());
                }
            }
        }

        // Establecer la respuesta HTTP
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(responseStrBuilder.toString());
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String buildUpcomingApiUrl() {
        // Obtener la fecha actual
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String currentDate = dateFormat.format(calendar.getTime());

        // Restar dos días a la fecha actual
        calendar.add(Calendar.DAY_OF_MONTH, -2);
        String twoDaysBefore = dateFormat.format(calendar.getTime());

        // Construir la URL con las fechas dinámicas
        String upcomingApiUrl = UPCOMING_API_BASE_URL + "?api_key=" + API_KEY
                + "&include_adult=false"
                + "&include_video=false"
                + "&sort_by=popularity.desc"
                + "&with_release_type=2|3"
                + "&release_date.gte=" + currentDate
                + "&release_date.lte=max_date"
                + "&with_original_language=en"
                + "&include_image_language=en,null"
                + "&language=" + LANGUAGE
                + "&page=";

        return upcomingApiUrl;
    }
    // Método auxiliar para obtener el día del mes a partir de una fecha en formato "dd de MMMM"
    private int getDayOfMonth(String formattedDate) {
        String[] parts = formattedDate.split(" de ");
        return Integer.parseInt(parts[0]);
    }

    // Método auxiliar para obtener el número de mes a partir de una fecha en formato "dd de MMMM"
    private int getMonthNumber(String formattedDate) {
        String[] parts = formattedDate.split(" de ");
        String monthName = parts[1];

        switch (monthName) {
            case "Enero": return 1;
            case "Febrero": return 2;
            case "Marzo": return 3;
            case "Abril": return 4;
            case "Mayo": return 5;
            case "Junio": return 6;
            case "Julio": return 7;
            case "Agosto": return 8;
            case "Septiembre": return 9;
            case "Octubre": return 10;
            case "Noviembre": return 11;
            case "Diciembre": return 12;
            default: return 0; // En caso de mes no reconocido
        }
    }
    
    private List<Movie> fetchMoviesFromAPI(String apiUrl, int ratingThreshold, boolean isUpcomingMovies) throws IOException {
        List<Movie> movies = new ArrayList<>();

        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // Procesar la respuesta JSON
            JSONObject jsonResponse = new JSONObject(response.toString());
            JSONArray results = jsonResponse.getJSONArray("results");

            DecimalFormat df = new DecimalFormat("#.0");

            // Obtener el año actual
            Calendar calendar = Calendar.getInstance();
            int currentYear = calendar.get(Calendar.YEAR);

            List<Movie> moviesThisYear = new ArrayList<>();

            for (int i = 0; i < results.length(); i++) {
                JSONObject movieJson = results.getJSONObject(i);
                    Object idObj = movieJson.get("id"); // Obtener el ID como Object
                    String id;

                    // Verificar el tipo de ID y convertirlo a String si es necesario
                    if (idObj instanceof Integer) {
                        id = String.valueOf(idObj); // Convertir entero a String
                    } else if (idObj instanceof String) {
                        id = (String) idObj; // Ya es una cadena
                    } else {
                        throw new JSONException("ID no es una cadena ni un entero");
                    }
                String title = movieJson.getString("title");

                // Verificar si "poster_path" y "release_date" están presentes y no son nulos
                if (!movieJson.isNull("poster_path") && !movieJson.isNull("release_date")) {
                    String posterPath = "https://image.tmdb.org/t/p/w500" + movieJson.getString("poster_path");
                    String releaseDate = movieJson.getString("release_date");

                    // Obtener el año de la fecha de estreno
                    String[] parts = releaseDate.split("-");
                    int releaseYear = Integer.parseInt(parts[0]);

                    // Filtrar por el año actual
                    if (releaseYear == currentYear) {
                        // Obtener el mes y el día de la fecha de estreno
                        int releaseMonth = Integer.parseInt(parts[1]);
                        int releaseDay = Integer.parseInt(parts[2]);

                        double voteAverage = movieJson.getDouble("vote_average");

                        // Filtrar según el ratingThreshold
                        if ((ratingThreshold == 0 && voteAverage == 0) || (ratingThreshold == 1 && voteAverage > 0)) {
                            String formattedVoteAverage = df.format(voteAverage);
                            String formattedDate = formatDate(releaseMonth, releaseDay);
                            Movie movie = new Movie(id, title, posterPath, formattedVoteAverage, formattedDate);

                            if (isUpcomingMovies) {
                                moviesThisYear.add(movie);
                            } else {
                                movies.add(movie); // Añadir a la lista general solo si no es de próximos estrenos
                            }
                        }
                    }
                }
            }

            // Si es para próximos estrenos, ordenar las películas por mes y luego por día dentro del mes
            if (isUpcomingMovies) {
                Collections.sort(moviesThisYear, new Comparator<Movie>() {
                    @Override
                    public int compare(Movie m1, Movie m2) {
                        // Comparar por mes
                        int monthComparison = getMonthNumber(m1.getReleaseDate()) - getMonthNumber(m2.getReleaseDate());
                        if (monthComparison != 0) {
                            return monthComparison;
                        }

                        // Si los meses son iguales, comparar por día
                        return getDayOfMonth(m1.getReleaseDate()) - getDayOfMonth(m2.getReleaseDate());
                    }
                });

                movies.addAll(moviesThisYear);
            }
        }
        return movies;
    }

    // Método auxiliar para obtener el nombre del mes a partir de su número
    private String formatDate(int month, int day) {
        String monthName;
        switch (month) {
            case 1:  monthName = "Enero"; break;
            case 2:  monthName = "Febrero"; break;
            case 3:  monthName = "Marzo"; break;
            case 4:  monthName = "Abril"; break;
            case 5:  monthName = "Mayo"; break;
            case 6:  monthName = "Junio"; break;
            case 7:  monthName = "Julio"; break;
            case 8:  monthName = "Agosto"; break;
            case 9:  monthName = "Septiembre"; break;
            case 10: monthName = "Octubre"; break;
            case 11: monthName = "Noviembre"; break;
            case 12: monthName = "Diciembre"; break;
            default: monthName = "";
        }
        return day + " de " + monthName;
    }

    private List<Movie> fetchMoviesFromMultiplePages(String apiUrl, int maxPages, int ratingThreshold, boolean isUpcomingMovies) throws IOException {
        List<Movie> allMovies = new ArrayList<>();

        for (int page = 1; page <= maxPages; page++) {
            String paginatedUrl = apiUrl + page;
            List<Movie> moviesFromPage = fetchMoviesFromAPI(paginatedUrl, ratingThreshold, isUpcomingMovies); // Ajustar llamada aquí
            allMovies.addAll(moviesFromPage);
        }

        return allMovies;
    }

}