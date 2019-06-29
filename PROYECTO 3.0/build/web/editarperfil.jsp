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
   
    BD bd = new BD();
    String q2;
    ResultSet res2;
    String q = "SELECT * FROM REGIONES";
    ResultSet res = bd.read(q);
    res.next();
    String rellenoregiones = "";
    int contadorregiones = 0;
    do {
            contadorregiones++;
            rellenoregiones = rellenoregiones + "<option value='" + res.getString("REGION_ID") + "'>" + res.getString("REGION_ORDINAL") + ": " + res.getString("REGION_NOMBRE") + "</option>";
        } while (res.next());
   %>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar perfil</title>
    </head>
    <script type="text/javascript">
        var auxregion;
        var auxprovincia;
        var auxcomuna;
        function rellenoregiones()
        {
            var relleno = "<%= rellenoregiones%>";
            document.getElementById("regiones").innerHTML = relleno;
            
            cargarCiudades();
        }
        
        function cargarComunas(id)
        {
            var idciudadseleccionada = id;
            var ultimaciudad = document.getElementById("lastciudades").value;
            
                document.getElementById("comuna"+idciudadseleccionada).style.display = "block";
                if(ultimaciudad !== "0")
                {
                    document.getElementById("comuna"+ultimaciudad).style.display = "none";
                }
                
                document.getElementById("lastciudades").value = idciudadseleccionada;

        }
        
        function cargarCiudades()
        {
            var idregionseleccionada = $('#regiones').val();
            var ultimaregion = document.getElementById("lastregiones").value;
            

                document.getElementById("ciudad"+idregionseleccionada).style.display = "block";
                if(ultimaregion !== "0")
                {
                    document.getElementById("ciudad"+ultimaregion).style.display = "none";
                }
                document.getElementById("lastregiones").value = idregionseleccionada;
                
                cargarComunas(document.getElementById("ciudad"+$('#regiones').val()).value);
                
            
        }
        
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
                if(usu != null && usubuscar != null){
                    q2 = "SELECT CO.COMUNA_ID, PRO.PROVINCIA_ID, RE.REGION_ID FROM COMUNAS CO"
                                + " JOIN PROVINCIAS PRO ON (CO.PROVINCIA_ID = PRO.PROVINCIA_ID) "
                                + " JOIN REGIONES RE ON (PRO.REGION_ID = RE.REGION_ID) " +
                                " WHERE CO.COMUNA_ID =" + usubuscar.getComuna_comuna_id();
                        res2 = bd.read(q2);
                        res2.next();
            %> usubuscar = true;
                    auxregion = "<%= res2.getString("region_id")%>"; 
                    auxprovincia = "<%= res2.getString("provincia_id")%>";
                    auxcomuna = "<%= res2.getString("COMUNA_ID")%>";
                        
            <%}else
            {
                if(usu != null)
                {
                    q2 = "SELECT CO.COMUNA_ID, PRO.PROVINCIA_ID, RE.REGION_ID FROM COMUNAS CO"
                                + " JOIN PROVINCIAS PRO ON (CO.PROVINCIA_ID = PRO.PROVINCIA_ID) "
                                + " JOIN REGIONES RE ON (PRO.REGION_ID = RE.REGION_ID) " +
                                " WHERE CO.COMUNA_ID =" + usu.getComuna_comuna_id();
                             res2 = bd.read(q2); 
                             res2.next(); %>
                             auxregion = "<%= res2.getString("region_id")%>";
                             auxprovincia = "<%= res2.getString("provincia_id")%>";
                             auxcomuna = "<%= res2.getString("COMUNA_ID")%>";
                <%}
                
            }%>
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
                    {
                        
                %>
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
                q2 = "select * from rol";
                res2 = bd.read(q2);
                res2.next();
                String relleno = "";
                do {
                        relleno = relleno + "<option value='" + res2.getString("id_rol") +"'>" + 
                                res2.getString("nombre_rol") +"</option>";
                    } while (res2.next());
                %>
                 document.getElementById("selectrol").innerHTML = "<%= relleno %>";
                <%                                            
                q2 = "select * from rubro";
                res2 = bd.read(q2);
                res2.next();
                String relleno2 = "";
                do {
                        relleno2 = relleno2 + "<option value='" + res2.getString("id_rubro") +"'>" + 
                                res2.getString("nombre_rubro") +"</option>";
                        } while (res2.next());
            %>
            document.getElementById("selectrubro").innerHTML = "<%= relleno2 %>";
            
            
            $("#selectrubro").val(auxrubro);
            $("#selectrol").val(auxrol);
            
            
            rellenoregiones();
            
            $("#regiones").on("change", function() {
                cargarCiudades();
            });
            
            
            for (var i = 0; i < <%= contadorregiones%>; i++) {
                $("#ciudad" + i).on("change", function(){
                    var val = document.getElementById("ciudad"+$('#regiones').val()).value;
                    cargarComunas(val);
                });
            }
            
            
            $('#regiones').val(auxregion);
            var comunafinal = "comuna" + auxprovincia;
            var ciudadfinal = "ciudad"+auxregion;
            
            var test = document.getElementById(ciudadfinal).value;
            document.getElementById(ciudadfinal).value = auxprovincia;
            document.getElementById(ciudadfinal).style.display = "block";
            document.getElementById("ciudad1").style.display = "none";
            document.getElementById("lastregiones").value = auxregion;
            document.getElementById(comunafinal).value = auxcomuna;
            document.getElementById(comunafinal).style.display = "block";
            document.getElementById("comuna1").style.display = "none";
            document.getElementById("lastciudades").value = auxprovincia;

            
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
                            $('#pclaveactual').html("* La clave actual es incorrecta");
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
            <h5>Ingrese datos, los campos con * son necesarios</h5>
            <form mode="post" action="EditarPerfil" onsubmit="return validar()">
                <table class="table">
                    <%
                        if(usubuscar == null)
                        {%>
                            <tr>
                                <td>Clave actual:</td><td><input type="password" id="clave" ><font color="red" id="pclaveactual">* </font><input type="hidden" style="display: none" id="clavesecreta" name="clavesecreta"></td>
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
                        <td>Nombre o razón social:</td><td><input type="text" name="nombre" id="nombre"><label ><font color="red" id="pnombre" name="pnombre">* </font> </label></td>
                    <tr>  
                    <tr>
                        <td>Apellido:</td><td><input type="text" name="apellido" id="apellido"></td>
                    </tr>
                    <tr>
                        <td>Direccion:</td><td><input type="text" name="direccion" id="direccion"><label ><font color="red" id="pdireccion" name="pdireccion">* </font> </label></td>
                    </tr>
                    
                    <tr>
                            <td>Región:</td>
                            <td><select id="regiones"></select></td>
                        </tr>
                        <input style="display: none" id="lastregiones" name="lastregiones" value="0">
                        <input style="display: none" id="lastciudades" name="lastciudades" value="0">
                        <tr>
                            <td>Ciudad:</td><td id="selectsciudades">
                                
                                <%
                                    int contadorciudades = 0;
                                    q = "SELECT * FROM PROVINCIAS";
                                    res = bd.read(q);
                                    res.last();
                                    contadorciudades = res.getRow();
                                    for (int i = 1; i < contadorregiones+1; i++) {
                                        res.first();
                                         %>
                                    <select id="ciudad<%= i%>" style="display: none">
                                        <%
                                            
                                            do {
                                                if(Integer.parseInt(res.getString("region_id")) == i){
                                                %>
                                                    <option value="<%= res.getString("provincia_id") %>"><% out.println(res.getString("provincia_nombre")); %></option>
                                                <%}
                                            } while (res.next());
                                        %>
                                        
                                    </select>
                                        <%}%>
                            </td>
                        </tr>
                        <tr>
                            <td>Comuna:</td>
                            <td id="selectscomunas">
                                
                                <%
                                    q = "SELECT * FROM COMUNAS";
                                    res = bd.read(q);
                                    for (int i = 1; i < contadorciudades+1; i++) {
                                           res.first();
                                         %>
                                    <select id="comuna<%= i%>" name="comuna<%= i%>" style="display: none">
                                        <%
                                            
                                            do {
                                                if(Integer.parseInt(res.getString("provincia_id")) == i){
                                                %>
                                                    <option value="<%= res.getString("comuna_id") %>"><% out.println(res.getString("comuna_nombre")); %></option>
                                                <%}
                                            } while (res.next());
                                        %>
                                        
                                    </select>
                                        <%}%>
                                
                            </td>
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
                        <td><a href="javascript:window.history.back();">&laquo; Volver</a></td><td><input type="submit" value="Editar perfil" name="submiteditar" id="submiteditar"></td>
                    </tr>
                    <input type="hidden" style="display: none" id="tipomod" name="tipomod" value="modadmin">
                </table>
            </form>
        </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
<% bd.cerrarConexion(); %>
  <!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
      <p class="m-0 text-center text-white">Contacto al: 2-123-1234, contacto@ferme.cl</p>
    </div>
    <!-- /.container -->
  </footer>

    </body>
</html>
