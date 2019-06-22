<%-- 
    Document   : prodagregar
    Created on : 15-06-2019, 5:03:42
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Agregar producto</title>
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
        String q = "SELECT * FROM USUARIO WHERE ROL_ID_ROL =" + 5;
        ResultSet res = bd.read(q);
        res.next();
        String relleno = "";
        do {
                relleno = relleno + "<option value='" + res.getString("id_user") + "'>" + res.getString("nombre_user") + "</option>";
            } while (res.next());
        
        q = "SELECT * FROM TIPO_PRODUCTO";
        res = bd.read(q);
        res.next();
        String relleno2 = "";
        do {
                relleno2 = relleno2 + "<option value='" + res.getString("id_tipoprod") + "'>" + res.getString("nombre_tipoprod") + "</option>";
            } while (res.next());
        
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
            var stockcri = document.getElementById("stockcri").value;
            if(stockcri.length < 1)
            {
                document.getElementById("pstockcri").innerHTML = "* El stock crítico no es válido";
                return false;
            }else
            {
                document.getElementById("pstock").innerHTML = "* ";
                return true;
            }   
        }
        
        function activarfecha()
        {
            if(document.getElementById("aplica").checked === true)
            {
                $("#fecha").prop('disabled', true);
            }else
            {
                $("#fecha").prop('disabled', false);
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
        
        $(window).on('load', function()
        {
            

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
            
            var relleno = "<%= relleno %>";
            var relleno2 = "<%= relleno2 %>";
            $('#selectproveedores').html(relleno);
            $('#selecttipo').html(relleno2);
            sortSelectOptions('#selectproveedores');
            sortSelectOptions('#selecttipo');
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
            <h5>Agregar producto</h5>
            <div id="registroDiv">
                <form method="post" action="AgregarProd" enctype = "multipart/form-data" onsubmit="return validar()">
                    <table class="table">
                        <tr>
                            <td>Nombre:</td><td><input type="text" name="nombre" id="nombre"><label ><font color="red" id="pnombre">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Descripción:</td><td><textarea type="textarea" name="descripcion" id="descripcion">Escriba o pegue aquí...</textarea><label ><font color="red" id="pdescripcion">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Precio unitario:</td><td><input type="number" name="preciou" id="preciou"><label ><font color="red" id="ppreciou">* </font> </label></td>
                        </tr>
                        
                        <tr>
                            <td>Stock:</td><td><input type="number" name="stock" id="stock"><label ><font color="red" id="pstock">* </font> </label></td>
                        </tr>
                        
                        <tr>
                            <td>Stock crítico:</td><td><input type="number" name="stockcri" id="stockcri"><label ><font color="red" id="pstockcri">* </font> </label></td>
                        </tr>
                        
                        <tr>
                            <td>Tipo de producto:</td><td><select id="selecttipo" name="selecttipo"></select><label ><font color="red" id="ptipo">* </font> </label></td>
                        </tr>
                        
                        <tr>
                            <td>Imagen:</td><td><input type="file" name="imagen" id="imagen" required><label ><font color="red" id="pimagen">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Fecha de vencimiento:</td><td><input type="date" name="fecha" id="fecha" required> <input type="checkbox" id="aplica" name="aplica" value="no" onclick="activarfecha()"> No aplica</td>
                        </tr>
                        
                        <tr>
                            <td>Proveedor:</td><td><select id="selectproveedores" name="selectproveedores"></select><label ><font color="red" id="pproveedor">* </font> </label></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:window.history.back();">&laquo; Volver</a></td><td><input type="submit" value="Enviar" name="submitn"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
      
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
