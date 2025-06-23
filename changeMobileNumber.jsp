<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Cambia Numero di Telefono</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Numero di Telefono Modificato!</h3>
<%} %>
<%
if("wrong".equals(msg)){
%>
<h3 class="alert">La Password è sbagliata!</h3>
<%} %>

<form action="changeMobileNumberAction.jsp" method="post">
 <h3>Inserisci Nuovo Numero di Telefono</h3>
 <input class="input-style" type="number" name="mobileNumber" placeholder="TELEFONO" required>
 <hr>
<h3>Inserisci Password</h3>
 <input class="input-style" type="password" name="password" placeholder="PASSWORD" required>
<hr>
<button class="button" type="submit">Salva <i class='far fa-arrow-alt-circle-right'></i></button>
</form>

</body>
<br><br><br>
</html>