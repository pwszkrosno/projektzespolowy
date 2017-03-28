

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
        
        
        
<div class="b">
<h1>Dodaj serwis</h1>   
<div class="reg_back">
<pre>
<form action="dodaj_h_serwisu1.jsp" method="post">
<table>
<tr>
    <td>samochod</td>
<td><select name="id_samochodu">
            
        <%          
            if (grupa.equals("1")||grupa.equals("2")||grupa.equals("3")){    
        //samochod
         try{
        
           
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from samochody where serwis='0' and wypozyczony='0'");
         
         while(rs.next())
         {
             String id = rs.getString("id");
             String nr_rejestracyjny = rs.getString("nr_rejestracyjny");
             String marka = rs.getString("marka");
             String model = rs.getString("model");
             %>                   
<option value="<%=id%>"><%out.print(nr_rejestracyjny+"\t "+marka+" \t"+model);%></option>                  
            <%
         }
        }catch(Exception e){
            out.print("BŁĄD BAZY DANYCH");
        }

//serwis
%></select>
</td></tr>
<tr><td>serwis</td>
<td>
<select name="id_serwisu">
            <%
 try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rss = stmt.executeQuery("select * from serwisy ");
         
         while(rss.next())
         {
             String id = rss.getString("id_serwisu");
             String nazwa = rss.getString("nazwa");
             String marka = rss.getString("marka");
            
             %>     
<option value="<%=id%>"><%out.print(nazwa+" \t"+marka);%></option>                              
            <%
         }
        }catch(Exception e){
           out.print("BŁĄD BAZY DANYCH");
        }

        %>
</select></td></tr>          
<tr><td>poczatek</td><td><input name="data_poczatek"  placeholder="data_poczatek" type="date"></td></tr>
<tr><td>koniec</td><td><input name="data_koniec"  placeholder="data_koniec" type="date"></td></tr>
<tr><td>koszt</td><td><input name="koszt"  placeholder="koszt" type="text"></td></tr>      
<tr><td>opis</td><td><input name="opis_usterki"  placeholder="opis usterki" type="text"></td></tr>                   
<tr><td> <input value="Dodaj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr></table>
</form>
</pre>
</div>
</div>
         <% }%>
    </body>
   
</html>
