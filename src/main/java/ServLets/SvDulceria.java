
package ServLets;

import Services.ServiceCompraDulceria;
import Services.ServiceDulceria;
import Services.ServiceLocales;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dto.Compra;
import modelo.dto.Customer;
import modelo.dto.ItemCompra;
import modelo.dto.Locales;
import modelo.dto.ItemDulceria;


@WebServlet(name = "Dulceria", urlPatterns = {"/Dulceria"})
public class SvDulceria extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");  
        
        
        //instanciamos el servicio para ejecutar acciones de consulta
        ServiceDulceria servDulceria = new ServiceDulceria();
        ServiceLocales servLocales = new ServiceLocales();
        ServiceCompraDulceria servCompraDulceria = new ServiceCompraDulceria();
        
        //instaciones un objeto para manejar datos JSON
        Gson gson = new Gson();
        String jsonData;
        
        //obtenemos todos los nombres de los parametros en la peticion GET
        Enumeration<String> params = request.getParameterNames();
        
        //guardamos todos estos nombres en un conjunto
        Set<String> requestParams = new HashSet<>();
        while (params.hasMoreElements()) {
            String value= params.nextElement();
            System.out.println(value);
            requestParams.add(value);
        }
        
        //Ejecutamos acciones segun que parametro viaja en la peticion
        //si es un parametro ?locales=0
        if (requestParams.contains("locales")) {
        
            List<Locales> locales = servLocales.FindAll();
            jsonData= gson.toJson(locales);
            response.getWriter().print(jsonData);
        
        //si es un parametro ?productos=0
        }else if(requestParams.contains("productos")){

            List<ItemDulceria> productos = servDulceria.FindAll();
            jsonData= gson.toJson(productos);
            response.getWriter().print(jsonData);
        
        }else if(requestParams.contains("customer") && requestParams.contains("pass")){

            String customerId = request.getParameter("customer");
            String customerPass = request.getParameter("pass");
            boolean customerFound = servCompraDulceria.FindCustomer(customerId,customerPass);
            String status="OK";
            String msj="user found";
            if(!customerFound){
                status="Error";
                msj="user NOT found";
            }
            
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("status",status);
            jsonResponse.addProperty("message", msj);
            response.getWriter().write(jsonResponse.toString());
            
        
        }else if(requestParams.contains("compra") && requestParams.contains("userId")){
            
            int idCompra = Integer.parseInt(request.getParameter("compra"));
            if(idCompra==0){
                String customerId = request.getParameter("userId");
                List<Compra> compras = servCompraDulceria.FindCompras(Integer.parseInt(customerId));

                // Configurar Gson para serializar LocalDateTime
                Gson gsonv2 = new GsonBuilder()
                    .registerTypeAdapter(LocalDateTime.class, new JsonSerializer<LocalDateTime>() {
                        private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

                        @Override
                        public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
                            return new JsonPrimitive(src.format(formatter));
                        }
                    })
                    .create();

                jsonData= gsonv2.toJson(compras);
                response.getWriter().print(jsonData);
                
            }else{
                List<ItemCompra> items = servCompraDulceria.FindItemsCompra(idCompra);
                jsonData= gson.toJson(items);
                System.out.println(jsonData);
                response.getWriter().print(jsonData);
            }
        }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");     
        
        //instanciamos el servicios necesarios para crear la boleta
        ServiceDulceria servDulceria = new ServiceDulceria();
        ServiceCompraDulceria servCompraDulceria = new ServiceCompraDulceria();
        
        //instaciones un objeto para manejar datos JSON
        Gson gson = new Gson();
        
        // Leer el cuerpo de la solicitud
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        
        String jsonData = sb.toString();
        
        
        System.out.println("Contenido:\n"+jsonData);
        
        // Convertir JSON a objeto Java para poder construir los demas objs
        JsonObject JsonBody = gson.fromJson(jsonData, JsonObject.class);
        
        //CONSTRUYENDO LOS ITEMS DE LA COMPRA
        List<JsonElement> itemsJson = JsonBody.get("items").getAsJsonArray().asList();
        List<ItemCompra> items = new ArrayList<>();
        for(JsonElement e:itemsJson){
            JsonObject itemJson = e.getAsJsonObject();
            
            int idProd = itemJson.get("id").getAsInt();
            String nomProd = itemJson.get("nombre").getAsString();
            int cant = itemJson.get("cantidad").getAsInt();
            BigDecimal subtotal = itemJson.get("subtotal").getAsBigDecimal();
            
            items.add(new ItemCompra(new ItemDulceria(idProd,nomProd), cant, subtotal));
        }
        
        //FEECHA_ACTUAL
        LocalDateTime  hoy = LocalDateTime.now();
        
        //CONSTRUYENDO LA COMPRA
        
        String tipoCompra = JsonBody.get("order").getAsString();
        int codCliente = JsonBody.get("cliente").getAsInt();
        if(tipoCompra.equalsIgnoreCase("anonymous")){
            codCliente = servCompraDulceria.GetCustomerId(String.valueOf(codCliente));
        }
        int codLocal = JsonBody.get("local").getAsInt();
        BigDecimal total = JsonBody.get("total").getAsBigDecimal();
        Compra compra = new Compra(new Customer(codCliente), new Locales(codLocal), hoy, total, items);
        
        System.out.println(compra);
        
        //GUARDANDO DATOS EN LA BD
        //1°->COMPRA
        long idCompra = servCompraDulceria.InsertCompra(compra);
        
        //2.1°->ITEMS DE LA COMPRA
        for(ItemCompra i: compra.getItems()){
            servCompraDulceria.InsertItemCompra(i, idCompra);
            //2.2°->ACTUALIZAR STOCK DEL ITEM COMPRADO
            int codItemDulceria = i.getProducto().getCodigo();
            int currentStock = servDulceria.FindItemStock(codItemDulceria);
            int newStock = currentStock - i.getCantidad();
            servDulceria.UpdateItemStock(codItemDulceria, newStock);
        }
        
        //ENVIAMOS LA RESPUESTA
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("status","OK");
        jsonResponse.addProperty("message", "COMPRA REALIZADA");
        response.getWriter().write(jsonResponse.toString());
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                
        resp.setContentType("application/json; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");  
        
        
        //instanciamos el servicio para ejecutar acciones de consulta
        ServiceDulceria servDulceria = new ServiceDulceria();
        ServiceCompraDulceria servCompraDulceria = new ServiceCompraDulceria();
        
        //instaciones un objeto para manejar datos JSON
        Gson gson = new Gson();
        String jsonData;
        
        //obtenemos todos los nombres de los parametros en la peticion
        Enumeration<String> params = req.getParameterNames();
        
        //guardamos todos estos nombres en un conjunto
        Set<String> requestParams = new HashSet<>();
        while (params.hasMoreElements()) {
            String value= params.nextElement();
            System.out.println(value);
            requestParams.add(value);
        }
        
        if (requestParams.contains("compra")) {
            int idCompra = Integer.parseInt(req.getParameter("compra"));
            
            List<ItemCompra> items = servCompraDulceria.FindItemsCompra(idCompra);
            
            for (ItemCompra i : items) {
                int idItemDulceria = i.getProducto().getCodigo();
                int currentStock = servDulceria.FindItemStock(idItemDulceria);
                int newStock = currentStock + i.getCantidad();
                servDulceria.UpdateItemStock(idItemDulceria, newStock);
                servCompraDulceria.DeleteItemCompra(idCompra);
            }
            
            servCompraDulceria.DeleteCompra(idCompra);
            
            //ENVIAMOS LA RESPUESTA
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("status","OK");
            jsonResponse.addProperty("message", "COMPRA ELIMINADA");
            resp.getWriter().write(jsonResponse.toString());
            
        }
        
    }


    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
