<%-- 
    Document   : ocgenerar
    Created on : 15-06-2019, 5:04:25
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<!DOCTYPE html>
<html>
    
    <%
        int contador_proveedores = 100;
        int contador_proveedores2 = 100;
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

    
    <script type="text/javascript">
        
        function cargarProductos()
        {
            var idprov = $('#i_proveedores').val();
            var ultimo = $('#last').val();
            var current = $('#current').val();
            
            if(idprov !== "0")
            {
                $('#last').val(idprov.toString()+"select");
                $('#current').val(idprov.toString()+"select");
                document.getElementById("0").style.display = "none";
                document.getElementById(ultimo.toString()).style.display = "none";
                document.getElementById(idprov+"select").style.display = "block";
            }else
            {
                document.getElementById(ultimo.toString()).style.display = "none";
                document.getElementById("0").style.display = "block";
            } 
        }
        
        function cargarProductoss()
        {
            //Llamar al id del producto y usarla para obtener el precio.
            var idpro = $("#h_idprod").val();
            document.getElementById("precio").value = document.getElementById(idpro).innerHTML.split(', $')[1];
        }
        
        function actualizarTotal () {
            //Se obtiene precio y se transforma a Int
            var p1 = $("#precio").val();
            var p2 = parseInt(p1);
            //Se obtiene cantidad
            var c = $("#cantid").val();
            //Se multiplican las variables
            var total = p2 * c;
            //Se asigna el total al input precio
            $("#precio").val(total);
        }
        
        
    </script>
    
    <body>
        <h1>Generar Orden de Compra</h1>
        <div class="container generaroc">
            <div class="input-group mb-3">
            <form action="AgregarAOC" method="post" id="data">
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
                                            contador_proveedores2++;
                                            out.println("<option value='"+res.getString("id_user") +"'>"+res.getString("nombre_user")+"</option>");
                                        }while(res.next());
                                    }
                                %>
                        </select>
                    </tr>
                    <input style="display: none" id="last" value="0">
                    <input style="display: none" id="current" name="current" value="0">
                    <tr>
                        <td>Seleccionar Producto</td>
                        <td id="selects">
                            <%
                                q = "select id_producto, nombre, usuario_id_proveedor, precio_unitario from producto";
                                res = bd.read(q);
                                out.println("<select class='custom-select' id='0'><option>Éste proveedor no tiene productos</option></select>");                                                          
                                String relleno = "";
                                String idprod = "";
                                if(res.next())
                                {
                                    
                                    
                                    int b;
                                    for (int i = 101; i < contador_proveedores+1; i++) {
                                        res.first();
                                        relleno = "";
                                        idprod = "";
                                        b = Integer.parseInt(res.getString("usuario_id_proveedor"));
                                        do
                                        {
                                            if(b == i)
                                            {
                                               relleno = relleno + "<option value='"+ res.getString("id_producto") +"' id='"+ res.getString("id_producto") +"'>" + res.getString("nombre")+", $"+ res.getString("precio_unitario") + "</option>"; 
                                               idprod = res.getString("id_producto");
                                            }
                                        }while (res.next());
                                        
                                        out.println("<select class='custom-select' style='display: none' id='" + i + "select' onmouseover='cargarProductoss()'></select>");
                                        String inputstring = i + "input";
                                        %>
                                        <input style="display: none" id="<%=inputstring%>" value="<%=relleno%>">
                                        <input type="hidden" id="auxuser" name="auxuser" value="">
                                        <%b = 0;
                                    } 
                                }                             
                            %>
                            <input type="hidden" id="h_idprod" name="h_idprod" value="<%=idprod%>">
                        </td>
                    </tr>
                    <tr>
                        <td>Precio (CLP)</td>
                        <td>
                            <input class="form-control" style="display: block" id="precio" value="0" readonly>
                        </td>
                    <br>
                        <td>Cantidad</td>
                        <td>
                            <input class="form-control" type="number" id="cantid" name="cantid" value="1" min="1" onchange="actualizarTotal()">
                        </td>
                    </tr>
                    <tr>
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
        </div>
        
                        <script type="text/javascript">
                            $(window).on('load', function()
                            {
                                var a = "<%= contador_proveedores2%>";
                                a = parseInt(a,10);
                                for (var i = 101; i < a+1; i++) {
                                    document.getElementById(i.toString() + "select").innerHTML = document.getElementById(i.toString() + "input").value;
                                }
                            });
                        </script>
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
