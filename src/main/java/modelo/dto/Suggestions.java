/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo.dto;

/**
 *
 * @author ztomz
 */
public class Suggestions {
    private int idsugerencia;
    private String nombre;
    private String correo;
    private String asunto;
    private String sugerencia;

    public Suggestions() {
    }

    public Suggestions(int idsugerencia, String nombre, String correo, String asunto, String sugerencia) {
        this.idsugerencia = idsugerencia;
        this.nombre = nombre;
        this.correo = correo;
        this.asunto = asunto;
        this.sugerencia = sugerencia;
    }

    public int getIdsugerencia() {
        return idsugerencia;
    }

    public void setIdsugerencia(int idsugerencia) {
        this.idsugerencia = idsugerencia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getSugerencia() {
        return sugerencia;
    }

    public void setSugerencia(String sugerencia) {
        this.sugerencia = sugerencia;
    }

    @Override
    public String toString() {
        return getNombre();
    }
}
