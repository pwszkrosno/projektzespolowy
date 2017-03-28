
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
         
           
            String data_rozpoczecia = request.getParameter("data_rozpoczecia");
            String czas_rozpoczecia = request.getParameter("czas_rozpoczecia");
            String data_zakonczenia = request.getParameter("data_zakonczenia");
            String czas_zakonczenia = request.getParameter("czas_zakonczenia");
            
           
            
            data_rozpoczecia=data_rozpoczecia+" "+czas_rozpoczecia;
            data_zakonczenia=data_zakonczenia+" "+czas_zakonczenia;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
               stmt.execute("UPDATE `wypozyczenia` SET `id_samochodu` = '"+id_samochodu+"', `data_rozpoczecia` = '"+data_rozpoczecia+"', `data_zakonczenia` = '"+data_zakonczenia+"'  WHERE `wypozyczenia`.`id_wypozyczenia` = '"+id+"'");
              //  stmt.execute("update  wypozyczenia set id_samochodu='" + id_samochodu + "',id_pracownika='" + id_pracownika + "',data_rozpoczecia='" + data_rozpoczecia + "',data_zakonczenia='" + data_zakonczenia + "',id_taryfy='" + id_taryfy + "',zaplacono='" + zaplacono + "',wydano='" + wydano + "' ,zwrocono='" + zwrocono + "' ,koszt='" + koszt + "' where id_wypozyczenia='24'");
                   

        %>
     
 <script type="text/javascript">
                    var msg = ("uaktualniono rezerwacje");
 
                    alert(msg);
                    window.location = "rezerwacje_lista.jsp";
        </script>


        <%

            } catch (Exception e) {

            }





        %>
    </body>

</html>
