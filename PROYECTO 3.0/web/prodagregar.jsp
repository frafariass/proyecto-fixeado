<%-- 
    Document   : prodagregar
    Created on : 15-06-2019, 5:03:42
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
            var relleno = "<%= relleno %>";
            var relleno2 = "<%= relleno2 %>";
            $('#selectproveedores').html(relleno);
            $('#selecttipo').html(relleno2);
            sortSelectOptions('#selectproveedores');
            sortSelectOptions('#selecttipo');
        });
    </script>
    
    <body>
    <div class="container">
    <!-- Page Features -->
    <div class="formularioregistro">

        <div id="registroDiv1">
            <h5>Agregar producto</h5>
            <div id="registroDiv">
                <form method="post" action="AgregarProd" enctype = "multipart/form-data">
                    <table class="table">
                        <tr>
                            <td>Nombre:</td><td><input type="text" name="nombre"><label ><font color="red" id="pnombre">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Descripción:</td><td><textarea type="textarea" name="descripcion" >Escriba o pegue aquí...</textarea><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Precio unitario:</td><td><input type="number" name="preciou" ><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                        </tr>
                        
                        <tr>
                            <td>Stock:</td><td><input type="number" name="stock" ><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                        </tr>
                        
                        <tr>
                            <td>Tipo de producto:</td><td><select id="selecttipo" name="selecttipo"></select><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                        </tr>
                        
                        <tr>
                            <td>Imagen:</td><td><input type="file" name="imagen" ><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Fecha de vencimiento:</td><td><input type="date" name="fecha"> <input type="checkbox" name="aplica" value="no"> No aplica</td>
                        </tr>
                        
                        <tr>
                            <td>Proveedor:</td><td><select id="selectproveedores" name="selectproveedores"></select><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:window.history.back();">&laquo; Volver</a></td><td><input type="submit" value="Enviar" name="submitn"><label ><font color="red" id="prut" name="prut">* </font> </label></td>
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
