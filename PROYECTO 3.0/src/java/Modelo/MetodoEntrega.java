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
public class MetodoEntrega {
    
    private int id_metodo;
    private String metodo;

    public MetodoEntrega() {
    }

    public MetodoEntrega(int id_metodo, String metodo) {
        this.id_metodo = id_metodo;
        this.metodo = metodo;
    }

    public int getId_metodo() {
        return id_metodo;
    }

    public void setId_metodo(int id_metodo) {
        this.id_metodo = id_metodo;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }
    
    
}
