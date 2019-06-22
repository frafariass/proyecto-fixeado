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
        String q = "SELECT PRO.NOMBRE, VEN.CANTIDAD, PRO.PRECIO_COMPRA, VEN.TOTAL_VENTA FROM VENTA VEN" +
                    " JOIN PRODUCTO PRO" +
                        " ON (VEN.PRODUCTO_ID_PRODUCTO = PRO.ID_PRODUCTO)" +
                            " WHERE VEN.NUMERO_BOLETA = " + boleta.getNro();
    ResultSet res = bd.read(q);
    %>
<!DOCTYPE html>
<html>
    <body>
   
        
        <div class="container" style="overflow-x:auto;">
            
            <form method="post" action="EspecificacionBoleta">
              <table class="table table-bordered">
                  <tr>
                      <td><b>#</b></td><td><b>NOMBRE</b></td><td><b>CANTIDAD</b></td><td><b>PRECIO UNITARIO</b></td><td><b>PRECIO TOTAL</b></td>
                  </tr>
                      <%
                          int cantidadproductos = 0;
                          int preciototal = 0;
                            if(res.next())
                            {
                                int cont = 0;
                                do {
                                    cont++;
                                    cantidadproductos++;
                                    preciototal = preciototal + Integer.parseInt(res.getString("TOTAL_VENTA"));
                                    %>
                                    <tr>
                                        <td><%= cont %></td>
                                        <td><%= res.getString("NOMBRE") %></td><td><%= res.getString("CANTIDAD") %></td><td><%= res.getString("PRECIO_COMPRA") %></td><td><%= res.getString("TOTAL_VENTA") %></td>
                                    </tr>
                                <% } while (res.next()); %>
                            <%}%>
                            <tr>
                                <td><a href="javascript:window.history.back();">&laquo; Volver</a></td><td>Cantidad de productos: </td><td><%= cantidadproductos%></td><td>Valor total: </td><td><%= preciototal %></td>
                            </tr>
              </table>
                </form>
            
            
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
