<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Home</title>
<script>
if(window.history.forward(1) != null)
	window.history.forward(1);</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next()){
		total=rs1.getInt(1);
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='bi bi-arrow-left'></i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="bi bi-currency-euro"></i> <%out.println(total); %> </th>
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
          </tr>
        </thead>
        <tbody>
        <%ResultSet rs=st.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
      while(rs.next()){
      %>
          <tr>
          <%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="bi bi-currency-euro"></i> <%=rs.getString(4) %></td>
            <td><%=rs.getString(8) %> </td>
            <td><i class="bi bi-currency-euro"></i><%=rs.getString(10) %> </td>
            </tr>
         <%}
      	ResultSet rs2=st.executeQuery("select *from users where email='"+email+"'");
      	while(rs2.next()){
      %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Indirizzo</h3>
<input class="input-style" type="text" name="address" value="<%=rs2.getString(8)%>" placeholder="INSERISCI INDIRIZZO" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(9)%>" placeholder="INSERISCI CITTA'" required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(10)%>" placeholder="INSERISCI STATO" required>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs2.getString(11)%>" placeholder="INSERISCI PAESE" required>
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Seleziona metodo di pagamento</h3>
<select class="input-style"name="paymentMethod">
	<option value="Alla consegna">Paga alla consegna</option>
	<option value="Online">Paga online</option>
</select>
</div>

<div class="right-div">
<h3>Pay online on this rama@pay.com</h3>
<input class="input-style" type="text" name="transactionID" placeholder="INSERISCI ID CARTA" required>
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobileNumber" value="<%=rs2.getString(5) %>" placeholder="INSERISCI CELLULARE" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">PROCEDI ALLA FATTURA <i class='bi bi-check2-circle'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
      	}
	}

}catch(Exception e){
	System.out.println(e);
}

%>

      <br>
      <br>
      <br>

</body>
</html>