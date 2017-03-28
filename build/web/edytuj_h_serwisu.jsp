

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
            <h1>Edytuj serwis</h1>
           
            <div class="reg_back">
            <pre>
           <table>
            <form action="edytuj_h_serwisu1.jsp" method="post">
                
            
        <%
            
            if (grupa.equals("1")||grupa.equals("2")||grupa.equals("3")){
             
            String id_h_serwisu=request.getParameter("id");
   
           %>                                  
           <tr><td>id serwisu</td><td><input name="id"  value="<%=id_h_serwisu%>" placeholder="id_h_serwisu" type="text" readonly></td></tr>  
             <tr><td>samochod</td><td><select name="id_samochodu">              
                <%
           
           
          //samochod1 
         
           try{
        
          String id_samochodu1=request.getParameter("id_samochodu");
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from samochody where id='"+id_samochodu1+"' ");
        
         
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
        
            String id_samochodu1=request.getParameter("id_samochodu");
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from samochody ");
                   
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
             <tr><td>serwis</td><td><select name="id_serwisu">
                    <%

//serwis
 try{
          String id_serwisu=request.getParameter("id_serwisu");
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rss = stmt.executeQuery("select * from serwisy where id_serwisu='"+id_serwisu+"'");
         
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
//serwis2
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

            %> </select></td></tr>
        
        <%
        
         try{
       
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rss = stmt.executeQuery("select * from historia_serwisow where id='"+id_h_serwisu+"'");
         
         while(rss.next())
         {
             String data_poczatek = rss.getString("data_poczatek");
             String data_koniec = rss.getString("data_koniec");
             String koszt = rss.getString("koszt");
              String opis_usterki = rss.getString("opis_usterki");
               String zakonczono = rss.getString("zakonczono");
            
             %>              
             <tr><td>poczatek</td><td><input name="data_poczatek"  value="<%=data_poczatek%>" placeholder="data_poczatek" type="date"></td></tr> 
            <tr><td>koniec</td><td><input name="data_koniec" value="<%=data_koniec%>"  placeholder="data_koniec" type="date"></td></tr> 
            <tr><td>koszt</td><td><input name="koszt"  value="<%=koszt%>" placeholder="koszt" type="text"></td></tr>             
            <tr><td>opis usterki</td><td><input name="opis_usterki" value="<%=opis_usterki%>"  placeholder="opis_usterki" type="text"></td></tr>  
            <tr><td>zakonczono</td><td><select name="zakonczono">
                <% if(zakonczono.equals("0")){%>
                <option value="0">nie</option>
                <option value="1">tak</option>
                 <%}%>
                
                <% if(zakonczono.equals("1")){%>
                <option value="1">tak</option>
                <option value="0">nie</option>
                 <%}%> 
            </select></td></tr>
          
           
            <tr><td><input value="Dodaj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr>                          
            <%
         }
        }catch(Exception e){
           out.print("BŁĄD BAZY DANYCH");
        }
        
        
        
        %>
        
        
            
            
            </form>
        </table>
            </pre>
            </div>
        </div>
         <% } %>
    </body>
   
</html>
