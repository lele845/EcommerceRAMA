<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
    <!--Header-->
    <br>
   
   <center><h2>RA MA (Essential Clothing for Man)</h2></center>
    <div class="topnav sticky">
    <%String email=session.getAttribute("email").toString(); %>
            
    	
    	<div class="topnav2 sticky">
    		<a href=""><i class="bi bi-list"></i></a>
    		<a href="home.jsp">Home <i class="bi bi-house"></i></a>
    	</div>
            
            <a href="logout.jsp">Logout <i class='bi bi-box-arrow-left'></i></a>
            <h2><a href=""><%out.println(email); %> <i class='bi bi-person-fill'></i></a></h2>
             <div class="search-container">
            	<form action="searchHome.jsp" method="post">
            		<input type="text" placeholder="Cerca" name="search">
            		<button type="submit"> <i class="bi bi-search"></i> </button>
            	</form>
            
            </div>
            <a href="myCart.jsp">Carrello <i class='bi bi-cart'></i></a>
           <!--  <a href="">My Orders  <i class='r'></i></a>
            <a href="">Change Details <i class=""></i></a>
            <a href="">Message Us <i class=''></i></a>
            <a href="">About <i class=""></i></a>  -->
            
             
               
                
             
            
          </div>
           <br>
           <!--table-->
