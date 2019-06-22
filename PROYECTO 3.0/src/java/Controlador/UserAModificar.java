/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
@WebServlet(name = "UserAModificar", urlPatterns = {"/UserAModificar"})
public class UserAModificar extends HttpServlet {

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
                String iduser = request.getParameter("idusermod");
                BD bd = new BD();
                String q = "SELECT * FROM USUARIO WHERE ID_USER =" + iduser;
                ResultSet res = bd.read(q);
                
                if(res.next())
                {
                    char dv = res.getString("dv_user").charAt(0);
                    String nombre = res.getString("nombre_user");
                    String apellido = res.getString("apellido_user");
                    String email = res.getString("email_user");
                    String contra = "";
                    String direccion = res.getString("direccion_user");
                    String fono = res.getString("fono_user");
                    int estadoid = Integer.parseInt(res.getString("estado_id_estado"));
                    int rubroid = Integer.parseInt(res.getString("rubro_id_rubro"));
                    int id_user = Integer.parseInt(res.getString("id_user"));
                    int rolid = Integer.parseInt(res.getString("rol_id_rol"));
                    int rutuser = Integer.parseInt(res.getString("rut_user"));

                    Usuario usu = new Usuario();

                    usu.setDv_user(dv);
                    usu.setNombre_user(nombre);
                    usu.setApellido_user(apellido);
                    usu.setEmail_user(email);
                    usu.setContrasena(contra);
                    usu.setDireccion_user(direccion);
                    usu.setFono_user(fono);
                    usu.setEstado_id_estado(estadoid);
                    usu.setRubro_id_rubro(rubroid);
                    usu.setId_user(id_user);
                    usu.setRol_id_rol(rolid);
                    usu.setRut_user(rutuser);
                    
                    request.getSession().setAttribute("usubuscar1", usu);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("editarperfil.jsp");
                    requestDispatcher.forward(request, response);
                }
            }catch(Exception e)
            {
                Error error = new Error(e.getMessage());
                request.getSession().setAttribute("error1", error);
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
