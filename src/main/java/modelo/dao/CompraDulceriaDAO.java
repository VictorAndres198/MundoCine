package modelo.dao;

import conexion.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import modelo.dto.CategoriaItem;
import modelo.dto.Compra;
import modelo.dto.ItemCompra;
import modelo.dto.ItemDulceria;
import modelo.dto.Locales;

public class CompraDulceriaDAO {

    private ConectaBD getCnx() {
        return new ConectaBD();
    }
    
    public List<Compra> FindCompras(int idCliente) {
        List<Compra> compras = new ArrayList<>();
        //Query a ejecutar
        String query = "SELECT  c.CodCompra as Id,l.Nombre as Local,c.Fecha_Hora,"
                + " c.Total FROM compra c INNER JOIN locales l "
                + " ON (c.CodLocal = l.CodLocal) WHERE c.CodCliente = ?;";
       
        try( Connection conn = getCnx().getConnection();
             PreparedStatement pst = conn.prepareStatement(query)){
             pst.setInt(1, idCliente);
            //Ejecuta la busqueda
            
            try(ResultSet rs = pst.executeQuery()){
                while(rs.next()){
                    //Obtenemos los proveedores y los agregamos a la lista
                    compras.add(this.getCompraFromDB(rs));
                }
            }
        } catch (Exception e) {
            return null;
        }
        return compras;
    }
    
    public List<ItemCompra> FindItemsCompra(int idCompra) {
        List<ItemCompra> items = new ArrayList<>();
        //Query a ejecutar
        String query = "SELECT dc.CodDetalleCompra as Id,i.CodItem as codProd,i.Nombre as Producto,"
                + " dc.Cantidad,dc.Subtotal FROM detallecompra dc "
                + " INNER JOIN itemdulceria i ON (dc.CodItemDulceria = i.CodItem)"
                + " WHERE dc.CodCompra=?;";
       
        try( Connection conn = getCnx().getConnection();
             PreparedStatement pst = conn.prepareStatement(query)){
             pst.setInt(1, idCompra);
            //Ejecuta la busqueda
            
            try(ResultSet rs = pst.executeQuery()){
                while(rs.next()){
                    //Obtenemos los proveedores y los agregamos a la lista
                    items.add(this.getitemCompraFromDB(rs));
                }
            }
        } catch (Exception e) {
            return null;
        }
        return items;
    }

    public long InsertCompra(Compra c) {

        long idCompraInsertada = 0;
        //Query a ejecutar
        String sql = "INSERT INTO compra(CodCliente,CodLocal,Fecha_Hora,Total) values (?,?,?,?);";

        try (Connection conn = getCnx().getConnection(); 
             PreparedStatement pst = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            setCompraToDB(pst, c);
            int affectedRows = pst.executeUpdate();

            if (affectedRows > 0) {
                // Obtener las claves generadas
                try (ResultSet generatedKeys = pst.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getLong(1);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return idCompraInsertada;
    }
    
    
    public void InsertItemCompra(ItemCompra item, long idCompra) {

        //Query a ejecutar
        String action = "INSERT INTO detallecompra(CodCompra,CodItemDulceria,Cantidad,Subtotal) values (?,?,?,?);";

        try (Connection conn = getCnx().getConnection();
             PreparedStatement pst = conn.prepareStatement(action)) {

            setItemCompraToDB(pst, item, idCompra);
            pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void DeleteCompra(int idCompra) {

        //Query a ejecutar
        String sql = "DELETE FROM compra WHERE CodCompra = ?;";

        try (Connection conn = getCnx().getConnection(); 
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setInt(1,idCompra);
            pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void DeleteItemCompra(int idCompra) {

        //Query a ejecutar
        String sql = "DELETE FROM detallecompra WHERE CodCompra = ?;";

        try (Connection conn = getCnx().getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setInt(1,idCompra);
            pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    private Compra getCompraFromDB(ResultSet rs) throws SQLException {
        return new Compra(rs.getInt("Id"),
                new Locales(rs.getString("Local")),
                rs.getObject("Fecha_Hora",LocalDateTime.class),
                rs.getBigDecimal("Total"));
    }

    private ItemCompra getitemCompraFromDB(ResultSet rs) throws SQLException {
        return new ItemCompra(rs.getInt("Id"),
                new ItemDulceria(rs.getInt("codProd"),rs.getString("Producto")),
                rs.getInt("Cantidad"),
                rs.getBigDecimal("Subtotal"));
    }

    private void setCompraToDB(PreparedStatement pst, Compra c) throws SQLException {
        pst.setInt(1, c.getCustomer().getCodcliente());
        pst.setInt(2, c.getLocal().getCodLocal());
        pst.setTimestamp(3, Timestamp.valueOf(c.getFecha_hora()));
        pst.setBigDecimal(4, c.getTotal());
    }

    private void setItemCompraToDB(PreparedStatement pst, ItemCompra item, long idCompra) throws SQLException {
        pst.setLong(1, idCompra);
        pst.setInt(2, item.getProducto().getCodigo());
        pst.setInt(3, item.getCantidad());
        pst.setBigDecimal(4, item.getSubtotal());
    }

}
