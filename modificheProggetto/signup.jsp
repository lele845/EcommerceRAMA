<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="signupAction.jsp" method="post">
  
  <input type="text" name="email" placeholder="EMAIL" required>
  <input type="password" name="password" placeholder="PASSWORD" required>
  <input type="text" name="name" placeholder="NOME" required>
  <input type="text" name="surname" placeholder="COGNOME" required>
  <input type="number" name="mobileNumber" placeholder="TELEFONO" required>
  
  <select name ="securityQuestion" required>
  <option value="Qual è stata la marca della tua prima auto?">Qual è stata la marca della tua prima auto?</option>
  <option value="Qual è stato il nome del tuo primo animale?">Qual è stato il nome del tuo primo animale?</option>
  <option value="Quale scuola elementare hai frequentato?">Quale scuola elementare hai frequentato?</option>
  <option value="Qual è il nome della città dove vorresti vivere?">Qual è il nome della città dove vorresti vivere?</option>
  </select>
  
  <input type="text" name="answer" placeholder="RISPOSTA" required>
  <input type="submit" value="Sign up">
  
  </form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>

    <h2>DIVENTA UN MEMBER RA MA</h2>
    <p>Essential Clothing for Man</p>
 <%
 String msg =request.getParameter("msg");
 if("valid".equals(msg)){
 %>
<h1>Regsitrato con successo!</h1>
<%
response.sendRedirect("login.jsp");
 }
 if("invalid".equals(msg)){
 %>
<h1>Qualcosa è andato storto... riprova!</h1>

<%} %>

  </div>
</div>

</body>
</html>