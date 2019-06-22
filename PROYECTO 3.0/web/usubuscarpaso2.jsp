<%-- 
    Document   : usubuscarpaso2
    Created on : 20-06-2019, 3:24:33
    Author     : lordp
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<% Usuario usubuscar = (Usuario)request.getSession().getAttribute("usubuscar1");
    Rol rolbuscar = (Rol)request.getSession().getAttribute("rolbuscar1");
    Rubro rubrobuscar = (Rubro)request.getSession().getAttribute("rubrobuscar1");
    Estado estadobuscar = (Estado)request.getSession().getAttribute("estadobuscar1");
%> 
<!DOCTYPE html>
<html>
    
    <%
        if(usu == null)
        {
            response.sendRedirect("index.jsp");
        }else
        {
            if(usu.getRol_id_rol() != 1)
            {
                response.sendRedirect("index.jsp");
            }
        }
    %>
    
    <body>
        <div class="container"  id="tablausubuscar2" style="overflow-x:auto;">
        <table class="table table-spacing">
            
            <%
               if(usubuscar != null)
                {%>
            <tr class="tableformat">
                <td class="tableformat"><b>RUT</b></td><td class="tableformat"><b>NOMBRE</b></td class="tableformat"><td><b>EMAIL</b></td>
                <td class="tableformat"><b>DIRECCION</b></td><td  class="tableformat"><b>FONO</b></td><td  class="tableformat"><b>ESTADO</b></td>
                <td class="tableformat"><b>ID USUARIO</b></td><td class="tableformat"><b>ROL</b></td><td class="tableformat"><b>RUBRO</b></td>
            </tr>
            <tr class="tableformat">
                <%
                    String rut = usubuscar.getRut_user() + "-" + usubuscar.getDv_user();
                    String nombrecompleto = usubuscar.getNombre_user()+" "+ usubuscar.getApellido_user();
                    String estado = estadobuscar.getNombre_estado();
                    String rol = rolbuscar.getNombre_rol();
                    String rubro = rubrobuscar.getNombre_rubro();

                    %>
                <td class="tableformat"><%= rut%></td><td class="tableformat"><%= nombrecompleto%></td><td class="tableformat"><%= usubuscar.getEmail_user()%></td>
                <td class="tableformat"><%= usubuscar.getDireccion_user()%></td><td class="tableformat"><%= usubuscar.getFono_user()%></td><td class="tableformat"><%= estado%></td>
                <td class="tableformat"><%= usubuscar.getId_user()%></td><td class="tableformat"><%= rol%></td><td class="tableformat"><%= rubro%></td>
            </tr>
            <tr>
                <td class="tableformat"><a href="javascript:window.history.back();">&laquo; Volver</a></td>
                <%if(usubuscar.getEstado_id_estado() == 0){
                %>
            <form action="AnularUsuario" method="post" onsubmit="return confirmacion()">
                <td><input type="submit" value="Anular usuario" name="submitanularusu" id="submitanularusu"><input name="iduser" style="display: none" value="<%= usubuscar.getId_user()%>"></td>
            </form>
            <%}%>
            <%if(usubuscar.getEstado_id_estado() == -1){
                %>
            <form action="ActivarUsuario" method="post" onsubmit="return confirmacion2()">
                <td><input type="submit" value="Activar Usuario" name="submitactivarusu" id="submitactivarusu"><input name="iduserac" style="display: none" value="<%= usubuscar.getId_user()%>"></td>
            </form>
            <%}%>
            <form action="editarperfil.jsp" method="post">
                    <td><input type="submit" value="Modificar Usuario" name="submitmodiusu" id="submitmodiusu"><input name="idusermod" style="display: none" value="<%= usubuscar.getId_user()%>"></td>
            </form>
            </tr>
            <%}else
            {
                response.sendRedirect("index.jsp");
            }%>
        </table>
        
        <script type="text/javascript">
            function confirmacion()
            {
                if(confirm("¿Está seguro que desea anular éste usuario?"))
                {
                    return true;
                }else
                {
                    return false;
                }
            }
            function confirmacion2()
            {
                if(confirm("¿Está seguro que desea activar éste usuario?"))
                {
                    return true;
                }else
                {
                    return false;
                }
            }
        </script>
    </div>
   <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
