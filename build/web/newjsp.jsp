<%-- 
    Document   : newjsp
    Created on : 28/05/2018, 12:59:43 AM
    Author     : aaron
--%>

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
                                    String driver="com.mysql.jdbc.Driver";
                                Class.forName(driver).newInstance();
                                Connection con=null;
                                Statement st=null;
                                ResultSet rs=null;
                                System.out.print("Conecto correctamente");
                                try{
                                    //String url="jdbc:mysql://10.100.58.147:3306/yps?user=root&password=DXLbln53711";
                                    String url="jdbc:mysql://node179928-ccyps2.jelastic.saveincloud.net:3306/yps?user=root&password=DXLbln53711";
                                    con=DriverManager.getConnection(url);
                                    st=con.createStatement();
                                    rs=st.executeQuery("select Color from color order by Color ASC");
                                    
                                    int i=1;
                                    int cal, id;
                                    String nom;
                                    while(rs.next()){
                                        
                                        nom=rs.getString(1);
                                        
                                        System.out.print("Entro a while");
                                        if(i==(i/2)*2){
                                %>
                                <p>insert into color (color) values("<%=nom%>");</p>
                                <% }else{
                                %>
         <p>insert into color (color) values("<%=nom%>");</p>
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
    </body>
</html>
