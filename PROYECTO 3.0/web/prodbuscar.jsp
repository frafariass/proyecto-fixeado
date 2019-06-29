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
        <title>Buscar productos</title>
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
        String q = "SELECT ID_PRODUCTO, NOMBRE, PRECIO_UNITARIO, PRECIO_COMPRA, " +
                " STOCK, STOCK_CRITICO, USUARIO_ID_PROVEEDOR, " +
                " NOMBRE_TIPOPROD, NOMBRE_ESTADO, NOMBRE_FAMILIA "+
                " FROM PRODUCTO PRO "+
                " JOIN TIPO_PRODUCTO TIP " +
                " ON (PRO.TIPO_PRODUCTO_ID_TIPOPROD = TIP.ID_TIPOPROD) "+
                " JOIN ESTADO ES " + 
                " ON (PRO.ESTADO_ID_ESTADO = ES.ID_ESTADO) " +
                " JOIN USUARIO US " + 
                " ON (PRO.USUARIO_ID_PROVEEDOR = US.ID_USER) " +
                " JOIN FAMILIA FA " + 
                " ON (TIP.FAMILIA_ID_FAMILIA = FA.ID_FAMILIA)";
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
        
        $(document).ready(function() {
            $('#tablaproductos').DataTable({
                "language": {
                  "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                }
              });
            
        });
        
    </script>
    
    <body>
            <%
                if(res.next())
                {%>
                <div style="overflow-x:auto;">  
                    <table id="tablaproductos" class="table" style="width:100%">
                        <thead>
                        <tr>
                            <th><b>ID PRODUCTO</b></th><th><b>NOMBRE PRODUCTO</b></th><th><b>PRECIO PROVEEDOR</b></th><th><b>PRECIO COMPRA</b></th>
                            <th><b>PRECIO COMPRA + IVA</b></th><th><b>STOCK</b></th><th><b>STOCK CRÍTICO</b></th><th><b>ID PROVEEDOR</b></th>
                            <th><b>NOMBRE TIPO PRODUCTO</b></th><th><b>FAMILIA</b></th><th><b>ESTADO</b></th>
                            <th><b>VER DETALLE</b></th><th><b>MODIFICAR</b></th><th><b>ANULAR/ACTIVAR</b></th>
                        </tr>
                        </thead>
                         <tbody>
                        <%
                            do {%>
                            <tr>
                                <td><%out.println(res.getString("id_producto"));%></td><td><%out.println(res.getString("nombre"));%></td><td><% out.println(res.getString("precio_unitario"));%></td>
                                <td><%out.println(res.getString("precio_compra"));%></td><td><% out.println(Math.round(Integer.parseInt(res.getString("precio_compra"))*1.19));%></td><td><% out.println(res.getString("stock"));%></td>
                                <td><% out.println(res.getString("stock_critico"));%></td><td><% out.println(res.getString("usuario_id_proveedor"));%></td><td><% out.println(res.getString("nombre_tipoprod"));%></td><td><% out.println(res.getString("nombre_familia"));%></td>
                                <td><% out.println(res.getString("nombre_estado"));%></td>
                                <td>
                                <form method="get" action="EspecificacionProducto">
                                    <input type="submit" value="Ver detalle" id="submitproducto"><input name="dato" style="display: none" value="<%= res.getString("id_producto")%>">
                                </form>
                                </td>
                                <td>
                                <form method="post" action="ProdAModificar">
                                    <input type="submit" value="Modificar" id="submitproducto"><input name="dato" style="display: none" value="<%= res.getString("id_producto")%>">
                                </form>
                                </td>
                                <td>
                              <%
                                  if(res.getString("nombre_estado").equals("ACTIVO")){
                                  %>
                                  <form method="post" action="AnularProducto" onsubmit="return confirmacion()">
                                    <input type="submit" value="Anular" id="submitproducto"><input name="dato" style="display: none" value="<%= res.getString("id_producto")%>">
                                </form>
                                <%}else
                                {%>
                                <form method="post" action="ActivarProducto" onsubmit="return confirmacion()">
                                    <input type="submit" value="Activar" id="submitproducto"><input name="dato" style="display: none" value="<%= res.getString("id_producto")%>">
                                    </form>
                                <%}%>
                                </td>
                            </tr>
                                <%} while (res.next());
                            }
                    %>
                        
                        </tbody>
                        <tfoot>
                        <tr>
                            <th><b>ID PRODUCTO</b></th><th><b>NOMBRE PRODUCTO</b></th><th><b>PRECIO PROVEEDOR</b></th><th><b>PRECIO COMPRA</b></th>
                            <th><b>PRECIO COMPRA + IVA</b></th><th><b>STOCK</b></th><th><b>STOCK CRÍTICO</b></th><th><b>ID PROVEEDOR</b></th>
                            <th><b>NOMBRE TIPO PRODUCTO</b></th><th><b>FAMILIA</b></th><th><b>ESTADO</b></th>
                            <th><b>VER DETALLE</b></th><th><b>MODIFICAR</b></th><th><b>ANULAR/ACTIVAR</b></th>
                        </tr>
                        </tfoot>
                        </table>
                    </div>
            
        <% bd.cerrarConexion(); %>
        <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
