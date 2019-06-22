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
public class TipoReporte {
    
    private int id_tipoventa;
    private String nombre_tvt;

    public TipoReporte(int id_tipoventa, String nombre_tvt) {
        this.id_tipoventa = id_tipoventa;
        this.nombre_tvt = nombre_tvt;
    }

    
    public int getId_tipoventa() {
        return id_tipoventa;
    }

    public void setId_tipoventa(int id_tipoventa) {
        this.id_tipoventa = id_tipoventa;
    }

    public String getNombre_tvt() {
        return nombre_tvt;
    }

    public void setNombre_tvt(String nombre_tvt) {
        this.nombre_tvt = nombre_tvt;
    }
    
}
