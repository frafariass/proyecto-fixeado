<%-- 
    Document   : datostransferencia
    Created on : 29-06-2019, 10:34:18
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<%
    try
    {
        Mensaje mensaje = (Mensaje)request.getSession().getAttribute("mensaje1"); 
    }catch(Exception e)
    {
        response.sendRedirect("carro.jsp");
    }
    
%>

<%
        if(usu == null)
        {
            response.sendRedirect("carro.jsp");
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos transferencia</title>
    </head>
    <body>
        <div class="container">
        <table class="table">
            <tr>                
                <td>Nombre: </td><td>Ferretería FERME</td>
            </tr>
            <tr>
                <td>Rut: </td><td>71.231.231-1</td>
            </tr>
            <tr>
                <td>Banco: </td><td>Banco xxxxxxxx</td>
            </tr>
            <tr>
                <td>Tipo de Cuenta: </td><td>Corriente</td>
            </tr>
            <tr>
                <td>Nº de Cuenta: </td><td>7777-1233-1233-1233</td>
            </tr>
            <tr>
                <td>Email: </td><td>ventas@ferme.cl</td>
            </tr>
            <tr>
             <h5>Enviar el comprobante de transferencia con el número de boleta al email indicado, un vendedor le responderá a la brevedad</h5>
            </tr>
            <tr>
                <td><a href="miscompras.jsp">&laquo; Click aquí para ir a mis compras</a><td>
            </tr>
            
 
        </table>
        
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
