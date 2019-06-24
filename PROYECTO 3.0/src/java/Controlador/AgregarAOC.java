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
import java.sql.Date;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "AgregarAOC", urlPatterns = {"/AgregarAOC"})
public class AgregarAOC extends HttpServlet {

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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
            try
            {
                String idprov = request.getParameter("i_proveedores");
                String aux = request.getParameter(idprov);
                String idprod = aux.split(",")[0];
                String cantidad = request.getParameter("cantid");
                String total = request.getParameter("precio");
                int idordenmax = 1;
                int nroocmax = 1;
                
                BD bd = new BD();
                String q = "SELECT MAX(ID_ORDEN), MAX(NRO_OC) FROM ORDEN_COMPRA";
                ResultSet res = bd.read(q);
                if(res.next())
                {
                    try
                    {
                        idordenmax = Integer.parseInt(res.getString("MAX(ID_ORDEN)"))+1;
                        nroocmax = Integer.parseInt(res.getString("MAX(NRO_OC)"))+1;
                    }catch(Exception e)
                    {
                        
                    }  
                }
                
                q = "INSERT INTO ORDEN_COMPRA VALUES(" + idordenmax +", current_timestamp, " +total
                        + ", 1, " + idprov + ", " + cantidad + ", "+ nroocmax + ", '" + idprod + "')";
                bd.update(q);
                
                Mensaje mensaje = new Mensaje("Orden de compra ingresada", "administrar.jsp", "&laquo; Ir a administrar");
                request.getSession().setAttribute("mensaje1", mensaje);
                response.sendRedirect("error.jsp");
            }catch(Exception e)
            {
                Mensaje mensaje = new Mensaje(e.getMessage(), "javascript:window.history.back();", "&laquo; Volver");
                request.getSession().setAttribute("mensaje1", mensaje);
                response.sendRedirect("error.jsp");
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
