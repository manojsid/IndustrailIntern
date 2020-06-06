

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
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

String ShipperName="",BranchName="",CCN="",AssignedTo="",ReceiverName="",DispatcherID="",RecAddress="",RecPhoneNo="";
Date DateOfBooking=null;
System.out.println("--1---");

try
{

	/*Getting the connection variable from session*/

	con = com.couriersystem.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Query = "Select * from dispatches,consignmentbooking where dispatches.CCN=consignmentbooking.CCN and consignmentbooking.Status like '%Dispatched%'";
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
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val,txt4Val,txt5Val)
{	  
		var txt = window.opener.document.forms(0).CCN;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).ReceiversName;
		txt1.value = txt1Val;
		var txt2 = window.opener.document.forms(0).ReceiversPhoneNo;
		txt2.value = txt2Val;
		var txt3 = window.opener.document.forms(0).BookedAt;
		txt3.value = txt3Val;
		var txt4 = window.opener.document.forms(0).DispatcherName;
		txt4.value = txt4Val;
		var txt5 = window.opener.document.forms(0).DispatcherID;
		txt5.value = txt5Val;
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
		<th align="center">BranchName</th>
		<th align="center">ReceiverName</th>
		<th align="center">AssignedTo</th>
<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   CCN=rs.getString(2);
	   BranchName=rs.getString(3);
	   ReceiverName=rs.getString(7);
	   RecPhoneNo=rs.getString(8);
	   DispatcherID=rs.getString(11);
	   AssignedTo=rs.getString(10);
	  DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href="#" onclick="sendInfo('<%=CCN%>','<%=ReceiverName%>','<%=RecPhoneNo%>','<%=BranchName%>','<%=AssignedTo%>','<%=DispatcherID%>')">
		<%=CCN%></a></td>
		<td><%=BranchName%></td>
		<td><%=ReceiverName%></td>
		<td><%=AssignedTo%></td>
		
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

