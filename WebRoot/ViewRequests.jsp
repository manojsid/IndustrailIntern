<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>View DealerShip Requests</FONT></B>
<HR>
<br><br>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
		con = com.couriersystem.ConnectionPool.getConnection();
		stmt =  con.createStatement();
		String Query = "Select * from dealershiprequests Where Status='Applied'";
		System.out.println(Query);
		rs = stmt.executeQuery(Query);
		%>
		<table align="center" width="60%">
		<tr class=row_title>
		<th align="center">RequestID</th>
		<th align="center">ApplicantName</th>
		<th align="center">ApplicantAddress</th>
		<th align="center">PhoneNo</th>
		<th align="center">DateOfApply</th>
		<th align="center">AmountDeposited</th>
		<th align="center">BranchLocation</th>
		<th align="center">OfficeLocation</th>
		<th align="center">Pincode</th>
		</tr>
		<%
		int rCount=0;
		while(rs.next())
		{
		%>
		<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<td align=center><%=rs.getString(1)%></td>
			<td align=center><%=rs.getString(2)%></td>
			<td align=center><%=rs.getString(3)%></td>
			<td align=center><%=rs.getString(4)%></td>
			<td align=center><%=rs.getString(5)%></td>
			<td align=center><%=rs.getString(6)%></td>
			<td align=center><%=rs.getString(7)%></td>
			<td align=center><%=rs.getString(8)%></td>
			<td align=center><%=rs.getString(9)%></td>
			
		</tr>
		<%
			rCount++;
		}
		if( rCount == 0)	{%><tr class="row_even"><td  colspan=7 align=center>Sorry No records Found</td></tr><%}
		rs.close();
		stmt.close();
		con.close();
		}catch(Exception e){
			rs.close();
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>


