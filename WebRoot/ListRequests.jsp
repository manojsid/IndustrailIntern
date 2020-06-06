

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
<title>List Requests</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val,txt4Val,txt5Val,txt6Val)
{
		var txt = window.opener.document.forms(0).RequestID;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).DealerName;
		txt1.value=txt1Val;
		var txt2 = window.opener.document.forms(0).PhoneNo;
		txt2.value = txt2Val;
		var txt3 = window.opener.document.forms(0).BranchAddress;
		txt3.value=txt3Val;
		var txt4 = window.opener.document.forms(0).Pincode;
		txt4.value=txt4Val;
		var txt5 = window.opener.document.forms(0).BranchLocation;
		txt5.value=txt5Val;
		var txt6 = window.opener.document.forms(0).DateOfApply;
		txt6.value=txt6Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h3 align=center>List of Requests applied for DealerShip</h3>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String RequestID,DealerName,BranchLocation,OfficeAddress,Pincode;
String ApplicantName,PhoneNo;
Date DateOfApply;
float AmountDeposited;
System.out.println("--1---");

try
{

	/*Getting the connection variable from session*/

	con = com.couriersystem.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from dealershiprequests Where Status='Applied'";
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
        <th align="center">RequestID</th>
		<th align="center">ApplicantName</th>
		<th align="center">PhoneNo</th>
		<th align="center">DateOfApply</th>
		<th align="center">AmountDeposited</th>
		<th align="center">OfficeAddress</th>
		<th align="center">Pincode</th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   RequestID=rs.getString(1);
	   ApplicantName=rs.getString(2);
	   PhoneNo=rs.getString(4);
	   DateOfApply=rs.getDate(5);
	   AmountDeposited=rs.getFloat(6);
	   OfficeAddress=rs.getString(8);
	   BranchLocation=rs.getString(7);
	   Pincode=rs.getString(9);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=RequestID%>','<%=ApplicantName%>','<%=PhoneNo%>','<%=OfficeAddress%>',
		'<%=Pincode%>','<%=BranchLocation%>','<%=DateOfApply%>')"><%=RequestID%></a></td>
		<td><%=ApplicantName%></td>
		<td><%=PhoneNo%></td>
		<td><%=DateOfApply%></td>
		<td><%=AmountDeposited%></td>
		<td><%=OfficeAddress%></td>
		<td><%=Pincode%></td>
		
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

