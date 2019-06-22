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
public class RecepcionOC {
    
    private int id_recepcion;
    private int fecha_recepcion;
    private int orden_compra_id_orden;

    public RecepcionOC(int id_recepcion, int fecha_recepcion, int orden_compra_id_orden) {
        this.id_recepcion = id_recepcion;
        this.fecha_recepcion = fecha_recepcion;
        this.orden_compra_id_orden = orden_compra_id_orden;
    }

    public RecepcionOC() {
    }
    
    

    public int getId_recepcion() {
        return id_recepcion;
    }

    public void setId_recepcion(int id_recepcion) {
        this.id_recepcion = id_recepcion;
    }

    public int getFecha_recepcion() {
        return fecha_recepcion;
    }

    public void setFecha_recepcion(int fecha_recepcion) {
        this.fecha_recepcion = fecha_recepcion;
    }

    public int getOrden_compra_id_orden() {
        return orden_compra_id_orden;
    }

    public void setOrden_compra_id_orden(int orden_compra_id_orden) {
        this.orden_compra_id_orden = orden_compra_id_orden;
    }
    
}
