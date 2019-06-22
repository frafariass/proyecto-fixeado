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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
        String rut = request.getParameter("rut");
        String clavecifrada = request.getParameter("clavesecreta");
        if (rut != null && clavecifrada != null) {
            int rutint;
            BD bd = new BD();
            try
            {
                
                rut = rut.replace(".", "");
                if (rut.contains("-")) {
                    rut = rut.replace("-", "");
                }                   
                char dvaux = rut.charAt(rut.length()-1);
                rut = rut.substring(0, rut.length()-1);
                rutint = Integer.parseInt(rut);
                String q = "select * from usuario where rut_user = " +rutint+ " and " + "contrasena = '" +clavecifrada+"'";               
                ResultSet res = bd.read(q);
                res.next();
                
                try
                {
                    int rutquery = Integer.parseInt(res.getString("rut_user"));
                    char dv = res.getString("dv_user").charAt(0);
                    String nombre = res.getString("nombre_user");
                    String apellido = res.getString("apellido_user");
                    String email = res.getString("email_user");
                    String contrasena = res.getString("contrasena");
                    String direccion = res.getString("direccion_user");
                    String fono = res.getString("fono_user");
                    int estado_id_estado = Integer.parseInt(res.getString("estado_id_estado"));
                    int rubro_id = Integer.parseInt(res.getString("rubro_id_rubro"));
                    int rol_id_rol = Integer.parseInt(res.getString("rol_id_rol"));
                    int id_user = Integer.parseInt(res.getString("id_user"));

                    Usuario usu = new Usuario(dv,nombre,apellido,email,contrasena,direccion,fono,estado_id_estado,
                                            rubro_id,id_user,rol_id_rol,rutquery);

                    request.getSession().setAttribute("usu1", usu);
                    response.sendRedirect("index.jsp");
                }catch(Exception e)
                {
                    String rutarmado = rut + "-" + dvaux;
                    String mensaje = "El rut " + rutarmado + " no se encuentra registrado en el sistema o la contraseña es incorrecta";
                    Error error = new Error(mensaje);
                    request.getSession().setAttribute("error1", error);
                    response.sendRedirect("error.jsp");
                }
                
                
                
                
                
            }catch (IOException | NumberFormatException | SQLException ex){
                response.sendRedirect("error.jsp");
            }
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
