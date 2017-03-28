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
        <title>Registration Success</title>
    </head>
    <body>


        <%

            
            
            String id_samochodu = request.getParameter("id_samochodu");
            String id_serwisu = request.getParameter("id_serwisu");
            String data_poczatek = request.getParameter("data_poczatek");
            String data_koniec = request.getParameter("data_koniec");
           
            String koszt = request.getParameter("koszt");
            String opis_usterki = request.getParameter("opis_usterki");
             String id_wypozyczenia="";
            
            
          
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
           
                stmt.execute("insert into historia_serwisow(id_serwisu,id_samochodu,data_poczatek,data_koniec,koszt,opis_usterki)values('" + id_serwisu + "','" + id_samochodu + "','" + data_poczatek + "','" + data_koniec + "','" + koszt + "','" + opis_usterki + "')");
              
        
            } catch (Exception e) {

%>
         <script type="text/javascript">
                    var msg = "podano niekompletne dane";
                    alert(msg);
                    window.location = "dodaj_h_serwisu.jsp";
        </script>
        <%

            }

  try{
                 Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("select id from historia_serwisow where id_samochodu='"+id_samochodu+"' ");
            
         
         while(rs.next())
         {
            id_wypozyczenia = rs.getString("id");
         }   
stmt.execute("update samochody set serwis='"+id_wypozyczenia+"' where id='"+id_samochodu+"'");

         %>
        
        
        <script type="text/javascript">
                    var msg = "serwis zostal dodany";
                    alert(msg);
                    window.location = "h_serwisow_lista.jsp";
        </script>
        <%
         
            }catch(Exception e ){

%>
<script type="text/javascript">
                    var msg = "podano błędne dane !";
                    alert(msg);
                    
                    window.location = "dodaj_h_serwisu.jsp";
        </script> 
<%
}


        %>



    </body>
</html>
