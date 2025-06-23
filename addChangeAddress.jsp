<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Aggiungi o Modifica Indirizzo</title>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 class="alert">Indirizzo Modificato !</h3>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Qualcosa è andato storto! Riprova!</h3>
<%} %>

<%
try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from users where email='"+email+"'");
	while(rs.next()){
%>

<form action="addChangeAddressAction.jsp" method="post">
<h3>Inserisci Indirizzo</h3>
 <input class="input-style" type="text" name="address" value="<%=rs.getString(8)%>" placeholder="INDIRIZZO">
 <hr>
 <h3>Inserisci Citta'</h3>
 <input class="input-style" type="text" name="city" value="<%=rs.getString(9)%>" placeholder="CITTA'">
<hr>
<h3>Inserisci Stato</h3>
<input class="input-style" type="text" name="state" value="<%=rs.getString(10)%>" placeholder="STATO">
<hr>
<h3>Inserisci Paese</h3>
<input class="input-style" type="text" name="country" value="<%=rs.getString(11)%>" placeholder="PAESE">
<hr>
<button class="button" type="submit">Salva <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%}
	}catch(Exception e){
		System.out.println(e);
		
	}%>
</body>
<br><br><br>
</html>