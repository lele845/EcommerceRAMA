<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">I Miei Ordini <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Nome Prodotto</th>
            <th scope="col">Categoria</th>
            <th scope="col"><i class="bi bi-currency-euro"></i>  Prezzo</th>
            <th scope="col">Quantita'</th>
            <th scope="col"><i class="bi bi-currency-euro"></i> Parziale</th>
            <th scope="col">Data dell'Ordine</th>
             <th scope="col">Consegna Prevista</th>
             <th scope="col">Metodo di Pagamento</th>
              <th scope="col">Stato</th>
              
          </tr>
        </thead>
        <tbody>
<%
int sno=0;
try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
	while(rs.next()){
		sno=sno+1;
%>
          <tr>
            <td><%out.println(sno);%></td>
            <td><%=rs.getString(17) %></td>
            <td><%=rs.getString(18) %></td>
            <td><i class="bi bi-currency-euro"></i> <%=rs.getString(19) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="bi bi-currency-euro"></i><%=rs.getString(5) %> </td>
             <td><%=rs.getString(11) %></td>
              <td><%=rs.getString(12) %></td>
               <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(15) %></td>
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