<%-- 
    Document   : especificacionboleta
    Created on : 20-06-2019, 1:27:21
    Author     : lordp
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<%
    
    if(usu == null)
    {
        response.sendRedirect("index.jsp");
    }
    Boleta boleta = (Boleta)request.getSession().getAttribute("boleta1");
    BD bd = new BD();
        String q = "SELECT VEN.NUMERO_BOLETA, ES.NOMBRE_ESTADO, PRO.NOMBRE, PRO.ID_PRODUCTO, VEN.CANTIDAD, PRO.PRECIO_COMPRA, VEN.TOTAL_VENTA , ME.METODO , TI.NOMBRE_TVT FROM VENTA VEN" +
                    " JOIN PRODUCTO PRO" +
                        " ON (VEN.PRODUCTO_ID_PRODUCTO = PRO.ID_PRODUCTO)" +
                    " JOIN METODO_ENTREGA ME " +
                    " ON (VEN.METODO_ENTREGA_ID_METODO = ME.ID_METODO) "+
               " JOIN TIPO_VENTA TI " +
                " ON (VEN.TIPO_VENTA_IDTIPOVENTA = TI.ID_TIPOVENTA) " +
                " JOIN ESTADO ES ON (VEN.ESTADO_ID_ESTADO = ES.ID_ESTADO) " +
                            " WHERE VEN.NUMERO_BOLETA = " + boleta.getNro();
    ResultSet res = bd.read(q);
    %>
<!DOCTYPE html>
<html>
    <head>
        <title>Boleta</title>
    </head>
    <body>
   
        
        <div class="container" style="overflow-x:auto;">
            
            <form method="post" action="EspecificacionBoleta">
              <table class="table">
                  <tr>
                      <td><b>#</b></td><td><b>NOMBRE</b></td><td><b>CANTIDAD</b></td><td><b>PRECIO UNITARIO</b></td><td><b>PRECIO TOTAL</b></td>
                  </tr>
                      <%
                          int cantidadproductos = 0;
                          int preciototal = 0;
                          String tipoen = "";
                          String tipoven = "";
                          String estadoventa = "";
                          String nroboleta = "";
                          
                            if(res.next())
                            {
                                int cont = 0;
                                do {
                                    cont++;
                                    cantidadproductos++;
                                    tipoen = res.getString("metodo");
                                    tipoven = res.getString("nombre_tvt");
                                    estadoventa = res.getString("nombre_estado");
                                    nroboleta = res.getString("numero_boleta");
                                    preciototal = preciototal + Integer.parseInt(res.getString("TOTAL_VENTA"));
                                    %>
                                    <tr>
                                        <td><%= cont %></td>
                                        <td><a href='http://localhost:11111/PROYECTO_3.0/EspecificacionProducto?dato= <%= res.getString("ID_PRODUCTO")%>'><%= res.getString("NOMBRE") %></a></td>
                                        <td><%= res.getString("CANTIDAD") %></td>
                                        <td>$<% out.println( Math.round(Integer.parseInt(res.getString("PRECIO_COMPRA"))*1.19) ); %></td>
                                        <td>$<%= res.getString("TOTAL_VENTA") %></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                <% } while (res.next()); %>
                            <%}%>
                            <tr>
                                <td><a href="javascript:window.history.back();">&laquo; Volver</a></td>
                                <td>Cantidad de productos: <%= cantidadproductos%> </td>
                                <td></td>
                                <td>Valor total: $<%= preciototal %></td><td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Tipo entrega: <%= tipoen %></td><td></td><td>Tipo venta: <%= tipoven %></td>
                                <td></td> 
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Estado: <%= estadoventa %></td><td></td><td>Número de boleta: <%= nroboleta%></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
              </table>
                </form>
            
            
        </div>
  <!-- /.container -->
<% bd.cerrarConexion(); %>
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
