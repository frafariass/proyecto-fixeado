<%-- 
    Document   : prodmodificar
    Created on : 15-06-2019, 5:03:51
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<% Producto probuscar = (Producto)request.getSession().getAttribute("probuscar1");%> 
<!DOCTYPE html>
<html>
    <head>
        <title>Modificar producto</title>
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
        
        if(probuscar == null)
        {
            response.sendRedirect("prodbuscar.jsp");
        }
        
    %>
    
    <script type='text/javascript'>
        
        //validacion nombre
        function validarnombre()
        {
            var nombre = document.getElementById("nombre").value;
            if(nombre.length <= 1)
            {
                document.getElementById("pnombre").innerHTML = "* El nombre no es válido";
                return false;
            }else
            {
                document.getElementById("pnombre").innerHTML = "* ";
                return true;
            }   
        }
        //fin validacion nombre
        
        function validardescripcion()
        {
            var descripcion = document.getElementById("descripcion").value;
            if(descripcion.length < 10)
            {
                document.getElementById("pdescripcion").innerHTML = "* La descripcion no es válida";
                return false;
            }else
            {
                document.getElementById("pdescripcion").innerHTML = "* ";
                return true;
            }   
        }
        
        function validarpreciou()
        {
            var preciou = document.getElementById("preciou").value;
            if(preciou.length < 1)
            {
                document.getElementById("ppreciou").innerHTML = "* El precio unitario no es válido";
                return false;
            }else
            {
                document.getElementById("ppreciou").innerHTML = "* ";
                return true;
            }   
        }
        
        function validarpreciou()
        {
            var preciou = document.getElementById("precioc").value;
            if(preciou.length < 1)
            {
                document.getElementById("pprecioc").innerHTML = "* El precio compra no es válido";
                return false;
            }else
            {
                document.getElementById("pprecioc").innerHTML = "* ";
                return true;
            }   
        }
        
        function validarstock()
        {
            var stock = document.getElementById("stock").value;
            if(stock.length < 1)
            {
                document.getElementById("pstock").innerHTML = "* El stock no es válido";
                return false;
            }else
            {
                document.getElementById("pstock").innerHTML = "* ";
                return true;
            }   
        }
        function validarstockcri()
        {
            var stock = document.getElementById("stock").value;
            var stockcri = document.getElementById("stockcri").value;
            if(stockcri.length < 1 || stockcri >= stock)
            {
                document.getElementById("pstockcri").innerHTML = "* El stock crítico debe ser menor al stock";
                return false;
            }else
            {
                document.getElementById("pstockcri").innerHTML = "* ";
                return true;
            }   
        }
        function sortSelectOptions(selectElement) {
            var options = $(selectElement + " option");

            options.sort(function(a,b) {
                    if (a.text.toUpperCase() > b.text.toUpperCase()) return 1;
                    else if (a.text.toUpperCase() < b.text.toUpperCase()) return -1;
                    else return 0;
            });

            $(selectElement).empty().append( options );
        }
        
        function calcularpreciocompra()
        {
            var preciounitario = $('#preciou').val();
            var preciocompra = $('#precioc').val();
            if(document.getElementById("calculoauto").checked)
            {
                $('#precioc').val(preciounitario*1.30);
                document.getElementById("precioc").readOnly = true;
            }else
            {
                document.getElementById("precioc").readOnly = false;
            }
        }
        
        $(window).on('load', function()
        {
            
            var nombre = "<%= probuscar.getNombre()%>";
            var descripcion = "<%= probuscar.getDesc_producto()%>";
            var preciou = "<%= probuscar.getPrecio_unitario()%>";
            var stock = "<%= probuscar.getStock()%>";
            var stockcri = "<%= probuscar.getStock_critico()%>";
            
            
            $('#nombre').val(nombre);
            $('#descripcion').val(descripcion);
            $('#preciou').val(preciou);
            $('#stock').val(stock);
            $('#stockcri').val(stockcri);
            
            $("#calculoauto").on("paste keyup input", function() {
                calcularpreciocompra();
            });
            
            $("#nombre").on("paste keyup input", function() {
                validarnombre();
            });
            
            $("#descripcion").on("paste keyup input", function() {
                validardescripcion();
            });
            
            $("#stock").on("paste keyup input", function() {
                validarstock();
            });
            
            $("#stockcri").on("paste keyup input", function() {
                validarstockcri();
            });
            
            $("#preciou").on("paste keyup input", function() {
                validarpreciou();
            });
            
        });
        
        function validar()
        {
            var valido = true;
            if(!validarnombre())
            {
                valido = false;
            }
            
            if(!validardescripcion())
            {
                valido = false;
            }
            
            if(!validarstock())
            {
                valido = false;
            }
            
             if(!validarstockcri())
            {
                valido = false;
            }
            
            if(!validarpreciou())
            {
                valido = false;
            }
            if(valido)
            {
                jQuery("#submitn").prop('disabled', false);
            }else
            {
                jQuery("#submitn").prop('disabled', true);
            }
            return valido;
        }
    </script>
    
    <body>
        
         <div class="container">
    <!-- Page Features -->
    <div class="formularioregistro">

        <div id="registroDiv1">
            <h5>Modificar producto</h5>
            <div id="registroDiv">
                <form method="post" action="ModificarProducto" enctype = "multipart/form-data" onsubmit="return validar()">
                    <input type="hidden" style="display: none" id="idprod" name="idprod" value="<%= probuscar.getId_producto()%>">
                    <table class="table">
                        <tr>
                            <td>Nombre:</td><td><input type="text" name="nombre" id="nombre" value="<%= probuscar.getNombre()%>"><label ><font color="red" id="pnombre">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Descripción:</td><td><textarea type="textarea" name="descripcion" id="descripcion" value="<%= probuscar.getDesc_producto()%>"><%= probuscar.getDesc_producto()%></textarea><label ><font color="red" id="pdescripcion">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Precio unitario:</td><td><input type="number" name="preciou" id="preciou" value="<%= probuscar.getPrecio_unitario()%>"><label ><font color="red" id="ppreciou">* </font> </label></td>
                        </tr>
                        <tr>
                            <td>Precio compra:</td><td><input type="number" name="precioc" id="precioc" value="<%= probuscar.getPrecio_compra()%>"><label ><font color="red" id="pprecioc">* </font></label><br>
                                <input type="checkbox" id="calculoauto" name="calculoauto">Calcular automaticamente</td>
                        </tr>
                        
                        <tr>
                            <td>Stock:</td><td><input type="number" name="stock" id="stock" value="<%= probuscar.getStock()%>"><label ><font color="red" id="pstock">* </font> </label></td>
                        </tr>
                        
                        <tr>
                            <td>Stock crítico:</td><td><input type="number" name="stockcri" id="stockcri" value="<%= probuscar.getStock_critico()%>"><label ><font color="red" id="pstockcri">* </font> </label></td>
                        </tr>
                        <tr>
                            <td>Imagen:</td><td><input type="file" name="imagen" id="imagen"><label ><font color="red" id="pimagen"></font> </label></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:window.history.back();">&laquo; Volver</a></td><td><input type="submit" value="Modificar" name="submitn"></td>
                        </tr>
                    </table>
                        <input type="hidden" style="display: none" name="idprod" id="idprod" value="<%= probuscar.getId_producto()%>">
                </form>
            </div>
        </div>
      
    </div>


  </div>
        
        
<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
      <p class="m-0 text-center text-white">Contacto al: 2-123-1234, contacto@ferme.cl</p>
    </div>
    <!-- /.container -->
  </footer>

    </body>
</html>
