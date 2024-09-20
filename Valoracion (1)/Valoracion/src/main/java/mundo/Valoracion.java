/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mundo;

/**
 *
 * @author Sistemas
 */
public class Valoracion {
    //atributos
    private String nombre;
    private String fecha;
    private String correo;
    private String negocio;
    private String puntuacion;
    
    //constructores

    public Valoracion() {
    }

    public Valoracion(String nombre, String fecha, String correo, String negocio, String puntuacion) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.correo = correo;
        this.negocio = negocio;
        this.puntuacion = puntuacion;
    }
    
    //getters and setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNegocio() {
        return negocio;
    }

    public void setNegocio(String negocio) {
        this.negocio = negocio;
    }

    public String getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(String puntuacion) {
        this.puntuacion = puntuacion;
    }  
}
