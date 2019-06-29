<%-- 
    Document   : ocgenerar
    Created on : 15-06-2019, 5:04:25
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Generar orden de compra</title>
    </head>
    <%
        int contador_proveedores = 100;
        if(usu == null)
        {
            response.sendRedirect("index.jsp");
        }else
        {
            if(usu.getRol_id_rol() != 1 && usu.getRol_id_rol() != 2)
            {
                response.sendRedirect("index.jsp");
            }
        }
    %>

    
    
    
    <body>
        
        <div class="container generaroc">
            <h1>Generar Orden de Compra</h1>

            <form action="AgregarAOC" method="post" id="data" class="table" onsubmit="return confirmacion()">
                <table>
                    <tr>
                        <td>Seleccionar Proveedor</td>
                        <td>
                            <select class="custom-select" id="i_proveedores" name="i_proveedores" onchange="cargarProductos()">
                                <!--Query para rellenar select PROVEEDORES -->
                                <%
                                    BD bd = new BD();
                                    String q = "select * from usuario where rol_id_rol = 5";
                                    ResultSet res = bd.read(q);
                                    out.println("<option value='0'>Seleccione un proveedor</option>");
                                    if(!res.next()){
                                        out.println("<option value='0' selected>No hay proveedores</option>");
                                    }else{
                                        do{
                                            contador_proveedores++;
                                            out.println("<option value='"+res.getString("id_user") +"'>"+res.getString("nombre_user")+"</option>");
                                        }while(res.next());
                                    }
                                %>
                        </select>
                    </tr>
                    <input style="display: none" name="last" id="last" value="0">
                    <tr>
                        <td>Seleccionar Producto</td>
                        <td>
                            <select class="custom-select" id="0"><option>Elija un proveedor</option></select>
                            <%
                                for (int i = 101; i < contador_proveedores+1; i++) {
                                        q = "select id_producto, nombre, precio_unitario from producto where usuario_id_proveedor=" + i;
                                        res = bd.read(q);
                                        if(res.next())
                                        {%>
                                            <select class="custom-select" style="display: none" id="<%= i %>" name="<%= i %>">
                                           <% do {%>
                                              
                                            
                                                <option value="<%=res.getString("id_producto")%>,<%= res.getString("precio_unitario")%>"> <% out.println(res.getString("nombre"));%>, $<%= res.getString("precio_unitario")%> </option>
                                           
                                            
                                            <%} while (res.next());
                                           %> </select>
                                        <%}else
                                        {%>
                                            <select style="display: none" id="<%= i %>">
                                                <option>Éste proveedor no tiene productos asociados</option>
                                            </select>
                                        <%}
                                        
    
                                    }

                            %>
                        </td>
                    </tr>
                    <tr>
                        <td>Precio (CLP)</td>
                        <td>
                            <input class="form-control" style="display: block" id="precio" name="precio" value="0" readonly>
                        </td>
                    <tr>
                        <td>Cantidad</td>
                        <td>
                            <input class="form-control" type="number" id="cantid" name="cantid" value="1" min="1" onchange="actualizarTotal()">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Agregar a Orden de Compra">
                        </td>
                    </tr>
                </table>
            </form>
                        
                    <form style="display: none">
                        <table>
                            <tr>
                                <th>Nombre Producto</th>
                                <th>Cantidad</th>                                
                                <th>Total</th>
                            </tr>
                            <tr>
                                
                            </tr>
                        </table>
                            
                    </form>
        </div>
                        
                        <script type="text/javascript">
        
        
        
        function confirmacion()
            {
                if(confirm("¿Está seguro que desea agregar esta orden de compra?"))
                {
                    return true;
                }else
                {
                    return false;
                }
            }
        
        function cargarProductos()
        {
            var idprov = $('#i_proveedores').val();
            var ultimo = $('#last').val();
            
            if(idprov !== "0")
            {
                document.getElementById("0").style.display = "none";
                document.getElementById(ultimo.toString()).style.display = "none";
                document.getElementById(idprov).style.display = "block";
                var aux = $('#'+idprov).val();
                var precio = aux.split(",")[1];
                $('#precio').val(precio);
                $('#last').val(idprov);
            }else
            {
                document.getElementById(ultimo.toString()).style.display = "none";
                document.getElementById("0").style.display = "block";
                $('#precio').val(0);
            } 
        }
        
        function cargarProductoss()
        {
            //Llamar al id del producto y usarla para obtener el precio.
            var idpro = $("#h_idprod").val();
            document.getElementById("precio").value = document.getElementById(idpro).innerHTML.split(', $')[1];
        }
        
        function actualizarTotal()
        {
            var cantidad = $('#cantid').val();
            var selectactual = $('#last').val();
            var aux = $('#'+selectactual).val();
            var precio = aux.split(",")[1];
            precio = precio*cantidad;
            $('#precio').val(precio);
        }
        
        function cargarprecio(i) {
            //Se obtiene precio y se transforma a Int
            var aux = $('#'+i).val();
            var precio = aux.split(",")[1];
            var id = aux.split(",")[0];
            var cantidad = $('#cantid').val();
            precio = precio*cantidad;
            $('#precio').val(precio);
        }

        
        
    </script>
        
                        <script type="text/javascript">
                            $(window).on('load', function()
                            {
                               
                                
                                var contadorse = <%= contador_proveedores%>;
                                contadorse = parseInt(contadorse, 10);
                                $('#i_proveedores').on('change', function(){
                                    cargarProductos();
                                });
                                for (var i = 101; i < contadorse+1; i++) {
                                    var id = "#"+i;
                                    $(id).on('change', function(){
                                        cargarprecio($('#last').val());
                                    });
                                }
                            });
                        </script>
                        
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
