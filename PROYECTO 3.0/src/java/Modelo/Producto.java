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
public class Producto {
    private String id_producto;                 
    private String desc_producto;               
    private int precio_unitario;            
    private int precio_compra;               
    private int stock;                       
    private int stock_critico;               
    private String fecha_venc;                        
    private int tipo_producto_id_tipoprod;   
    private int estado_id_estado;
    private String base64Image;
    private String nombre;
    private int usuario_id_proveedor;

    public Producto(String id_producto, String desc_producto, int precio_unitario, int precio_compra, int stock, int stock_critico, String fecha_venc, int tipo_producto_id_tipoprod, int estado_id_estado, String base64Image, String nombre, int usuario_id_proveedor) {
        this.id_producto = id_producto;
        this.desc_producto = desc_producto;
        this.precio_unitario = precio_unitario;
        this.precio_compra = precio_compra;
        this.stock = stock;
        this.stock_critico = stock_critico;
        this.fecha_venc = fecha_venc;
        this.tipo_producto_id_tipoprod = tipo_producto_id_tipoprod;
        this.estado_id_estado = estado_id_estado;
        this.base64Image = base64Image;
        this.nombre = nombre;
        this.usuario_id_proveedor = usuario_id_proveedor;
    }
    
    public Producto() {
    }

    public int getUsuario_id_proveedor() {
        return usuario_id_proveedor;
    }

    public void setUsuario_id_proveedor(int usuario_id_proveedor) {
        this.usuario_id_proveedor = usuario_id_proveedor;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getDesc_producto() {
        return desc_producto;
    }

    public void setDesc_producto(String desc_producto) {
        this.desc_producto = desc_producto;
    }

    public int getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(int precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public int getPrecio_compra() {
        return precio_compra;
    }

    public void setPrecio_compra(int precio_compra) {
        this.precio_compra = precio_compra;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStock_critico() {
        return stock_critico;
    }

    public void setStock_critico(int stock_critico) {
        this.stock_critico = stock_critico;
    }

    public String getFecha_venc() {
        return fecha_venc;
    }

    public void setFecha_venc(String fecha_venc) {
        this.fecha_venc = fecha_venc;
    }

    public int getTipo_producto_id_tipoprod() {
        return tipo_producto_id_tipoprod;
    }

    public void setTipo_producto_id_tipoprod(int tipo_producto_id_tipoprod) {
        this.tipo_producto_id_tipoprod = tipo_producto_id_tipoprod;
    }

    public int getEstado_id_estado() {
        return estado_id_estado;
    }

    public void setEstado_id_estado(int estado_id_estado) {
        this.estado_id_estado = estado_id_estado;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    
    
}
