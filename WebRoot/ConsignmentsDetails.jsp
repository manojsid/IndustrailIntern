

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>
<jsp:directive.page import="java.util.Random;"/>

<%
String DealerName=(String)session.getAttribute("userr");
String BranchID = (String)session.getAttribute("BranchID");
%>
<HTML>
<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
<title>List Consignments</title>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String ShipperName="",BookedAtBranch="",CCN="",ShipperAddress="",ReceiverName="",PhoneNo="",RecAddress="",RecPhoneNo="";
Date DateOfBooking=null;
System.out.println("--1---");

try
{

	/*Getting the connection variable from session*/

	con = com.couriersystem.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from consignmentbooking,deliveries where deliveries.DeliveredAtBranch=consignmentbooking.Destination and consignmentbooking.Status like '%Delivered%'";
	System.out.println(Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
	%><%=e%><%
}

%>
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val,txt4Val,txt5Val,txt6Val,txt7Val)
{	  
		var txt = window.opener.document.forms(0).CCN;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).BranchName;
		txt1.value = txt1Val;
		var txt2 = window.opener.document.forms(0).ShipperName;
		txt2.value = txt2Val;
		var txt3 = window.opener.document.forms(0).PhoneNo;
		txt3.value = txt3Val;
		var txt4 = window.opener.document.forms(0).SenderAddress;
		txt4.value = txt4Val;
		var txt5 = window.opener.document.forms(0).ReceiverName;
		txt5.value = txt5Val;
		var txt6 = window.opener.document.forms(0).RecPhoneNo;
		txt6.value = txt6Val;
		var txt7 = window.opener.document.forms(0).RecAddress;
		txt7.value = txt7Val;
		window.close();
}

//-->
</SCRIPT>
</HEAD>

<body class="SC">

<h3 align=center>List of Consignments </h3>
<form name=cons>
<center><input type=button value=close onclick="window.close()"></center>

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
        <th align="center">CCN</th>
		<th align="center">ShipperName</th>
		<th align="center">BookedAtBranch</th>
		<th align="center">ReceiverName</th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   CCN=rs.getString(2);
	   ShipperName=rs.getString(3);
	   BookedAtBranch=rs.getString(9);
	   ShipperAddress=rs.getString(4);
	   PhoneNo=rs.getString(5);
	   ReceiverName=rs.getString(13);
	   RecAddress=rs.getString(14);
	   RecPhoneNo=rs.getString(15);
	   System.out.println(CCN);
	   System.out.println(ShipperName);
	   System.out.println(BookedAtBranch);
	   System.out.println(ShipperAddress);
	   System.out.println(PhoneNo);
	   System.out.println(ReceiverName);
	   System.out.println(RecAddress);
	   System.out.println(RecPhoneNo);
	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=CCN%>','<%=BookedAtBranch%>','<%=ShipperName%>','<%=PhoneNo%>','<%=ShipperAddress%>','<%=ReceiverName%>','<%=RecPhoneNo%>','<%=RecAddress%>')">
		<%=CCN%></a></td>
		<td><%=ShipperName%></td>
		<td><%=BookedAtBranch%></td>
		<td><%=ReceiverName%></td>
		
	<%
	}


	rs.close();
	
if(DisRow==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<center><tr><th colspan=6>No Records found</th></tr></center>
	<%

}

}
%>




</table>
</form>
</BODY>
</HTML>

