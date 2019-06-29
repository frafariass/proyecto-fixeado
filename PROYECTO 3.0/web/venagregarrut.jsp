<%-- 
    Document   : venagregarrut
    Created on : 29-06-2019, 8:55:04
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verificar rut</title>
    </head>
    
    
    
    <body>
        
        
        
        <div class="container">
            
            
            <div class="formularioregistro">
                <form action="VerificarSiExisteRut" method="post" onsubmit="return validarrut()">
                    <table class="table">
                        <tr>
                            <td>Rut usuario:</td><td><input type="text" name="rut" id="rut"><label ><font color="red" id="prut" name="prut">* </font> </label></td>
                        </tr>
                        <tr>
                            <td></td><td><input type="submit" value="Verificar si existe en el sistema"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        
        
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
        </script>
        
        
        <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
      <p class="m-0 text-center text-white">Contacto al: 2-123-1234, contacto@ferme.cl</p>
    </div>
    <!-- /.container -->
  </footer>

    </body>
</html>
