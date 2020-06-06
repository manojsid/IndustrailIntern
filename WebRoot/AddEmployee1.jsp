<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
	<B><FONT COLOR="#B70226" face='verdana'>Add Employ Details</FONT></B>
	<A HREF="ViewBranches1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewBranch" src="Images/ViewBranches0.jpg" onmouseover="document['ViewBranch'].src='Images/ViewBranches1.jpg'" onmouseout="document['ViewBranch'].src='Images/ViewBranches0.jpg'" ></A>
	<A HREF="ViewEmploy0.jsp" target="ResultFrame" ><img align=right border="0" name="ViewEmployee" src="Images/ViewEmployee0.jpg" onmouseover="document['ViewEmployee'].src='Images/ViewEmployee1.jpg'" onmouseout="document['ViewEmployee'].src='Images/ViewEmployee0.jpg'" ></A>
	<A HREF="AddDealerShipRequest0.jsp" target="ResultFrame" ><img align=right border="0" name="PlaceRequest" src="Images/PlaceRequest0.jpg" onmouseover="document['PlaceRequest'].src='Images/PlaceRequest1.jpg'" onmouseout="document['PlaceRequest'].src='Images/PlaceRequest0.jpg'" ></A>
	<HR>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String EmpID ="";
	MyFunctions MF = new MyFunctions();
	EmpID= MF.genNextID("employeemaster","EmpID","SA0001");
	String EmployeeName = request.getParameter("EmployeeName");
	String Role = request.getParameter("Role");	
	String BranchID = request.getParameter("BranchID");	
	String BranchName = request.getParameter("BranchName");	
	String BranchLocation = request.getParameter("BranchLocation");
	String DateOfJoin = request.getParameter("DateOfJoin");
	String Salary = request.getParameter("Salary");	
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			String Query = "Insert into employeemaster values('"+EmpID+"','"+EmployeeName+"','"+Role+"','"+BranchID+"','"+BranchName+"','"+BranchLocation+"','"+DateOfJoin+"',"+Salary+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h6 align=center>Details of employ stored sucessfully</h6><%
			}
			else{
				%><h6 align=center>Error in updating..please try again</h6><% 
			}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>
