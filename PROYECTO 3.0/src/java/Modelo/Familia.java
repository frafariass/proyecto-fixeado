/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author lordp
 */
public class Familia {
    
    private int id_familia;
    private String nombre_familia;
    private String imagen_familia;

    public Familia() {
    }

    public Familia(int id_familia, String nombre_familia, String imagen_familia) {
        this.id_familia = id_familia;
        this.nombre_familia = nombre_familia;
        this.imagen_familia = imagen_familia;
    }

    public int getId_familia() {
        return id_familia;
    }

    public void setId_familia(int id_familia) {
        this.id_familia = id_familia;
    }

    public String getNombre_familia() {
        return nombre_familia;
    }

    public void setNombre_familia(String nombre_familia) {
        this.nombre_familia = nombre_familia;
    }

    public String getImagen_familia() {
        return imagen_familia;
    }

    public void setImagen_familia(String imagen_familia) {
        this.imagen_familia = imagen_familia;
    }

    


    
    
}
