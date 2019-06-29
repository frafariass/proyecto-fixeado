<%-- 
    Document   : catalogo
    Created on : 25-05-2019, 0:05:46
    Author     : lordp
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Catálogo Ferretería FERME</title>
    </head>
    
    <script type="text/javascript">
        
        function submitfamilia()
        {
            $('form#catalogofamilia').submit();
        }
        
        function submitbuscar()
        {
            $('form#buscarform').submit();
        }
        function validarbuscar()
        {
            var asd = document.getElementById("buscar").value;
            if(asd === "" || asd === null)
            {
                return false;
            }else
            {
                return true;
            }
        }
        
    </script>
  <!-- Page Content -->
  <div class="container" >

    <div class="row">
        
        
      <div class="col-lg-3">
          <form id="buscarform" method="get" action="BuscarProducto" onsubmit="return validarbuscar()">
            <div style="padding-top: 25px;"><input placeholder="Buscar..." type="text" name="buscar" id="buscar"><button onclick="submitbuscar()" type="text" id="buscar">&#128269;</button></div>
        </form>
        <h1 class="my-4">Categorías</h1>
        <div class="list-group">
            <%
                BD bd = new BD();
                String q4 = "select id_familia, nombre_familia from familia";
                ResultSet res5 = bd.read(q4);
                res5.next();
                do {%>
                        <form method='get' action='CatalogoFamilia' id="catalogofamilia">
                            <button onclick="submitfamilia()" class='list-group-item' type='submit'><% out.println(res5.getString("NOMBRE_FAMILIA")); %></button>
                        <input type="hidden" style="display: none" name = 'dato' value = '<% out.println(res5.getString("id_familia")); %>'>
                        <input type="hidden" style="display: none" name = 'dato2' value = '<% out.println(res5.getString("NOMBRE_FAMILIA")); %>'>
                        </form>
                    <%} while (res5.next());
                
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
              
              <%
                  
                    String q = "SELECT * FROM ("
                    +" SELECT NOMBRE, PRECIO_COMPRA, IMAGEN, PRODUCTO_ID_PRODUCTO, COUNT(PRODUCTO_ID_PRODUCTO) FROM VENTA VE "
                    + " JOIN PRODUCTO PRO " 
                    + " ON (PRO.ID_PRODUCTO = VE.PRODUCTO_ID_PRODUCTO) "
                    + " GROUP BY PRODUCTO_ID_PRODUCTO, NOMBRE,PRECIO_COMPRA, IMAGEN "
                    + " ORDER BY COUNT(PRODUCTO_ID_PRODUCTO) DESC "
                    + " ) WHERE ROWNUM <= 3";
                    ResultSet res = bd.read(q);
                    res.last();
                    int tam = res.getRow();
                    res.first();
                    for (int i = 0; i < tam; i++) {
                            if(i == 0)
                            {%>
                            
                            <div class="carousel-item active">
                                <a href="http://localhost:11111/PROYECTO_3.0/EspecificacionProducto?dato=<%= res.getString("producto_id_producto") %>">
                                    <img class="d-block img-fluid" src="<% out.println(res.getString("IMAGEN")); %>" alt="First slide" width="900" height="350"></a>
                              </div>
                                
                            <% res.next(); }else
                            {%>
                            
                            <div class="carousel-item">
                                <a href="http://localhost:11111/PROYECTO_3.0/EspecificacionProducto?dato=<%= res.getString("producto_id_producto") %>">
                                    <img class="d-block img-fluid" src="<% out.println(res.getString("IMAGEN")); %>" alt="Second slide" width="900" height="350"></a>
                            </div>

                            <%res.next(); }
                        }

              %>
              
              
              
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
            String n = "select * from familia";
            ResultSet res1 = bd.read(n);
            
            if(res1.next())
            {
                do {
                             %>
            
                        <div class='col-lg-4 col-md-6 mb-4'>
                            
                            <div class='card h-100'>
                                <img class='card-img-top' src='<% out.println(res1.getString("IMAGEN_FAMILIA")); %>' >
                                <div class='card-body'>
                                    <h4 class='card-title'>
                                        <form method='get' action='CatalogoFamilia'>
                                            <input class='list-group-item' type='submit' value = ' <% out.println(res1.getString("nombre_familia")); %>' >
                                            <input type="hidden" style="display: none" name = 'dato' value = '<% 
                                                out.println(res1.getString("id_familia")); %>' >
                                            <input type="hidden" style="display: none" name = 'dato2' value = '<% out.println(res1.getString("NOMBRE_FAMILIA")); %>'>
                                        </form>
                                    </h4>
                                </div>
                            </div>
                        </div>
                            
                            <% } while (res1.next());
            }else{
                out.println("<p>No hay familias ingresadas en la base de datos</p>");
            }
            
        %>    
            

         
         <!-- 
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">Item Three</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
        -->
          

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

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
