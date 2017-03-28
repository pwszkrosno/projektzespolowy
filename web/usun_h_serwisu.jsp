
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
        <title>usuń samochod</title>
    </head>
    <body>
        <%  
             String id=request.getParameter("id");
             String id_samochodu=request.getParameter("id_samochodu");
            
          

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
                stmt.execute("delete from  historia_serwisow where id='" + id + "'");
                stmt.execute("update samochody set serwis='0' where id='"+id_samochodu+"'");
        %>
        <script type="text/javascript">
            var msg = "serwis o id  <%=id%> został pomyślnie usuniety";
            alert(msg);
            window.location = "h_serwisow_lista.jsp";
        </script>



        <%

            } catch (Exception e) {

            }


        %>
    </body>

</html>
