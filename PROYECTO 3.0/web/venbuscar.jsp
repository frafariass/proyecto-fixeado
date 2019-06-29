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
        String q = "select PAGO,numero_boleta,  USUARIO_RUT_USER, " +
                    "sum(total_venta) as total_boleta, TO_CHAR(FECHA_BOLETA, 'DD-MM-YYYY HH:MI:SS') AS FECHA_BOLETA, NOMBRE_ESTADO, NOMBRE_TVT, ve.estado_id_estado, metodo from venta VE " +
                     "JOIN ESTADO ES " +
                     "ON (VE.ESTADO_ID_ESTADO = ES.ID_ESTADO) " +
                     "JOIN TIPO_VENTA TI  " +
                     "ON (VE.TIPO_VENTA_IDTIPOVENTA = TI.ID_TIPOVENTA)  " +
                     "JOIN METODO_ENTREGA ME  " +
                     "ON (VE.METODO_ENTREGA_ID_METODO = ME.ID_METODO)  " +
                     "JOIN METODO_PAGO MEPA  " +
                     "ON (VE.METODO_PAGO_IDPAGO = MEPA.ID_PAGO)  " +
                     "group by numero_boleta, FECHA_BOLETA, NOMBRE_ESTADO, NOMBRE_TVT, ve.estado_id_estado, METODO , USUARIO_RUT_USER, PAGO";
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
        <div   style=" margin: 0 auto; width: 2000px; ">
            
            <!-- Jumbotron Header -->


            <!-- Page Features -->
                
              <table id="tablacompras" class="table" style="width:100%; overflow-x:auto;" >
                  
                      <%
                            if(res.next())
                            {%>
                            <thead>
                                <tr>
                                    <th><b>NÚMERO DE BOLETA</b></th><th><b>RUT ASOCIADO</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>TIPO VENTA</b></th><th><b>MÉTODO ENTREGA</b></th><th><b>MÉTODO PAGO</b></th>
                                    <th><b>VER DETALLE</b></th><th><b>ANULAR/ACTIVAR</b></th><th><b>VERIFICARCIÓN PAGO</b></th><th><b>COMPLETAR</b></th>
                                </tr>
                            </thead>
                               <% 
                                do {
                                    %>
                                  <tr>
                                      <td><%= res.getString("numero_boleta") %></td><td><%= res.getString("USUARIO_RUT_USER") %></td><td><%= res.getString("fecha_boleta") %></td><td>$<%= res.getString("total_boleta") %></td><td><%= res.getString("nombre_estado") %></td>
                                      <td><%= res.getString("nombre_tvt") %></td><td><%= res.getString("metodo") %></td><td><%= res.getString("pago") %></td>
                                    <td>
                                    <form method="post" action="EspecificacionBoleta">
                                        <input type="submit" value="Ver detalle" name="submitboleta" id="submitboleta"><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>">
                                    </form>
                                    </td>
                                    <td>
                                        <%
                                            if((res.getString("estado_id_Estado").equals("1")  ||  res.getString("estado_id_Estado").equals("4"))  || res.getString("estado_id_Estado").equals("3")){%>
                                            <form method="post" action="AnularBoleta" onsubmit="return confirmacion()">
                                                <input type="submit" value="Anular boleta" name="submitboletaanu" id="submitboletaanu"
                                                       
                                                       
                                                       >
                                                <input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>" ><input name="estadoboleta" style="display: none" value="<%= res.getString("estado_id_estado")%>">
                                            </form>
                                            
                                        <%}else{%>
                                        
                                            
                                        
                                        
                                        <form method="post" action="ActivarBoleta" onsubmit="return confirmacion()">
                                                    
                                            <input type="submit" value="Activar Boleta" name="submitboletaanu" id="submitboletaanu"
                                                   <%if(res.getString("estado_id_Estado").equals("3"))
                                                     {%>
                                                   
                                                     disabled="true"
                                                     
                                                     
                                                   <%}%>
                                                   
                                                   
                                                   ><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>" ><input name="estadoboleta" style="display: none" value="<%= res.getString("estado_id_estado")%>">
                                        
                                        </form>
                                            
                                                
                                            
                                        

                                            
                                        <%}%>
                                    </td>
                                    
                                    <td>
                                    <form method="post" action="MarcarBoletaPagada" onsubmit="return confirmacion()">
                                        <input type="submit" value="Marcar como pagada" name="submitboletaanu" id="submitboletaanu"
                                               
                                               <%if(!res.getString("estado_id_estado").equals("1"))
                                               {%>
                                                  
                                               disabled="true"
                                               
                                                <%} %>
                                         > 
                                               <input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>" ><input name="estadoboleta" style="display: none" value="<%= res.getString("estado_id_estado")%>">
                                    </form>
                                    </td>
                                    <td>
                                    <form method="post" action="CompletaBoleta" onsubmit="return confirmacion()">
                                        <input type="submit" value="Marcar como completada" name="submitboletaanu" id="submitboletaanu"
                                               
                                               
                                                <%if(!res.getString("estado_id_estado").equals("4"))
                                               {%>
                                                  
                                               disabled="true"
                                               
                                                <%} %>
                                               
                                               
                                               ><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>" ><input name="estadoboleta" style="display: none" value="<%= res.getString("estado_id_estado")%>">
                                    </form>
                                    </td>
                                  </tr>
                                <% } while (res.next()); %>
                            <%}else
                            {%>
                            <h4>No hay ventas registradas en el sistema</h4>
                            <%}%>
                          
                            <tfoot>
                                <tr>
                                    <th><b>NÚMERO DE BOLETA</b></th><th><b>RUT ASOCIADO</b></th><th><b>FECHA</b></th><th><b>VALOR TOTAL</b></th><th><b>ESTADO</b></th>
                                    <th><b>TIPO VENTA</b></th><th><b>MÉTODO ENTREGA</b></th><th><b>MÉTODO PAGO</b></th>
                                    <th><b>VER DETALLE</b></th><th><b>ANULAR/ACTIVAR</b></th><th><b>VERIFICARCIÓN PAGO</b></th><th><b>COMPLETAR</b></th>
                                </tr>
                            </tfoot>
        
                      
                      
              </table>
                           
            <!-- /.row -->

        </div>
                            
                            <% bd.cerrarConexion(); %>
<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
      <p class="m-0 text-center text-white">Contacto al: 2-123-1234, contacto@ferme.cl</p>
    </div>
    <!-- /.container -->
  </footer>

    </body>
</html>