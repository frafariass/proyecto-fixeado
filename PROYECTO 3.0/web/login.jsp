<%-- 
    Document   : login
    Created on : 23-05-2019, 0:42:34
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<% 
   if(usu != null)
   {
       response.sendRedirect("index.jsp");
   }
   %>
<!DOCTYPE html>
<html>

    <script type="text/javascript">
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

                digitocalculado = digitocalculado.toString();

                if(digitocalculado !== digitorutingresado)
                {
                    document.getElementById("prut").innerHTML = "* El rut no es válido";
                    return false;
                }else
                {
                    jQuery("#submitlogin").prop('disabled', false);
                    document.getElementById("prut").innerHTML = "<font color='red'>* </font>";
                    return true;
                }
            }else
            {
                document.getElementById("prut").innerHTML = "* El rut no es válido";
                return false;
            }
        }
               
        function cifrado() {
            jQuery("#submitlogin").prop('disabled', true);
            var clave = $('#clave').val();
            var clavecifrada = new PBKDF2(clave, 1234, 1000, 32);
            var estatus = true;
            var status_callback = function(percent_done) {
                $("#clave").on("paste keyup", function() {
                    estatus = false;
                });
            };
            var result_callback = function(key) {
                if(estatus === false)
                {
                    return;
                }
                jQuery("#submitlogin").prop('disabled', false);
                document.getElementById("clavesecreta").value = key;};
            clavecifrada.deriveKey(status_callback, result_callback);            
        }
        
        $(window).on('load', function() {
            jQuery("#submitlogin").prop('disabled', true);
            
            $("#clave").on("paste keyup", function() {
                cifrado();
            });
            
            $("#rut").on("paste keyup", function() {
                validarrut();
            });

            var toValidate = jQuery('#rut, #clave'),
                valid = false;
            toValidate.keyup(function () {
                if (jQuery(this).val().length > 0) {
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
                    jQuery(this).data('valid', true);
                } else {
                    jQuery(this).data('valid', false);
                }
                toValidate.each(function () {
                        if (jQuery(this).data('valid') == true) {
                            valid = true; 
                        } 
                    });
                });
                
                if (valid === true) {
                    jQuery("#submitlogin").prop('disabled', false);
                } else {
                    jQuery("#submitlogin").prop('disabled', true);
                }
            });
        
        function validar()
        {
            var valido = true;
            if(validarrut()){
                if($("#clavesecreta").val() !== "")
                {
                    valido = true;
                }else
                {
                    valido = false;
                }
            }else
            {
                valido = false;
            }
            
            if(valido)
            {
                jQuery("#submitlogin").prop('disabled', false);
            }else
            {
                jQuery("#submitlogin").prop('disabled', true);
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
            <h5>Ingrese sus datos</h5>
            <form mode="post" action="Login" onsubmit="return validar()" id="formulariologin" name="formulariologin">
                <table class="table">
                    <tr>
                        <td>Rut:</td><td><input type="text" name="rut" id="rut" ><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                    </tr>

                    <tr>
                        <td>Clave:</td><td><input type="password" id="clave" ><font color="red" id='status'>* </font> <input type="hidden" style="display: none" id="clavesecreta" name="clavesecreta"></td>
                    </tr>
                    <tr>
                        <td><a href="registro.jsp">Registrarse</a>&nbsp;</td><td><input type="submit" value="Ingresar" id="submitlogin" name="submitlogin"></td>
                    </tr>
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
