<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
String BranchID=request.getParameter("BranchID");
%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
	<B><FONT COLOR="#B70226" face='verdana'>View Employees </FONT></B>
	<A HREF="ViewBranches1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewBranch" src="Images/ViewBranches0.jpg" onmouseover="document['ViewBranch'].src='Images/ViewBranches1.jpg'" onmouseout="document['ViewBranch'].src='Images/ViewBranches0.jpg'" ></A>
	<A HREF="AddEmployee0.jsp" target="ResultFrame" ><img align=right border="0" name="AddEmployee" src="Images/AddEmployee0.jpg" onmouseover="document['AddEmployee'].src='Images/AddEmployee1.jpg'" onmouseout="document['AddEmployee'].src='Images/AddEmployee0.jpg'" ></A>
	<HR>	
<BR>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from employeemaster where BranchID='"+BranchID+"'";
			rs = stmt.executeQuery(Query);
			%>
				<table align="center" width="70%">
				<tr class=row_title>
				<th align="left">EmpID</th>
				<th align="left">EmployeeName</th>
				<th align="left">Role</th>
				<th align="left">BranchID</th>
				<th align="left">BranchName</th>
				<th align="left">BranchLocation</th>
				<th align="left">DateOfJoin</th>
				<th align="left">Salary</th>
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


