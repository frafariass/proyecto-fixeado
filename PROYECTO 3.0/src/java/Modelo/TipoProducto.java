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
public class TipoProducto {
    
    private int id_tipoprod;
    private String nombre_tipoprod;
    private int familia_id_familia;
    private String tipoprod_imagen; 

    public TipoProducto() {
    }

    public TipoProducto(int id_tipoprod, String nombre_tipoprod, int familia_id_familia, String tipoprod_imagen) {
        this.id_tipoprod = id_tipoprod;
        this.nombre_tipoprod = nombre_tipoprod;
        this.familia_id_familia = familia_id_familia;
        this.tipoprod_imagen = tipoprod_imagen;
    }

    public int getId_tipoprod() {
        return id_tipoprod;
    }

    public void setId_tipoprod(int id_tipoprod) {
        this.id_tipoprod = id_tipoprod;
    }

    public String getNombre_tipoprod() {
        return nombre_tipoprod;
    }

    public void setNombre_tipoprod(String nombre_tipoprod) {
        this.nombre_tipoprod = nombre_tipoprod;
    }

    public int getFamilia_id_familia() {
        return familia_id_familia;
    }

    public void setFamilia_id_familia(int familia_id_familia) {
        this.familia_id_familia = familia_id_familia;
    }

    public String getTipoprod_imagen() {
        return tipoprod_imagen;
    }

    public void setTipoprod_imagen(String tipoprod_imagen) {
        this.tipoprod_imagen = tipoprod_imagen;
    }

    
    
}
