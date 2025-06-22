<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg)){
%>
<h3 class="alert">Aggiunto con successo!</h3>
<%} 
if("exist".equals(msg)){
%>
<h3 class="alert">Prodotto già esistente! Quantità incrementata!</h3>
<%} 
if("invalid".equals(msg)){
%>
<h3 class="alert">Qualcosa è andato storto! Riprova!</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Nome</th>
            <th scope="col">Categoria</th>
            <th scope="col"><i class="bi bi-currency-euro"></i> Prezzo</th>
            <th scope="col">Aggiungi al carrello <i class='bi bi-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>

<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where active='Si'");
	while(rs.next()){
%>

          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="bi bi-currency-euro"></i><%=rs.getString(4) %> </i></td>
            <td><a href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Aggiungi al carrello <i class='bi bi-cart-plus'></i></a></td>
          </tr>
<%}
	}catch(Exception e){
		System.out.println(e);
	}%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>