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
<B><FONT COLOR="#B70226" face='verdana'>View Deliveries </FONT></B>
<A HREF="Deliveries0.jsp" target="ResultFrame" ><img align=right border="0" name="AddDeliveries" src="Images/AddDeliveries0.jpg" onmouseover="document['AddDeliveries'].src='Images/AddDeliveries1.jpg'" onmouseout="document['AddDeliveries'].src='Images/AddDeliveries0.jpg'" ></A>
<HR>
<br>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from deliveries Where BookedAtBranch='"+BranchID+"'";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">DeliveryID</th>
							<th align="left">CCN</th>
							<th align="left">BookedAtBranch</th>
							<th align="left">ShipperName</th>
							<th align="left">DeliveredAtBranch</th>
							<th align="left">DealerName</th>
							<th align="left">DateOfDelivery</th>
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


