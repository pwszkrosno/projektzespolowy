
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <title>Dodaj rezerwacje</title>
    </head>
    <body>
        <%
            String wypozycza="";
            String pesel="";
            
            
       try{
        
           
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from uzytkownicy where id='"+n+"'");
     while(rs.next())
         {
         wypozycza=rs.getString("wypozycza");
         pesel=rs.getString("pesel");
         }
     
                   
       }catch(Exception e){
            out.print("BŁĄD BAZY DANYCH");
        }
      
        pesel=pesel.substring(0,2);
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yy");
        String dateString = dateFormat.format(currentDate);  
        int wiek = (Integer.valueOf(dateString)+100)-Integer.valueOf(pesel);
      
        %>
        
        <div class="b">
            <h1>Dodaj rezerwacje</h1>
         
            <div class="reg_back">
            <pre>
<table>
            <form action="dodaj_rezerwacje1.jsp" method="post">
                <tr><td>samochod</td><td><select name="id_samochodu">
            
        <%
            
            if (grupa.equals("0")&& wypozycza.equals("0")){
              
            
        
        
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
                <tr><td>moje id klienta</td><td><input name="id_klienta" value="<%out.print(n);%>" readonly></td></tr>
                 <tr><td>wiek</td><td><input name="wiek" value="<%out.print(wiek);%>" readonly></td></tr>
            
        
            
                <tr><td>data rozpoczęcia</td><td><input name="data_rozpoczecia"  placeholder="data_rozpoczecia" type="date"/><input type="time" name="czas_rozpoczecia"></td></tr>
            <tr><td>data zakończenia</td><td><input name="data_zakonczenia"  placeholder="data_zakonczenia" type="date"><input type="time" name="czas_zakonczenia"></td></tr>
            
            
          
            
            
                
            
          
           
            <tr><td><input value="Dodaj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr> 
            </form>
         </table>
            </pre>
            </div>
        </div>
         <% }else{%>
         <script type="text/javascript">
                    var msg = ("posiadasz już rezerwacje");

                    alert(msg);
                    window.location = "rezerwacje_lista.jsp";
        </script>
         
         
         <%}%>
    </body>
   
</html>
