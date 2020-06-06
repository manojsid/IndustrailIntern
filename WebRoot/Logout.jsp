<!--
	File : Logout.jsp
	

-->
<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<%
	session.removeAttribute("userr");
	session.removeAttribute("connection");
	session.removeAttribute("auth");
	session.invalidate();
	
%>

<Head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
<Title>Reports</Title>
</Head>
<body Class=Log>
<jsp:forward page="CourierSystemHome.html"/>


<font face="Times New Roman" color=blue >
<center>

<BR><BR><BR>

<h2 class=Heading>You have successfully logged out</h2>
<BR><BR>

<!--Link to relogin again-->
<h2 class=Heading><A href="Login.jsp">click here</A>to login in again</h2>
<br><br>
<h2 class=Heading>Have a nice day</h2>

</center>

</font>
</body>
</html>