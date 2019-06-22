/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
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
        
        try{
            String totalstring = request.getParameter("precio");
            int total_oc = Integer.parseInt(totalstring);
            int estado = 1;
            String ustr = request.getParameter("i_proveedores");
            int userid = Integer.parseInt(ustr);
            String cants = request.getParameter("cantid");
            int cant = Integer.parseInt(cants);
            String prod = request.getParameter("h_idprod");
            Date fech = Date.valueOf(LocalDate.now());
        
            BD bd = new BD();
        
            String q = "select max(id_orden) from orden_compra";
            int idorden = 0;
            ResultSet res_oc = bd.read(q);
            if(res_oc.next()){
                if(res_oc.getString("max(id_orden)") != null){
                    idorden = Integer.parseInt(res_oc.getString("max(id_orden)")) + 1;
                }else
                {
                idorden=1;   
                }
            }
        
            String q2 = "select nro_oc from orden_compra where estado_id_estado=1 and usuario_id_user="+userid;
            String q3 = "select max(nro_oc) from orden_compra";
            int nroc = 0;
            ResultSet res_nro = bd.read(q2);
            ResultSet resmax = bd.read(q3);
        
            if(res_nro.next()){
                if(res_nro.getString("nro_oc") != null){
                    
                    nroc = Integer.parseInt(res_nro.getString("nro_oc"));
                }else{
                    nroc = Integer.parseInt(resmax.getString("max(nro_oc)")) + 1;
                }
            }else{
                nroc = 1;
            }
        
            String ins = "insert into orden_compra "
                    + "values ('"+idorden+"', '"+fech+"', '"+total_oc+"',"
                    + " '"+estado+"', '"+userid+"', '"+cant+"', '"+nroc+"')";
            bd.update(ins);
        
        
            response.sendRedirect("index.jsp");
            }catch (NumberFormatException | SQLException e){
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
