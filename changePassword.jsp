<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg)){
%>
<h3 class="alert">Le password non corrispondono!</h3>
<%} %>
<%if("wrong".equals(msg)){
%>
<h3 class="alert">Password attuale non corretta!</h3>
<%} %>
<%if("done".equals(msg)){
%>
<h3 class="alert">Password modificata!</h3>
<%} %>
<%if("invalid".equals(msg)){
%>
<h3 class="alert">Qualcosa è andato storto riprova!</h3>
<%} %>

<form action="changePasswordAction.jsp" method="post">
<h3>Inserisci la vecchia Password</h3>
<input class="input-style" type="password" name="oldPassword" placeholder="PASSWORD ATTUALE" required> 
  <hr>
 <h3>Inserisci la nuova Password</h3>
<input class="input-style" type="password" name="newPassword" placeholder="NUOVA PASSWORD" required> 
 <hr>
<h3>Conferma Password Password</h3>
<input class="input-style" type="password" name="confirmPassword" placeholder="CONFERMA PASSWORD" required>
<hr>
 <button class="button" type="submit">Salva <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>