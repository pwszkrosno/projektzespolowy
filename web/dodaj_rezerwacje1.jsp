
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Success</title>
    </head>
    <body>


        <%
            
            
            
            

            String id_klienta = request.getParameter("id_klienta");
            String id_samochodu = request.getParameter("id_samochodu");
            String wiek=request.getParameter("wiek");
            String data_rozpoczecia = request.getParameter("data_rozpoczecia");
            String czas_rozpoczecia = request.getParameter("czas_rozpoczecia");
            String data_zakonczenia = request.getParameter("data_zakonczenia");
            if(data_zakonczenia.equals(""))data_zakonczenia="NULL";
            String czas_zakonczenia = request.getParameter("czas_zakonczenia");
            data_rozpoczecia=data_rozpoczecia+" "+czas_rozpoczecia;
            data_zakonczenia=data_zakonczenia+" "+czas_zakonczenia;
            int w =Integer.valueOf(wiek);
            String taryfa="";
            if (w<24) {taryfa="1";}
            else if(24<=w && w<=50){taryfa="2";}
            else{taryfa="3";}
         
            
          
           

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
                if(data_zakonczenia.equals("NULL ")){
                   
                stmt.execute("INSERT INTO `wypozyczenia` (`id_klienta`, `id_samochodu`, `id_pracownika`, `data_rozpoczecia`, `id_taryfy`,`wydano`) VALUES('" + id_klienta + "','" + id_samochodu + "','1','" + data_rozpoczecia + "','"+taryfa+"','0')");
                
                }else
                { 
                stmt.execute("INSERT INTO `wypozyczenia` (`id_klienta`, `id_samochodu`, `id_pracownika`, `data_rozpoczecia`, `data_zakonczenia`, `id_taryfy`,`wydano`) VALUES('" + id_klienta + "','" + id_samochodu + "','1','" + data_rozpoczecia + "','" + data_zakonczenia + "','1','0')");
                }
               // stmt.execute("update  uzytkownicy set wypozycza='1' where id='" + id_klienta + "'");
             //   stmt.execute("update  samochody set wypozyczony='1' where id='" + id_samochodu + "'");
                

       

            } catch (Exception e) {
                %>
<script type="text/javascript">
                    var msg = "podano błędne dane !";
                    alert(msg);
                    
                    window.location = "dodaj_rezerwacje.jsp";
        </script> 
<%
                
            }



try{
    Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("select id_wypozyczenia from wypozyczenia where id_klienta='"+id_klienta+"' ");
         String id_rezerwacji="";
         while(rs.next())
         {
              id_rezerwacji = rs.getString("id_wypozyczenia");
         }
 stmt.execute("update  samochody set zarezerwowany='"+id_rezerwacji+"' where id='" + id_samochodu + "'");
 stmt.execute("update  uzytkownicy set wypozycza='"+id_rezerwacji+"' where id='" + id_klienta + "'");

 %>
       
 <script type="text/javascript">
                    var msg = "dodano rezerwacje";
                    alert(msg);
                    window.location = "rezerwacje_lista.jsp";
        </script>

        <%

}catch (Exception e) {


            }
        %>
        

       



    </body>
</html>
