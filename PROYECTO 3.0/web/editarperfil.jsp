<%-- 
    Document   : editarperfil
    Created on : 23-05-2019, 23:52:21
    Author     : lordp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<% Usuario usubuscar = (Usuario)request.getSession().getAttribute("usubuscar1");%> 


<% 
   if(usu == null && usu.getRol_id_rol() != 1)
   {
       response.sendRedirect("login.jsp");
   }
   %>
<!DOCTYPE html>
<html>
    <script type="text/javascript">
        
          //validacion email
        function validaremail()
        {
            var email = document.getElementById("email").value;
            if(!email.includes("@"))
            {
                document.getElementById("pemail").innerHTML = "El email no es válido";
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
            if(nombre.length === 1)
            {
                document.getElementById("pnombre").innerHTML = "El nombre no es válido";
                return false;
            }else
            {
                document.getElementById("pnombre").innerHTML = "* ";
                return true;
            }   
        }
        //fin validacion nombre
        
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
                document.getElementById("ptelefono").innerHTML = "* ";
                return true;
            }
        }
        //fin validacion telefono
        
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
            var clave = document.getElementById("nuevaclave").value;
            var conclave = document.getElementById("connuevaclave").value;
            if(clave !== conclave)
            {
                document.getElementById("pconclave").innerHTML = "Las contraseñas no coinciden";
                return false;
            }else
            {
                document.getElementById("pconclave").innerHTML = "";
                return true;
            }
        }
        
        function cifrado() {
            
            jQuery("#submiteditar").prop('disabled', true);
            var estatus = true;
            if(validarclaves())
            {
                var clavecifrada = new PBKDF2(document.getElementById("nuevaclave").value, 1234, 1000, 32);
                var status_callback = function(percent_done) {
                    $("#nuevaclave").on("paste keyup", function() {
                        estatus = false;
                    });
                    $("#nuevaconclave").on("paste keyup", function() {
                        estatus = false;
                    });
                };
                var result_callback = function(key) {
                    if(estatus === false)
                    {
                        return false;
                    }
                    document.getElementById("nuevaclavesecreta").value = key;
                    jQuery("#submiteditar").prop('disabled', false);
                    return true;               
                };
                clavecifrada.deriveKey(status_callback, result_callback);          
            }else
            {
                return false;
            }
        }
        
        function cifradoclaveactual() {
            
            jQuery("#submiteditar").prop('disabled', true);
            var estatus = true;
            if(validarclaves())
            {
                var clavecifrada = new PBKDF2(document.getElementById("clave").value, 1234, 1000, 32);
                var status_callback = function(percent_done) {
                    $("#aclave").on("paste keyup", function() {
                        estatus = false;
                    });
                    
                };
                var result_callback = function(key) {
                    if(estatus === false)
                    {
                        return estatus;
                    }
                    document.getElementById("clavesecreta").value = key;
                    jQuery("#submiteditar").prop('disabled', false);
                    return estatus;               
                };
                clavecifrada.deriveKey(status_callback, result_callback);          
            }else
            {
                return false;
            }
        }
        
        
        $(window).on('load', function()
        {
            var usubuscar = null;
            
            var email;
            var telefono;
            var direccion;
            var nombre;
            var apellido;
            var auxrubro;
            var auxrol;
            
            <%
                if(usu != null && usubuscar != null){%> usubuscar = true;
            <%}%>
            if(usubuscar === null)
            {
                email = "<%= usu.getEmail_user() %>";
                telefono = "<%= usu.getFono_user()%>";
                direccion = "<%= usu.getDireccion_user()%>";
                nombre = "<%= usu.getNombre_user()%>";
                apellido = "<%= usu.getApellido_user()%>";
                auxrubro = "<%= usu.getRubro_id_rubro() %>";
                auxrol = "<%= usu.getRol_id_rol()%>";
                $('#tipomod').val('moduser')
                document.getElementById("trrubro").style.display = "none";
                document.getElementById("trrol").style.display = "none";
            }else
            {
                <%
                    if(usubuscar != null)
                    {%>
                        email = "<%= usubuscar.getEmail_user() %>";
                        document.getElementById("nuevaclavesecreta").value = "<%= usubuscar.getContrasena()%>";
                        telefono = "<%= usubuscar.getFono_user()%>";
                        direccion = "<%= usubuscar.getDireccion_user()%>";
                        nombre = "<%= usubuscar.getNombre_user()%>";
                        apellido = "<%= usubuscar.getApellido_user()%>";
                        auxrubro = "<%= usubuscar.getRubro_id_rubro() %>";
                        auxrol = "<%= usubuscar.getRol_id_rol()%>";  
                    <%}
                %>
                
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
            
            $("#selectrubro").val(auxrubro);
            $("#selectrol").val(auxrol);
            
            
            
            
            
            
            $("#nuevaclave").on("paste keyup", function() {
                cifrado();
            });
            $("#connuevaclave").on("paste keyup", function() {
                cifrado();
            });
            $("#clave").on("paste keyup", function() {
                cifradoclaveactual();
            });
            $("#nombre").on("change paste keyup", function() {
                validarnombre();
            });
            $("#email").on("change paste keyup", function() {
                validaremail();
            });
            $("#telefono").on("change paste keyup", function() {
                validartelefono();
            });
            
            if(telefono === "0")
            {
                telefono = "";
            }
            if(apellido === "NO INGRESADO")
            {
                apellido = "";
            }
            if(direccion === "NO INGRESADO")
            {
                direccion = "";
            }
            $('#email').val(email);
            $('#telefono').val(telefono);
            $('#direccion').val(direccion);
            $('#nombre').val(nombre);
            $('#apellido').val(apellido);
            
            
            
            
        });
        
        function validar()
        {
            var valido = true;
            var claveusuariologeado = "";
            <%
                if(usubuscar == null)
                {%>
                    claveusuariologeado = "<%= usu.getContrasena()%>";
                    if(claveusuariologeado !== "")
                    {
                        var test = document.getElementById("clavesecreta").value;
                        if(claveusuariologeado !== test)   
                        {
                            valido = false;
                        }
                    }
                    
                <%}
                %>
                        
            if(!validarclaves())
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
            
            if(valido)
            {
                jQuery("#submiteditar").prop('disabled', false);
            }
            return valido;
        }

    </script>

  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
   

    <!-- Page Features -->
    <div class="formularioregistro">

      <div id="ingresar">
            <h5>Ingrese sus datos, los campos con * son necesarios</h5>
            <form mode="post" action="EditarPerfil" onsubmit="return validar()">
                <table class="table">
                    <%
                        if(usubuscar == null)
                        {%>
                            <tr>
                                <td>Clave actual:</td><td><input type="password" id="clave" ><font color="red">* </font><input type="hidden" style="display: none" id="clavesecreta" name="clavesecreta"></td>
                            </tr>
                        <%}
                    %>
                    <tr>
                        <td>Email:</td><td><input type="email" name="email" id="email"><label><font id="pemail" name="pemail" color="red">* </font> </label></td>
                    <tr>
                        <td>Nueva clave:</td><td><input type="password" id="nuevaclave" > <input type="hidden" style="display: none" id="nuevaclavesecreta" name="nuevaclavesecreta"></td>
                    </tr>
                    <tr>
                        <td>Confirmar clave:</td><td><input type="password" id="connuevaclave" ><label><font color="red" id="pconclave" name="pconclave"></font></label></td>
                    </tr>
                    <tr>
                        <td>Nombre:</td><td><input type="text" name="nombre" id="nombre"><label ><font color="red" id="pnombre" name="pnombre">* </font> </label></td>
                    <tr>  
                    <tr>
                        <td>Apellido:</td><td><input type="text" name="apellido" id="apellido"><label ><font id="papellido" name="papellido" color="red">*  </font></label></td>
                    </tr>
                    <tr>
                        <td>Direccion:</td><td><input type="text" name="direccion" id="direccion"><label ><font color="red" id="pdireccion" name="pdireccion">* </font> </label></td>
                    </tr>
                    <tr>
                        <td> Teléfono de contacto:</td><td><input type="number" name="telefono" id="telefono"><label ><font color="red" id="ptelefono" name="ptelefono">* </font></label></td>
                    </tr>
                    <tr id="trrubro">
                        <td>Rubro:</td><td><select id='selectrubro' name='selectrubro'></select></td>
                        </tr>
                        <tr id="trrol">
                        <td>Rol:</td><td><select id='selectrol' name='selectrol'></select></td>
                        </tr>
                    <tr>
                        <td></td><td><input type="submit" value="Editar perfil" name="submiteditar" id="submiteditar"></td>
                    </tr>
                    <input type="hidden" style="display: none" id="tipomod" name="tipomod" value="modadmin">
                </table>
            </form>
        </div>

    </div>
    <!-- /.row -->

  </div>
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
