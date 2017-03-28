
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
        <h1>Lista serwisów:</h1>
        <a href="dodaj_h_serwisu.jsp"> <button type="button" class="btn btn-primary">Dodaj serwis</button> </a>
         <table class="table table-striped table-bordered table-hover" id="mydata">
             <thead> <tr>
                 <td>id</td>
                 <td>id serwisu</td>
                 <td>nazwa serwisu</td>
                 <td>id samochodu</td>
                 <td>nr rejestracyjny</td>
                 <td>marka</td>
                 <td>model</td>
                 <td>poczatek naprawy</td>
                 <td>koniec naprawy</td>               
                 <td>koszt</td>
                 <td>opis usterki</td>
                 <td>zakonczono</td>
               
               
               <td>edytuj</td>
               <td>usuń</td>
              
                 </tr></thead>
        
     <%
        
     try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
         
          Statement stmt = con.createStatement();
        //   ResultSet rs = stmt.executeQuery("select * from historia_serwisow");
         ResultSet rs = stmt.executeQuery( "select * from historia_serwisow inner join serwisy ON historia_serwisow.id_serwisu=serwisy.id_serwisu inner join samochody ON historia_serwisow.id_samochodu=samochody.id ");
         
       
         
         while(rs.next())
         {
             String id = rs.getString("historia_serwisow.id");
             String id_serwisu = rs.getString("historia_serwisow.id_serwisu");
             String id_samochodu = rs.getString("historia_serwisow.id_samochodu");
             String data_poczatek = rs.getString("historia_serwisow.data_poczatek");
             String data_koniec = rs.getString("historia_serwisow.data_koniec");
             String koszt = rs.getString("historia_serwisow.koszt");
             String opis_usterki = rs.getString("historia_serwisow.opis_usterki");
             String zakonczono = rs.getString("historia_serwisow.zakonczono");
             String nazwa_serwisu = rs.getString("serwisy.nazwa");
             String samochod_rejestracja = rs.getString("samochody.nr_rejestracyjny");
             String samochod_model = rs.getString("samochody.model");
               String samochod_marka = rs.getString("samochody.marka");
             
             %>
             
                 <tr>
                     <td><%out.print(id);%></td>
                     <td><%out.print(id_serwisu);%></td>
                     <td><%out.print(nazwa_serwisu);%></td>
                     <td><%out.print(id_samochodu);%></td>
                     <td><%out.print(samochod_rejestracja);%></td>
                     <td><%out.print(samochod_marka);%></td>
                     <td><%out.print(samochod_model);%></td>
                     <td><%out.print(data_poczatek);%></td>
                     <td><%out.print(data_koniec);%></td>              
                     <td><%out.print(koszt);%></td>
                     <td><%out.print(opis_usterki);%></td>
                     <td><% if (zakonczono.equals("0")) out.print("nie"); else out.print("tak");%></td>
                      
                       
                       
                    
                      
                     <td>  <a href="edytuj_h_serwisu.jsp?id=<%out.print(id);%>&id_samochodu=<%out.print(id_samochodu);%>&id_serwisu=<%out.print(id_serwisu);%>"><img src="image/edit.png" /></a> </td>
                       
                     
                     
                     <td>  <a href="usun_h_serwisu.jsp?id=<%out.print(id);%>&id_samochodu=<%out.print(id_samochodu);%>"><img src="image/delete.png" /></a> </td>
                      
                    
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
