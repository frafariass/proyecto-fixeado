<%-- 
    Document   : especificacionproducto
    Created on : 26-05-2019, 1:51:03
    Author     : lordp
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>

<% 
    
   Producto prod = (Producto)request.getSession().getAttribute("prod1"); %>
<!DOCTYPE html>
<html>
    

  <!-- Page Content -->


    
    <!-- Page Features -->
<div class="container">

    <script type="text/javascript">
        
        function submitfamilia()
        {
            $('form#catalogofamilia').submit();
        }
        
    </script>
    
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
                        <form method='post' action='CatalogoFamilia' id="catalogofamilia">
                            <button onclick="submitfamilia()" class='list-group-item' type='submit'><% out.println(res.getString("NOMBRE_FAMILIA")); %></button>
                        <input type="hidden" style="display: none" name = 'dato' value = '<% out.println(res.getString("id_familia")); %>'>
                        </form>
                    <%} while (res.next());
                
            %>
        </div>
        </div>
      <!-- /.col-lg-3 -->
     



        <div class='col-lg-9'>
            <div class='card mt-4'>
                <div class='card-body'>
        <%
            
            if(prod != null)
            {
                if(usu != null)
                {
                    if(usu.getRol_id_rol() == 1 || usu.getRol_id_rol() == 2 || usu.getRol_id_rol() == 3)
                    {
                        String fechavenc = "No aplica";
                        if(!prod.getFecha_venc().equals("00000000"))
                        {
                            fechavenc = "";
                            fechavenc = prod.getFecha_venc().substring(0,2);
                            fechavenc = fechavenc + "-" + prod.getFecha_venc().substring(2,4);
                            fechavenc = fechavenc + "-" + prod.getFecha_venc().substring(4,prod.getFecha_venc().length());
                        }
        %>
                         <h5>Datos empleado:</h5>
                         <h5 class='card-text' style='font-size: small'>Fecha de vencimiento: <% out.println(fechavenc); %></h5>
                         <h5 class='card-text' style='font-size: small'>Valor precio compra a proveedor: <% out.println(prod.getPrecio_unitario()); %></h5>
                         <h5 class='card-text' style='font-size: small'>Id proveedor asociado: <% out.println(prod.getUsuario_id_proveedor()); %></h5>
                         <h5 class='card-text' style='font-size: small'>Stock crítico: <% out.println(prod.getStock_critico()); %></h5>
                    
                    <%}
                }%>
                        
                                <img class='card-img-top img-fluid' src='data:image/jpg;base64,<% out.println(prod.getBase64Image()); %>' alt=''>
                                
                                    <h5 class='card-text' style='font-size: small'>Código de producto: <% out.println(prod.getId_producto()); %></h5>
                                    <h3 class='card-title'><% out.println(prod.getNombre()); %></h3>
                                    <h4>Stock: <% out.println(prod.getStock());%> unidades</h4>
                                    <h4>Valor: $<% out.println(Math.round(prod.getPrecio_compra()*1.19));%></h4>
                                    <p class='card-text'><% out.println(prod.getDesc_producto()); %></p>
                                    <aside>
                                    <form method='post' action='AgregarAlCarro'>
                                    <div class='quantity'>
                                        Cantidad <input type='number' name='cantidad' width='100px'>
                                    </div>
                                    </form>
                                    <a href='#' class='btn btn-success'>+</a> Agregar al Carro
                                
                            
                   <% 
            }else{
                Error error = new Error("Producto nulo");
                request.getSession().setAttribute("error1", error);
                response.sendRedirect("error.jsp");
            }
            
        %>
                </div>
            </div>
        </div> 
        

        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->




  <!-- Footer -->

 <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  
    </body>
</html>
