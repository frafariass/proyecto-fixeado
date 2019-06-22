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
        String q = "select numero_boleta, sum(total_venta), TO_CHAR(FECHA_BOLETA, 'DD-MM-YYYY') AS FECHA_BOLETA, ESTADO_ID_ESTADO from venta where usuario_id_usuario = "
                + usu.getId_user() + " group by numero_boleta, FECHA_BOLETA, ESTADO_ID_ESTADO";
        ResultSet res = bd.read(q);
        


    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container" style="overflow-x:auto;">

            <!-- Jumbotron Header -->


            <!-- Page Features -->
            <div id="miscomprasdiv">
                
              <table class="datatable table table-bordered">
                  
                      <%
                            if(res.next())
                            {%>
                                <tr>
                                    <td><b>NÚMERO DE BOLETA</b></td><td><b>FECHA</b></td><td><b>VALOR TOTAL</b></td><td><b>ESTADO</b></td>
                                </tr>
                               <% String estado = "";
                                do {
                                     estado = res.getString("ESTADO_ID_ESTADO");
                                     if(estado.equals("1"))
                                     {
                                         estado = "Pendiente";
                                     }
                                     if(estado.equals("-1"))
                                     {
                                         estado = "Anulado";
                                     }
                                     if(estado.equals("3"))
                                     {
                                         estado = "Enviado";
                                     }
                                     if(estado.equals("4"))
                                     {
                                         estado = "Pagado";
                                     }
                                    %>
                                  <tr>
                                    <td><%= res.getString("numero_boleta") %></td><td><%= res.getString("fecha_boleta") %></td><td><%= res.getString("sum(total_venta)") %></td><td><%= estado %></td>
                                    <td>
                                    <form method="post" action="EspecificacionBoleta">
                                    <input type="submit" value="Ver detalle" name="submitboleta" id="submitboleta"><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>">
                                    </form>
                                    <form method="post" action="AnularBoleta" onsubmit="return verificarestado()">
                                    <input type="submit" value="Anular compra" name="submitboletaanu" id="submitboletaanu"><input name="nroboleta" style="display: none" value="<%= res.getString("numero_boleta")%>" ><input name="estadoboleta" style="display: none" value="<%= res.getString("estado_id_estado")%>">
                                    </form>
                                    </td>
                                  </tr>
                                <% } while (res.next()); %>
                            <%}else
                            {%>
                            <h4>No hay compras, compra aquí: </h4><a href="catalogo.jsp">Catálogo</a>
                            <%}%>
                          
            
        
                      
                      
              </table>
            </div>
            <!-- /.row -->

          </div>
          <!-- /.container -->

          <!-- Footer -->
          <footer class="py-5 bg-dark">
            <div class="container">
              <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
            </div>
            <!-- /.container -->
          </footer>
    </body>
</html>
