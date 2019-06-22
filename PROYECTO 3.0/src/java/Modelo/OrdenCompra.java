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
public class OrdenCompra {
    
    private int id_orden;
    private int fecha_creacion;
    private int total_compra;
    private int estado_id_estado;
    private int usuario_id_user;
    private int cantidad;
    private int nro_oc;

    public OrdenCompra() {
    }

    public OrdenCompra(int id_orden, int fecha_creacion, int total_compra, int estado_id_estado, int usuario_id_user, int cantidad, int nro_oc) {
        this.id_orden = id_orden;
        this.fecha_creacion = fecha_creacion;
        this.total_compra = total_compra;
        this.estado_id_estado = estado_id_estado;
        this.usuario_id_user = usuario_id_user;
        this.cantidad = cantidad;
        this.nro_oc = nro_oc;
    }

    public int getUsuario_id_user() {
        return usuario_id_user;
    }

    public void setUsuario_id_user(int usuario_id_user) {
        this.usuario_id_user = usuario_id_user;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getNro_oc() {
        return nro_oc;
    }

    public void setNro_oc(int nro_oc) {
        this.nro_oc = nro_oc;
    }

   

    public int getId_orden() {
        return id_orden;
    }

    public void setId_orden(int id_orden) {
        this.id_orden = id_orden;
    }

    public int getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(int fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public int getTotal_compra() {
        return total_compra;
    }

    public void setTotal_compra(int total_compra) {
        this.total_compra = total_compra;
    }

    public int getEstado_id_estado() {
        return estado_id_estado;
    }

    public void setEstado_id_estado(int estado_id_estado) {
        this.estado_id_estado = estado_id_estado;
    }

    
}
