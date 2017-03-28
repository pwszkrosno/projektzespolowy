
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
            String login = request.getParameter("login");
            String haslo = request.getParameter("haslo");
            String pesel = request.getParameter("pesel");
            String imie = request.getParameter("imie");
            String nazwisko = request.getParameter("nazwisko");
            String adres = request.getParameter("adres");
           
            String telefon = request.getParameter("telefon");
            String email = request.getParameter("email");
            String grupaa = request.getParameter("grupa");
            

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
                stmt.execute("update  uzytkownicy set login='" + login + "',haslo='" + haslo + "',pesel='" + pesel + "',imie='" + imie + "',nazwisko='" + nazwisko + "',adres='" + adres + "',telefon='" + telefon + "',email='" + email + "',grupa='" + grupaa + "' where id='" + id + "'");

        %>
        <script type="text/javascript">
            var msg = "uzytkownik o id  <%=id%> został pomyślnie zaktualizowany";
            alert(msg);
            window.location = "uzytkownicy_lista.jsp";
        </script>



        <%

            } catch (Exception e) {
out.print("update  uzytkownicy set login='" + login + "',haslo='" + haslo + "',pesel='" + pesel + "',imie='" + imie + "',nazwisko='" + nazwisko + "',adres='" + adres + "',telefon='" + telefon + "',email='" + email + "',grupa='" + grupaa + "' where id='" + id + "'");
            }


        %>
    </body>

</html>
