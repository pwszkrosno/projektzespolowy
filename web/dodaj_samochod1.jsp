

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Success</title>
    </head>
    <body>


        <%

            String nr = request.getParameter("nr_rejestracyjny");
            String marka = request.getParameter("marka");
            String model = request.getParameter("model");
            String ubezpieczenie = request.getParameter("ubezpieczenie");
            String przeglad = request.getParameter("przeglad");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
                stmt.execute("insert into samochody(nr_rejestracyjny,marka,model,ubezpieczenie,przeglad)values('" + nr + "','" + marka + "','" + model + "','" + ubezpieczenie + "','" + przeglad + "')");

        %>
        <script type="text/javascript">
                    var msg = "samochod o numerze rejestracyjnym <%=nr%> został pomyślnie dodany do bazy danych";
                    alert(msg);
                    window.location = "samochody_lista.jsp";
        </script>



        <%

            } catch (Exception e) {

            }


        %>



    </body>
</html>
