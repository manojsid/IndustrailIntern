

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
String CCN=request.getParameter("CCN");
%>
<HTML>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
<title>List Materials</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val,txt2Val)
{		var txt = window.opener.document.forms(0).MaterialDescription;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).NoOfItems;
		txt1.value = txt1Val;
		var txt2 = window.opener.document.forms(0).DateOfBooking;
		txt2.value = txt2Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h3 align=center>Material Description </h3>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String MaterialDescription,NoOfItems,Category;
Date DateOfBooking;
System.out.println("--1---");

try
{

	/*Getting the connection variable from session*/

	con = com.couriersystem.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from consignmentbooking where CCN='"+CCN+"'";
	System.out.println(Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>


<%
if(rs!=null)
{
//System.out.println("Resultset is not null");

%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->

	<table class=notebook align=center>

	<tr class=row_title>
        <th align="center">MaterialDescription</th>
		<th align="center">NoOfItems</th>
		<th align="center">Category</th>
		
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   MaterialDescription=rs.getString(6);
	   NoOfItems=rs.getString(7);
	   Category=rs.getString(16);
	   DateOfBooking=rs.getDate(11);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=MaterialDescription%>','<%=NoOfItems%>','<%=DateOfBooking%>')"><%=MaterialDescription%></a></td>
		<td><%=NoOfItems%></td>
		<td><%=Category%></td>
		
		
	<%
	}


	rs.close();
	
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=6>No Records found</th></tr>

		</CENTER>
	<%

}

}
%>




</table>
</form>
</BODY>
</HTML>

