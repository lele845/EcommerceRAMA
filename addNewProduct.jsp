<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Aggiungi Prodotto</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Prodotto Aggiunto con Successo!</h3>
<%} %>

<%if("wrong".equals(msg)){
%>
<h3 class="alert">Qualcosa è andato stroto! Riprova!</h3>
<%} %>
<%
int id=1;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from product");
	while(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}
	
}catch(Exception e){}

%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: #F1B24A;">ID Prodotto: <%out.println(id); %> </h3>
<input type="hidden" name="id" value="<%out.println(id); %>">

<div class="left-div">
 <h3>Inserisci Nome</h3>
 <input class="input-style" type="text" name="name" placeholder="NOME" required>
<hr>
</div>

<div class="right-div">
<h3>Inserisci Categoria</h3>
  <input class="input-style" type="text" name="category" placeholder="CATEGORIA" required>
<hr>
</div>

<div class="left-div">
<h3>Inserisci Prezzo</h3>
  <input class="input-style" type="number" name="price" placeholder="PREZZO" required>
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
 <button class="button">Salva <i class='bi bi-check-circle'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>