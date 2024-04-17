<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <link rel="stylesheet" href="CSS/bootstrap.css">
  <link rel="stylesheet" href="csss/estilo.css">
  <head>
    <title>Pagina Principal</title>
  </head>
  <body>
    <header id="header" class="fixed-top">
      <nav id="nav">
        <ul>
          <li id="imagen"><img src="img/YPS.jpg"  class="rounded" width="60px"></li>
          <li><a href="Princ.jsp"><span class="primero"><i class="icon icon-home3"></i></span>Inicio</a></li>
          <li><a href="Categorias.jsp"><span class="segundo"><i class="icon icon-books"></i></span>Categorias</a>
            <ul>
              <li><a href="PapelyCartulina.jsp">Papel y Cartulina</a></li>
              <li><a href="EscolaresyOficina.jsp">Escolares y de Oficina</a></li>
              <li><a href="ArteyManualidades.jsp">Arte y Manualidades</a></li>
              <li><a href="Regalos.jsp">Regalos</a></li>
            </ul>
          </li>
          <li><a href="Papelerias.jsp"><span class="tercero"><i class="icon icon-office"></i></span>Papelerias</a></li>
          <li><a href="Carrito.jsp"><span class="cuarto"><i class="icon icon-cart"></i></span>Carrito</a></li>
        </ul>
      </nav>
    </header>
    <div class="container-fluid">
      <div class="shadow-sm p-3 mb-5 bg-dark rounded" id="encabezado2"><h3>Todos los productos</h3></div>
      <div class="col-12">
            <%
                String idp = "";
          HttpSession sesionOk = request.getSession();
          HttpSession sesionPap = request.getSession();
          idp = (String)sesionPap.getAttribute("idpap");
          System.out.println("El id papeleria es "+idp);
                 String usuario = "";
          usuario = (String)sesionOk.getAttribute("usuario");
          System.out.println(usuario);
            String driver="com.mysql.jdbc.Driver";
                                Class.forName(driver).newInstance();
                                Connection con=null;
                                Statement st=null;
                                ResultSet rs=null;
                                System.out.print("Conecto correctamente");

                                try{
                                    //String url="jdbc:mysql://10.100.58.147:3306/yps2?user=root&password=DXLbln53711";
                                    String url="jdbc:mysql://node179928-ccyps2.jelastic.saveincloud.net:3306/yps2?user=root&password=DXLbln53711";
                                    con=DriverManager.getConnection(url);
                                    st=con.createStatement();
                                    rs=st.executeQuery("Select producto.id_producto, material.Material, producto.Ubimagen, producto.Precio from material INNER JOIN producto ON producto.id_material=material.id_material WHERE id_papeleria="+idp+""); //"
                                    
                                    String ubimg, nom;
                                    int id;
                                    float prec;

                                    int i=1;
                                    while(rs.next()){
                                        id=rs.getInt(1);
                                        nom=rs.getString(2);
                                        ubimg=rs.getString(3);
                                        prec=rs.getFloat(4);
                                        System.out.println("el id es: "+id);
                                        
                                        System.out.print("Entro a while");
                                        if(i==(i/2)*2){
                                            
                                %>
            <div class="card" style="width: 18rem;" id="horizontal">
                <img class="card-img-top" width="60px" src="img/<%=ubimg%>" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title"><%=nom%></h5>
                  <p class="card-text">$<%=prec%></p>
                  <form action="Datos">
                      <input type="hidden" name="nom" value="<%=nom%>">
                      <input type="hidden" name="prec" value="<%=prec%>">
                      <input type="hidden" name="img" value="<%=ubimg%>">
                      <input type="hidden" name="id" value="<%=id%>">
                      <input class="btn btn-primary" type="submit" value="Comprar" />
                  </form>
                </div>                   
            </div>
                                <% }else{
                                %>
            <div class="card" style="width: 18rem;" id="horizontal">
                <img class="card-img-top" width="60px" src="img/<%=ubimg%>" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title"><%=nom%></h5>
                  <p class="card-text">$<%=prec%></p>
                  <form action="Datos">
                      <input type="hidden" name="nom" value="<%=nom%>">
                      <input type="hidden" name="prec" value="<%=prec%>">
                      <input type="hidden" name="img" value="<%=ubimg%>">
                      <input type="hidden" name="id" value="<%=id%>">
                      <input class="btn btn-primary" type="submit" value="Comprar" />
                  </form>
                </div>                   
            </div>
                                <%
                                        }
                                        i++;
                                    }
                                    rs.close();
                                    st.close();
                                    con.close();
                                    }catch(Exception e){
                                    System.out.println("Hay un error: "+e.getMessage());
                                    System.out.println(e.getStackTrace());
                                    }
                                %> 
          </div>
    </div>
    <footer id="footer">
      <div id="social" margin-rigth="0%">
        <h3>Contacto:</h3><h5> yourpapershop@outlook.com</h5>
        <div id="facebook"></div>
        <div id="twitter"><a href="https://twitter.com/YourPaperShopOF"  target="_blank"><img src="img/twitterlogo.png" height="50 px"></a></div>
      </div>
    </footer>
  </body>
</html>
