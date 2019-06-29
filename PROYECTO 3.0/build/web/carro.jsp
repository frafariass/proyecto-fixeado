<%-- 
    Document   : carro
    Created on : 22-06-2019, 10:59:18
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carro de compras</title>
    </head>
    <body>
        
        <script type="text/javascript">
         function confirmacion()
            {
                if(confirm("¿Está seguro que desea quitar éste elemento?"))
                {
                    return true;
                }else
                {
                    return false;
                }
            }
            
            

     </script>
        
        <div class="container">
            <table id="tablaproductos" class="table">
                
                <%      int i = 0; 
                        int total = 0;
                        BD bd = new BD();
                        String q;
                        ResultSet res;
                        if(listaventas.size() !=0)
                        {%>
                            <thead>
                                <th><b>#</b></th><th><b>NOMBRE</b></th><th><b>PRECIO COMPRA</b></th><th><b>CANTIDAD</b></th><th><b>PRECIO TOTAL</b></th>
                            </thead>
                           <% for (Venta ven : listaventas) {
                                try
                                {  i++;
                                    int precioredondeado = (int) Math.round(ven.getPrecio_unitario_producto()*1.19);
                                    int aux = precioredondeado * ven.getCantidad();
                                    total = total + aux;
                                    q = "SELECT NOMBRE FROM PRODUCTO WHERE ID_PRODUCTO ='" + ven.getProducto_id_producto()+"'";
                                    res = bd.read(q);
                                    res.next();
                                    
                                    
                           %>
                                    <tr>
                                            <td><% out.println(i);%></td>
                                            <td><a href="http://localhost:11111/PROYECTO_3.0/EspecificacionProducto?dato=<%=ven.getProducto_id_producto()%>"><% out.println(res.getString("nombre"));%></a></td>
                                            <td>$<% out.println(precioredondeado);%></td>
                                            <td><% out.println(ven.getCantidad());%></td>
                                            <td>$<% out.println(aux);%></td>
                                            <form method="post" action="QuitarProdCarro" onsubmit="return confirmacion()"> 
                                                <td><input type="submit" value="Quitar del carro"><input name="idquitar" style="display: none" value="<%= ven.getProducto_id_producto()%>"></td>
                                            </form>
                                    </tr>
                               <%}catch(Exception e)
                                {
                                    
                                 }
                            }
                        %>
                            <tfoot>
                            <th></th><th><b></b></th><th><b></b></th><th><b>MONTO TOTAL CARRO:</b></th><th><b>$<%= total %></b></th>
                     
                        <%
                            if(usu == null)
                            {%>
                                
                            <th><a href="login.jsp">Ingresar para pasar por caja</a></th>
                            
                            <%}else
                            { if(usu.getRol_id_rol() == 1 || usu.getRol_id_rol() == 3)
                                {%>
                                  
                            <th><a href="venagregar.jsp">Vender a cliente</a></th>
                            <th><a href="caja.jsp">Pasar por caja</a></th>
                                <%}else
                                {%>
                                    
                                    <th><a href="caja.jsp">Pasar por caja</a></th>
                                <%}   
                            }
                            }else
                            {%>
                                <h3>No tienes productos en el carro, puedes empezar a comprar aquí: <a href="catalogo.jsp">Catálogo</a></h3>
                            <%}%>
                        
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
