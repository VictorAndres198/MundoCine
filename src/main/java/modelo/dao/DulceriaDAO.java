package modelo.dao;

import conexion.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.CategoriaItem;
import modelo.dto.ItemDulceria;

public class DulceriaDAO {

    private ConectaBD getCnx() {
        return new ConectaBD();
    }

    public List<ItemDulceria> FindAll() {
        List<ItemDulceria> items = new ArrayList<>();
        //Query a ejecutar
        String query = "SELECT i.CodItem,i.Nombre,i.Descripcion, i.Precio, "
                + "c.CodCategoria,c.Nombre as Categoria FROM "
                + "itemdulceria i INNER JOIN categoria c "
                + "ON (i.CodCategoria = c.CodCategoria) WHERE i.Stock>0;";

        try (Connection conn = getCnx().getConnection(); 
             Statement st = conn.createStatement()) {

            //Ejecuta la busqueda
            st.execute(query);
            try (ResultSet rs = st.getResultSet()) {
                while (rs.next()) {
                    //Obtenemos los proveedores y los agregamos a la lista
                    items.add(this.getitemsDulceriaFromDB(rs));
                }
            }
        } catch (Exception e) {
            return null;
        }
        return items;
    }
    
        public int FindItemStock(int idItemDulceria) {
        //Query a ejecutar
        String action = "SELECT Stock FROM itemdulceria WHERE CodItem = ?;";
        int stock = 0;
        
        try( Connection conn = getCnx().getConnection();
             PreparedStatement pst = conn.prepareStatement(action)){

            pst.setInt(1, idItemDulceria);

            try(ResultSet rs = pst.executeQuery();){
                if(rs.next()){
                    //Obtenemos al proveedor correspondiente
                    return rs.getInt("Stock");       
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stock;
    }
    
    
    
    public void UpdateItemStock(int idItemDulceria,int stock) {
        //Query a ejecutar
        String sql = "UPDATE itemdulceria SET Stock = ? WHERE CodItem = ?;";
        
        try( Connection conn = getCnx().getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)){
            
            pst.setInt(1, stock);
            pst.setLong(2, idItemDulceria);
            pst.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    

    private ItemDulceria getitemsDulceriaFromDB(ResultSet rs) throws SQLException {
        return new ItemDulceria(rs.getInt("CodItem"),
                new CategoriaItem(rs.getInt("CodCategoria"), rs.getString("Categoria")),
                rs.getString("Nombre"),
                rs.getString("Descripcion"),
                rs.getString("Precio"));
    }


}
