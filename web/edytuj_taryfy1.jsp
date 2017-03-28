
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
        <%  String stawka1 = request.getParameter("stawka1");
        String stawka2 = request.getParameter("stawka2");
        String stawka3 = request.getParameter("stawka3");
            

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
                stmt.execute("update  taryfy set stawka='" + stawka1 + "' where id_taryfy='1'");
                stmt.execute("update  taryfy set stawka='" + stawka2 + "' where id_taryfy='2'");
                stmt.execute("update  taryfy set stawka='" + stawka3 + "' where id_taryfy='3'");

        %>
        <script type="text/javascript">
            var msg = "nowe stawki:\n1. <%=stawka1%>\n2. <%=stawka2%>\n3. <%=stawka3%>";
            alert(msg);
            window.location = "samochody_lista.jsp";
        </script>



        <%

            } catch (Exception e) {

            }


        %>
    </body>

</html>
