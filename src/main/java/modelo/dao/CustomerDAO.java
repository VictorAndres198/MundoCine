package modelo.dao;

import conexion.conectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.dto.Customer;

/**
 *
 * @author usuario
 */
public class CustomerDAO {
    private Connection cnx;

    public CustomerDAO() {
        cnx = new conectaBD().getConnection();
    }
    
    public String insert(Customer cst) {
        String resp = "";
        PreparedStatement ps;
        ResultSet rs;
        String cadSQL = "INSERT INTO cliente (nombres, apepaterno, apematerno, dni,fechanacimiento,usuario,correo,contraseña) VALUES(?,?,?,?,?,?,?,?) ";
        
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
        } catch (SQLException ex) {
            resp = ex.getMessage();
        }
        return resp;
    }
    public Customer get(int idx) {
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
    }
}
