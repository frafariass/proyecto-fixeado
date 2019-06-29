<%-- 
    Document   : error
    Created on : 23-05-2019, 2:06:57
    Author     : lordp
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<%Mensaje mensaje = (Mensaje)request.getSession().getAttribute("mensaje1"); %>
<!DOCTYPE html>
<html>
    <head>
        <title>Mensaje</title>
    </head>

  <!-- Page Content -->
  <div class="container" style="text-align: center">

      
      <h5><% out.println(mensaje.getMensaje()); %></h5>
      <a href="<%= mensaje.getHref()%>"><%= mensaje.getPagina()%></a>
    <!-- /.row -->

  </div>
  <!-- /.container -->

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
