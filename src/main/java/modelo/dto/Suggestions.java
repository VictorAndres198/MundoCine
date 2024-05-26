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
    private String Asunto;
    private String Contenido;

    public Suggestions() {
    }

    public Suggestions(int idsugerencia, String Asunto, String Contenido) {
        this.idsugerencia = idsugerencia;
        this.Asunto = Asunto;
        this.Contenido = Contenido;
    }

    public int getIdsugerencia() {
        return idsugerencia;
    }

    public void setIdsugerencia(int idsugerencia) {
        this.idsugerencia = idsugerencia;
    }

    public String getAsunto() {
        return Asunto;
    }

    public void setAsunto(String Asunto) {
        this.Asunto = Asunto;
    }

    public String getContenido() {
        return Contenido;
    }

    public void setContenido(String Contenido) {
        this.Contenido = Contenido;
    }


}
