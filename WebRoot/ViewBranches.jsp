<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>View Branches</FONT></B>
<HR>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
		con = com.couriersystem.ConnectionPool.getConnection();
		stmt =  con.createStatement();
		String Query = "Select * from branches";
		rs = stmt.executeQuery(Query);
		%>
		<table align="center" width="60%">
		<tr class=row_title>
		<th align="left">BranchID</th>
		<th align="left">RequestID</th>
		<th align="left">DealerName</th>
		<th align="left">BranchName</th>
		<th align="left">BranchLocation</th>
		<th align="left">PinCode</th>
		<th align="left">BranchAddress</th>
		<th align="left">PhoneNo</th>
		</tr>
		<%
		int rCount=0;
		while(rs.next())
		{
		%>
		<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
		</tr>
		<%
			rCount++;
		}
		if( rCount == 0)	{%><tr class="row_even"><td  colspan=7 align=center>Sorry No records Found</td></tr><% }
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


