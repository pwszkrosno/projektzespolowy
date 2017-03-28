

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
            <h1>Edytuj rezerwacje</h1>
           
            <div class="reg_back">
            <pre>
<table>
            <form action="edytuj_rezerwacje1.jsp" method="post">
           
            
        <%
            
            if (grupa.equals("0")|| grupa.equals("1")||grupa.equals("2")||grupa.equals("3")){
             
            String id_wypozycz=request.getParameter("id");
           
           
             
             String id_klienta = "";
             String id_samochodu = "";
             String id_pracownika = "";
             String data_rozpoczecia = "";
             String data_zakonczenia = "";
             String id_taryfy = "";
             String koszt = "";
             String zaplacono = "";
             String wydano = "";
             String zwrocono = "";
           
             try{
          
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rss = stmt.executeQuery("select * from wypozyczenia where id_wypozyczenia='"+id_wypozycz+"'");
         
         while(rss.next())
         {
              id_klienta = rss.getString("id_klienta");
              id_samochodu = rss.getString("id_samochodu");
              id_pracownika = rss.getString("id_pracownika");
             
              data_rozpoczecia = rss.getString("data_rozpoczecia");
              data_zakonczenia = rss.getString("data_zakonczenia");
        
        
       
         }
        }catch(Exception e){
           out.print("BŁĄD BAZY DANYCH");
        }
          String czas_rozpoczecia=data_rozpoczecia.substring(11,16);
          data_rozpoczecia=data_rozpoczecia.substring(0,10);
           String czas_zakonczenia="";
          if(data_zakonczenia!=null)
          { 
             czas_zakonczenia=data_zakonczenia.substring(11,16);
               data_zakonczenia=data_zakonczenia.substring(0,10);
               
          }
        
           %>
       
      
                
                
                
                
           <tr><td>id</td><td><input name="id"  value="<%=id_wypozycz%>" placeholder="id_wypozycz" type="text" readonly></td></tr>  
           <tr><td>id klienta</td><td><input name="id_klienta"  value="<%=id_klienta%>" placeholder="id_klienta" type="text" readonly></td></tr>  
                
               
           <tr><td>samochod></td><td><select name="id_samochodu">               
                <%
           
           
          //samochod1 
         
           try{
        
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from samochody where id='"+id_samochodu+"' ");
        
         
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

        //samochod2
         try{
        
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from samochody where wypozyczony='0' and zarezerwowany='0' ");
                   
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
             %> </select></td></tr>
               
         
           <tr><td>data rozpoczęcia</td><td><input name="data_rozpoczecia"  placeholder="data_rozpoczecia" value="<%=data_rozpoczecia%>" type="date"/><input type="time" value="<%=czas_rozpoczecia%>" name="czas_rozpoczecia"></td></tr>
           <tr><td>data zakonczenia</td><td><input name="data_zakonczenia"  placeholder="data_zakonczenia" value="<%if(data_zakonczenia!=null)out.print(data_zakonczenia);%>" type="date"><input type="time" value="<%if(czas_zakonczenia!="")out.print(czas_zakonczenia);%>" name="czas_zakonczenia"></td></tr>
                     
           
           
           
          
            
            
           
            <tr><td><input value="Dodaj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr>                          
            
        
        
        
        
        
        
        
            
            
            </form>
            </table>
            </pre>
            </div>
        </div>
         <% } %>
    </body>
   
</html>
