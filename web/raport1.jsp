
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
       <!-- <link href="css/home.css" type="text/css" rel="stylesheet"/> -->
       
       <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
       
        <title>JSP Page</title>
        <%@ include file="header.jsp"%>
    </head>
    
   
    <body>
         <% 
try{ 
            if (grupa.equals("1") || grupa.equals("2") || grupa.equals("3")){ 
         String miesiac = request.getParameter("miesiac");
         String rok = request.getParameter("rok");
         
         %>
       
              <h1>Raport wypożyczeń za miesiac <%out.print(miesiac+"."+rok+"r.");%></h1>
         
         
              <div>
      
         <table class="table table-striped table-bordered table-hover" id="mydata" >
             <thead> <tr>
                 <td>id</td>
                 <td>id_klienta</td>
                 <td>imię</td>
                 <td>nazwisko</td>
                 <td>id samochodu</td>
                 <td>nr rejestracyjny</td>
                 <td>id pracownika</td>
                 <td>imię pracownika</td>
                 <td>nazwisko pracownika</td>
                 <td>data rozpoczecia</td>               
                 <td>data zakonczenia</td>
                 <td>taryfa</td>
                 <td>koszt</td>
                 <td>zapłacono</td>
                 <td>wydano</td>
                 <td>zwrocono</td>              
                 
             
                 </tr></thead>
        
     <%
        
     try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
         
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM wypozyczenia as w inner join uzytkownicy as u on w.id_klienta=u.id inner join uzytkownicy as u2 on w.id_pracownika=u2.id inner join samochody as s on w.id_samochodu=s.id where w.data_rozpoczecia between '"+rok+"-"+miesiac+"-01 ' and '"+rok+"-"+miesiac+"-31 ' order by w.wydano ASC ");
         
         while(rs.next())
         {
             String id_wypozyczenia = rs.getString("w.id_wypozyczenia");
             String id_klienta = rs.getString("w.id_klienta");
             String imie_klienta = rs.getString("u.imie");
             String nazwisko_klienta = rs.getString("u.nazwisko");
             String id_samochodu = rs.getString("w.id_samochodu");
             String nr_rejestracyjny = rs.getString("s.nr_rejestracyjny");
             String id_pracownika = rs.getString("w.id_pracownika");
             String imie_pracownika = rs.getString("u2.imie");
             String nazwisko_pracownika = rs.getString("u2.nazwisko");
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
                     <td><%out.print(id_klienta);%></td>
                     <td><%out.print(imie_klienta);%></td>
                     <td><%out.print(nazwisko_klienta);%></td>
                     <td><%out.print(id_samochodu);%></td>
                     <td><%out.print(nr_rejestracyjny);%></td>
                     <td><%if (id_pracownika.equals(n))out.print("<p p style='color:blue'>"+id_pracownika+"</p>");else{out.print(id_pracownika);}%></td>
                     <td><%if (id_pracownika.equals(n))out.print("<p p style='color:blue'>"+imie_pracownika+"</p>");else{out.print(imie_pracownika);}%></td>
                     <td><%if (id_pracownika.equals(n))out.print("<p p style='color:blue'>"+nazwisko_pracownika+"</p>");else{out.print(nazwisko_pracownika);}%></td>       
                     <td><%out.print(data_rozpoczecia);%></td>              
                     <td><%if (data_zakonczenia==null){out.print("brak");}else out.print(data_zakonczenia);%></td>
                     <td><%out.print(id_taryfy);%></td>
                      <td><%out.print(koszt);%></td>
                       <td><%if (zaplacono.equals("nie"))out.print("<p p style='color:red'>"+zaplacono+"</p>"); else out.print(zaplacono);%></td>
                     <td><% if (wydano.equals("0")) out.print("<p style='color:red'>nie</p>"); else out.print("tak");%></td>
                     <td><% if (zwrocono.equals("0")) out.print("nie"); else out.print("tak");%></td>
                   
                
                   
                    
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
     
    
      </table>
      <script src="js/jquery.js"></script>
   
    <script src="js/bootstrap.min.js"></script>   
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
         <script src="js/mydata.js"></script>
              </div>
     
     
     
     
     
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
