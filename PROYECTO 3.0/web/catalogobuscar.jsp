<%-- 
    Document   : catalogobuscar
    Created on : 24-06-2019, 5:33:31
    Author     : lordp
--%>

<%@ include file="master.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Producto> listaproductosbuscar = (List<Producto>)request.getSession().getAttribute("barrabuscar1"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados búsqueda</title>
    </head>
    <div class="container">

    <div class="row">

       
        
      <div class="col-lg-3">
          
          <form id="buscarform" method="get" action="BuscarProducto" onsubmit="return validarbuscar()">
            <div style="padding-top: 25px;"><input placeholder="Buscar..." type="text" name="buscar" id="buscar"><button onclick="submitbuscar()" type="text" id="buscar">&#128269;</button></div>
        </form>
        <h1 class="my-4">Categorías</h1>
        <div class="list-group">
           <%
                BD bd = new BD();
                String q = "select * from familia";
                ResultSet res2 = bd.read(q);
                res2.next();
                do {%>
                        <form method='get' action='CatalogoFamilia'>
                        <button onclick="submitfamilia()" class='list-group-item' type='submit'><% out.println(res2.getString("NOMBRE_FAMILIA")); %></button>
                        <input type="hidden" style="display: none" name = 'dato' value = '<% out.println(res2.getString("id_familia")); %>'>
                        <input type="hidden" style="display: none" name = 'dato2' value = '<% out.println(res2.getString("NOMBRE_FAMILIA")); %>'>
                        </form>
                    <%} while (res2.next());
                
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
                    
                    String q3 = "SELECT * FROM ("
                    +" SELECT NOMBRE, PRECIO_COMPRA, PRODUCTO_ID_PRODUCTO, COUNT(PRODUCTO_ID_PRODUCTO) FROM VENTA VE "
                    + " JOIN PRODUCTO PRO " 
                    + " ON (PRO.ID_PRODUCTO = VE.PRODUCTO_ID_PRODUCTO) "
                    + " GROUP BY PRODUCTO_ID_PRODUCTO, NOMBRE,PRECIO_COMPRA "
                    + " ORDER BY COUNT(PRODUCTO_ID_PRODUCTO) DESC "
                    + " ) WHERE ROWNUM <= 3";
                    ResultSet res = bd.read(q3);
                    res.last();
                    int tam = res.getRow();
                    res.first();
                    for (int i = 0; i < tam; i++) {
                        
                        String q2 = "SELECT IMAGEN FROM PRODUCTO WHERE ID_PRODUCTO= '" + res.getString("PRODUCTO_ID_PRODUCTO")+"'";
                        ResultSet res3 = bd.read(q2);
                        res3.next();
                        Blob blob = res3.getBlob("imagen");
                 
                        InputStream inputStream = blob.getBinaryStream();
                        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead = -1;

                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);                  
                        }

                        byte[] imageBytes = outputStream.toByteArray();
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        
                            if(i == 0)
                            {%>
                            
                            <div class="carousel-item active">
                                <a href="http://localhost:11111/PROYECTO_3.0/EspecificacionProducto?dato=<%= res.getString("producto_id_producto") %>"><img class="d-block img-fluid" src="data:image/jpg;base64,<% out.println(base64Image); %>" alt="First slide"></a>
                              </div>
                                
                            <% res.next(); }else
                            {%>
                            
                            <div class="carousel-item">
                                <a href="http://localhost:11111/PROYECTO_3.0/EspecificacionProducto?dato=<%= res.getString("producto_id_producto") %>"><img class="d-block img-fluid" src="data:image/jpg;base64,<% out.println(base64Image); %>" alt="Second slide"></a>
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
            
            for (Producto pro : listaproductosbuscar) {%>
                    <div class='col-lg-4 col-md-6 mb-4'>
                        <div class='card h-100'>
                        <img class='card-img-top' src='data:image/jpg;base64, <%  out.println(pro.getBase64Image()); %>'/>
                        <div class='card-body'>
                        <form method='get' action='EspecificacionProducto'>
                        <h4 class='card-title'>
                        <input class='list-group-item' type='submit' value = '<% out.println(pro.getNombre()); %>'>
                        <input name='dato' type='hidden' style="display:none" value = '<% out.println(pro.getId_producto()); %>'>
                        </h4>
                        </form>
                        </form>
                            <h5> Valor: $<% out.println(pro.getPrecio_compra()); %></h5>
                        </div>
                        </div>
                        </div>
                <%}
            
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