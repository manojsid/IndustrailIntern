<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>
<% String BranchAddress=request.getParameter("BranchAddress");
   String PhoneNo=request.getParameter("PhoneNo");	
   String BranchID=request.getParameter("BranchID");
%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Edit Branch Details</FONT></B>
<A HREF="AddEmployee0.jsp" target="ResultFrame" ><img align=right border="0" name="AddEmployee" src="Images/AddEmployee0.jpg" onmouseover="document['AddEmployee'].src='Images/AddEmployee1.jpg'" onmouseout="document['AddEmployee'].src='Images/AddEmployee0.jpg'" ></A>
<A HREF="ViewBranches1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewBranch" src="Images/ViewBranches0.jpg" onmouseover="document['ViewBranch'].src='Images/ViewBranches1.jpg'" onmouseout="document['ViewBranch'].src='Images/ViewBranches0.jpg'" ></A>
<HR>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null,stmt1=null;
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "update branches set BranchAddress='"+BranchAddress+"',PhoneNo='"+PhoneNo+"' where BranchID='"+BranchID+"'";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
                       %><h6 align=center>Branch details updated sucessfully</h6><%
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
