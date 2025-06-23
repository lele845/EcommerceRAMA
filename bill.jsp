<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
try{
	int total=0;
	int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(rs.next()){
		total=rs.getInt(1);
	}
	ResultSet rs2=st.executeQuery("select *from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(rs2.next()){
%>
<h3>RA MA (Essential Clothing for Man)</h3>
<hr>
<div class="left-div"><h3>Nome:  <%=rs2.getString(3) %></h3></div>
<div class="right-div-right"><h3>Email: <%out.println(email); %> </h3></div>
<div class="right-div"><h3>Telefono: <%=rs2.getString(21) %> </h3></div>  

<div class="left-div"><h3>Data dell'ordine:  <%=rs2.getString(22) %></h3></div>
<div class="right-div-right"><h3>Metodo di Pagamento: <%=rs2.getString(24) %> </h3></div>
<div class="right-div"><h3>Consegna Prevista entro: <%=rs2.getString(23) %> </h3></div> 

<div class="left-div"><h3>ID Carta: <%=rs2.getString(25) %> </h3></div>
<div class="right-div-right"><h3>Città:  <%=rs2.getString(18) %></h3></div> 
<div class="right-div"><h3>Indirizzo: <%=rs2.getString(17) %> </h3></div> 

<div class="left-div"><h3>Stato: <%=rs2.getString(19) %> </h3></div>
<div class="right-div-right"><h3>Paese: <%=rs2.getString(20) %> </h3></div>  

<hr>
<%break;
}
%>

	
	<br>
	
<table id="customers">
<h3>Dettagli</h3>
  <tr>
    <th>S.No</th>
    <th>Nome</th>
    <th>Categoria</th>
    <th>Prezzo</th>
    <th>Quantità</th>
     <th>Parziale</th>
  </tr>
  <%
  ResultSet rs1=st.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
  while(rs1.next()){
	  sno=sno+1;
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(17) %></td>
    <td><%=rs1.getString(18) %></td>
    <td><%=rs1.getString(19) %></td>
    <td><%=rs1.getString(3) %></td>
     <td><%=rs1.getString(5) %></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total: <%out.println(total); %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Ritorna alla home</button></a>
<a onclick="window.print();"><button class="button right-button">Stampa</button></a>
<br><br><br><br>
<%
}catch(Exception e){
	System.out.println(e);
}%>
</body>
</html>