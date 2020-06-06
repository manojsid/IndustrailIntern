<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%String BranchID=request.getParameter("BranchID");%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>View Receivers </FONT></B>
<A HREF="Receivers0.jsp" target="ResultFrame" ><img align=right border="0" name="AddReceivers" src="Images/AddReceiver0.jpg" onmouseover="document['AddReceivers'].src='Images/AddReceiver1.jpg'" onmouseout="document['AddReceivers'].src='Images/AddReceiver0.jpg'" ></A>
<HR>
<br><br>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from receivers,consignmentbooking Where consignmentbooking.CCN=receivers.CCN and consignmentbooking.Status like '%Received%'" ;
			System.out.println(Query);
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">ReceiversID</th>
							<th align="left">CCN</th>
							<th align="left">ReceiversName</th>
							<th align="left">ReceiversPhoneNo</th>
							<th align="left">BookedAtBranch</th>
							<th align="left">MaterialDescription</th>
							<th align="left">NoOfItems</th>
							<th align="left">DateOfReceive</th>
							<th align="left">NameOfReceiver</th>
							<th align="left">Relation</th>
							<th align="left">DispatcherName</th>
							<th align="left">DispatcherID</th>
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
						<td><%=rs.getString(9)%></td>
						<td><%=rs.getString(10)%></td>
						<td><%=rs.getString(11)%></td>
						<td><%=rs.getString(12)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
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


