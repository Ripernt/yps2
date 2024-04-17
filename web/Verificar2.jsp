<%-- 
    Document   : Verificar
    Created on : 24/05/2018, 04:40:38 PM
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
        String mail=request.getParameter("mail");
        String pass=request.getParameter("pass");
        System.out.println(mail);
        System.out.println(pass);
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
                                    rs=st.executeQuery("Select * from papeleria where CorrPap='"+mail+"'");
                                    String corr, cont, ses, Ident,id;
                                    int se;
                                    
                                    
                                    while(rs.next()){
                                        
                                        corr=rs.getString("CorrPap");
                                        cont=rs.getString("Contrasenia");
                                    
                                    if(cont.equals(pass)){
                                        id=rs.getString("id_papeleria");
                                        HttpSession sesion=request.getSession(true);
                                        HttpSession sesionOk = request.getSession();
                                        sesionOk.setAttribute("usuario",id);
                                            response.sendRedirect("InicioPapelerias.jsp");
                                     
                                        
                                        
                                    }else{
                                        
                                        response.sendRedirect("index.html");
                                    }
                                    }
                                }catch(Exception e){
                                    System.out.println("Hay un error: "+e.getMessage());
                                    System.out.println(e.getStackTrace());
                                    response.sendRedirect("index.html");
                                    
                                }
        
        
                               
        %>
    </body>
</html>

