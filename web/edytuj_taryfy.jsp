
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link href="css/home1.css" rel="stylesheet" type="text/css">
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp" %>
        <title>Edytuj taryfy</title>
    </head>
    <body>
        <div class="b">
            <h1>Edytuj taryfy</h1>
           
            <div class="reg_back">
            <pre>

            <form action="edytuj_taryfy1.jsp" method="post">
                <table>
        <%
            
            if (grupa.equals("2")||grupa.equals("3")){

     try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
         
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("select * from taryfy");
         
         while(rs.next())
         {
             String id = rs.getString("id_taryfy");
             String stawka = rs.getString("stawka");
             
             %>
             
                  
             <tr><td><%out.print(id+".");%><input name="<%out.print("stawka"+id);%>" value="<%out.print(stawka);%>" placeholder="stawka" type="text" ></td></tr>
            <%}%>
           
                    <tr><td><input value="Edytuj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr>
            </form>
            </table>
            </pre>
            </div>
        </div>
        
             
            <%
         
        }catch(Exception e){
            
        }
                  

            
        %>
      
         <% } %>
    </body>
   
</html>
