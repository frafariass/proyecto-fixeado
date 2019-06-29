<%-- 
    Document   : venagregar
    Created on : 24-06-2019, 2:36:51
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
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
    String existe = (String) request.getSession().getAttribute("existe1");
    String rut = (String) request.getSession().getAttribute("rut1");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar venta</title>
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
                        precioapagarfactura = precioapagarfactura + (int)((Math.round(ven.getPrecio_unitario_producto()*1.19))*ven.getCantidad());
                        precioapagarboleta =  precioapagarboleta + (int)((Math.round(ven.getPrecio_unitario_producto()*1.19))*ven.getCantidad());
                        cantidad = cantidad + ven.getCantidad();
                    }%>
                    <div class="formularioregistro">
                        <form action="AgregarVentaVendedor" method="post" onsubmit="return confirmacion()">
                            <input style="display: none" type="hidden" value="<%= rut%>" name="rut">
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
                                    </select></td>
                            </tr>
                            <tr>
                                <td>Cantidad: </td><td><% out.println(cantidad); %></td>
                            </tr>
                            <tr>
                                <td>Monto a pagar: </td><td id="monto" value="<% out.println(precioapagarboleta);%>">$<% out.println(precioapagarboleta);%></td>
                            </tr>
                            <tr>
                                <td><a style="display: none;" id="a" href="registro.jsp">Registrar empresa</a></td><td><input id="submitpagar" type="submit" value="Pagar"></td>
                            </tr>
                        </table>
                   </form>
                    </div>
                            
        <script type="text/javascript">
            
            
            
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
            
         
          $(window).on('load', function(){
              var precioapagarfactura = "<%= precioapagarfactura%>";
              var precioapagarboleta = "<%= precioapagarboleta%>";
              var estado = "<%= existe%>";
              
              
              $('#tipoventa').on("change", function()
              {
                 
                 if($('#tipoventa').val() == "1")
                 {
                     document.getElementById("a").style.display = "none";
                     $('#submitpagar').prop('disabled', false);
                     $('#monto').html("$"+precioapagarboleta);
                 }else
                 {
                     if(estado === "1")
                     {
                         document.getElementById("a").style.display = "block";
                         $('#submitpagar').prop('disabled', true);
                     }
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
      <p class="m-0 text-center text-white">Contacto al: 2-123-1234, contacto@ferme.cl</p>
    </div>
    <!-- /.container -->
  </footer>

    </body>
</html>