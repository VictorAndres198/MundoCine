package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.dto.Claims;
import conexion.ConectaBD;

public class ClaimsDAO {

    private Connection cnx;

    public ClaimsDAO() {
        cnx = new ConectaBD().getConnection();
    }

    public String insert(Claims c) {
        String resp = "";
        String cadSQL = "INSERT INTO reclamos (NombreCli, CorreoReclamo, dniReclamo, fechaReclamo, AsuntoReclamo, ContenidoReclamo, CodLocal) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = cnx.prepareStatement(cadSQL)) {
            ps.setString(1, c.getnombre_cliente());
            ps.setString(2, c.getcorreo_reclamo());
            ps.setString(3, c.getdni_reclamo());
            ps.setDate(4, java.sql.Date.valueOf(c.getfecha_reclamo()));  // Asumiendo que `getfecha_reclamo` retorna un `String` en formato "yyyy-mm-dd"
            ps.setString(5, c.getasunto_reclamo());
            ps.setString(6, c.getcontenido_reclamo());
            ps.setInt(7, c.getCod_local());
            ps.executeUpdate();
        } catch (SQLException ex) {
            resp = ex.getMessage();
        }

        return resp;
    }
}
