<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp" method="post">
     	<input type="email" name="email" placeholder="EMAIL" required>
     	<input type="number" name="mobileNumber" placeholder="TELEFONO" required>
     	<select name="securityQuestion">
     	<option value="Qual è stata la marca della tua prima auto?">Qual è stata la marca della tua prima auto?</option>
     	<option value="Qual è stato il nome del tuo primo animale?">Qual è stato il nome del tuo primo animale?</option>
     	<option value="Quale scuola elementare hai frequentato?">Quale scuola elementare hai frequentato?</option>
     	<option value="Qual è il nome della città dove vorresti vivere?">Qual è il nome della città dove vorresti vivere?</option>
     	</select>
     	
     	<input type="text" name="answer" placeholder="RISPOSTA" required>
     	<input type="password" name="newPassword" placeholder="NUOVA PASSWORD" required>
     	<input type="submit" value="Salva">
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  <%
  String msg=request.getParameter("msg");
  if("done".equals(msg)){
  %> 
<h1>Password modificata!</h1>
<%
response.sendRedirect("login.jsp");
  } 
if("invalid".equals(msg)){
%>
<h1>Qualcosa è andato storto! Riprova !</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>