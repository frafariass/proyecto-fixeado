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
public class Venta {
    
    private String fecha_boleta;
    private int total_venta;
    private int tipo_venta_id_tipoventa;
    private int estado_id_estado;
    private int cantidad;
    private String producto_id_producto;
    private int numero_boleta;
    private int id_venta;
    private int usuario_id_usuario;
    private int precio_unitario_producto;
    private int tipo_venta_idtipoventa;
    private int metodo_entrega_id_metodo;
    private int usuario_rut_user;

    public Venta() {
    }

    public int getUsuario_rut_user() {
        return usuario_rut_user;
    }

    public void setUsuario_rut_user(int usuario_rut_user) {
        this.usuario_rut_user = usuario_rut_user;
    }
    
    

    public Venta(String fecha_boleta, int total_venta, int tipo_venta_id_tipoventa, int estado_id_estado, int cantidad, String producto_id_producto, int numero_boleta, int id_venta, int usuario_id_usuario, int precio_unitario_producto, int tipo_venta_idtipoventa, int metodo_entrega_id_metodo, int usuario_rut_user) {
        this.fecha_boleta = fecha_boleta;
        this.total_venta = total_venta;
        this.tipo_venta_id_tipoventa = tipo_venta_id_tipoventa;
        this.estado_id_estado = estado_id_estado;
        this.cantidad = cantidad;
        this.producto_id_producto = producto_id_producto;
        this.numero_boleta = numero_boleta;
        this.id_venta = id_venta;
        this.usuario_id_usuario = usuario_id_usuario;
        this.precio_unitario_producto = precio_unitario_producto;
        this.tipo_venta_idtipoventa = tipo_venta_idtipoventa;
        this.metodo_entrega_id_metodo = metodo_entrega_id_metodo;
        this.usuario_rut_user = usuario_rut_user;
    }

    

    public String getFecha_boleta() {
        return fecha_boleta;
    }

    public void setFecha_boleta(String fecha_boleta) {
        this.fecha_boleta = fecha_boleta;
    }

    public int getTotal_venta() {
        return total_venta;
    }

    public void setTotal_venta(int total_venta) {
        this.total_venta = total_venta;
    }

    public int getTipo_venta_id_tipoventa() {
        return tipo_venta_id_tipoventa;
    }

    public void setTipo_venta_id_tipoventa(int tipo_venta_id_tipoventa) {
        this.tipo_venta_id_tipoventa = tipo_venta_id_tipoventa;
    }

    public int getEstado_id_estado() {
        return estado_id_estado;
    }

    public void setEstado_id_estado(int estado_id_estado) {
        this.estado_id_estado = estado_id_estado;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getProducto_id_producto() {
        return producto_id_producto;
    }

    public void setProducto_id_producto(String producto_id_producto) {
        this.producto_id_producto = producto_id_producto;
    }

    public int getNumero_boleta() {
        return numero_boleta;
    }

    public void setNumero_boleta(int numero_boleta) {
        this.numero_boleta = numero_boleta;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getUsuario_id_usuario() {
        return usuario_id_usuario;
    }

    public void setUsuario_id_usuario(int usuario_id_usuario) {
        this.usuario_id_usuario = usuario_id_usuario;
    }

    public int getPrecio_unitario_producto() {
        return precio_unitario_producto;
    }

    public void setPrecio_unitario_producto(int precio_unitario_producto) {
        this.precio_unitario_producto = precio_unitario_producto;
    }

    public int getTipo_venta_idtipoventa() {
        return tipo_venta_idtipoventa;
    }

    public void setTipo_venta_idtipoventa(int tipo_venta_idtipoventa) {
        this.tipo_venta_idtipoventa = tipo_venta_idtipoventa;
    }

    public int getMetodo_entrega_id_metodo() {
        return metodo_entrega_id_metodo;
    }

    public void setMetodo_entrega_id_metodo(int metodo_entrega_id_metodo) {
        this.metodo_entrega_id_metodo = metodo_entrega_id_metodo;
    }

    

    

    
    
    
    
}
