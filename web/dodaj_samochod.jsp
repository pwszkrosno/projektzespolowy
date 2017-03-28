

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
        <%
            
            if (grupa.equals("1")||grupa.equals("2")||grupa.equals("3")){
            
        %>
        <div class="b">
            <h1>Dodaj samochód</h1>
           
            <div class="reg_back">
            <pre>
<table>
            <form action="dodaj_samochod1.jsp" method="post">
                
                <tr><td>nr rejestracyjny</td><td><input name="nr_rejestracyjny"  placeholder="Nr rejestracyjny" type="text"></td></tr> 
            <tr><td>marka</td><td><input name="marka"  placeholder="marka" type="text"></td></tr>                             
            <tr><td>model</td><td><input name="model"  placeholder="model" type="text"></td></tr>
            <tr><td>ubezpieczenie</td><td><input name="ubezpieczenie"  placeholder="ubezpieczenie" type="date"></td></tr> 
            <tr><td>przegląd</td><td><input name="przeglad"  placeholder="przeglad" type="date"></td></tr>
          
           
            <tr><td><input value="Dodaj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr> 
            </form>
    </table>
            </pre>
            </div>
        </div>
         <% } %>
    </body>
   
</html>
