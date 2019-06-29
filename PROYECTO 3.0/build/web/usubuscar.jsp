<%-- 
    Document   : usubuscar
    Created on : 15-06-2019, 5:05:27
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar usuarios</title>
    </head>
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
        
        
        
        BD bd = new BD();
        String q = "SELECT RUT_USER, DV_USER, NOMBRE_USER, APELLIDO_USER, " +
                        " EMAIL_USER, DIRECCION_USER, FONO_USER, ES.NOMBRE_ESTADO, ID_USER, RO.NOMBRE_ROL, RU.NOMBRE_RUBRO, " +
                        " ESTADO_ID_ESTADO, ROL_ID_ROL, RUBRO_ID_RUBRO FROM USUARIO US JOIN ESTADO ES " +
                        " ON (US.ESTADO_ID_ESTADO = ES.ID_ESTADO) " +
                        " JOIN ROL RO " +
                        " ON (US.ROL_ID_ROL = RO.ID_ROL) " +
                        " JOIN RUBRO RU " +
                        " ON (US.RUBRO_ID_RUBRO = RU.ID_RUBRO) ";
        ResultSet res = bd.read(q);
        res.next();
    %>
    
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
            $(document).ready(function() {
            $('#tablausuarios').DataTable({
                "language": {
                  "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                }
              });
            
        });
    </script>
    
    <body>
        <div style="overflow-x:auto; margin: 0 auto; width: 1500px">
            <table id="tablausuarios" class="table">
                <thead>
                    <tr>
                        <th><b>RUT USUARIO</b></th><th><b>NOMBRE</b></th><th><b>EMAIL</b></th>
                        <th><b>DIRECCION</b></th><th><b>FONO</b></th><th><b>ESTADO</b></th>
                        <th><b>ID USUARIO</b></th><th><b>ROL</b></th><th><b>RUBRO</b></th>
                        <th><b>ACTIVAR/ANULAR</b></th><th><b>MODIFICIAR</b></th>
                    </tr>
                </thead>
                <%
                            do {
                                String nombrecompleto = res.getString("nombre_user") + " " + res.getString("apellido_user");
                                String rut = res.getString("rut_user") + "-" + res.getString("dv_user");
                %>
                <tr>
                            <td><%= rut%></td><td><%= nombrecompleto %></td><td><%= res.getString("email_user")%></td>
                            <td><%= res.getString("direccion_user")%></td><td><%= res.getString("fono_user")%></td><td><%= res.getString("nombre_estado")%></td>
                            <td><%= res.getString("id_user")%></td><td ><%= res.getString("nombre_rol")%></td><td><%= res.getString("nombre_rubro")%></td>
                                <td>
                                    <%if(res.getString("estado_id_estado").equals("2")){
                                %>
                                <form action="AnularUsuario" method="post" onsubmit="return confirmacion()">
                                    <input type="submit" value="Anular usuario" name="submitanularusu" id="submitanularusu"><input name="iduser" style="display: none" value="<%= res.getString("id_user")%>">
                                </form>
                                <%}%>
                                <%if(res.getString("estado_id_estado").equals("-1")){
                                %>
                                <form action="ActivarUsuario" method="post" onsubmit="return confirmacion2()">
                                    <input type="submit" value="Activar Usuario" name="submitactivarusu" id="submitactivarusu"><input name="iduserac" style="display: none" value="<%= res.getString("id_user")%>">
                                </form>
                                <%}%>
                                </td>
                                <td>
                                    <form action="UserAModificar" method="post">
                                            <input type="submit" value="Modificar Usuario" name="submitmodiusu" id="submitmodiusu"><input name="idusermod" style="display: none" value="<%= res.getString("id_user")%>">
                                    </form>
                                </td>
                </tr>
                            
                            <%} while (res.next());
                            
                    %>
                    
                <tfoot>
                    <tr>
                        <th><b>RUT USUARIO</b></th><th><b>NOMBRE</b></th><th><b>EMAIL</b></th>
                        <th><b>DIRECCION</b></th><th><b>FONO</b></th><th><b>ESTADO</b></th>
                        <th><b>ID USUARIO</b></th><th><b>ROL</b></th><th><b>RUBRO</b></th>
                        <th><b>ACTIVAR/ANULAR</b></th><th><b>MODIFICIAR</b></th>
                    </tr>
                </tfoot>
            </table>
        </div>
                    
                    <% bd.cerrarConexion(); %>
   <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
