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
    <head>
        <title><% out.println(prod.getNombre());%></title>
    </head>

  <!-- Page Content -->


    
    <!-- Page Features -->
<div class="container">

    <script type="text/javascript">
        
        function validarcantidadystock()
        {
            var cantidad = $('#cantidad').val();
            var stock = parseInt($('#stock').val(), 10);
            if(stock >= 1 && cantidad >= 1 && cantidad <= stock)
            {
                return true;
            }else
            {
                if(cantidad == 0)
                {
                    $('#pcantidad').html('La cantidad debe ser mayor a 0');
                }else
                {
                    $('#pcantidad').html('No hay stock');
                }
                return false;
            }
        }
        
        function validarstock()
        {
            
            
        }
        
        function submitform()
        {
            $('form#formulariocarro').submit();
        }
        
        function submitfamilia()
        {
            $('form#catalogofamilia').submit();
        }
        
    </script>
    <div class="row">
        

      <div class="col-lg-3">
          <form id="buscarform" method="get" action="BuscarProducto" onsubmit="return validarbuscar()">
            <div style="padding-top: 25px;"><input placeholder="Buscar..." type="text" name="buscar" id="buscar"><button onclick="submitbuscar()" type="text" id="buscar">&#128269;</button></div>
        </form>
        <h1 class="my-4">Categorías</h1>
        <div class="list-group">
            <%
                BD bd = new BD();
                String q4 = "select nombre_familia, id_familia from familia";
                ResultSet res2 = bd.read(q4);
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
                         <h5 class='card-text' style='font-size: small'>Valor precio compra a proveedor: $<% out.println(prod.getPrecio_unitario()); %></h5>
                         <h5 class='card-text' style='font-size: small'>Id proveedor asociado: <% out.println(prod.getUsuario_id_proveedor()); %></h5>
                         <h5 class='card-text' style='font-size: small'>Stock crítico: <% out.println(prod.getStock_critico()); %></h5>
                    
                    <%}
                }%>
                <form method='post' action='AgregarAlCarro' id="formulariocarro" onsubmit="return validarcantidadystock()">
                                <img class='card-img-top img-fluid' src='<% out.println(prod.getImagen()); %>' alt=''>
                                
                                    <h5 class='card-text' style='font-size: small'>Código de producto: <% out.println(prod.getId_producto()); %></h5>
                                    <input type="hidden" style="display: none" name="codprod" id="codprod" value="<% out.println(prod.getId_producto()); %>" >
                                    <h3 class='card-title' ><% out.println(prod.getNombre()); %></h3>
                                    <input type="hidden" style="display: none" name="nombre" id="nombre" value="<% out.println(prod.getNombre()); %>">
                                    <h4>Stock: <% out.println(prod.getStock());%> unidades</h4>
                                    <input type="hidden" style="display: none" name="stock" id="stock" value="<% out.println(prod.getStock()); %>" >
                                    <h4 >Valor: $<% out.println(Math.round(prod.getPrecio_compra()*1.19));%></h4>
                                    <input type="hidden" style="display: none" name="preciocompra" id="preciocompra" value="<% out.println(prod.getPrecio_compra()); %>" >
                                    <p class='card-text'><% out.println(prod.getDesc_producto()); %></p>
                                    <div class='quantity'>
                                        <label>Cantidad: </label><input type='number' name='cantidad' id="cantidad" value="0" width='100px'>      <a onclick="submitform()" class='btn btn-success'>      +</a> Agregar al Carro
                                        <br>
                                        <font color="red" id="pcantidad"></font>
                                    </div>
                            </form>
                                    
                                
                            
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
<% bd.cerrarConexion(); %>
<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Ferretería Ferme 2019</p>
      <p class="m-0 text-center text-white">Contacto al: 2-123-1234, contacto@ferme.cl</p>
    </div>
    <!-- /.container -->
  </footer>

    </body>
</html>
