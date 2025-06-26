<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Ordini Cancellati</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Ordini Cancellati <i class='bi bi-x-square'></i></div>

<table id="customers">
          <tr>
          <th>Telefono</th>
            <th scope="col">Nome Prodotto</th>
            <th scope="col">Quantita'</th>
             <th scope="col">Taglia</th>
            <th scope="col"><i class="bi bi-currency-euro"></i> Totale</th>
            <th>Indirizzo</th>
            <th>Citta'</th>
            <th>Stato</th>
            <th>Paese</th>
            <th scope="col">Data Ordine</th>
             <th scope="col">Consegna Prevista</th>
             <th scope="col">Metodo di pagamento</th>
              <th scope="col">T-ID</th>
              <th scope="col">Stato</th>
          </tr>
        
       
         <%
       try{
    	   
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Cancel'");
    	   while(rs.next()){
       %> 
        
          <tr>
          <td><%=rs.getString(11) %></td>
            <td><%=rs.getString(18) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(6) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5) %> </td>
                <td><%=rs.getString(7) %></td>
               <td><%=rs.getString(8) %></td>
                <td><%=rs.getString(9) %></td>
                 <td><%=rs.getString(10) %></td>
             <td><%=rs.getString(12) %></td>
              <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(15) %></td>
               <td><%=rs.getString(15) %></td>
              </tr>
        <%}
    	   }catch(Exception e){
    		   System.out.println(e);
    	   }%>
 
        </table>
      <br>
      <br>
      <br>

</body>
</html>