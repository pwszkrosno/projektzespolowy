

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Success</title>
        <%@include file="header.jsp" %>
    </head>
    <body>

        <%

            String login = request.getParameter("login");
            String haslo = request.getParameter("password");
            String haslo_ponownie = request.getParameter("repassword");
            
            if (haslo.equals(haslo_ponownie)){
            
            String pesel = request.getParameter("pesel");
            String imie = request.getParameter("imie");
            String nazwisko = request.getParameter("nazwisko");
            String adres = request.getParameter("adres");
            String telefon = request.getParameter("telefon");
            String email = request.getParameter("email");
            String grupa1="0";
            if (grupa.equals("2")){
             grupa1 = request.getParameter("grupa");
            }
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
                stmt.execute("insert into uzytkownicy(login,haslo,pesel,imie,nazwisko,adres,telefon,email,grupa)values('" + login + "','" + haslo + "','" + pesel + "','" + imie + "','" + nazwisko + "','" + adres + "','" + telefon + "','" + email + "','" + grupa1 + "')");
                %>
        
         <script type="text/javascript">
                    var msg = "uzytkownik został pomyślnie dodany do bazy danych";
                    alert(msg);
                    <%if (grupa.equals("1")|| grupa.equals("2")||grupa.equals("3")){%> window.location = "uzytkownicy_lista.jsp";<%}else{
                    %>window.location = "login.jsp";<%}%>
        </script>
        
        
        <%
            } catch (Exception e) {%>
<script type="text/javascript">
                    var msg = "podano błędne dane !";
                    alert(msg);
                    
                    window.location = "reg.jsp";
        </script> 
<%

            }
}else{
%>
      <script type="text/javascript">
                    var msg = "podane hasła są od siebie różne !";
                    alert(msg);
                    
                    window.location = "reg.jsp";
        </script>  
        
        
        <%



}

        %>
    </body>
</html>
