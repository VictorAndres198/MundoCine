package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.dto.Customer;
import conexion.ConectaBD;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    private Connection cnx;

    public CustomerDAO() {
        cnx = new ConectaBD().getConnection();
    }
    
    public boolean insert(Customer cst) {
        boolean success = false;
        PreparedStatement ps;
        String cadSQL = "INSERT INTO cliente (nombres, apepaterno, apematerno, dni, fechanacimiento, usuario, correo, contraseña) VALUES(?,?,?,?,?,?,?,?)";
        
        try {
            ps = cnx.prepareStatement(cadSQL);
            ps.setString(1, cst.getNombre());
            ps.setString(2, cst.getApepaterno());
            ps.setString(3, cst.getApematerno());
            ps.setString(4, cst.getDni());
            ps.setString(5, cst.getFechanacimiento());
            ps.setString(6, cst.getUsuario());
            ps.setString(7, cst.getCorreo());
            ps.setString(8, cst.getContraseña());
            ps.executeUpdate();
            success = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return success;
    }
    
    public Customer authenticate(String correo, String contrasena) {
        Customer cst = null;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT * FROM cliente WHERE correo = ? AND contraseña = ?";

        try {
            ps = cnx.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();

            if (rs.next()) {
                cst = new Customer();
                cst.setCodcliente(rs.getInt("codcliente"));
                cst.setNombre(rs.getString("nombres"));
                cst.setApepaterno(rs.getString("apepaterno"));
                cst.setApematerno(rs.getString("apematerno"));
                cst.setDni(rs.getString("dni"));
                cst.setFechanacimiento(rs.getString("fechanacimiento"));
                cst.setUsuario(rs.getString("usuario"));
                cst.setCorreo(rs.getString("correo"));
                cst.setContraseña(rs.getString("contraseña"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return cst;
    }
    
    public List<Customer> ListarClientes(){
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT CodCliente, Nombres, ApePaterno, ApeMaterno, DNI, FechaNacimiento, Usuario, Correo, Contraseña FROM Cliente;";
        List<Customer> lista = null;
        
        try{
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();
            lista = new ArrayList<>();
            while(rs.next()){
            Customer cus = new Customer(
                    rs.getInt("CodCliente"),
                    rs.getString("Nombres"),
                    rs.getString("ApePaterno"),
                    rs.getString("ApeMaterno"),
                    rs.getString("DNI"),
                    rs.getString("FechaNacimiento"),
                    rs.getString("Usuario"),
                    rs.getString("Correo"),
                    rs.getString("Contraseña")
            );
            lista.add(cus);
            }
        }catch(SQLException ex){
            System.out.println("Error al listar los productos: " + ex);
        }
        return lista;
    }
    
    public String RegistrarCliente(Customer c) {
        String resp = "";
        PreparedStatement ps = null;
        String sql = "INSERT INTO Cliente (Nombres, ApePaterno, ApeMaterno, DNI, FechaNacimiento, Usuario, Correo, Contraseña) VALUES (?,?,?,?,?,?,?,?);";

        try {
            ps = cnx.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getApepaterno());
            ps.setString(3, c.getApematerno());
            ps.setString(4, c.getDni());
            ps.setString(5, c.getFechanacimiento());
            ps.setString(6, c.getUsuario());
            ps.setString(7, c.getCorreo());
            ps.setString(8, c.getContraseña());
            ps.executeUpdate(); // Ejecutar la instrucción SQL
            resp = "Cliente registrado exitosamente";
        } catch (SQLException ex) {
            resp = ex.getMessage();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                resp = ex.getMessage();
            }
        }
        return resp;
    }
    

    public boolean FindValidCustomer(String dniCustomer,String pass) {
        boolean CustomerFound = true;
        
        String query = "SELECT count(*) as rs FROM mundocine.cliente where DNI=?"
                + "AND contraseña = ?;";
        
        try( Connection conn = new ConectaBD().getConnection();
             PreparedStatement pst = conn.prepareStatement(query)){
             pst.setString(1, dniCustomer);
             pst.setString(2, pass);
            //Ejecuta la busqueda
            
            try(ResultSet rs = pst.executeQuery()){
                rs.next();
                if(rs.getInt("rs")==0){
                    return false;
                }
            }
        } catch (Exception e) {
        }
        return CustomerFound;
    }

    public int getCustomerId(String dniCustomer) {
        int CustomerId = 0;
        
        String query = "SELECT CodCliente FROM cliente where DNI=?;";
        
        try( Connection conn = new ConectaBD().getConnection();
             PreparedStatement pst = conn.prepareStatement(query)){
             pst.setString(1, dniCustomer);
            //Ejecuta la busqueda
            
            try(ResultSet rs = pst.executeQuery()){
                rs.next();
                CustomerId =  rs.getInt("CodCliente");
            }
        } catch (Exception e) {
        }
        return CustomerId;
    }

    public Customer ObtenerCliente (int cod){
        Customer c = null;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT CodCliente, Nombres, ApePaterno, ApeMaterno, DNI, FechaNacimiento, Usuario, Correo, Contraseña FROM Cliente WHERE CodCliente=?;";
        
        try{
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, cod);
            rs = ps.executeQuery();
            if (rs.next()) {
                c = new Customer();
                c.setCodcliente(rs.getInt("CodCliente"));
                c.setNombre(rs.getString("Nombres"));
                c.setApepaterno(rs.getString("ApePaterno"));
                c.setApematerno(rs.getString("ApeMaterno"));
                c.setDni(rs.getString("DNI"));
                c.setFechanacimiento(rs.getString("FechaNacimiento"));
                c.setUsuario(rs.getString("Usuario"));
                c.setCorreo(rs.getString("Correo"));
                c.setContraseña(rs.getString("Contraseña"));
            } else {
                System.out.println("No se encontró ningún cliente con el código: " + cod);
            }
            rs.close();
            ps.close();
        }catch(SQLException ex){
            System.out.println("Error al obtener cliente por su código: " + ex);
        }
        return c;
    }
    
    public String ActualizarCliente (Customer c){
        String resp = "";
        PreparedStatement ps;
        ResultSet rs;
        String sql = "UPDATE Cliente SET Nombres=?, ApePaterno=?, ApeMaterno=?, DNI=?, FechaNacimiento=?, Usuario=?, Correo=?, Contraseña=? WHERE CodCliente=?;";
        
        try{
            ps = cnx.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getApepaterno());
            ps.setString(3, c.getApematerno());
            ps.setString(4, c.getDni());
            ps.setString(5, c.getFechanacimiento());
            ps.setString(6, c.getUsuario());
            ps.setString(7, c.getCorreo());
            ps.setString(8,c.getContraseña());
            ps.setInt(9, c.getCodcliente());
            int ctos = ps.executeUpdate();
            if (ctos == 0) {
                resp = "No se ha actualizado";
            }
            ps.close();
        }catch(SQLException ex){
            resp = ex.getMessage();
        }
        return resp;
    }
    
    public String EliminarCliente(int codCliente) {
        String resp = "";
        PreparedStatement ps = null;
        String sql = "DELETE FROM Cliente WHERE CodCliente=?;";

        try {
            ps = cnx.prepareStatement(sql);
            ps.setInt(1, codCliente);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                resp = "Cliente eliminado exitosamente";
            } else {
                resp = "No se encontró el cliente con el código proporcionado";
            }
        } catch (SQLException ex) {
            resp = ex.getMessage();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                resp = ex.getMessage();
            }
        }
        return resp;

    }

    /*public Customer get(int idx) {
        Customer cst = null;
        PreparedStatement ps;
        ResultSet rs;
        String cadSQL = "SELECT * FROM cliente where dni=?";
        try {
            ps = cnx.prepareStatement(cadSQL);
            ps.setInt(1, idx);
            rs = ps.executeQuery();
            if  (rs.next()){
                cst = new Customer();
                cst.setCodcliente(rs.getInt("codcliente"));
                cst.setNombre(rs.getString("nombres"));
                cst.setApepaterno(rs.getString("apepaterno"));
                cst.setApematerno(rs.getString("apematerno"));
                cst.setDni(rs.getString("dni"));
                cst.setFechanacimiento(rs.getString("fechanacimiento"));
                cst.setUsuario(rs.getString("usuario"));
                cst.setCorreo(rs.getString("correo"));
                cst.setContraseña(rs.getString("contraseña"));
            }
        } catch (SQLException ex) {
        }
        return cst;
    }*/
    
    
}
