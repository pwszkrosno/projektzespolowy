
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
        <%  String id = request.getParameter("id");
            String id_samochodu = request.getParameter("id_samochodu");
            String id_serwisu = request.getParameter("id_serwisu");
            String data_poczatek = request.getParameter("data_poczatek");
            String data_koniec = request.getParameter("data_koniec");
            
            String koszt = request.getParameter("koszt");
            String opis_usterki = request.getParameter("opis_usterki");
            String zakonczono = request.getParameter("zakonczono");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
                stmt.execute("update  historia_serwisow set id_samochodu='" + id_samochodu + "',id_serwisu='" + id_serwisu + "',data_poczatek='" + data_poczatek + "',data_koniec='" + data_koniec + "',koszt='" + koszt + "',opis_usterki='" + opis_usterki + "',zakonczono='" + zakonczono + "' where id='" + id + "'");
                    

        %>
     



        <%

            } catch (Exception e) {

            }


try{
         
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
            
             
             if(zakonczono.equals("1")){
              Statement stmt2 = con.createStatement();
              stmt2.execute("update samochody set serwis='0' where id='"+id_samochodu+"'");         
              }

        %>
         <script type="text/javascript">
                    var msg = "dodano dane o serwisie";
                    alert(msg);
                    window.location = "h_serwisow_lista.jsp";
        </script>

        <%
        }catch(Exception e){
            
        }


        %>
    </body>

</html>
