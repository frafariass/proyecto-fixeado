/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Mensaje;
import Modelo.Usuario;
import Modelo.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "AgregarVenta", urlPatterns = {"/AgregarVenta"})
public class AgregarVenta extends HttpServlet {

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
                List<Venta> listaventas = (List<Venta>)request.getSession().getAttribute("listaventas1");
                Usuario usu = (Usuario)request.getSession().getAttribute("usu1");
                int iduser = usu.getId_user();
                int rutuser = usu.getRut_user();
                BD bd = new BD();
                String q = "SELECT MAX(NUMERO_BOLETA), MAX(ID_VENTA) FROM VENTA";
                ResultSet res = bd.read(q);
                res.next();
                int nuevonroboleta = 1;
                int idventamax = 1;
                if(res.getString("max(numero_boleta)") != null)
                {
                    nuevonroboleta = Integer.parseInt(res.getString("max(numero_boleta)")) + 1;
                    idventamax = Integer.parseInt(res.getString("max(id_venta)"));
                }
                String tipoventa = request.getParameter("tipoventa");
                String tipoentrega = request.getParameter("tipoentrega");
                int totalventa = 0;
                String tipopago = request.getParameter("tipopago");
                if(tipopago == null)
                {
                    tipopago = "2";
                }
                
                for (Venta listaventa : listaventas) {
                    idventamax++;
                    totalventa = (int) ((Math.round(listaventa.getPrecio_unitario_producto()*1.19))*listaventa.getCantidad());
                    q = "INSERT INTO VENTA VALUES (current_timestamp, "+ totalventa  +", "+1+", " +listaventa.getCantidad() +", " +
                            listaventa.getProducto_id_producto() + ", " + nuevonroboleta + ", " + idventamax + ", " + iduser + ", " + listaventa.getPrecio_unitario_producto()
                            + ", " + tipoventa + ", " + tipoentrega + ", " + rutuser + ", "+ tipopago + ")";
                    bd.update(q);
                }
                bd.cerrarConexion();
                request.getSession().setAttribute("listaventas1", null);
                if(tipopago.equals("2"))
                {
                    response.sendRedirect("datostransferencia.jsp");
                }else
                {
                    Mensaje mensaje = new Mensaje("Gracias por su compra", "miscompras.jsp", "&laquo; Ir a mis compras");
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
