/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.dto.Claims;
import conexion.conectaBD;
/**
 *
 * @author aldom
 */
public class ClaimsDAO {
    private Connection cnx;
    
    public ClaimsDAO(){
        cnx = new conectaBD().getConnection();
    }
    
    public String insert(Claims c) {
        String resp = "";
        PreparedStatement ps;
        ResultSet rs;
        String cadSQL = "INSERT INTO reclamos (NombreCli, CorreoReclamo, dniReclamo, fechaReclamo, AsuntoReclamo, ContenidoReclamo) VALUES(?,?,?,?,?,?) ";
        try {
            ps = cnx.prepareStatement(cadSQL);
            ps.setString(1,c.getNombre_cliente());
            ps.setString(2,c.getCorreo_reclamo());
            ps.setString(3,c.getDni_reclamo());
            ps.setString(4,c.getFecha_reclamo());
            ps.setString(5,c.getAsunto_reclamo());
            ps.setString(6,c.getContenido_reclamo());
            ps.executeUpdate();
        }catch (SQLException ex){
            resp = ex.getMessage();
        }
        return resp;
        
    }
    
    
}
