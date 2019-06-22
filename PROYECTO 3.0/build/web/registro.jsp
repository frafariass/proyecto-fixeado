<%-- 
    Document   : registro
    Created on : 23-05-2019, 0:42:18
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<% 
    
   if(usu != null && usu.getRol_id_rol() != 1)
   {
       response.sendRedirect("index.jsp");
   }
   
   %>
<!DOCTYPE html>
<html>
    
    <script type="text/javascript">
        
        //validacion rut, que sea valido el que esta ingresando
        //es un modulo 11
        function validarrut()
        {
            var rut = document.getElementById("rut").value;
            if(rut.charAt(0) === "0")
            {
                rut = rut.substring(1,rut.length);
            }
            rut = rut.replace(".", "");
            rut = rut.trim();
            var rutsinguion = rut;
            rutsinguion = rutsinguion.replace("-", "");
            
            if(rutsinguion.length === 8 || rutsinguion.length === 9)
            {
                var indicefor = 0;
                if (rutsinguion.length === 8) {
                    indicefor = 1;
                }

                var total = 0;
                var i;
                    for (i = 7; i >= indicefor; i--) {
                        var valor = rut.charAt(i) - '0';
                        if (rutsinguion.length === 8) {
                            valor = (rut.charAt(i-1)) - '0';
                        }
                        switch(i){
                            case 0:
                                total += valor * 3;
                                break;
                            case 1: 
                                total += valor * 2;
                                break;
                            case 2: 
                                total += valor * 7;
                                break;
                            case 3: 
                                total += valor * 6;
                                break;
                            case 4: 
                                total += valor * 5;
                                break;
                            case 5: 
                                total += valor * 4;
                                break;
                            case 6: 
                                total += valor * 3;
                                break;
                            case 7: 
                                total += valor * 2;
                                break;
                            default:
                                break;
                        }
                    }

                var resto = total % 11;
                resto = 11 - resto;
                var digitocalculado = resto;
                if (resto === 10) {
                    digitocalculado = "k";
                }
                var digitorutingresado = rut.charAt(rut.length-1);
                if(digitorutingresado === "K")
                {
                    digitorutingresado = "k";
                }
                digitocalculado = digitocalculado.toString();

                if(digitocalculado !== digitorutingresado)
                {
                    document.getElementById("prut").innerHTML = "* El rut no es válido";
                    return false;
                }else
                {
                    document.getElementById("prut").innerHTML = "<font color='red'>* </font>";
                    return true;
                }
            }else
            {
                document.getElementById("prut").innerHTML = "* El rut no es válido";
                return false;
            }
        }
        //fin validacion rut
        
        //validacion de telefono
        function validartelefono()
        {

            var telefono = document.getElementById("telefono").value;
            if(telefono.length !== 9)
            {
                document.getElementById("ptelefono").innerHTML = "* El teléfono debe tener 9 números";
                return false;
            }else
            {
                document.getElementById("ptelefono").innerHTML = "";
                return true;
            }
        }
        //fin validacion telefono
        
        //validacion email
        function validaremail()
        {
            var email = document.getElementById("email").value;
            if(!email.includes("@"))
            {
                document.getElementById("pemail").innerHTML = "* El email no es válido";
                return false;
            }else
            {
                document.getElementById("pemail").innerHTML = "* ";
                return true;
            }
        }
        //fin validacion email
        
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
        
        //validacion apellido
        function validarapellido()
        {
            jQuery("#submiteditar").prop('disabled', true);
            var apellido = document.getElementById("apellido").value;
            if(apellido.length <= 1)
            {
                document.getElementById("papellido").innerHTML = "* El apellido no es válido";
                return false;
            }else
            {
                jQuery("#submiteditar").prop('disabled', false);
                document.getElementById("papellido").innerHTML = "* ";
                return true;
            }   
        }
        //fin validacion apellido
        
        //validacion apellido
        function validardireccion()
        {
            jQuery("#submiteditar").prop('disabled', true);
            var direccion = document.getElementById("direccion").value;
            if(direccion.length <= 1)
            {
                document.getElementById("pdireccion").innerHTML = "* La dirección no es válida";
                return false;
            }else
            {
                jQuery("#submiteditar").prop('disabled', false);
                document.getElementById("pdireccion").innerHTML = "* ";
                return true;
            }   
        }
        //fin validacion apellido

        //validacion de claves
        //cifrado clave, siempre hacer el cifrado ANTES de enviarlo al servidor
        //esto es para mas seguridad
        function validarclaves()
        {
            var clave = document.getElementById("clave").value;
            var conclave = document.getElementById("conclave").value;
            if(clave !== conclave)
            {
                document.getElementById("pconclave").innerHTML = "* Las contraseñas no coinciden";
                return false;
            }else
            {
                document.getElementById("pconclave").innerHTML = "* ";
                return true;
            }
        }        
        function cifrado() {
            jQuery("#submitn").prop('disabled', true);
            var estatus = true;
            if(validarclaves())
            {
                var clavecifrada = new PBKDF2(document.getElementById("clave").value, 1234, 1000, 32);
                var status_callback = function(percent_done) {
                    $("#clave").on("paste keyup", function() {
                        estatus = false;
                    });
                    $("#conclave").on("paste keyup", function() {
                        estatus = false;
                    });
                };
                var result_callback = function(key) {
                    if(estatus === false)
                    {
                        return false;
                    }
                    document.getElementById("nuevaclavesecreta").value = key;
                    jQuery("#submitn").prop('disabled', false);
                    return true;
                };
                clavecifrada.deriveKey(status_callback, result_callback);          
            }else
            {
                return false;
            }
        }
        //fin validacion y cifrado de claves
        
        
        //VALIDA QUE LOS CAMPOS NECESARIOS ESTEN LLENOS
        //SI NO ESTAN LLENOS, EL SUBMIT SE DESHABILITA
        $(window).on('load', function() {  
            var rolactual = -2;
            <%
                if(usu != null){%> rolactual = <%= usu.getRol_id_rol()%>
            <%}%>
            if(rolactual !== 1)
            {
                $('#tiporegistro').val('reguser')
                document.getElementById("trrubro").style.display = "none";
                document.getElementById("trrol").style.display = "none";
            }
            <%
                BD bd = new BD();
                String q = "select * from rol";
                ResultSet res = bd.read(q);
                res.next();
                String relleno = "";
                do {
                        relleno = relleno + "<option value='" + res.getString("id_rol") +"'>" + 
                                res.getString("nombre_rol") +"</option>";
                    } while (res.next());
                %>
                 document.getElementById("selectrol").innerHTML = "<%= relleno %>";
                <%                                            
                q = "select * from rubro";
                res = bd.read(q);
                res.next();
                String relleno2 = "";
                do {
                        relleno2 = relleno2 + "<option value='" + res.getString("id_rubro") +"'>" + 
                                res.getString("nombre_rubro") +"</option>";
                        } while (res.next());
            %>
            document.getElementById("selectrubro").innerHTML = "<%= relleno2 %>";
                    
            var auxrubro = "1";
            var auxrol = "4";
            $("#selectrubro").val(auxrubro);
            $("#selectrol").val(auxrol);
            
            
            $("#clave").on("paste keyup", function() {
                cifrado();
            });
            $("#conclave").on("paste keyup", function() {
                cifrado();
            });
            
            $("#apellido").on("paste keyup input", function() {
                validarapellido();
            });
            
            $("#direccion").on("paste keyup input", function() {
                validardireccion();
            });
            
            jQuery("#submitn").prop('disabled', true);

            var toValidate = jQuery('#rut, #clave, #conclave, #email, #nombre, #telefono, #apellido, #direccion'),
                valid = false;
            toValidate.keyup(function () {
                if (jQuery(this).val().length > 0) {
                    if(jQuery(this).attr('id') === 'telefono')
                    {
                        if(validartelefono())
                        {                                
                            valid = true;
                        }else
                        {
                            valid = false;
                        }
                    }
                    if(jQuery(this).attr('id') === 'rut')
                    {
                        if(validarrut())
                        {                                
                            valid = true;
                        }else
                        {
                            valid = false;
                        }
                    }
                    if(jQuery(this).attr('id') === 'email')
                    {
                        if(validaremail())
                        {                                
                            valid = true;
                        }else
                        {
                            valid = false;
                        }
                    }
                    if(jQuery(this).attr('id') === 'nombre')
                    {
                        if(validarnombre())
                        {                                
                            valid = true;
                        }else
                        {
                            valid = false;
                        }
                    }
                    if(jQuery(this).attr('id') === 'direccion')
                    {
                        if(validardireccion())
                        {                                
                            valid = true;
                        }else
                        {
                            valid = false;
                        }
                    }
                    if(jQuery(this).attr('id') === 'apellido')
                    {
                        if(validarapellido())
                        {                                
                            valid = true;
                        }else
                        {
                            valid = false;
                        }
                    }
                    jQuery(this).data('valid', true);
                } else {
                    jQuery(this).data('valid', false);
                }
                toValidate.each(function () {
                    if (jQuery(this).data('valid') === true && jQuery(this).attr('id') !== "telefono") {
                        valid = true; 
                    } else {
                        if(jQuery(this).attr('id') === "telefono" && jQuery(this).val().length === 9)
                        {
                            valid = true;
                        }else
                        {
                            valid = false;
                            return false;
                        }
                    }
                });
                
                if (valid === true) {
                    jQuery("#submitn").prop('disabled', false);
                } else {
                    jQuery("#submitn").prop('disabled', true);
                }
            });
        });
        
    
        //esto valida por una ultima vez todos los campos, si algo esta mal
        //deshabilita el submit y avisa que cosa esta mal
        function validar()
        {
            var valido = true;
            
            if(!validarapellido())
            {
                valido = false;
            }
            
            if(!validardireccion())
            {
                valido = false;
            }
            
            if(!validarrut())
            {
                valido = false;
            }
            
            if(!validaremail())
            {
                valido = false;
            }
            
            if(!validarnombre())
            {
                valido = false;
            }
            
            if(!validartelefono())
            {
                valido = false;
            }
            
            if(!validarclaves())
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
    
    
  <!-- Page Content -->
  <div class="container">


    <!-- Page Features -->
    		<div id="status"></div>

    <div class="formularioregistro">

        <div id="registroDiv1">
            <h5>Registro</h5>
            <div id="registroDiv">
                <form method="post" action="Registro" onsubmit="return validar()">
                    <table class="table">
                        <tr>
                            <td>Rut:</td><td><input type="text" name="rut" id="rut" ><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Clave:</td><td><input type="password" id="clave" ><font color="red">* </font> <input type="hidden" style="display: none" id="nuevaclavesecreta" name="nuevaclavesecreta"></td>
                        </tr>

                        <tr>
                            <td>Confirmar Clave:</td><td><input type="password" id="conclave" ><label ><font color="red" id="pconclave" name="pconclave">* </font></label></td>
                        </tr>
                        
                        <tr>
                            <td>Email:</td><td><input type="text" name="email" id="email" ><label><font id="pemail" name="pemail" color="red">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Nombre:</td><td><input type="text" name="nombre" id="nombre" ><label ><font color="red" id="pnombre" name="pnombre">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Apellido:</td><td><input type="text" name="apellido" id="apellido"><label ><font id="papellido" name="papellido" color="red">*  </font></label></td>
                        </tr>
                        <tr>
                            <td>Direccion:</td><td><input type="text" name="direccion" id="direccion"><label ><font color="red" id="pdireccion" name="pdireccion">* </font> </label></td>
                        </tr>

                        <tr>
                            <td>Teléfono de contacto:</td><td><input type="number" name="telefono" id="telefono"><label ><font color="red" id="ptelefono" name="ptelefono">* </font></label></td>
                        </tr>
                        <tr id="trrubro">
                        <td>Rubro:</td><td><select id='selectrubro' name='selectrubro'></select></td>
                        </tr>
                        <tr id="trrol">
                        <td>Rol:</td><td><select id='selectrol' name='selectrol'></select></td>
                        </tr>
                        <tr>
                            <td><a href="javascript:window.history.back();">&laquo; Volver</a></td><td><input type="submit" value="Enviar" name="submitn" id="submitn"></td>
                        </tr>  
                    </table>
                    <input type='hidden' style='display: none' id='tiporegistro' name='tiporegistro' value='regadmin'>
                </form>
            </div> 
        </div> 
    </div>
  </div>
  
  <div id="generarcampoadmin"></div>
    <!-- /.row -->
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>
    </body>
</html>
