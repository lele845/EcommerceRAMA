<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1="create table users(email varchar(100)primary key, password varchar(100),name varchar(100), surname varchar(100), mobileNumber bigint, securityQuestion varchar(200), answer varchar(100))";
	System.out.print(q1);
	st.execute(q1);
	System.out.print("Table created");
	con.close();
}
catch(Exception e)
{
	System.out.print(e);	
}
%>