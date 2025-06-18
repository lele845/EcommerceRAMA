
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp" method="post">
     <input type="email" name="email" placeholder="ENTER EMAIL" required>
     <input type="password" name="password" placeholder="ENTER PASSWORD" required>
     <input type="submit" value="Login">
     </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
	String msg=request.getParameter("msg");
	if("notexist".equals(msg)){
	%>
	<h2>Email o Password sbagliati</h2>
	<%} 
	if("invalid".equals(msg)){
	%>
	<h2>Qualcosa è andato storto... riprova!</h2>
	<%} %>
	    <h2>EFFETTUA IL LOGIN</h2>
    <p>RA MA. Essential Clothing for Man</p>
  </div>
</div>

</body>
</html>