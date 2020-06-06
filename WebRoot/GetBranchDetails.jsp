

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
String BranchID=(String)session.getAttribute("BranchID");
String Destination=request.getParameter("Destination");

%>
<HTML>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
<title>List Branches</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val)
{		var txt = window.opener.document.forms(0).DeliveredAtBranch;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).DealerName;
		txt1.value = txt1Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h3 align=center>List of Branches </h3>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String DealerName,BranchLocation,BranchAddress;
System.out.println("--1---");

try
{

	/*Getting the connection variable from session*/

	con = com.couriersystem.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from branches where BranchAddress='"+Destination+"'" ;
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
        <th align="center">BranchID</th>
		<th align="center">DealerName</th>
		<th align="center">BranchLocation</th>
		<th align="center">BranchAddress</th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   BranchID=rs.getString(1);
	   DealerName=rs.getString(3);
	   BranchLocation=rs.getString(5);
	   BranchAddress=rs.getString(7);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=BranchAddress%>','<%=DealerName%>')"><%=BranchID%></a></td>
		<td><%=DealerName%></td>
		<td><%=BranchLocation%></td>
		<td><%=BranchAddress%></td>
		
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

