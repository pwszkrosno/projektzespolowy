

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/home1.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@include file="header.jsp" %>
        <title>wypozyczalnia</title>
    </head>
    <body>
        
        <div>
            <div class="reg_back">
                <h1 style="margin-left: 70px;">Logowanie</h1>
          <form action="Login" method="post">
            <pre>
         <input name="login" placeholder="login"    type="text"> 

         <input name="haslo"  placeholder="hasło" type="password"> 
            

        <input value="Login"   type="submit" class="btn" style="padding-bottom: 30px;"> 


            </pre>
            </form> 
            </div>
        </div>
  
        <%@include file="footer.jsp" %>
    </body>
</html>
