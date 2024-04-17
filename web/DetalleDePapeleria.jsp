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
     <%
         String usuario = "";
          HttpSession sesionOk = request.getSession();
          usuario = (String)sesionOk.getAttribute("usuario");
          System.out.println(usuario);
           
     String img = request.getParameter("url");
     String nomb = request.getParameter("name");
     String cali = request.getParameter("cal");
     String ub = request.getParameter("ubi");
                                String driver="com.mysql.jdbc.Driver";
                                Class.forName(driver).newInstance();
                                Connection con=null;
                                Statement st=null;
                                ResultSet rs=null;
                                try{
                                    //String url="jdbc:mysql://10.100.58.147:3306/yps2?user=root&password=DXLbln53711";
                                    String url="jdbc:mysql://node179928-ccyps2.jelastic.saveincloud.net:3306/yps2?user=root&password=DXLbln53711";
                                    con=DriverManager.getConnection(url);
                                    st=con.createStatement();
                                    rs=st.executeQuery("select id_papeleria from papeleria where NomPap='"+nomb+"'");
                                String id;
                                while(rs.next()){
                                
                                    id=rs.getString(1);
                                    HttpSession sesion=request.getSession(true);
                                    HttpSession sesionPap = request.getSession();
                                    sesionPap.setAttribute("idpap",id);
                                }
                                    rs.close();
                                    st.close();
                                    con.close();
                                    }catch(Exception e){
                                    System.out.println("Hay un error: "+e.getMessage());
                                    System.out.println(e.getStackTrace());
                                }
     %>
      <div class="container-fluid">
          <h3>Papeleria <%=nomb%></h3>
        <div class="row">
          <div class="col-4">
              <img class="card-img-top" src="Imagenes/<%=img%>" alt="Papeleria">
          </div>
          <div class="col-8">
            <h5>Direccion: <%=ub%></h5>
            
            <h5>Horarios de atencion: 10 - 19</h5>
            <a href="AllProducs.jsp"><input class="btn btn-primary" type="button" value="Consultar productos" /></a>          
          </div>
        </div>
      </div>
    <footer id="footer">
        <div id="social" margin-rigth="0%">
          <h3>Contacto:</h3><h5> yourpapershop@outlook.com</h5>
          <div id="facebook"></div>
          <div id="twitter"><a href="https://twitter.com/YourPaperShopOF"  target="_blank"><img src="img/twitterlogo.png" height="50 px"></a></div>
          <div text-align="center" id="YPS">
          </div>
        </div>
      </footer>
    </body>
  </html>
