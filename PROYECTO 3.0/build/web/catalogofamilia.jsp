<%-- 
    Document   : catalogofamilia
    Created on : 25-05-2019, 1:09:08
    Author     : lordp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>


<%@ page import="Modelo.Usuario"%>
<% 
   Familia fa = (Familia)request.getSession().getAttribute("fa1"); 
   TipoProducto tipo = (TipoProducto)request.getSession().getAttribute("tipo1"); %>
   
   
<!DOCTYPE html>
<html>
    <head>
        <title>Catálogo Ferretería FERME</title>
    </head>

  <!-- Page Content -->
<script type="text/javascript">
        
        function submitfamilia()
        {
            $('form#catalogofamilia').submit();
        }
        
    </script>

    
    <!-- Page Features -->
<div class="container">

    <div class="row">

      <div class="col-lg-3">
        <h1 class="my-4">Categorías</h1>
        <div class="list-group">
           <%
                BD bd = new BD();
                String q = "select * from familia";
                ResultSet res = bd.read(q);
                res.next();
                do {%>
                        <form method='get' action='CatalogoFamilia'>
                        <button onclick="submitfamilia()" class='list-group-item' type='submit'><% out.println(res.getString("NOMBRE_FAMILIA")); %></button>
                        <input type="hidden" style="display: none" name = 'dato' value = '<% out.println(res.getString("id_familia")); %>'>
                        <input type="hidden" style="display: none" name = 'dato2' value = '<% out.println(res.getString("NOMBRE_FAMILIA")); %>'>
                        </form>
                    <%} while (res.next());
                
            %>
        </div>
      </div>
      <!-- /.col-lg-3 -->
     <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

            
        <%
            String n = "select * from tipo_producto where familia_id_familia = " + fa.getId_familia();
            ResultSet res1 = bd.read(n);
            
            if(res1.next())
            {
                do {
                        Blob blob = res1.getBlob("tipoprod_imagen");
                 
                        InputStream inputStream = blob.getBinaryStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead = -1;

                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);                  
                        }

                        byte[] imageBytes = outputStream.toByteArray();
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);


                        inputStream.close();
                        outputStream.close(); %>
                        
                        <div class='col-lg-4 col-md-6 mb-4'>
                        <div class='card h-100'>
                        <img class='card-img-top' src='data:image/jpg;base64, <% out.println(base64Image); %>'/>
                        <div class='card-body'>
                        <h4 class='card-title'>
                        <form method='post' action='CatalogoTipoProd'>
                        <input class='list-group-item' type='submit' value = ' <% out.println(res1.getString("nombre_tipoprod")); %>' >
                        <input type="hidden" style="display: none" name = 'dato' value = '<% 
                            out.println(res1.getString("id_tipoprod")); %>' >
                        </form>
                        </h4>
                        </div>
                        </div>
                        </div>
                        
                   <% } while (res1.next());
            }else{
                out.println("<p>No hay productos en esta categoria</p>");
            }
            
        %>    
        
       

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

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