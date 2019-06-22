/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Modelo.BD;
import Modelo.Estado;
import Modelo.Rol;
import Modelo.Rubro;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "BuscarUser", urlPatterns = {"/BuscarUser"})
public class BuscarUser extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String rut = request.getParameter("rut");
            rut = rut.replace(".", "");
            rut = rut.replace("-", "");
            rut = rut.substring(0, rut.length()-1);
            BD bd = new BD();
            String q = "SELECT RUT_USER, DV_USER, NOMBRE_USER, APELLIDO_USER, " +
                        " EMAIL_USER, DIRECCION_USER, FONO_USER, ES.NOMBRE_ESTADO, ID_USER, RO.NOMBRE_ROL, RU.NOMBRE_RUBRO, " +
                        " ESTADO_ID_ESTADO, ROL_ID_ROL, RUBRO_ID_RUBRO FROM USUARIO US JOIN ESTADO ES " +
                        " ON (US.ESTADO_ID_ESTADO = ES.ID_ESTADO) " +
                        " JOIN ROL RO " +
                        " ON (US.ROL_ID_ROL = RO.ID_ROL) " +
                        " JOIN RUBRO RU " +
                        " ON (US.RUBRO_ID_RUBRO = RU.ID_RUBRO) " +
                        " WHERE RUT_USER = " + rut;
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
                
                
                Rol rol = new Rol(Integer.parseInt(res.getString("rol_id_rol")), res.getString("nombre_rol"));
                Rubro rubro = new Rubro(Integer.parseInt(res.getString("rubro_id_rubro")), res.getString("nombre_rubro"));
                Estado estado = new Estado(Integer.parseInt(res.getString("estado_id_estado")), res.getString("nombre_estado"));
                
                request.getSession().setAttribute("rolbuscar1", rol);
                request.getSession().setAttribute("rubrobuscar1", rubro);
                request.getSession().setAttribute("estadobuscar1", estado);
                request.getSession().setAttribute("usubuscar1", usu);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("usubuscarpaso2.jsp");
                requestDispatcher.forward(request, response);
            }
            
            
            
            
            
        }catch(Exception e)
        {
            response.sendRedirect("error");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BuscarUser.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BuscarUser.class.getName()).log(Level.SEVERE, null, ex);
        }
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
