/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author lordp
 */
@WebServlet(name = "ModificarProducto", urlPatterns = {"/ModificarProducto"})
public class ModificarProducto extends HttpServlet {

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
            
            try
            {
                String nombre = "";
                String descripcion = "";
                String preciou = "";
                String stock = "";
                String rutaarchivosubido = "";
                String stockcri = "";
                String nombrefinal = "";
                String idprod = "";

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);

                for (Object item : items) {
                       FileItem uploaded = (FileItem) item;

                       // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                       // subido donde nos interese
                       int contador = 1;
                       
                       if (!uploaded.isFormField()) {
                          // No es campo de formulario, guardamos el fichero en algún sitio
                            boolean estado = true;
                            String aux = "";
                            do {
                               try
                                {
                                    try
                                    {
                                        nombrefinal = uploaded.getName().substring(0,uploaded.getName().length()-4)+contador+".jpg";
                                    }catch(Exception e)
                                    {
                                        estado = false;
                                    }
                                    File fichero = new File("C:\\Users\\lordp\\Desktop\\portafolio\\proyecto-fixeado\\images\\tipo_producto\\productos", nombrefinal);
                                    uploaded.write(fichero);
                                    rutaarchivosubido = "C:\\Users\\lordp\\Desktop\\portafolio\\proyecto-fixeado\\images\\tipo_producto\\productos\\" + nombrefinal;
                                    estado = false;
                                }catch(Exception e)
                                {
                                    contador++;
                                }
                           } while (estado);



                       }else
                       {
                           String key = uploaded.getFieldName();
                           String valor = uploaded.getString();
                           if(key.equals("nombre"))
                           {
                               nombre = valor;
                           }
                           if(key.equals("descripcion"))
                           {
                               descripcion = valor;
                           }
                           if(key.equals("preciou"))
                           {
                               preciou = valor;
                           }
                           if(key.equals("stock"))
                           {
                               stock = valor;
                           }
                           if(key.equals("stockcri"))
                           {
                               stockcri = valor;
                           }
                           if(key.equals("idprod"))
                           {
                               idprod = valor;
                           }

                       } 
                    }
                
                BD bd = new BD();
                int preciocompra = (int) Math.round(Integer.parseInt(preciou)*1.3);
                String q = "UPDATE PRODUCTO "
                        + "SET DESC_PRODUCTO = '" + descripcion + "' , PRECIO_UNITARIO = " + preciou 
                        + ", PRECIO_COMPRA = " + preciocompra + ", STOCK = " + stock + " , STOCK_CRITICO ="
                        + stockcri + " , NOMBRE ='" + nombre + "' WHERE ID_PRODUCTO = '" + idprod + "'";
                bd.update(q);
                
                if(!rutaarchivosubido.equals(""))
                {
                    if(bd.insertarImagen(rutaarchivosubido, "producto", "imagen",  idprod, "id_producto"))
                    {
                        request.getSession().setAttribute("probuscar1", null);
                        Error error = new Error("El producto se ha modificado con éxito");
                        request.getSession().setAttribute("error1", error);
                        response.sendRedirect("error.jsp");
                    }else
                    {
                        Error error = new Error("Ha habido un problema al actualizar la imagen");
                        request.getSession().setAttribute("error1", error);
                        response.sendRedirect("error.jsp");
                    }
                }else
                {
                    request.getSession().setAttribute("probuscar1", null);
                    Error error = new Error("El producto se ha modificado con éxito");
                    request.getSession().setAttribute("error1", error);
                    response.sendRedirect("error.jsp");
                }
                
                
            }catch(Exception e)
            {
                Error error = new Error(e.getMessage());
                request.getSession().setAttribute("error1", error);
                response.sendRedirect("error.jsp");
            }
            /* TODO output your page here. You may use following sample code. */
            
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
