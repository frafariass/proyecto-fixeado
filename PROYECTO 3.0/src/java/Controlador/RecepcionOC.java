/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Mensaje;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "RecepcionOC", urlPatterns = {"/RecepcionOC"})
public class RecepcionOC extends HttpServlet {

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
            try
            {
                String idarecepcionar = request.getParameter("idorden");
                BD bd = new BD();
                String q = "UPDATE ORDEN_COMPRA SET ESTADO_ID_ESTADO = 5 WHERE ID_ORDEN =" + idarecepcionar;
                bd.update(q);
                q = "SELECT PRODUCTO_ID_PRODUCTO, CANTIDAD FROM ORDEN_COMPRA WHERE ID_ORDEN = " + idarecepcionar;
                ResultSet res = bd.read(q);
                res.next();
                String idprod = res.getString("producto_id_producto");
                int cantidad = Integer.parseInt(res.getString("cantidad"));
                q = "SELECT STOCK FROM PRODUCTO WHERE ID_PRODUCTO = '" + idprod + "'";
                res = bd.read(q);
                res.next();
                int stockactual = Integer.parseInt(res.getString("stock"));
                cantidad = cantidad + stockactual;
                q = "UPDATE PRODUCTO SET STOCK =" + cantidad + " where id_producto = '" + idprod + "'";
                bd.update(q);
                q = "SELECT MAX(ID_RECEPCION) FROM RECEPCION_OC";
                res = bd.read(q);
                int recepcionidmax = 1;
                if(res.next())
                {
                    try
                    {
                        recepcionidmax = Integer.parseInt(res.getString("MAX(ID_RECEPCION)"))+1;
                    }catch(Exception e)
                    {
                        
                    }  
                }
                
                
                q = "INSERT INTO RECEPCION_OC VALUES("+ recepcionidmax + ", current_timestamp, " + idarecepcionar + ")";
                bd.update(q);
                Mensaje mensaje = new Mensaje("Orden de compra recepcionada", "administrar.jsp", "&laquo; Ir a administrar");
                request.getSession().setAttribute("mensaje1", mensaje);
                response.sendRedirect("error.jsp");
            }catch(Exception e)
            {
                Mensaje mensaje = new Mensaje(e.getMessage(), "javascript:window.history.back();", "&laquo; Volver");
                request.getSession().setAttribute("mensaje1", mensaje);
                response.sendRedirect("error.jsp");
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
