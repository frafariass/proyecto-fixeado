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
    private String BaseImage64;

    public Familia() {
    }

    public String getBaseImage64() {
        return BaseImage64;
    }

    public void setBaseImage64(String BaseImage64) {
        this.BaseImage64 = BaseImage64;
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

    public Familia(int id_familia, String nombre_familia, String BaseImage64) {
        this.id_familia = id_familia;
        this.nombre_familia = nombre_familia;
        this.BaseImage64 = BaseImage64;
    }


    
    
}
