/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Mensaje;
import Modelo.Producto;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
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
@WebServlet(name = "BuscarProducto", urlPatterns = {"/BuscarProducto"})
public class BuscarProducto extends HttpServlet {

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
                List<Producto> productos = new ArrayList<Producto>();
                BD bd = new BD();
                String[] datos = request.getParameter("buscar").split(" ");
                String q = "SELECT ID_PRODUCTO, NOMBRE, IMAGEN, PRECIO_COMPRA FROM PRODUCTO " +
                            "WHERE NOMBRE";
                for (int i = 0; i < datos.length; i++) {
                    if(i == 0)
                    {
                        q = q + " LIKE '%" + datos[0] + "%' ";
                    }else
                    {
                        q = q + " OR NOMBRE LIKE '%" + datos[i] + "%' ";
                    }
                }
                
                ResultSet res = bd.read(q);
                if(res.next())
                {
                    do {
                        Producto pro = new Producto();
                        pro.setNombre(res.getString("nombre"));
                        pro.setId_producto(res.getString("id_producto"));
                        int precioconiva = (int)Math.round(Integer.parseInt(res.getString("precio_compra"))*1.19);
                        pro.setPrecio_compra(precioconiva);
                        pro.setImagen(res.getString("IMAGEN"));

                        productos.add(pro);
                    } while (res.next());
                    request.getSession().setAttribute("barrabuscar1", productos);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("catalogobuscar.jsp");
                    requestDispatcher.forward(request, response);
                }else
                {
                    Mensaje mensaje = new Mensaje("No se han encontrado productos", "javascript:window.history.back();", "&laquo; Volver");
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
