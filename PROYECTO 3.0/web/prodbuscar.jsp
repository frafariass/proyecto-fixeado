<%-- 
    Document   : prodbuscar
    Created on : 15-06-2019, 5:03:33
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Buscar producto</title>
    </head>
    <%
        if(usu == null)
        {
            response.sendRedirect("index.jsp");
        }else
        {
            if(usu.getRol_id_rol() != 1 && usu.getRol_id_rol() != 2 && usu.getRol_id_rol() != 3)
            {
                response.sendRedirect("index.jsp");
            }
        }
        
        BD bd = new BD();
        String q = "SELECT * FROM PRODUCTO";
        ResultSet res = bd.read(q);
        
    %>
    
    <script type="text/javascript">
        
        function validarprod()
        {
            var idprod = $('#dato').val();
            if(idprod.length != 24)
            {
                document.getElementById("pidprod").innerHTML = "* El id debe ser de 24 carácteres";
                return false;
            }
            return true;
        }
        
        $(window).on('load', function(){
            
            
        });
        
        $(document).ready(function() {
            $('#tablaproductos').DataTable({
                "language": {
                  "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                }
              });
            
        });
        
    </script>
    
    <body>
        <div class="container formularioregistro">
        <div id="ingresar">
            <h5>Ingrese la id del producto a buscar</h5>
            <form mode="get" action="EspecificacionProducto" onsubmit="return validarprod()" id="formulariobuscarprod" name="formulariobuscarprod">
                <table class="table">
                    <tr>
                        <td>Id producto:</td><td><input type="text" name="dato" id="dato" ><label ><font color="red" id="pidprod" name="pidprod">* </font> </label></td>
                    </tr>
                    <tr>
                        <td></td><td><input type="submit" value="Buscar producto" id="submitbuscarprod"></td>
                    </tr>
                </table>
            </form>
          </div>
    </div>  
            <%
                if(res.next())
                {%>
                <div style="overflow-x:auto;">  
                    <table id="tablaproductos" class="table" style="width:100%">
                        <thead>
                        <tr>
                            <th><b>ID PRODUCTO</b></th><th><b>NOMBRE PRODUCTO</b></th><th><b>PRECIO UNITARIO</b></th><th><b>PRECIO COMPRA</b></th><th><b>PRECIO COMPRA + IVA</b></th><th><b>STOCK</b></th><th><b>ACCIONES</b></th>
                        </tr>
                        </thead>
                         <tbody>
                        <%
                            do {%>
                            <tr>
                                <td><%out.println(res.getString("id_producto"));%></td><td><%out.println(res.getString("nombre"));%></td><td><% out.println(res.getString("precio_unitario"));%></td>
                                <td><%out.println(res.getString("precio_compra"));%></td><td><% out.println(Math.round(Integer.parseInt(res.getString("precio_compra"))*1.19));%></td><td><% out.println(res.getString("stock"));%></td>
                                <td>
                                <form method="get" action="EspecificacionProducto">
                                    <input type="submit" value="Ver detalle" id="submitproducto"><input name="dato" style="display: none" value="<%= res.getString("id_producto")%>">
                                </form>
                                </td>
                            </tr>
                                <%} while (res.next());
                            }
                    %>
                        
                        </tbody>
                        <tfoot>
                        <tr>
                            <th><b>ID PRODUCTO</b></th><th><b>NOMBRE PRODUCTO</b></th><th><b>PRECIO UNITARIO</b></th><th><b>PRECIO COMPRA</b></th><th><b>PRECIO COMPRA + IVA</b></th><th><b>STOCK</b></th><th><b>ACCIONES</b></th>
                        </tr>
                        </tfoot>
                        </table>
                    </div>
            
        
        <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
