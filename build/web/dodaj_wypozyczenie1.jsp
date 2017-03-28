
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
            String id_pracownika = request.getParameter("id_pracownika");
            String data_rozpoczecia = request.getParameter("data_rozpoczecia");
            String czas_rozpoczecia = request.getParameter("czas_rozpoczecia");
            String data_zakonczenia = request.getParameter("data_zakonczenia");
            if(data_zakonczenia.equals(""))data_zakonczenia="NULL";
            String czas_zakonczenia = request.getParameter("czas_zakonczenia");
            data_rozpoczecia=data_rozpoczecia+" "+czas_rozpoczecia;
            data_zakonczenia=data_zakonczenia+" "+czas_zakonczenia;
            
            //String id_taryfy = request.getParameter("id_taryfy");
            
        
            String pesel="";


//automatyczna taryfa
            
            try{
        
           
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");
                     
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select pesel from uzytkownicy where id='"+id_klienta+"'");
     while(rs.next())
         {
         
         pesel=rs.getString("pesel");
         }
     
                   
       }catch(Exception e){
            out.print("BŁĄD BAZY DANYCH");
        }
      
        pesel=pesel.substring(0,2);
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yy");
        String dateString = dateFormat.format(currentDate);  
        int wiek = (Integer.valueOf(dateString)+100)-Integer.valueOf(pesel);
        
        int w =Integer.valueOf(wiek);
            String taryfa="";
            if (w<24) {taryfa="1";}
            else if(24<=w && w<=50){taryfa="2";}
            else{taryfa="3";}
        
        //koniec auto taryfa
           

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/wypozyczalnia", "root", "");

                Statement stmt = con.createStatement();
                if(data_zakonczenia.equals("NULL ")){
                   
                stmt.execute("INSERT INTO `wypozyczenia` (`id_klienta`, `id_samochodu`, `id_pracownika`, `data_rozpoczecia`, `id_taryfy`,`wydano`) VALUES('" + id_klienta + "','" + id_samochodu + "','" + id_pracownika + "','" + data_rozpoczecia + "','" + taryfa + "','1')");
                
                }else
                { 
                stmt.execute("INSERT INTO `wypozyczenia` (`id_klienta`, `id_samochodu`, `id_pracownika`, `data_rozpoczecia`, `data_zakonczenia`, `id_taryfy`,`wydano`) VALUES('" + id_klienta + "','" + id_samochodu + "','" + id_pracownika + "','" + data_rozpoczecia + "','" + data_zakonczenia + "','" + taryfa + "','1')");
                }
                stmt.execute("update  uzytkownicy set wypozycza='1' where id='" + id_klienta + "'");
                stmt.execute("update  samochody set wypozyczony='1' where id='" + id_samochodu + "'");
                

        %>
       
 <script type="text/javascript">
                    var msg = "dodano wypozyczenie";
                    alert(msg);
                    window.location = "wypozyczenia_lista.jsp";
        </script>

        <%

            } catch (Exception e) {
                out.print("INSERT INTO `wypozyczenia` (`id_klienta`, `id_samochodu`, `id_pracownika`, `data_rozpoczecia`, `id_taryfy`) VALUES('" + id_klienta + "','" + id_samochodu + "','" + id_pracownika + "','" + data_rozpoczecia + "','" + taryfa + "')");
            }


        %>
        

       



    </body>
</html>
