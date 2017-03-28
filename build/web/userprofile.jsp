<%-- 
    Document   : userprofile
    Created on : Sep 29, 2016, 1:32:41 AM
    Author     : Oops
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
        <title>O profilu</title>
        <%@ include file="header.jsp"%>
    </head>
    <body>
        <%            try {
                HttpSession session1 = request.getSession(false);
                if (session1 != null) {
                    String name = (String) session1.getAttribute("name");
                    //out.println(name);
                }

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from uzytkownicy where id='"+session.getAttribute("name")+"' ");
                rs.next();
                String login = rs.getString("login");
                String imie = rs.getString("imie");
                String nazwisko = rs.getString("nazwisko");
                String wypozycza = rs.getString("wypozycza");
                String telefon = rs.getString("telefon");
                String email = rs.getString("email");
                

        %>
        <table style="width:300px" class="table">
            
                <tr> <td>login:</td><td><%out.println(login);%></td></tr>
                <tr> <td> imię:</td><td><%out.println(imie);%></td></tr>
                <tr> <td> nazwisko:</td><td><%out.println(nazwisko);%></td></tr>
                <tr> <td> wypożycza:</td><td><%out.println(wypozycza);%></td></tr>
                <tr> <td> telefon:</td><td><%out.println(telefon);%></td></tr>
                <tr> <td> e-mail:</td><td><%out.println(email);%></td></tr>

            
        </table>
        <%
            } catch (Exception e) {
                out.println(e);
            }


        %>


        <%@ include file="footer.jsp"%>
    </body>
</html>
