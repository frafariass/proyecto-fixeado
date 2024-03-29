<%-- 
    Document   : miscompras
    Created on : 19-06-2019, 0:37:28
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    
    <%
        if(usu == null)
        {
            response.sendRedirect("index.jsp");
        }
        
        BD bd = new BD();
        String q = "select METODO,PAGO,numero_boleta, sum(total_venta) as total_boleta, TO_CHAR(FECHA_BOLETA, 'DD-MM-YYYY') AS FECHA_BOLETA, NOMBRE_ESTADO, NOMBRE_TVT, estado_id_estado from venta VE " +
                     "JOIN ESTADO ES  " +
                     "ON (VE.ESTADO_ID_ESTADO = ES.ID_ESTADO)  " +
                     "JOIN TIPO_VENTA TI  " +
                     "ON (VE.TIPO_VENTA_IDTIPOVENTA = TI.ID_TIPOVENTA)  " +
                     "JOIN METODO_ENTREGA MEEN " +
                     "ON (VE.METODO_ENTREGA_ID_METODO = MEEN.ID_METODO) " +
                     "JOIN METODO_PAGO MEPA " +
                     "ON (VE.METODO_PAGO_IDPAGO = MEPA.ID_PAGO) " +
                     "where USUARIO_ID_USUARIO = " + usu.getId_user() +
                     "group by numero_boleta, FECHA_BOLETA, NOMBRE_ESTADO, NOMBRE_TVT, estado_id_estado,METODO, pago  ";
        ResultSet res = bd.read(q);
        


    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis compras</title>
    </head>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#tablacompras').DataTable({
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
        <div  class="container" style="overflow-x:auto;">
            <div class="row">
            <!-- Jumbotron Header -->


            <!-- Page Features -->
            <h5><a href="datostransferencia.jsp">Ver información y datos de transferencia</a></h5>
              <table id="tablacompras" class="table" style="width:100%">
                  
                      <%
                            if(res.next())
                            {%>
                            <thead>
                                <tr>
                                    <th><b>NÚMERO DE BOLETA</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>TIPO VENTA</b></th><th><b>MÉTODO DE ENTREGA</b></th><th><b>MÉTODO DE PAGO</b></th>
                                    <th><b>VER DETALLE</b></th><th><b>ANULAR</b></th>
                                </tr>
                            </thead>
                               <% 
                                do {
                                    %>
                                  <tr>
                                      <td><%= res.getString("numero_boleta") %></td><td><%= res.getString("fecha_boleta") %></td><td>$<%= res.getString("total_boleta") %></td><td><%= res.getString("nombre_estado") %></td>
                                      <td><%= res.getString("nombre_tvt") %></td>
                                      <td><%= res.getString("metodo") %></td><td><%= res.getString("pago") %></td>
                                    <td>
                                    <form method="post" action="EspecificacionBoleta">
                                        <input type="submit" value="Ver detalle" name="submitboleta" id="submitboleta"><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>">
                                    </form>
                                    </td>
                                    <td>
                                        
                                        
                                        <form method="post" action="AnularBoleta" onsubmit="return confirmacion()">
                                        <input type="submit" value="Anular compra" name="submitboletaanu" id="submitboletaanu"
                                               
                                               <%if(!res.getString("estado_id_estado").equals("1"))
                                               {%>
                                                  
                                               disabled="true"
                                               
                                                <%} %>
                                               
                                               
                                               ><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>" ><input name="estadoboleta" style="display: none" value="<%= res.getString("estado_id_estado")%>">
                                    </form>
                                    
                                    
                                    </td>
                                  </tr>
                                <% } while (res.next()); %>
                                
                                <tfoot>
                                <tr>
                                    <th><b>NÚMERO DE BOLETA</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>TIPO VENTA</b></th><th><b>MÉTODO DE ENTREGA</b></th><th><b>MÉTODO DE PAGO</b></th>
                                    <th><b>VER DETALLE</b></th><th><b>ANULAR</b></th>
                                </tr>
                            </tfoot>
                                
                            <%}else
                            {%>
                            <h4>No hay compras, compra aquí: <a href="catalogo.jsp"> Catálogo</a></h4>
                            <%}%>
                          
                            
        
                      
                      
              </table>
                 </div>           
            <!-- /.row -->

          </div>
          <!-- /.container -->
<% bd.cerrarConexion(); %>
          <!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
      <p class="m-0 text-center text-white">Contacto al: 2-123-1234, contacto@ferme.cl</p>
    </div>
    <!-- /.container -->
  </footer>

    </body>
</html>
