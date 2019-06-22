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
public class Rubro {
    
    private int id_rubro;
    private String nombre_rubro;

    public Rubro(int id_rubro, String nombre_rubro) {
        this.id_rubro = id_rubro;
        this.nombre_rubro = nombre_rubro;
    }

    public Rubro() {
    }
    
    

    public int getId_rubro() {
        return id_rubro;
    }

    public void setId_rubro(int id_rubro) {
        this.id_rubro = id_rubro;
    }

    public String getNombre_rubro() {
        return nombre_rubro;
    }

    public void setNombre_rubro(String nombre_rubro) {
        this.nombre_rubro = nombre_rubro;
    }
    
}
