<%-- 
    Document   : caja
    Created on : 23-06-2019, 7:39:48
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Caja</title>
    </head>
    <body>
        

  <div class="container">

      
      
      <%
          if(listaventas.size() != 0)
          {
                int precioapagarfactura = 0;
                int precioapagarboleta = 0;
                int cantidad = 0;
                for (Venta ven : listaventas) {
                        precioapagarfactura = precioapagarfactura + ven.getTotal_venta();
                        precioapagarboleta =  precioapagarboleta + (int)((Math.round(ven.getPrecio_unitario_producto()*1.19))*ven.getCantidad());
                        cantidad = cantidad + ven.getCantidad();
                    }%>
                    <div class="formularioregistro">
                    <form action="AgregarVenta" method="post">
                        <table class="table">
                            <tr>
                                <td>Tipo de boleta:</td><td>
                                    <select name="tipoventa" id="tipoventa">
                                        <option value="1">Boleta</option>
                                        <option value="2">Factura</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Método de entrega:</td><td>
                                    <select name="tipoentrega" id="tipoentrega">
                                        <option value="1">Presencial</option>
                                        <option value="2">Envío</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Cantidad: </td><td><% out.println(cantidad); %></td>
                            </tr>
                            <tr>
                                <td>Monto a pagar: </td><td id="monto" value="<% out.println(precioapagarboleta);%>">$<% out.println(precioapagarboleta);%></td>
                            </tr>
                            <tr>
                                <td></td><td><input type="submit" value="Pagar"></td>
                            </tr>
                        </table>
                   </form>
                    </div>
                            
        <script type="text/javascript">
          $(window).on('load', function(){
              var precioapagarfactura = "<%= precioapagarfactura%>";
              var precioapagarboleta = "<%= precioapagarboleta%>";
              $('#tipoventa').on("change", function()
              {
                 if($('#tipoventa').val() == "1")
                 {
                      $('#monto').html("$"+precioapagarboleta);
                 }else
                 {
                     $('#monto').html("$"+precioapagarfactura);
                 } 
              });
          });
      </script>
      
          <%}else
          {
              response.sendRedirect("carro.jsp");
          }

      %>
      
          
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
