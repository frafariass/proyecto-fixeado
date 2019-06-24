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
public class Comuna {
    
    private int comuna_id;
    private String comuna_nombre;
    private int provincia_id;

    public Comuna() {
    }

    public Comuna(int comuna_id, String comuna_nombre, int provincia_id) {
        this.comuna_id = comuna_id;
        this.comuna_nombre = comuna_nombre;
        this.provincia_id = provincia_id;
    }

    public int getComuna_id() {
        return comuna_id;
    }

    public void setComuna_id(int comuna_id) {
        this.comuna_id = comuna_id;
    }

    public String getComuna_nombre() {
        return comuna_nombre;
    }

    public void setComuna_nombre(String comuna_nombre) {
        this.comuna_nombre = comuna_nombre;
    }

    public int getProvincia_id() {
        return provincia_id;
    }

    public void setProvincia_id(int provincia_id) {
        this.provincia_id = provincia_id;
    }
    
    
    
}
