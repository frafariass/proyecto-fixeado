<%-- 
    Document   : prodbuscar
    Created on : 15-06-2019, 5:03:33
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
            if(idprod.length != 17)
            {
                document.getElementById("pidprod").innerHTML = "* El id debe ser de 17 carácteres";
                return false;
            }
            return true;
        }
        
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
            
            <%
                if(res.next())
                {%>
                  
                <table class="table table-bordered">
                <tr>
                    <td><b>ID PRODUCTO</b></td><td><b>NOMBRE PRODUCTO</b></td><td><b>PRECIO UNITARIO</b></td><td><b>PRECIO COMPRA</b></td><td><b>PRECIO COMPRA + IVA</b></td><td><b>STOCK</b></td>
                </tr>
                
                
                <%
                    do {%>
                    
                    <td><%out.println(res.getString("id_producto"));%></td><td><%out.println(res.getString("nombre"));%></td><td><% out.println(res.getString("precio_unitario"));%></td>
                    <td><%out.println(res.getString("precio_compra"));%></td><td><% out.println(Integer.parseInt(res.getString("precio_compra"))*1.19);%></td><td><% out.println(res.getString("stock"));%></td>
                    <td>
                    <form method="get" action="EspecificacionProducto">
                        <input type="submit" value="Ver detalle" id="submitproducto"><input name="dato" style="display: none" value="<%= res.getString("id_producto")%>">
                    </form>
                    </td>
                        <%} while (res.next());
                    }
            %>
            </table>
            
            
        </div>
    </div>
        <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
