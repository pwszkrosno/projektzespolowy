

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link href="css/home1.css" rel="stylesheet" type="text/css">
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="b">
            <h1>Rejestracja</h1>
           
            <div class="reg_back">
            <pre>
            <form action="register.jsp" method="post">
                <table>  
                    <tr><td>login</td><td><input name="login"  placeholder="login" type="text"></td></tr>           
            <tr><td>hasło</td><td><input name="password"  placeholder="haslo" type="password"></td></tr>  
            <tr><td>powtoz haslo</td><td><input name="repassword"  placeholder="ponownie haslo" type="password"></td></tr>              
            <tr><td>pesel</td><td><input name="pesel"  placeholder="pesel" type="text"></td></tr>   
            <tr><td>imie</td><td><input name="imie"  placeholder="imie" type="text"></td></tr>  
            <tr><td>nazwisko</td><td><input name="nazwisko"  placeholder="nazwisko" type="text"></td></tr>   
           <tr><td>adres</td><td><input name="adres"  placeholder="adres" type="text"></td></tr>  
            <tr><td>telefon</td><td><input name="telefon"  placeholder="telefon" type="text"></td></tr>   
            <tr><td>email</td><td><input name="email"  placeholder="email" type="text"></td></tr>  
            <%if (grupa !=null && (grupa.equals("2") || grupa.equals("3"))){%>
            <tr><td>grupa</td><td><select name="grupa">
                <option value="0">klient</option>
                <option value="1">pracownik</option>
                <option value="2">manager</option>
                <option value="3">administrator</option>
                    </select></td></tr>
            
            <%}%>
           
            <tr><td><input value="Rejestracja"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr> 
                </table>
            </form>
            </pre>
            </div>
        </div>
         
    </body>
   
</html>
