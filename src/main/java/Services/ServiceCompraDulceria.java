
package Services;

import java.util.List;
import modelo.dao.CompraDulceriaDAO;
import modelo.dao.CustomerDAO;
import modelo.dao.DulceriaDAO;
import modelo.dto.Compra;
import modelo.dto.ItemCompra;
import modelo.dto.ItemDulceria;

public class ServiceCompraDulceria{
    
    private CompraDulceriaDAO compraDulceriaDao;
    private CustomerDAO customerDao;

    public ServiceCompraDulceria() {
        this.compraDulceriaDao = new CompraDulceriaDAO();
        this.customerDao = new CustomerDAO();
    }
    
    
    //METODOS PARA HISTORIAL DE COMPRAS
    
    public List<Compra> FindCompras(int idCliente){
        return compraDulceriaDao.FindCompras(idCliente);
    }
    
    public List<ItemCompra> FindItemsCompra(int idCompra){
        return compraDulceriaDao.FindItemsCompra(idCompra);
    }
    
    //METODOS PARA GUARDAR/ELIMINAR COMPRAS
    
    public long InsertCompra(Compra c){
        return compraDulceriaDao.InsertCompra(c);
    }
    
    public void InsertItemCompra(ItemCompra item, long idCompra){
        compraDulceriaDao.InsertItemCompra(item, idCompra);
    }
    
    public void DeleteCompra(int idCompra){
        compraDulceriaDao.DeleteCompra(idCompra);
    }
    
    public void DeleteItemCompra(int idCompra){
        compraDulceriaDao.DeleteItemCompra(idCompra);
    }
    
    //METODOS PARA CORROBORAR SI EL USUARIO EXISTE SEGUN DNI
    public boolean FindCustomer(String dniCustomer,String pass){
        return customerDao.FindValidCustomer(dniCustomer,pass);
    }
    
    //METODO PARA OBTENER EL ID DEL CLIENTE POR EL DNI
    public int GetCustomerId(String dniCustomer){
        return customerDao.getCustomerId(dniCustomer);
    }

    
    
}
