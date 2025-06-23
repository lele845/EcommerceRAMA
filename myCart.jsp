<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Carrello <i class='bi bi-cart'></i></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">E' solo una! Clicca su rimuovi!</h3>
<%} %>
<%if("inc".equals(msg))
{ %>
<h3 class="alert">Quantità Incrementata!</h3>
<%} %>
<%if("dec".equals(msg))
{ %>
<h3 class="alert">Quantità Decrementata!</h3>
<%} %>
<%if("removed".equals(msg))
{ %>
<h3 class="alert">Prodotto Rimosso!</h3>
<%} %>
<table>
<thead>
<%
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next()){
		total=rs1.getInt(1);
	}
%>
          <tr>
            <th scope="col" style="background-color: yellow;">Totale: <i class="bi bi-currency-euro"><%out.println(total); %></i> </th>
            <%if(total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp">Procedi all'ordine</a></th> <%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Nome</th>
            <th scope="col">Categoria</th>
            <th scope="col"><i class="bi bi-currency-euro"></i> Prezzo</th>
            <th scope="col">Quantità</th>
            <th scope="col">Parziale</th>
            <th scope="col">Rimuovi <i class='bi bi-trash3'></i></th>
          </tr>
        </thead>
        <tbody>
      <%ResultSet rs=st.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
      while(rs.next()){
      %>
          <tr>
		<%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="bi bi-currency-euro"></i><%=rs.getString(4) %> </td>
            <td><a href="incDecQuantityAction.jsp?id=<%= rs.getString(1)%>&quantity=inc"><i class='bi bi-plus'></i></a> <%=rs.getString(8) %>  <a href="incDecQuantityAction.jsp?id=<%= rs.getString(1)%>&quantity=dec"><i class='bi bi-dash'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10) %> </td>
            <td><a href="removeFromCart.jsp?id=<%= rs.getString(1)%>">Remove <i class='bi bi-trash3'></i></a></td>
          </tr>
<%}
}catch(Exception e){
	
} 
      %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>