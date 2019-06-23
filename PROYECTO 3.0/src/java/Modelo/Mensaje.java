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
public class Mensaje {
    
    private String mensaje;
    private String href;
    private String pagina;

    public Mensaje() {
    }

    public Mensaje(String mensaje, String href, String pagina) {
        this.mensaje = mensaje;
        this.href = href;
        this.pagina = pagina;
    }

    public Mensaje(Mensaje mensaje, String javascriptwindowhistoryback, String laquo_Volver) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getPagina() {
        return pagina;
    }

    public void setPagina(String pagina) {
        this.pagina = pagina;
    }

    
    
    
    
}
