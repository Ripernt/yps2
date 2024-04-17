<!DOCTYPE html
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en" dir="ltr">
<link rel="stylesheet" href="CSS/bootstrap.css">
<link rel="stylesheet" href="csss/estilo.css">
<title>Pagina Principal</title>
</head>
<body>
<header id="header" class="fixed-top">
<nav id="nav">
  <ul>
    <li id="imagen"><img src="img/YPS.jpg"  class="rounded" width="61px" height="61px"></li>
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
  <body>
    <div class="container-fluid">
      <h3 align="center">Carrito</h3>
      <table class="table" id="arriba">
      <thead class="thead-dark">
        <tr>
          <th scope="col">Producto</th>
          <th scope="col">Color</th>
          <th scope="col">Precio</th>
          <th scope="col">Cantidad</th>
          <th scope="col"> Eliminar producto</th>
        </tr>
      </thead>
      <%
                                           String usuario = "";
          HttpSession sesionOk = request.getSession();
          
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
                                    rs=st.executeQuery("Select material.Material,color.Color,producto.Precio,compra.Cantidad from producto INNER JOIN compra ON compra.id_producto = producto.id_producto INNER JOIN material ON material.id_material=producto.id_material INNER JOIN color ON color.id_color=compra.id_color WHERE id_carrito=1; ");
                                    
                                    int i=1;
                                    int cal, id;
                                    String mat,col,pre;
                                    while(rs.next()){
                                        //id=rs.getInt(1);
                                        //nom=rs.getString(2);
                                        mat=rs.getString(1);
                                        col= rs.getString(2);
                                        pre = rs.getString(3);
                                        cal = rs.getInt(4);
                                        
                                        //ubic=rs.getString(3);
                                        //img=rs.getString(4);
                                        System.out.print("Entro a while");
                                        if(i==(i/2)*2){
                                        
                                    %>
    <tbody>
        <tr>
            <td><%=mat%></td>
            <td><%=col%></td>
            <td><%=pre%></td>
            <td><%=cal%></td>
            <td><button type="button" class="btn btn-outline-danger">Eliminar</button></td>
        </tr>
                                    <%
                                        }else{
                                        %>
                <tr>
          <td><%=mat%></td>
          <td><%=col%></td>
          <td><%=pre%></td>
          <td><%=cal%></td>
          <td><button type="button" class="btn btn-outline-danger">Eliminar</button></td>
        </tr>                                

      
      </tbody>
    </table>
  </div>
  <div class="container-fluid">
      <h2>Cantidad de productos: 10</h2>
      <h2>Total a pagar: $75</h2>
      <button type="button" class="btn btn-success btn-lg btn-block">Realizar Pedido</button>
  </div>
                                          <%
                                        i++;
                                        }
                                    }

                                    
                                    rs.close();
                                    st.close();
                                    con.close();
                                    }  catch(Exception e){
                                System.out.println(e.getMessage());
                                   }
      
      %>
  <footer id="footer">
            <div id="social" margin-rigth="0%">
        			<h3>Contacto:</h3><h5> yourpapershop@outlook.com</h5>
        			<div id="facebook"></div>
              <div id="twitter"><a href="https://twitter.com/YourPaperShopOF"  target="_blank"><img src="img/twitterlogo.png" height="50 px"></a></div>
              
        		</div>
          </footer>
  </body>
</html>
