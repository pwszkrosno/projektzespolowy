

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/header.css" rel="stylesheet" type="text/css">
        <title>Wypozyczalnia</title>
    </head>
    <body>
        <%
            String n = (String) session.getAttribute("name");
            String imienazwisko = (String) session.getAttribute("imienazwisko");
            String grupa = (String) session.getAttribute("grupa");
           
            if (n == null && imienazwisko==null && grupa==null ) {%>
        <div class="back">
            <div class="logo">
                <img src="image/logo.png" >
                <p style=" font-size: 35px;color: #ffffff; margin-left:50px; ">Wypozyczalnia samochodowa "a wez ..."</p>
            </div>
            <div class="menu1">

                <div style="margin-top: 15px; margin-left: 180px;">
                    <li><a href="login.jsp" style="color:mintcream">zaloguj </a></li> &nbsp;&nbsp;
                    <li><a href="reg.jsp" style="color:mintcream">zarejestruj</a></li>

                </div>
            </div>
        </div>


        <%} else if (grupa.equals("0")) {%>
        <div class="back">
            <div class="logo">
                <img src="image/logo.png" >
                <label style=" font-size: 35px;color: #ffffff; margin-left:50px; ">Wypożyczalnia samochodowa "a weź ..."</label>
            </div>
            <div class="menu1">
                <p>  Witaj <% out.print(imienazwisko); %></p>
                <div style="margin-top: 15px; margin-left: 20px;">
                    <li><a href="rezerwacje_lista.jsp" style="color:mintcream">Rezerwacje</a></li> &nbsp;&nbsp;
                    <li><a href="userprofile.jsp" style="color:mintcream">Profil </a></li> &nbsp;&nbsp;
                    <li><a href="logout.jsp" style="color:mintcream">Wyloguj </a></li> &nbsp;&nbsp;


                </div>
            </div>
        </div>
        <%} else if (grupa.equals("1")) {%>
        <div class="back">
            <div class="logo">
                <img src="image/logo.png" >
               
            </div>
            <div class="menu1">
                Witaj <% out.print(imienazwisko); %>
                <div style="margin-top: 15px; margin-left: 20px;">
                     <li><a href="wypozyczenia_lista.jsp" style="color:mintcream">Wypozyczenia </a></li> &nbsp;&nbsp;
                    <li><a href="samochody_lista.jsp" style="color:mintcream">Samochody </a></li> &nbsp;&nbsp;
                    <li><a href="reg.jsp" style="color:mintcream">Zarejestruj klienta</a></li> &nbsp;&nbsp;
                    <li><a href="h_serwisow_lista.jsp" style="color:mintcream">Serwisy </a></li> &nbsp;&nbsp;
                    <li><a href="raport.jsp" style="color:mintcream">Raporty</a></li> &nbsp;&nbsp;
                    <li><a href="userprofile.jsp" style="color:mintcream">Profil </a></li> &nbsp;&nbsp;
                    <li><a href="logout.jsp" style="color:mintcream">Wyloguj </a></li> &nbsp;&nbsp;


                </div>
            </div>
        </div>
        <%} else if (grupa.equals("2")) {%>
        <div class="back">
            <div class="logo">
                <img src="image/logo.png" >
               
            </div>
            <div class="menu1">
                     Witaj <% out.print(imienazwisko); %>
                <div style="margin-top: 15px; margin-left: 20px;">
                    <li><a href="wypozyczenia_lista.jsp" style="color:mintcream">Wypozyczenia </a></li> &nbsp;&nbsp;
                    <li><a href="samochody_lista.jsp" style="color:mintcream">Samochody </a></li> &nbsp;&nbsp;
                     <li><a href="uzytkownicy_lista.jsp" style="color:mintcream">Uzytkownicy </a></li> &nbsp;&nbsp;
                      <li><a href="h_serwisow_lista.jsp" style="color:mintcream">Serwisy </a></li> &nbsp;&nbsp;
                       <li><a href="raport.jsp" style="color:mintcream">Raporty</a></li> &nbsp;&nbsp;
                      <li><a href="edytuj_taryfy.jsp" style="color:mintcream">Taryfy </a></li> &nbsp;&nbsp;
                    <li><a href="userprofile.jsp" style="color:mintcream">Profil </a></li> &nbsp;&nbsp;
                    <li><a href="logout.jsp" style="color:mintcream">Wyloguj </a></li> &nbsp;&nbsp;


                </div>
            </div>
        </div>
        <%}else if (grupa.equals("3")) {%>
        <div class="back">
            <div class="logo">
                <img src="image/logo.png" >
                
            </div>
            <div class="menu1">
       Witaj <% out.print(imienazwisko); %>
                <div style="margin-top: 15px; margin-left: 20px;">
                    <li><a href="wypozyczenia_lista.jsp" style="color:mintcream">Wypozyczenia </a></li> &nbsp;&nbsp;
                    <li><a href="samochody_lista.jsp" style="color:mintcream">Samochody </a></li> &nbsp;&nbsp;
                    <li><a href="uzytkownicy_lista.jsp" style="color:mintcream">Uzytkownicy </a></li> &nbsp;&nbsp;
                    <li><a href="h_serwisow_lista.jsp" style="color:mintcream">Serwisy </a></li> &nbsp;&nbsp;
                    <li><a href="userprofile.jsp" style="color:mintcream">Profil </a></li> &nbsp;&nbsp;
                    <li><a href="logout.jsp" style="color:mintcream">Wyloguj </a></li> &nbsp;&nbsp;


                </div>
            </div>
        </div>
        <%}
        %>






    </body>
</html>
