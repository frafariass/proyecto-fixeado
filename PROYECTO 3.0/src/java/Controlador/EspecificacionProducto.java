/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Mensaje;
import Modelo.Producto;
import Modelo.TipoProducto;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.ResultSet;
import java.util.Base64;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "EspecificacionProducto", urlPatterns = {"/EspecificacionProducto"})
public class EspecificacionProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String id = "";
            try
            {
                id = request.getParameter("dato");
                id = id.trim();
                BD bd = new BD();
                String q = "select * from producto where id_producto = '" + id + "'";
                ResultSet res = bd.read(q);
                res.next();
                Producto prod = new Producto();
                
                
                prod.setId_producto(res.getString("id_producto"));
                prod.setDesc_producto(res.getString("desc_producto"));
                prod.setPrecio_unitario(Integer.parseInt(res.getString("precio_unitario")));
                prod.setPrecio_compra(Integer.parseInt(res.getString("precio_compra")));
                prod.setStock(Integer.parseInt(res.getString("stock")));
                prod.setStock_critico(Integer.parseInt(res.getString("stock_critico")));
                prod.setFecha_venc(res.getString("fecha_venc"));
                prod.setTipo_producto_id_tipoprod(Integer.parseInt(res.getString("tipo_producto_id_tipoprod")));
                prod.setEstado_id_estado(Integer.parseInt(res.getString("estado_id_estado")));
                prod.setImagen(res.getString("imagen"));
                prod.setNombre(res.getString("nombre"));
                prod.setUsuario_id_proveedor(Integer.parseInt(res.getString("usuario_id_proveedor")));
                bd.cerrarConexion();
                request.getSession().setAttribute("prod1", prod);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("especificacionproducto.jsp");
                requestDispatcher.forward(request, response);
            }catch(Exception e)
            {
                Mensaje mensaje = new Mensaje("La id " + id + " no corresponde a un producto ingresado en el sistema", "javascript:window.history.back();", "&laquo; Volver");
                request.getSession().setAttribute("mensaje1", mensaje);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("error.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
