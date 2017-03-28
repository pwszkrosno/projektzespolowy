
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
            if (grupa.equals("0") ||grupa.equals("1") || grupa.equals("2") || grupa.equals("3")){ %>
       
              <h1>rezerwacje</h1>
            
         
        
        <a href="dodaj_rezerwacje.jsp"> <button class="btn btn-primary">Dodaj rezerwacje</button></a>
         <table class="table table-striped table-bordered table-hover" id="mydata">
             <thead><tr>
                 <td>id</td>
                 
                 <td>id samochodu</td>
                 <td>nr rejestracyjny</td>
                 <td>marka</td>
                 <td>model</td>
                 <td>id pracownika</td>
                 <td>imię</td>
                 <td>nazwisko</td>
                 <td>data rozpoczecia</td>               
                 <td>data zakonczenia</td>
                 <td>taryfa</td>
                 <td>koszt</td>
                 <td>zapłacono</td>
                 <td>wydano</td>
                 <td>zwrocono</td>              
                 <td>edytuj</td>
                 <td>usuń</td>
             
                 </tr></thead>
        
     <%
        
     try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
         
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM wypozyczenia as w inner join uzytkownicy as u on w.id_pracownika=u.id inner join samochody as s on w.id_samochodu=s.id where id_klienta='"+n+"' order by w.wydano DESC  ");
         
         while(rs.next())
         {
             String id_wypozyczenia = rs.getString("id_wypozyczenia");
            
             String id_samochodu = rs.getString("w.id_samochodu");
             String nr_rejestracyjny = rs.getString("s.nr_rejestracyjny");
             String marka_samochodu = rs.getString("s.marka");
             String model_samochodu = rs.getString("s.model");
             String id_pracownika = rs.getString("w.id_pracownika");
             String imie_pracownika = rs.getString("u.imie");
             String nazwisko_pracownika = rs.getString("u.nazwisko");
             String data_rozpoczecia = rs.getString("w.data_rozpoczecia");
             String data_zakonczenia = rs.getString("w.data_zakonczenia");             
             String id_taryfy = rs.getString("w.id_taryfy");
             String koszt = rs.getString("w.koszt");
             String zaplacono = rs.getString("w.zaplacono");
             String wydano = rs.getString("w.wydano");
             String zwrocono = rs.getString("w.zwrocono");
            
             %>
             
                 <tr>
                     <td><%out.print(id_wypozyczenia);%></td>
                     
                     <td><%out.print(id_samochodu);%></td>
                     <td><%out.print(nr_rejestracyjny);%></td>
                     <td><%out.print(marka_samochodu);%></td>
                     <td><%out.print(model_samochodu);%></td>
                     <td><% if (id_pracownika.equals("1")){out.print("rezerwacja");}else out.print(id_pracownika);%></td>
                     <td><% if (id_pracownika.equals("1")){out.print("rezerwacja");}else out.print(imie_pracownika);%></td>
                      <td><% if (id_pracownika.equals("1")){out.print("rezerwacja");}else out.print(nazwisko_pracownika);%></td>
                     <td><%out.print(data_rozpoczecia);%></td>              
                     <td><%if (data_zakonczenia==null){out.print("brak");}else out.print(data_zakonczenia);%></td>
                     <td><%out.print(id_taryfy);%></td>
                      <td><%out.print(koszt);%></td>
                       <td><%if (zaplacono.equals("nie"))out.print("<p p style='color:red'>"+zaplacono+"</p>"); else out.print(zaplacono);%></td>
                     <td><% if (wydano.equals("0")) out.print("<p style='color:red'>nie</p>"); else out.print("tak");%></td>
                     <td><% if (zwrocono.equals("0")) out.print("nie"); else out.print("tak");%></td>
                   
                                         
                       
                         
                     <td> <a href="edytuj_rezerwacje.jsp?id=<%out.print(id_wypozyczenia);%>"><img src="image/edit.png" /></a> </td>
                        
                     
                     
                         
                     <td> <%if (wydano.equals("0")){%>  <a href="usun_rezerwacje.jsp?id=<%out.print(id_wypozyczenia);%>&id_samochodu=<%out.print(id_samochodu);%>"><img src="image/delete.png" /></a> <%}%></td>
                        
                    
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
      
      <p>Aktualne taryfy:</p>
          <table border="1"><tr><td>18-23 lat</td><td>24-50 lat</td><td>50+ lat</td></tr><tr>
            <%  try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
         
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("select * from taryfy");
         
         while(rs.next())
         {
             
             String stawka = rs.getString("stawka");
            %><td><%out.print(stawka);%></td><%
         }
         
        }catch(Exception e){
            
}%></table>
      
     <%@ include file="footer.jsp"%>
    
    </body>
</html>
