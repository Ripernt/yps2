<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="CSS/bootstrap.css">
  <link rel="stylesheet" href="csss/estilo.css">
  <title>Pagina Principal</title>
</head>

  <body>
      <%
      String usuario = "";
          HttpSession sesionOk = request.getSession();
          usuario = (String)sesionOk.getAttribute("usuario");
          System.out.println(usuario);
      %>
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
      <%
     String img = request.getParameter("url");
     String nomb = request.getParameter("name");
     String precio = request.getParameter("preci");
     String id = request.getParameter("id");
     System.out.println(id);
     System.out.println(img);
     System.out.println(nomb);
     System.out.println(precio);
      %>
    <div class="container-fluid">
      <h3><%=nomb%></h3>
      <div class="row">
        <div class="col-4">
            <img class="card-img-top" src="Imagenes/<%=img%>" alt="Producto">
        </div>
        <div class="col-8">
            <form action="ACarr" method="GET">
                <input type="hidden" name="id" value="<%=id%>">
          <label for="exampleFormControlSelect1">Seleccione el Color</label>
          <select class="form-control" name="color" id="exampleFormControlSelect1">
            <%
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
                                    rs=st.executeQuery("select * from color order by color ASC ");
                                    String color;
                                    int idcol;
                                    int i=1;
                                    while(rs.next()){
                                        idcol=rs.getInt(1);
                                        color=rs.getString(2);
                                        
                                    if(i==(i/2)*2){
                                        
            %>
            <option><%=color%></option>
            <%
            }else{
            %>
            <option><%=color%></option>
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
          </select>
          <br>
          <label for="exampleFormControlSelect1">Precio:</label>
          <p class="form-control">$<%=precio%></p>
          <input type="hidden" name="precio" value="<%=precio%>">
          <br>
          <label for="exampleFormControlSelect1">Cantidad</label>
          <select class="form-control" name="cantidad" id="exampleFormControlSelect1">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
            <option>6</option>
            <option>7</option>
            <option>8</option>
          </select>
          <br>
          <button type="submit" class="btn btn-primary">Comprar</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  <footer id="footer">
      <div id="social" margin-rigth="0%">
        <h3>Contacto:</h3><h5> yourpapershop@outlook.com</h5>
        <div id="facebook"></div>
        <div id="twitter"><a href="https://twitter.com/YourPaperShopOF"  target="_blank"><img src="img/twitterlogo.png" height="50 px"></a></div>
        <div text-align="center" id="YPS">
        <h1>YPS <span class="badge badge-secondary">OPEN NOW</span></h1>
        </div>
      </div>
    </footer>
  </body>
</html>
