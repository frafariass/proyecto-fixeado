

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<html>
    <head>
        <title>Ferretería FERME</title>
    </head>
  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h1 class="display-3">Te damos la bienvenida</h1>
      <p class="lead">La mejor calidad del mercado encuentrala aquí.</p>
      <a href="catalogo.jsp" class="btn btn-primary btn-lg">Ir al catálogo de productos</a>
    </header>
<h4 style="text-align: center">Productos más vendidos</h4>
    <!-- Page Features -->
    <div class="row text-center">
        
        <%
        
            BD bd = new BD();
            String q = "SELECT * FROM ("
                    +" SELECT NOMBRE, IMAGEN, PRECIO_COMPRA, PRODUCTO_ID_PRODUCTO, COUNT(PRODUCTO_ID_PRODUCTO) FROM VENTA VE "
                    + " JOIN PRODUCTO PRO " 
                    + " ON (PRO.ID_PRODUCTO = VE.PRODUCTO_ID_PRODUCTO) "
                    + " GROUP BY PRODUCTO_ID_PRODUCTO, NOMBRE,PRECIO_COMPRA, IMAGEN "
                    + " ORDER BY COUNT(PRODUCTO_ID_PRODUCTO) DESC "
                    + " ) WHERE ROWNUM <= 4";
            ResultSet res = bd.read(q);
            
            for (int i = 0; i < 4; i++) {
                try
                {
                    if(res.next())
                    { %>
                    
                    <div class="col-lg-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <a href="http://localhost:11111/PROYECTO_3.0/EspecificacionProducto?dato= <%= res.getString("PRODUCTO_ID_PRODUCTO")%>">
                          <img class="card-img-top" 
                                
                               src="<%= res.getString("IMAGEN")%>" alt="" >
                          </a>
                          <div class="card-body">
                            <h4 class="card-title"><%= res.getString("nombre")%></h4>
                            <p class="card-text">Precio: $<%= Math.round(Integer.parseInt(res.getString("precio_compra"))*1.19)%></p>
                          </div>
                          <div class="card-footer">
                            <a href="http://localhost:11111/PROYECTO_3.0/EspecificacionProducto?dato= <%= res.getString("PRODUCTO_ID_PRODUCTO")%>" class="btn btn-primary">Compra aquí</a>
                          </div>
                        </div>
                      </div>
                  <%}else
                    {%>
                        
                     <div class="col-lg-3 col-md-6 mb-4">
                    <div class="card h-100">
                      <img class="card-img-top" src="images\tipo_producto\Guirnalda eléctrica bolas blanco y negro.jpg" width="500" height="325">
                      <div class="card-body">
                        <h4 class="card-title">Card title</h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
                      </div>
                      <div class="card-footer">
                        <a href="#" class="btn btn-primary">Find Out More!</a>
                      </div>
                    </div>
                  </div>
                    
                    <%}
                }catch(Exception e)
                {
                    out.println("EXCEPTION " +e.getMessage());
                }
            }
            %>
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
    