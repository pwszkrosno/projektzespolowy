
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
        <title>Dodaj samochod</title>
    </head>
    <body>
        <%
            
            if (grupa.equals("1")||grupa.equals("2")||grupa.equals("3")){

     try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
         String nrid=request.getParameter("id");
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("select * from samochody where id='" + nrid + "' ");
         
         while(rs.next())
         {
             String nr = rs.getString("nr_rejestracyjny");
             String marka = rs.getString("marka");
             String model = rs.getString("model");
             String ubezpieczenie = rs.getString("ubezpieczenie");
             String serwis = rs.getString("serwis");
             String przeglad = rs.getString("przeglad");
             int zarezerwowany = rs.getInt("zarezerwowany");
             int wypozyczony = rs.getInt("wypozyczony");
             %>
             
                  <div class="b">
            <h1>Edytuj samochód</h1>
           
            <div class="reg_back">
            <pre>
            <form action="edytuj_samochod1.jsp" method="post">
            <input name="id" value="<%out.print(nrid);%>" placeholder="id" type="text" readonly > 
            <input name="nr_rejestracyjny" value="<%out.print(nr);%>" placeholder="Nr rejestracyjny" type="text" > 
            <input name="marka"  value="<%out.print(marka);%>" placeholder="marka" type="text">                             
            <input name="model"  value="<%out.print(model);%>" placeholder="model" type="text">
            <input name="ubezpieczenie" value="<%out.print(ubezpieczenie);%>"  placeholder="ubezpieczenie" type="date"> 
            <input name="przeglad"  value="<%out.print(przeglad);%>" placeholder="przeglad" type="date">
          
           
            <input value="Edytuj"   type="submit" class="btn" style="padding-bottom: 30px;"> 
            </form>
            </pre>
            </div>
        </div>
        
             
            <%
         }
        }catch(Exception e){
            
        }
                  

            
        %>
      
         <% } %>
    </body>
   
</html>
