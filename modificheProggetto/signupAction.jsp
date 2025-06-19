<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%

String email=request.getParameter("email");
String password=request.getParameter("password");
String name=request.getParameter("name");
String surname=request.getParameter("surname");
String mobileNumber=request.getParameter("mobileNumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String address="";
String city="";
String state="";
String country="";

try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?)");
	ps.setString(1, email);
	ps.setString(2, password);
	ps.setString(3, name);
	ps.setString(4, surname);
	ps.setString(5, mobileNumber);
	ps.setString(6, securityQuestion);
	ps.setString(7, answer);
	/*ps.setString(8, address);
	ps.setString(9, city);
	ps.setString(10, state);
	ps.setString(11, country);*/
	ps.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
}
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>