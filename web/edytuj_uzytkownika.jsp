
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
        <title>Edycja uzytkownika</title>
    </head>
    <body>
        <%
            
            if (grupa.equals("1")||grupa.equals("2")||grupa.equals("3")){

     try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
         String nrid=request.getParameter("id");
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("select * from uzytkownicy where id='" + nrid + "' ");
         
         while(rs.next())
         {
             String id = rs.getString("id");
             String login = rs.getString("login");
             String haslo = rs.getString("haslo");
             String pesel = rs.getString("pesel");
             String imie = rs.getString("imie");
             String nazwisko = rs.getString("nazwisko");
             String adres = rs.getString("adres");          
             String telefon = rs.getString("telefon");
             String email = rs.getString("email");
             String grupaa = rs.getString("grupa");
             
             %>
             
                  <div class="b">
            <h1>Edytuj użytkownika</h1>
           
            <div class="reg_back">
            <pre>
<table>
            <form action="edytuj_uzytkownika1.jsp" method="post">
            <tr><td>id</td><td><input name="id" value="<%out.print(id);%>" placeholder="id" type="text" readonly ></td></tr> 
            <tr><td>login</td><td><input name="login" value="<%out.print(login);%>" placeholder="login" type="text" ></td></tr> 
            <tr><td>hasło</td><td><input name="haslo"  value="<%out.print(haslo);%>" placeholder="haslo" type="text"></td></tr>                             
            <tr><td>pesel</td><td><input name="pesel"  value="<%out.print(pesel);%>" placeholder="pesel" type="text"></td></tr>
            <tr><td>imię</td><td><input name="imie" value="<%out.print(imie);%>"  placeholder="imie" type="text"></td></tr> 
            <tr><td>nazwiko</td><td><input name="nazwisko"  value="<%out.print(nazwisko);%>" placeholder="nazwisko" type="text"></td></tr>
            <tr><td>adres</td><td><input name="adres"  value="<%out.print(adres);%>" placeholder="adres" type="text"></td></tr>
            <tr><td>telefon</td><td><input name="telefon"  value="<%out.print(telefon);%>" placeholder="telefon" type="text"></td></tr>
            <tr><td>e-mail</td><td><input name="email"  value="<%out.print(email);%>" placeholder="email" type="text"></td></tr>
            
             <%if (grupa.equals("2") || grupa.equals("3")){%>
             <tr><td>grupa</td><td><select name="grupa">
                 <option value="<%out.print(grupaa);%>"><%
                     if(grupaa.equals("0")){out.print("klient");}else if (grupaa.equals("1")){out.print("pracownik");}else if (grupaa.equals("2")){out.print("manager");}else if (grupaa.equals("3")){out.print("admin");}
                     %></option>
                <option value="0">klient</option>
                <option value="1">pracownik</option>
                <option value="2">manager</option>
                <option value="3">administrator</option>
                     </select></td></tr>
            
            <%}else{%>
            <tr><td>grupa</td><td><input name="grupa"  value="<%out.print(grupaa);%>" placeholder="grupa" type="text" readonly></td></tr>
          
           <%}%>
           <tr><td><input value="Edytuj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr> 
            </form>
            </table>
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
