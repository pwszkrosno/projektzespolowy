
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
            if (grupa.equals("2") || grupa.equals("3")){ %>
        <h1>Lista uzytkownikow:</h1>
        <a href="reg.jsp"> <button class="btn btn-primary">Dodaj uzytkownika</button></a>
         <table class="table table-striped table-bordered table-hover" id="mydata">
             <thead>
             <tr>
                 <td>id</td>
                 <td>login</td>
                 <td>hasło</td>
                 <td>pesel</td>
                 <td>imię</td>               
                 <td>nazwisko</td>
                 <td>adres</td>
                 <td>wypożycza</td>
                 <td>telefon</td>
                 <td>email</td>
               
               <td>grupa</td>
               
               <td>edytuj</td>
               <td>usuń</td>
              
             </tr></thead>
        
     <%
        
     try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
         
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("select * from uzytkownicy ");
         
         while(rs.next())
         {
             String id = rs.getString("id");
             String login = rs.getString("login");
             String haslo = rs.getString("haslo");
             String pesel = rs.getString("pesel");
             String imie = rs.getString("imie");
             String nazwisko = rs.getString("nazwisko");
             String adres = rs.getString("adres");
             String wypozycza = rs.getString("wypozycza");
             String telefon = rs.getString("telefon");
             String email = rs.getString("email");
             String grupaa = rs.getString("grupa");
             %>
             
                 <tr>
                     <td><%out.print(id);%></td>
                     <td><%out.print(login);%></td>
                     <td><%out.print(haslo);%></td>
                     <td><%out.print(pesel);%></td>
                     <td><%out.print(imie);%></td>              
                     <td><%out.print(nazwisko);%></td>
                     <td><%out.print(adres);%></td>
                     <td><% if (wypozycza.equals("0")) out.print("nie"); else out.print("tak");%></td>
                      <td><%out.print(telefon);%></td>
                       <td><%out.print(email);%></td>
                       
                       <td>
                           <% if(grupaa.equals("0"))
                           out.print("klient");
                           if(grupaa.equals("1"))
                           out.print("pracownik");
                           if(grupaa.equals("2"))
                           out.print("manager");
                           if(grupaa.equals("3"))
                           out.print("admin");
                       
                       
                       %></td>
                    
                       <% 
                         if ((grupa.equals("1") || grupa.equals("2")) && grupaa.equals("3")){%>
                         <td></td> <% }else if (grupa.equals("1") || grupa.equals("2")|| grupa.equals("3") ){  %>
                     <td>  <a href="edytuj_uzytkownika.jsp?id=<%out.print(id);%>"><img src="image/edit.png" /></a> </td>
                         <% } %>
                     
                     <% 
                         if ((grupa.equals("1") || grupa.equals("2")) && grupaa.equals("3")){%>
                         <td> </td> <% }else if (grupa.equals("1") || grupa.equals("2") || grupa.equals("3")){  %>
                     <td>  <a href="usun_uzytkownika.jsp?id=<%out.print(id);%>"><img src="image/delete.png" /></a> </td>
                         <% } %>
                    
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
