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
@WebServlet(name = "MarcarBoletaPagada", urlPatterns = {"/MarcarBoletaPagada"})
public class MarcarBoletaPagada extends HttpServlet {

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
                String estado = request.getParameter("estadoboleta");
                String nroboleta = request.getParameter("nroboleta");
                estado = estado.trim();
                
                BD bd = new BD();
                String q3 = "SELECT * FROM VENTA WHERE NUMERO_BOLETA =" + nroboleta;
                ResultSet res2 = bd.read(q3);
                res2.next();
                boolean todosconstock = true;
                do {
                   String idprod = res2.getString("producto_id_producto");
                   int cantidad = Integer.parseInt(res2.getString("cantidad"));
                   String q2 = "SELECT STOCK FROM PRODUCTO WHERE ID_PRODUCTO = '" + idprod + "'";
                   ResultSet res = bd.read(q2);
                   res.next();
                   int stock = Integer.parseInt(res.getString("stock"));
                   if(stock < cantidad)
                   {
                       todosconstock = false;
                   }
                } while (res2.next());
                res2.first();
                if(todosconstock)
                {
                    do {
                       String idprod = res2.getString("producto_id_producto");
                       int cantidad = Integer.parseInt(res2.getString("cantidad"));
                       String q2 = "SELECT STOCK FROM PRODUCTO WHERE ID_PRODUCTO = '" + idprod + "'";
                       ResultSet res = bd.read(q2);
                       res.next();
                       int stock = Integer.parseInt(res.getString("stock"));
                       if(stock >= 1)
                       {
                           stock = stock-cantidad;
                           q2 = "update producto set stock = " + stock + " where id_producto = '" + idprod + "'";
                           bd.update(q2);
                       }
                    } while (res2.next());
                    String q = "UPDATE VENTA SET ESTADO_ID_ESTADO = 4 WHERE NUMERO_BOLETA = " + nroboleta;
                    bd.update(q);
                    bd.cerrarConexion();
                    Mensaje mensaje = new Mensaje("Venta marcada como pagada exitosamente", "venbuscar.jsp", "&laquo; Volver");
                    request.getSession().setAttribute("mensaje1", mensaje);
                    response.sendRedirect("error.jsp");
                }else
                {
                    Mensaje mensaje = new Mensaje("No se puede pagar, hay productos que no tienen stock", "venbuscar.jsp", "&laquo; Volver");
                    request.getSession().setAttribute("mensaje1", mensaje);
                    response.sendRedirect("error.jsp");
                }
               

                
                
                
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
