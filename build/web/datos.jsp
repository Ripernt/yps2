<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String usuario = "";
          HttpSession sesionOk = request.getSession();
          usuario = (String)sesionOk.getAttribute("usuario");
          System.out.println("Usuario es"+usuario);
        String color = request.getParameter("color");
        String id = request.getParameter("id");
        String cantidad= request.getParameter("cantidad");
        %>
        <p><%=color%></p>
        <p><%=id%></p>
        <p><%=cantidad%></p>
        <%
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
                                    rs=st.executeQuery("select id_color from color where color='"+color+"'");
                                    String idcol;
                                    while(rs.next()){
                                        idcol=rs.getString(1);
                                        System.out.println("id del color es"+idcol);
                                        response.sendRedirect("Anadir?color="+idcol+"&id="+id+"&cantidad="+cantidad+"&usuario="+usuario+"");
                                    }
                                    rs.close();
                                    st.close();
                                    con.close();
                                }catch(Exception e){
                                    System.out.println("Hay un error: "+e.getMessage());
                                    System.out.println(e.getStackTrace());
                                }
        
        %>
    </body>
</html>
