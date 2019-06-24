<%-- 
    Document   : verocs
    Created on : 19-06-2019, 0:37:52
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Mis órdenes de compra</title>
    </head>
    <%
        if(usu == null)
        {
            response.sendRedirect("index.jsp");
        }else
        {
            if(usu.getRol_id_rol() != 5)
            {
                response.sendRedirect("index.jsp");
            }
        }
        
        BD bd = new BD();
        String q = "SELECT ID_ORDEN, TO_CHAR(FECHA_CREACION, 'DD-MM-YYYY HH24:MI') AS FECHA, TOTAL_COMPRA, ES.NOMBRE_ESTADO, USUARIO_ID_USER, CANTIDAD, PRODUCTO_ID_PRODUCTO, NOMBRE FROM ORDEN_COMPRA ORDEN "+
                " JOIN ESTADO ES ON (ORDEN.ESTADO_ID_ESTADO = ES.ID_ESTADO) JOIN PRODUCTO PRO ON (ORDEN.PRODUCTO_ID_PRODUCTO = PRO.ID_PRODUCTO) WHERE USUARIO_ID_USER =" + usu.getId_user();
        ResultSet res = bd.read(q);
    %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis órdenes de compra</title>
    </head>
    <body>
        <div class="container" style="overflow-x:auto;">
            <div class="row">
            <!-- Jumbotron Header -->


            <!-- Page Features -->
                
              <table id="tablaoc" class="table" style="width:100%">
                  
                      <%
                            if(res.next())
                            {%>
                            <thead>
                                <tr>
                                    <th><b>#</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>ID DE PROVEEDOR</b></th><th><b>CANTIDAD</b></th><th><b>ID PRODUCTO</b></th><th><b>NOMBRE PRODUCTO</b></th>
                                    <th><b>ANULAR</b></th>
                                </tr>
                            </thead>
                               <% 
                                do {
                                    %>
                                  <tr>
                                      <td><%= res.getString("ID_ORDEN") %></td><td><%= res.getString("FECHA") %></td><td><%= res.getString("TOTAL_COMPRA") %></td><td><%= res.getString("NOMBRE_ESTADO") %></td>
                                      <td><%= res.getString("USUARIO_ID_USER") %></td><td><%= res.getString("CANTIDAD") %></td><td><%= res.getString("PRODUCTO_ID_PRODUCTO") %></td><td><%= res.getString("NOMBRE") %></td>

                                    <td>
                                        <%if(res.getString("nombre_estado").equals("PENDIENTE"))
                                    {%>
                                    <form method="post" action="AnularOC">
                                        <input type="submit" value="Anular compra"><input name="idorden" style="display: none" value="<%= res.getString("ID_ORDEN")%>" >
                                    </form>
                                    <%} %>
                                     </td>
                                  </tr>
                                <% } while (res.next()); %>
                            <%}else
                            {%>
                            <h4>No hay órdenes de compra asociadas a su rut </h4><a href="index.jsp">Volver al inicio</a>
                            <%}%>
                          
                            <tfoot>
                                <tr>
                                    <th><b>#</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>ID DE PROVEEDOR</b></th><th><b>CANTIDAD</b></th><th><b>ID PRODUCTO</b></th><th><b>NOMBRE PRODUCTO</b></th>
                                    <th><b>ANULAR</b></th>
                                </tr>
                            </tfoot>
        
                      
                      
              </table>
                 </div>           
            <!-- /.row -->

          </div>
        <footer class="py-5 bg-dark">
    <div class="container">
        
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
