
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
        <%@ include file="header.jsp"%>
    </head>
    
   
    <body>
       
         <% 
try{ 
            if (grupa.equals("1") || grupa.equals("2") || grupa.equals("3")){ %>
        <h1>Lista samochodów:</h1>
         <a href="dodaj_samochod.jsp"> <button class="btn btn-primary">Dodaj samochod</button></a>
         <table  class="table table-striped table-bordered table-hover" id="mydata">
             <thead> <tr>
                 <td>id</td>
                 <td>nr_rejestracyjny</td>
                 <td>marka</td>
                 <td>model</td>
                 <td>ubezpieczenie</td>               
                 <td>przeglad</td>
                 <td>serwis</td>
                 <td>zarezerwowany</td>
                 <td>wypozyczony</td>
                 <td>edytuj</td>
                 <td>usuń</td>
                 </tr></thead>
        
     <%
        
     try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
         
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("select * from samochody ");
         
         while(rs.next())
         {
             String id = rs.getString("id");
             String nr = rs.getString("nr_rejestracyjny");
             String marka = rs.getString("marka");
             String model = rs.getString("model");
             String ubezpieczenie = rs.getString("ubezpieczenie");
             String serwis = rs.getString("serwis");
             String przeglad = rs.getString("przeglad");
             int zarezerwowany = rs.getInt("zarezerwowany");
             int wypozyczony = rs.getInt("wypozyczony");
             %>
             
                 <tr>
                     <td><%out.print(id);%></td>
                     <td><%out.print(nr);%></td>
                     <td><%out.print(marka);%></td>
                     <td><%out.print(model);%></td>
                     <td><%out.print(ubezpieczenie);%></td>              
                     <td><%out.print(przeglad);%></td>
                     <td><%out.print(serwis);%></td>
                     <td><% if (zarezerwowany==0) out.print("nie"); else out.print("tak");%></td>
                     <td><% if (wypozyczony==0) out.print("nie"); else out.print("tak");%></td>
                     <td><a href="edytuj_samochod.jsp?id=<%out.print(id);%>"><img src="image/edit.png" /></a></td>
                     <td><a href="usun_samochod.jsp?id=<%out.print(id);%>"><img src="image/delete.png" /></a></td>
                 </tr>
        
             
            <%
         }
        }catch(Exception e){
            
        }

         }
}catch (Exception e){
response.sendRedirect("index.jsp");
}

     %>
      </table><script src="js/jquery.js"></script>
   
    <script src="js/bootstrap.min.js"></script>   
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
          <script src="js/mydata.js"></script>
      
      
     <%@ include file="footer.jsp"%>
    
    </body>
</html>
