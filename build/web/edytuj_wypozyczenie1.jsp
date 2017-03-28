
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
       <%
           
            
            int godziny=0;
            float stawka=0;
            String id = request.getParameter("id");
            String id_klienta = request.getParameter("id_klienta");
            String id_samochodu = request.getParameter("id_samochodu");
            String id_pracownika = request.getParameter("id_pracownika");
           
            String data_rozpoczecia = request.getParameter("data_rozpoczecia");
            String czas_rozpoczecia = request.getParameter("czas_rozpoczecia");
            String data_zakonczenia = request.getParameter("data_zakonczenia");
            String czas_zakonczenia = request.getParameter("czas_zakonczenia");
            
           
           
            String zaplacono = request.getParameter("zaplacono");
            String wydano = request.getParameter("wydano");
            String zwrocono = request.getParameter("zwrocono");
            
            data_rozpoczecia=data_rozpoczecia+" "+czas_rozpoczecia;
            data_zakonczenia=data_zakonczenia+" "+czas_zakonczenia;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
               stmt.execute("UPDATE `wypozyczenia` SET `id_samochodu` = '"+id_samochodu+"', `id_pracownika` = '"+id_pracownika+"' , `data_rozpoczecia` = '"+data_rozpoczecia+"', `data_zakonczenia` = '"+data_zakonczenia+"' ,  `zaplacono` = '"+zaplacono+"', `wydano` = '"+wydano+"', `zwrocono` = '"+zwrocono+"' WHERE `wypozyczenia`.`id_wypozyczenia` = '"+id+"'");
                    if(zwrocono.equals("1")){
                    stmt.execute("update samochody set wypozyczony='0', zarezerwowany='0' where id='"+id_samochodu+"'");
                    stmt.execute("update uzytkownicy set wypozycza='0' where id='"+id_klienta+"'");
                    }else
                    if(wydano.equals("1")){
                    stmt.execute("update samochody set wypozyczony='"+id+"', zarezerwowany='0' where id='"+id_samochodu+"'");}

            } catch (Exception e) {

            }
           
            try{
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
       
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("SELECT  b.`data_rozpoczecia`, b.`data_zakonczenia`, TIMESTAMPDIFF(HOUR, b.`data_rozpoczecia`, b.`data_zakonczenia`) AS `godziny` FROM wypozyczenia b where id_wypozyczenia='"+id+"'");
    
         while(rs.next())
         {       
             godziny = rs.getInt("godziny");
         }
        
     
        }catch(Exception e){
            
        }

 try{
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");          
         
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("SELECT t.stawka FROM `wypozyczenia` as w  INNER JOIN `taryfy` as t  ON w.id_taryfy=t.id_taryfy WHERE w.id_wypozyczenia='"+id+"'");
     
         while(rs.next())
         {       
             stawka = rs.getFloat("t.stawka");
         }
        
        
        }catch(Exception e){
            
        }

float koszt=godziny*stawka;
 try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
               stmt.execute("UPDATE `wypozyczenia` SET `koszt` = '"+koszt+"' WHERE `wypozyczenia`.`id_wypozyczenia` = '"+id+"'");
                    
                %>
        
        <script type="text/javascript">
                    var msg = ("godziny = <%out.print(godziny);%> \nstawka = <%out.print(stawka);%> \nkoszt= <%out.print(godziny*stawka);%> \nzaktualizowano wypozyczenie");

                    alert(msg);
                    window.location = "wypozyczenia_lista.jsp";
        </script>
        
        <%
               

            } catch (Exception e) {

            }




        %>
    </body>

</html>
