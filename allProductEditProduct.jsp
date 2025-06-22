<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html">
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
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
<div style="color: white; text-align: center; font-size: 30px;">Modifica Prodotti <i class='bi bi-pencil-fill'></i></div>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Prodotto aggiornato!</h3>
<%} %>
<%if("wrong".equals(msg)){
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
            <th>Stato</th>
            <th scope="col">Modifica <i class='bi bi-pencil-fill'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select *from product");
    	   while(rs.next())
    	   {
       %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="bi bi-currency-euro"></i> <%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Modifica <i class='bi bi-pencil-fill'></i></a></td>
          </tr>
         <%
         }
         }
         catch(Exception e){
        	 System.out.println(e);
         }%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>