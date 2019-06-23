<%-- 
    Document   : venbuscar
    Created on : 15-06-2019, 5:05:08
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar venta</title>
    </head>
    <%
        if(usu == null)
        {
            response.sendRedirect("index.jsp");
        }else
        {
            if(usu.getRol_id_rol() != 1 && usu.getRol_id_rol() != 3)
            {
                response.sendRedirect("index.jsp");
            }
        }
        
        BD bd = new BD();
        String q = "select numero_boleta, sum(total_venta) as total_boleta, TO_CHAR(FECHA_BOLETA, 'DD-MM-YYYY') AS FECHA_BOLETA, NOMBRE_ESTADO, NOMBRE_TVT, estado_id_estado, metodo from venta VE " +
                    " JOIN ESTADO ES "+
                    " ON (VE.ESTADO_ID_ESTADO = ES.ID_ESTADO) " +
                    " JOIN TIPO_VENTA TI " +
                    " ON (VE.TIPO_VENTA_IDTIPOVENTA = TI.ID_TIPOVENTA) " +
                    " JOIN METODO_ENTREGA ME " +
                    " ON (VE.METODO_ENTREGA_ID_METODO = ME.ID_METODO) " +
                    " group by numero_boleta, FECHA_BOLETA, NOMBRE_ESTADO, NOMBRE_TVT, estado_id_estado, METODO ";
        ResultSet res = bd.read(q);
        


    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar ventas</title>
    </head>
    <script type="text/javascript">
        $(document).ready(function() {
            
            $('#tablacompras').DataTable({
                "language": {
                  "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                }
              });
            
        });
    </script>
    <body>
        <div class="container" style="overflow-x:auto;">
            <div class="row">
            <!-- Jumbotron Header -->


            <!-- Page Features -->
                
              <table id="tablacompras" class="table" style="width:100%">
                  
                      <%
                            if(res.next())
                            {%>
                            <thead>
                                <tr>
                                    <th><b>NÚMERO DE BOLETA</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>TIPO VENTA</b></th><th><b>TIPO ENTREGA</b></th>
                                    <th><b>VER DETALLE</b></th><th><b>ANULAR</b></th>
                                </tr>
                            </thead>
                               <% 
                                do {
                                    %>
                                  <tr>
                                      <td><%= res.getString("numero_boleta") %></td><td><%= res.getString("fecha_boleta") %></td><td><%= res.getString("total_boleta") %></td><td><%= res.getString("nombre_estado") %></td>
                                      <td><%= res.getString("nombre_tvt") %></td><td><%= res.getString("metodo") %></td>
                                    <td>
                                    <form method="post" action="EspecificacionBoleta">
                                        <input type="submit" value="Ver detalle" name="submitboleta" id="submitboleta"><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>">
                                    </form>
                                    </td>
                                    <td>
                                    <form method="post" action="AnularBoleta">
                                        <input type="submit" value="Anular compra" name="submitboletaanu" id="submitboletaanu"><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>" ><input name="estadoboleta" style="display: none" value="<%= res.getString("estado_id_estado")%>">
                                    </form>
                                    </td>
                                  </tr>
                                <% } while (res.next()); %>
                            <%}else
                            {%>
                            <h4>No hay compras, compra aquí: </h4><a href="catalogo.jsp">Catálogo</a>
                            <%}%>
                          
                            <tfoot>
                                <tr>
                                    <th><b>NÚMERO DE BOLETA</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>TIPO VENTA</b></th><th><b>TIPO ENTREGA</b></th>
                                    <th><b>VER DETALLE</b></th><th><b>ANULAR</b></th>
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
