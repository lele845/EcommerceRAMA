<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Cambia Domanda di Sicurezza</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Domanda di Sicurezza Modificata!</h3>
<%} %>
<%if("wrong".equals(msg)){ %>
<h3 class="alert">La Password è sbagliata!</h3>
<%} %>

<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Seleziona la nuova Domanda di Sicurezza</h3>
  <select class="input-style" name="securityQuestion">
  <option value="Qual è stata la marca della tua prima auto?">Qual è stata la marca della tua prima auto?</option>
  <option value="Qual è stato il nome del tuo primo animale?">Qual è stato il nome del tuo primo animale?</option>
  <option value="Quale scuola elementare hai frequentato?">Quale scuola elementare hai frequentato?</option>
  <option value="Qual è il nome della città dove vorresti vivere?">Qual è il nome della città dove vorresti vivere?</option>
  
  </select>
 <hr>
 <h3>Inserisci Risposta</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="RISPOSTA" required>
<hr>
<h3>Inserisci Password</h3>
 <input class="input-style" type="password" name="password" placeholder="PASSWORD" required>
<hr>
 <button class="button" type="submit">Salva <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>