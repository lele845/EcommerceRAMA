<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<title>Profilo</title>
<style>
hr
{width:40%;}</style>
</head>

<body>


<%
if("utente".equals(email)){
%>	

<h2>Per accedere a quest'area è necessario effetture il <a id="link" href="login.jsp">login</a>.</h2>	


<%
}else{
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select *from users where email='"+email+"'");
		while(rs.next()){
	%>
	
	<div class="myprofile">
	
	<h1>Ciao <%=rs.getString(3) %>!</h1>
				<h2><a href="myOrders.jsp">I Miei Ordini  <i class='r'></i></a></h2> <br>
	            <h2><a href="changeDetails.jsp">Modifica Dati <i class=""></i></a></h2>
	
	<!--  <h3>Email: <%=rs.getString(1) %> </h3>
	 <h3>Telefono: <%=rs.getString(5) %></h3>
	 <h3>Indirizzo: <%=rs.getString(8) %></h3>
	      <br>
	      <br>
	 -->
	<%}
	}catch(Exception e){
		System.out.println(e);
	}
}%>

</div>
</body>



</html>