

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
String DealerName=(String)session.getAttribute("userr");
%>
<HTML>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
<title>List Branches</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val,txt2Val)
{
		var txt = window.opener.document.forms(0).BranchID;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).BookedAtBranch;
		txt1.value=txt1Val;
		var txt2 = window.opener.document.forms(0).BranchLocation;
		txt2.value = txt2Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h3 align=center>List of Branches </h3>
<form name="cons">
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String BranchID,BranchName,BranchLocation,BranchAddress,BookedAtBranch;
System.out.println("--1---");

try
{

	/*Getting the connection variable from session*/

	con = com.couriersystem.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from branches  where DealerName='"+DealerName+"'";
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
		<th align="center">BranchName</th>
		<th align="center">BranchLocation</th>
		<th align="center">BranchAddress</th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   BranchID=rs.getString(1);
	   BranchName=rs.getString(4);
	   BranchLocation=rs.getString(5);
	   BranchAddress=rs.getString(7);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=BranchID%>','<%=BranchName%>','<%=BranchLocation%>')"><%=BranchID%></a></td>
		<td><%=BranchName%></td>
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

