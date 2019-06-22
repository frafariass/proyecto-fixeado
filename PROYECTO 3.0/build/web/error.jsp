<%-- 
    Document   : error
    Created on : 23-05-2019, 2:06:57
    Author     : lordp
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<%Error error = (Error)request.getSession().getAttribute("error1"); %>
<!DOCTYPE html>
<html>
    

  <!-- Page Content -->
  <div class="container" style="text-align: center">

      
      <h5><% out.println(error.getMessage()); %></h5>
      <a href="javascript:window.history.back();">&laquo; Volver</a>
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
