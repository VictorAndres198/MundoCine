/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 *
 * @author aldom
 */
public class Claims {
    private int id_reclamos;
    private String nombre_cliente;
    private String correo_reclamo;
    private String dni_reclamo;
    private String asunto_reclamo;
    private String fecha_reclamo;
    private String contenido_reclamo;
    private int Cod_local;

    public int getCod_local() {
        return Cod_local;
    }

    public void setCod_local(int Cod_local) {
        this.Cod_local = Cod_local;
    }
    
    public Claims(){
    }   

    public Claims(int id_reclamos, String nombre_cliente, String correo_reclamo, String dni_reclamo, String asunto_reclamo, String fecha_reclamo, String contenido_reclamo) {
        this.id_reclamos = id_reclamos;
        this.nombre_cliente = nombre_cliente;
        this.correo_reclamo = correo_reclamo;
        this.dni_reclamo = dni_reclamo;
        this.asunto_reclamo = asunto_reclamo;
        this.fecha_reclamo = fecha_reclamo;
        this.contenido_reclamo = contenido_reclamo;
    }

    public int getid_reclamos() {
        return id_reclamos;
    }
    public void setid_reclamos(int id_reclamos) {
        this.id_reclamos = id_reclamos;
    }
    public String getnombre_cliente() {
        return nombre_cliente;
    }
    public void setnombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }
    public String getcorreo_reclamo() {
        return correo_reclamo;
    }
    public void setcorreo_reclamo(String correo_reclamo) {
        this.correo_reclamo = correo_reclamo;
    }
    public String getdni_reclamo() {
        return dni_reclamo;
    }
    public void setdni_reclamo(String dni_reclamo) {
        this.dni_reclamo = dni_reclamo;
    }
    public String getasunto_reclamo() {
        return asunto_reclamo;
    }
    public void setasunto_reclamo(String asunto_reclamo) {
        this.asunto_reclamo = asunto_reclamo;
    }
    public String getfecha_reclamo() {
        return fecha_reclamo;
    }
    public void setfecha_reclamo(String fecha_reclamo) {
        this.fecha_reclamo = fecha_reclamo;
    }

    public String getcontenido_reclamo() {
        return contenido_reclamo;
    }

    public void setcontenido_reclamo(String contenido_reclamo) {
        this.contenido_reclamo = contenido_reclamo;
    }
    
}
