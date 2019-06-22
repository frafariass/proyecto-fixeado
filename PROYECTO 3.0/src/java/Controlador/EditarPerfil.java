/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Cifrado;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "EditarPerfil", urlPatterns = {"/EditarPerfil"})
public class EditarPerfil extends HttpServlet {

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
                Usuario usu = (Usuario)request.getSession().getAttribute("usu1");
                Usuario usueditar = new Usuario();
                String auxsaber = request.getParameter("tipomod");
                
                if(auxsaber.equals("modadmin"))
                {
                    usueditar = (Usuario)request.getSession().getAttribute("usubuscar1");
                    int aux = Integer.parseInt(request.getParameter("selectrol"));
                    int aux2 = Integer.parseInt(request.getParameter("selectrubro"));
                    usueditar.setRol_id_rol(aux);
                    usueditar.setRubro_id_rubro(aux2);
                }else
                {
                    usueditar = usu;
                }
                String clavecifrada = request.getParameter("nuevaclavesecreta");
                if(clavecifrada != "")
                {
                    usueditar.setContrasena(clavecifrada);
                } 
                String contraono = " , contrasena = '" + usueditar.getContrasena() + "' ";
                if(auxsaber.equals("modadmin"))
                {
                    contraono = "";
                }
                
                BD bd = new BD();
                if(request.getParameter("email") != "")
                {
                    usueditar.setEmail_user(request.getParameter("email"));
                }
                if(request.getParameter("telefono") != "")
                {
                    usueditar.setFono_user(request.getParameter("telefono"));
                }else
                {
                    usueditar.setFono_user("0");
                }
                
                if(request.getParameter("direccion") != "")
                {
                    usueditar.setDireccion_user(request.getParameter("direccion"));
                }else
                {
                    usueditar.setDireccion_user("NO INGRESADO");
                }    
                if(request.getParameter("apellido") != "")
                {
                    usueditar.setApellido_user(request.getParameter("apellido"));
                }else
                {
                    usueditar.setApellido_user("NO INGRESADO");
                }
                if(request.getParameter("nombre") != "")
                {
                    usueditar.setNombre_user(request.getParameter("nombre"));
                }
                
                
                String q = "update usuario"
                        + " set email_user = '" + usueditar.getEmail_user() + "' " + contraono +", fono_user = '" + usueditar.getFono_user() + "', direccion_user = '" + usueditar.getDireccion_user() 
                        + "' , apellido_user = '" + usueditar.getApellido_user() + "' , nombre_user = '" + usueditar.getNombre_user() 
                        + "', rol_id_rol = "+usueditar.getRol_id_rol()+" , rubro_id_rubro ="+ usueditar.getRubro_id_rubro()+
                        "where rut_user = " + usueditar.getRut_user();
                bd.update(q);
                if(!auxsaber.equals("modadmin"))
                {
                    request.getSession().setAttribute("usu1", usueditar);
                }else
                {
                    Usuario usucerrar = null;
                    request.getSession().setAttribute("usubuscar1", usucerrar);
                }
                
                
                response.sendRedirect("exito.jsp");
            }catch(Exception e)
            {
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
