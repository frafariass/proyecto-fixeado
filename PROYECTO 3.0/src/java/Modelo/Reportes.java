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
public class Reportes {
    
    private int id_reporte;
    private String contenido_reporte;
    private int fecha_reporte;
    private int tipo_reporte_id_trep;
    private int usuario_id_user;

    

    public Reportes() {
    }

    public Reportes(int id_reporte, String contenido_reporte, int fecha_reporte, int tipo_reporte_id_trep, int usuario_id_user) {
        this.id_reporte = id_reporte;
        this.contenido_reporte = contenido_reporte;
        this.fecha_reporte = fecha_reporte;
        this.tipo_reporte_id_trep = tipo_reporte_id_trep;
        this.usuario_id_user = usuario_id_user;
    }

    
    
    public int getUsuario_id_user() {
        return usuario_id_user;
    }

    public void setUsuario_id_user(int usuario_id_user) {
        this.usuario_id_user = usuario_id_user;
    }
    
    

    public int getId_reporte() {
        return id_reporte;
    }

    public void setId_reporte(int id_reporte) {
        this.id_reporte = id_reporte;
    }

    public String getContenido_reporte() {
        return contenido_reporte;
    }

    public void setContenido_reporte(String contenido_reporte) {
        this.contenido_reporte = contenido_reporte;
    }

    public int getFecha_reporte() {
        return fecha_reporte;
    }

    public void setFecha_reporte(int fecha_reporte) {
        this.fecha_reporte = fecha_reporte;
    }



    public int getTipo_reporte_id_trep() {
        return tipo_reporte_id_trep;
    }

    public void setTipo_reporte_id_trep(int tipo_reporte_id_trep) {
        this.tipo_reporte_id_trep = tipo_reporte_id_trep;
    }
    
    
}
