/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Mensaje;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;
import javax.imageio.ImageIO;
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
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                String nombre = "";
                String descripcion = "";
                String preciou = "";
                String stock = "";
                String precioc = "";
                String rutaarchivosubido = "";
                String stockcri = "";
                String enc = "";
                String idprod = "";
                

                // req es la HttpServletRequest que recibimos del formulario.
                // Los items obtenidos serán cada uno de los campos del formulario,
                // tanto campos normales como ficheros subidos.
                List items = upload.parseRequest(request);

                // Se recorren todos los items, que son de tipo FileItem
                for (Object item : items) {
                   FileItem uploaded = (FileItem) item;

                   // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                   // subido donde nos interese
                   
                   
                   if (!uploaded.isFormField()) {
                      // No es campo de formulario, guardamos el fichero en algún sitio   
                        
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
                       if(key.equals("precioc"))
                       {
                           precioc = valor;
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
                
                
                
                boolean imageningresada = false;
                String nombrefinal = "";
                for (Object item : items) {
                    FileItem uploaded = (FileItem) item;
                    if(!uploaded.isFormField())
                    {
                        nombrefinal = "";
                        String nombre2 = uploaded.getName();
                        String[] nombreaux = nombre2.split("\\.");
                        String nombreaux2 = "";
                        String extension = "";
                        int cont = 0;
                        for (String string : nombreaux) {
                            if(cont == 0)
                            {
                                nombreaux2 = string;
                            }else
                            {
                                extension = string;
                            }
                            cont++;
                        }

                        if(extension.equals(""))
                        {
                            imageningresada = false;
                        }else
                        {
                            
                            boolean estado = true;
                            int cont2 = 1;
                            File fichero;
                            String idprodacambiar = idprod;
                            do {
                                nombrefinal = idprodacambiar+"." + extension;
                                enc = "images/tipo_producto/" + nombrefinal;
                                fichero = new File("C:/proyecto-fixeado/PROYECTO 3.0/web/images/tipo_producto", nombrefinal);
                                idprodacambiar = idprod;
                                try
                                {
                                    uploaded.write(fichero);
                                    estado = false;
                                    imageningresada = true;
                                }catch(Exception e)
                                {
                                    idprodacambiar = idprodacambiar + "(" + cont2 + ")";
                                    cont2++;
                                }

                            } while (estado);


                            InputStream inputs = new FileInputStream(fichero);
                            if(ImageIO.read(inputs) == null)
                            {
                                rutaarchivosubido = "imagen invalida";

                            }else
                            {
                                 rutaarchivosubido = "imagen valida" ;
                            }
                        }
                    }
                }
                
                if(rutaarchivosubido.equals("imagen invalida"))
                {
                    bd.cerrarConexion();
                    Mensaje mensaje = new Mensaje("El archivo ingresado NO es una imagen", "javascript:window.history.back();", "&laquo; Volver");
                    request.getSession().setAttribute("mensaje1", mensaje);
                    response.sendRedirect("error.jsp");
                }else
                {
                    String q = "";
                    if(imageningresada)
                    {
                        q = "UPDATE PRODUCTO SET "
                            + "DESC_PRODUCTO = '" + descripcion + "' , "
                            + "NOMBRE = '" + nombre + "' , "
                            + "PRECIO_UNITARIO = " + preciou + " , " 
                            + "PRECIO_COMPRA = " + precioc + " , "
                            + "STOCK = " + stock + " , "
                            + "STOCK_CRITICO = " + stockcri + " , "
                            + "IMAGEN = '" + enc + "' " 
                            + "WHERE ID_PRODUCTO = '" + idprod + "'";
                    }else
                    {
                        q = "UPDATE PRODUCTO SET "
                            + "DESC_PRODUCTO = '" + descripcion + "' , "
                            + "NOMBRE = '" + nombre + "' , "
                            + "PRECIO_UNITARIO = " + preciou + " , " 
                            + "PRECIO_COMPRA = " + precioc + " , "
                            + "STOCK = " + stock + " , "
                            + "STOCK_CRITICO = " + stockcri + " "
                            + "WHERE ID_PRODUCTO = '" + idprod + "'";
                    }
                    bd.update(q);
                    bd.cerrarConexion();
                    Mensaje mensaje = new Mensaje("El producto ha sido modificado con éxito", "administrar.jsp", "&laquo; Ir a administrar");
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
