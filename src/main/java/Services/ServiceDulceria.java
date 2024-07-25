
package Services;

import java.util.List;
import modelo.dao.DulceriaDAO;
import modelo.dto.ItemDulceria;

public class ServiceDulceria{
    
    private DulceriaDAO dulceriaDao;

    public ServiceDulceria() {
        this.dulceriaDao = new DulceriaDAO();
    }
    
    
    public List<ItemDulceria> FindAll(){
        return dulceriaDao.FindAll();
    }
    
    
    //METODOS PARA MANEJAR STOCK DE ITEMS DE LA DULCERIA
    
    public int FindItemStock(int idItemDulceria){
        return dulceriaDao.FindItemStock(idItemDulceria);
    }
    
    public void UpdateItemStock(int idItemDulceria,int stock){
        dulceriaDao.UpdateItemStock(idItemDulceria, stock);
    }
    
    
}
