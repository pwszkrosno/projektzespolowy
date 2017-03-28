

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
        <title>Dodaj wypozyczenie</title>
    </head>
    <body>
        
       
        
        <div class="b">
            <h1>Dodaj wypożyczenie</h1>
         
            <div class="reg_back">
            <pre>
<table>
            <form action="dodaj_wypozyczenie1.jsp" method="post">
                <tr><td>sanochod</td><td><select name="id_samochodu">
            
        <%
            
            if (grupa.equals("1")||grupa.equals("2")||grupa.equals("3")){
              
            
        
        
        //samochod
         try{
        
           
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from samochody where serwis='0' and wypozyczony='0' and zarezerwowany='0' and ubezpieczenie>CURDATE() and przeglad>CURDATE() ");
         
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

//klient
%> 
                        </select></td></tr>
                <tr><td>klient</td><td><select name="id_klienta">
            <%
 try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rss = stmt.executeQuery("select * from uzytkownicy where wypozycza='0' and grupa='0' ");
         
         while(rss.next())
         {
             String id = rss.getString("id");
             String imie = rss.getString("imie");
             String nazwisko = rss.getString("nazwisko");
             
             
            
             %>
             
                
    
         
                <option value="<%=id%>"><%out.print(imie+" \t"+nazwisko);%></option>            
        
            
            <%
         }
        }catch(Exception e){
           out.print("BŁĄD BAZY DANYCH");
        }

        %>
                        </select></td></tr>
        
            
                <tr><td>id pracownika</td><td><input name="id_pracownika" value="<%=n%>" placeholder="data_poczatek" type="text" readonly></td></tr> 
                <tr><td>data rozpoczęcia</td><td><input name="data_rozpoczecia"  placeholder="data_rozpoczecia" type="date"/><input type="time" name="czas_rozpoczecia"></td></tr>
            <tr><td>data zakończenia</td><td><input name="data_zakonczenia"  placeholder="data_zakonczenia" type="date"><input type="time" name="czas_zakonczenia"></td></tr>
            
            
            
            
            
            
                
            
          
           
            <tr><td><input value="Dodaj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr> 
            </form>
         </table>
            </pre>
            </div>
        </div>
         <% }%>
    </body>
   
</html>
