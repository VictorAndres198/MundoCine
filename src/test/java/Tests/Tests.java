
package Tests;

import Services.ServiceDulceria;
import Services.ServiceLocales;
/*import conexion.ConectaBD;*/
import java.sql.Connection;
import java.util.List;
import modelo.dao.CompraDulceriaDAO;
import modelo.dto.ItemCompra;
import modelo.dto.Locales;
import modelo.dto.ItemDulceria;
import org.junit.jupiter.api.Test;


public class Tests {

   @Test
    public void testCompras() {
        CompraDulceriaDAO dao = new CompraDulceriaDAO();
        List<ItemCompra> items = dao.FindItemsCompra(2);
        for(ItemCompra i : items){
            System.out.println(i);
        }
    }

}
