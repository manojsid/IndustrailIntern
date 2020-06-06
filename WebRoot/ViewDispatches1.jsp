<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<%String BranchID=(String)session.getAttribute("BranchID");%>


<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>View Dispatches </FONT></B>
<A HREF="Dispatches0.jsp" target="ResultFrame" ><img align=right border="0" name="AddDispatches" src="Images/AddDispatches0.jpg" onmouseover="document['AddDispatches'].src='Images/AddDispatches1.jpg'" onmouseout="document['AddDispatches'].src='Images/AddDispatches0.jpg'" ></A>
<HR>
<br><br>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from dispatches,employeemaster where dispatches.DispatcherID=employeemaster.EmpID and employeemaster.BranchID='"+BranchID+"'  ";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">DispatchID</th>
							<th align="left">CCN</th>
							<th align="left">BranchName</th>
							<th align="left">ShipperName</th>
							<th align="left">PhoneNo</th>
							<th align="left">SenderAddress</th>
							<th align="left">ReceiverName</th>
							<th align="left">RecPhoneNo</th>
							<th align="left">RecAddress</th>
							<th align="left">AssignedTo</th>
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


