
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
            String nr = request.getParameter("nr_rejestracyjny");
            String marka = request.getParameter("marka");
            String model = request.getParameter("model");
            String ubezpieczenie = request.getParameter("ubezpieczenie");
            String przeglad = request.getParameter("przeglad");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
                stmt.execute("update  samochody set nr_rejestracyjny='" + nr + "',marka='" + marka + "',model='" + model + "',ubezpieczenie='" + ubezpieczenie + "',przeglad='" + przeglad + "' where id='" + id + "'");

        %>
        <script type="text/javascript">
            var msg = "samochod o numerze rejestracyjnym <%=nr%> został pomyślnie zaktualizowany<%=marka%>";
            alert(msg);
            window.location = "samochody_lista.jsp";
        </script>



        <%

            } catch (Exception e) {

            }


        %>
    </body>

</html>
