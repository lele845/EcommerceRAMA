<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   <%String email=session.getAttribute("email").toString(); %>
            <center><h2 id="adminHeader-style">RA MA (Essential Clothing for Man)</h2></center>
            <a href="addNewProduct.jsp">Aggiungi un nuovo prodotto <i class='bi bi-plus-circle'></i></a>
            <a href="allProductEditProduct.jsp">Modifica Prodotti <i class='bi bi-pencil-fill'></i></a>
            <a href="messagesReceived.jsp">Messaggi Ricevuti <i class='bi bi-chat-left'></i></a>
            <a href="ordersReceived.jsp">Ordini Ricevuti <i class='bi bi-list'></i></a>
            <a href="cancelOrders.jsp">Ordini Cancellati <i class='bi bi-x-square'></i></a>
            <a href="deliveredOrders.jsp">Ordini Spediti <i class='bi bi-truck'></i></a>
            <a href="../logout.jsp">Logout <i class='bi bi-box-arrow-left'></i></a>
          </div>
           <br>
           <!--table-->
