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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "AgregarProd", urlPatterns = {"/AgregarProd"})
public class AgregarProd extends HttpServlet {

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
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                String nombre = "";
                String descripcion = "";
                String preciou = "";
                String stock = "";
                String fechavenc = "";
                String proveedor = "";
                String aplica = "si";
                String rutaarchivosubido = "";
                String idtipoprod = "";
                String stockcri = "";
                

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
                       if(key.equals("stock"))
                       {
                           stock = valor;
                       }
                       if(key.equals("stockcri"))
                       {
                           stockcri = valor;
                       }
                       if(key.equals("fecha"))
                       {
                           fechavenc = valor;
                       }
                       if(key.equals("selectproveedores"))
                       {
                           proveedor = valor;
                       }
                       if(key.equals("aplica"))
                       {
                           aplica = valor;
                       }
                       if(key.equals("selecttipo"))
                       {
                           idtipoprod = valor;
                       }
                       
                   } 
                }
                
                
                
                
                BD bd = new BD();
                String q = "SELECT ID_PRODUCTO FROM PRODUCTO";
                ResultSet res = bd.read(q);
                res.next();
                int max = 0;
                do {
                    int id = Integer.parseInt(res.getString("id_producto").substring(17,24));
                    if(id > max)
                    {
                        max = id;
                    }
                } while (res.next());
                max = max + 1;
                String idstring = max + "";
                int cuantoscar = idstring.length();
                switch(cuantoscar)
                {
                    case 1:
                        idstring = "000000" + idstring;
                        break;
                    case 2:
                        idstring = "00000" + idstring;
                        break;
                    case 3:
                        idstring = "0000" + idstring;
                        break;
                    case 4:
                        idstring = "000" + idstring;
                        break;
                    case 5:
                        idstring = "00" + idstring;
                        break;
                    case 6:
                        idstring = "0" + idstring;
                        break;
                    case 7:
                        idstring = idstring;
                        break;
                }
                
                q = "SELECT FAMILIA_ID_FAMILIA FROM TIPO_PRODUCTO WHERE ID_TIPOPROD =" + idtipoprod;
                res = bd.read(q);
                res.next();
                String idfamilia = res.getString("familia_id_familia");
                int preciouint = Integer.parseInt(preciou);
                
                if(aplica.equals("si"))
                {
                    String año = fechavenc.substring(0,4);
                    String mes = fechavenc.substring(5,7);
                    String dia = fechavenc.substring(fechavenc.length()-2, fechavenc.length());
                    fechavenc = dia + mes + año;
                }else
                {
                    fechavenc = "00000000";
                }
                String idproducto = proveedor + idfamilia + fechavenc + idtipoprod + idstring;
                
                
                
                
                
                for (Object item : items) {
                    FileItem uploaded = (FileItem) item;
                    if(!uploaded.isFormField())
                    {
                        String nombrefinal = "";
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
                            bd.cerrarConexion();
                            Mensaje mensaje = new Mensaje("El archivo ingresado NO es una imagen", "javascript:window.history.back();", "&laquo; Volver");
                            request.getSession().setAttribute("mensaje1", mensaje);
                            response.sendRedirect("error.jsp");
                        }
                        
                        nombrefinal = idproducto+"." + extension;
                        String enc = "images/tipo_producto/" + nombrefinal;
                        
                        q = "INSERT INTO PRODUCTO VALUES('" + idproducto + "', '" +
                        descripcion + "', " + preciouint +"," + preciouint*1.3 + ", " + stock + ","+ stockcri+ "," +
                        idtipoprod + ", '" + nombre + "', 2,'" + fechavenc + "', " + proveedor + ", '" + enc + "')";
                        bd.update(q);
                        
                        File fichero = new File("C:/proyecto-fixeado/PROYECTO 3.0/web/images/tipo_producto", nombrefinal);
                        uploaded.write(fichero);
                        InputStream inputs = new FileInputStream(fichero);
                        if(ImageIO.read(inputs) == null)
                        {
                            rutaarchivosubido = "";
                            
                        }else
                        {
                             rutaarchivosubido = "../../productos/imagenes/" + nombrefinal;
                        }
                        
                       
   
                    }
                }
                
                if(rutaarchivosubido.equals(""))
                {
                    bd.cerrarConexion();
                    Mensaje mensaje = new Mensaje("El archivo ingresado NO es una imagen", "javascript:window.history.back();", "&laquo; Volver");
                    request.getSession().setAttribute("mensaje1", mensaje);
                    response.sendRedirect("error.jsp");
                }else
                {

                    bd.cerrarConexion();
                        Mensaje mensaje = new Mensaje("El producto ha sido agregado con éxito", "administrar.jsp", "&laquo; Ir a administrar");
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
