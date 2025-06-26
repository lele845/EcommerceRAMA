<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<%@page import="java.nio.channels.ConnectionPendingException"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<title>Add New Product</title>
<!--  <meta name='viewport' content='width=device-width, initial-scale=1'>-->

<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i style='font-size:24px' class='fas' >&#xf060 Indietro</i></a></h2>
<%
String id=request.getParameter("id");
try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where id='"+id+"'");
	while(rs.next()){
%>
<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<div class="left-div">
 <h3>Inserisci Nome</h3>
<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required>
<hr>
</div>

<div class="right-div">
<h3>Inserisci Categoria</h3>
<input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>" required>
<hr>
</div>

<div class="left-div">
<h3>Inserisci Prezzo</h3>
 <input class="input-style" type="number" name="price" value="<%=rs.getString(4)%>" required>
<hr>
</div>

<div class="right-div">
<h3>Attivo</h3>
<select class="input-style" name="active">
<option value="Si">SI</option>
<option value="No">NO</option>
</select>
 <hr>
</div>

<button class="button">Salva<i class='far'>&#xf058</i></button> 
 <!-- <button style='font-size:24px'>Salva <i class='far fa-check-circle'></i> -->
</form>
<%
	}
}catch(Exception e){
	
	System.out.println(e);
}%>

</body>
<br><br><br>
</body>
</html>