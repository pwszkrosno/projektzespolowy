

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
        <title>Dodaj wypozyczenie</title>
    </head>
    <body>





        <%            if (grupa.equals("1") || grupa.equals("2") || grupa.equals("3")) {


        %>





        <div class="b">
            <h1>Generuj raport</h1>

            <div class="reg_back">
                <pre>
<table>
            <form action="raport1.jsp" method="post">
              <tr><td>Historia wypożyczeń</td></tr>
                <tr><td>miesiąc</td><td><select name="miesiac">
                        
                         <option value="01">styczen</option>
                         <option value="02">luty</option>
                         <option value="03">marzec</option>
                         <option value="04">kwiecien</option>
                         <option value="05">maj</option>
                         <option value="06">czerwiec</option>
                         <option value="07">lipiec</option>
                         <option value="08">sierpień</option>
                         <option value="09">wrzesień</option>
                         <option value="10">październik</option>
                         <option value="11">listiopad</option>
                         <option value="12">grudzień</option>
                        </select></td></tr>
                <tr><td>rok</td><td><select name="rok">
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
            <option value="2016">2016</option>
            <option value="2017">2017</option>
            
     
                        </select></td></tr>
   
          
           
            <tr><td><input value="Generuj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr> 
            </form>
         </table>

<table>
    <tr><td>Historia serwisów</td></tr>
            <form action="raport2.jsp" method="post">
              
                <tr><td>miesiąc</td><td><select name="miesiac">
                        
                         <option value="01">styczen</option>
                         <option value="02">luty</option>
                         <option value="03">marzec</option>
                         <option value="04">kwiecien</option>
                         <option value="05">maj</option>
                         <option value="06">czerwiec</option>
                         <option value="07">lipiec</option>
                         <option value="08">sierpień</option>
                         <option value="09">wrzesień</option>
                         <option value="10">październik</option>
                         <option value="11">listiopad</option>
                         <option value="12">grudzień</option>
                        </select></td></tr>
                <tr><td>rok</td><td><select name="rok">
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
            <option value="2016">2016</option>
            <option value="2017">2017</option>
            
     
                        </select></td></tr>
   
          
           
            <tr><td><input value="Generuj"   type="submit" class="btn" style="padding-bottom: 30px;"></td></tr> 
            </form>
         </table>
                </pre>
            </div>
        </div>
        <% }%>
    </body>

</html>
