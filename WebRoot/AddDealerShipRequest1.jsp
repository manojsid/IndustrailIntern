<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Place DealerShip Request</FONT></B>
<A HREF="AddEmployee0.jsp" target="ResultFrame" ><img align=right border="0" name="AddEmployee" src="Images/AddEmployee0.jpg" onmouseover="document['AddEmployee'].src='Images/AddEmployee1.jpg'" onmouseout="document['AddEmployee'].src='Images/AddEmployee0.jpg'" ></A>
<A HREF="ViewBranches1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewBranch" src="Images/ViewBranches0.jpg" onmouseover="document['ViewBranch'].src='Images/ViewBranches1.jpg'" onmouseout="document['ViewBranch'].src='Images/ViewBranches0.jpg'" ></A>
<A HREF="EditBranch0.jsp" target="ResultFrame" ><img align=right border="0" name="EditBranch" src="Images/EditBranch0.jpg" onmouseover="document['EditBranch'].src='Images/EditBranch1.jpg'" onmouseout="document['EditBranch'].src='Images/EditBranch0.jpg'" ></A>
<HR>
<br><br>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String RequestID = "";
	MyFunctions MF = new MyFunctions();
	RequestID= MF.genNextID("dealershiprequests","RequestID","R000");
	String ApplicantName = request.getParameter("ApplicantName");	
	String ApplicantAddress = request.getParameter("ApplicantAddress");
	String PhoneNo = request.getParameter("PhoneNo");	
	String DateOfApply = request.getParameter("DateOfApply");	
	String AmountDeposited = request.getParameter("AmountDeposited");
	String BranchLocation = request.getParameter("BranchLocation");	
	String OfficeAddress = request.getParameter("OfficeAddress");	
	String Pincode = request.getParameter("Pincode");	
	String Status = "Applied";	
	try{
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
				
			String Query = "Insert into dealershiprequests values('"+RequestID+"','"+ApplicantName+"','"+ApplicantAddress+"','"+PhoneNo+"','"+DateOfApply+"',"+AmountDeposited+",'"+BranchLocation+"','"+OfficeAddress+"','"+Pincode+"','"+Status+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><h6 align=center>Request Placed sucessfully</h6><%
			}
			else{
				%><h2 align=center>Error in updating..please try again</h2><% 
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


