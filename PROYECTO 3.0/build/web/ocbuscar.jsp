<%-- 
    Document   : ocbuscar
    Created on : 15-06-2019, 5:04:07
    Author     : lordp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar orden de compra</title>
    </head>
    <%
        if(usu == null)
        {
            response.sendRedirect("index.jsp");
        }else
        {
            if(usu.getRol_id_rol() != 1 && usu.getRol_id_rol() != 2)
            {
                response.sendRedirect("index.jsp");
            }
        }
        
        BD bd = new BD();
        String q = "SELECT ID_ORDEN, TO_CHAR(FECHA_CREACION, 'DD-MM-YYYY HH24:MI') AS FECHA, TOTAL_COMPRA, ES.NOMBRE_ESTADO, USUARIO_ID_USER, CANTIDAD, PRODUCTO_ID_PRODUCTO FROM ORDEN_COMPRA ORDEN "+
                " JOIN ESTADO ES ON (ORDEN.ESTADO_ID_ESTADO = ES.ID_ESTADO)";
        ResultSet res = bd.read(q);
        
    %>
    
    <script type="text/javascript">
        $(document).ready(function() {
            
            $('#tablaoc').DataTable({
                "language": {
                  "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                }
              });
            
        });
        
        function confirmacion()
            {
                if(confirm("¿Está seguro?"))
                {
                    return true;
                }else
                {
                    return false;
                }
            }
    </script>
    <body>
        <div style="overflow-x:auto; margin: 0 auto; width: 1500px">
            
            <!-- Jumbotron Header -->


            <!-- Page Features -->
                
              <table id="tablaoc" class="table" style="width:100%">
                  
                      <%
                            if(res.next())
                            {%>
                            <thead>
                                <tr>
                                    <th><b>#</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>ID DE PROVEEDOR</b></th><th><b>CANTIDAD</b></th><th><b>ID PRODUCTO</b></th>
                                    <th><b>RECEPCIONAR</b></th><th><b>ANULAR</b></th>
                                </tr>
                            </thead>
                               <% 
                                do {
                                    %>
                                  <tr>
                                      <td><%= res.getString("ID_ORDEN") %></td><td><%= res.getString("FECHA") %></td><td><%= res.getString("TOTAL_COMPRA") %></td><td><%= res.getString("NOMBRE_ESTADO") %></td>
                                      <td><%= res.getString("USUARIO_ID_USER") %></td><td><%= res.getString("CANTIDAD") %></td><td><%= res.getString("PRODUCTO_ID_PRODUCTO") %></td>
                                    <td>
                                        <%if(res.getString("nombre_estado").equals("PENDIENTE"))
                                    {%>
                                    <form method="post" action="RecepcionOC">
                                        <input type="submit" value="Recepcionar OC"><input name="idorden" style="display: none" value="<%= res.getString("ID_ORDEN")%>">
                                    </form>
                                    <%} %>
                                    </td>
                                    <td>
                                        <%if(res.getString("nombre_estado").equals("PENDIENTE"))
                                    {%>
                                    <form method="post" action="AnularOC" onsubmit="return confirmacion()">
                                        <input type="submit" value="Anular compra"><input name="idorden" style="display: none" value="<%= res.getString("ID_ORDEN")%>" >
                                    </form>
                                    <%} %>
                                     </td>
                                  </tr>
                                <% } while (res.next()); %>
                            <%}else
                            {%>
                            <h4>No hay compras, compra aquí: </h4><a href="catalogo.jsp">Catálogo</a>
                            <%}%>
                          
                            <tfoot>
                                <tr>
                                    <th><b>#</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>ID DE PROVEEDOR</b></th><th><b>CANTIDAD</b></th><th><b>ID PRODUCTO</b></th>
                                    <th><b>RECEPCIONAR</b></th><th><b>ANULAR</b></th>
                                </tr>
                            </tfoot>
        
                      
                      
              </table>
                          
            <!-- /.row -->
<% bd.cerrarConexion(); %>
          </div>
        <footer class="py-5 bg-dark">
    <div class="container">
        
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
