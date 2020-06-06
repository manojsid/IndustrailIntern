<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Add Branch Details</FONT></B>
<A HREF="ViewBranches.jsp" target="ResultFrame" ><img align=right border="0" name="Edit" src="Images/ViewBranches0.jpg" onmouseover="document['Edit'].src='Images/ViewBranches1.jpg'" onmouseout="document['Edit'].src='Images/ViewBranches0.jpg'" ></A>
<HR>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null,stmt1=null;
	String BranchID = "";
	MyFunctions MF = new MyFunctions();
	BranchID= MF.genNextID("branches","BranchID","B000");
	
	String RequestID = request.getParameter("RequestID");
	String DealerName = request.getParameter("DealerName");	
	String BranchName = request.getParameter("BranchName");	
	String BranchLocation = request.getParameter("BranchLocation");
	String Pincode = request.getParameter("Pincode");	
	String BranchAddress = request.getParameter("BranchAddress");
	String PhoneNo = request.getParameter("PhoneNo");	
	String Auth="1";
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			con.setAutoCommit(false);
			stmt =  con.createStatement();
			String Query = "Insert into branches values('"+BranchID+"','"+RequestID+"','"+DealerName+"','"+BranchName+"','"+BranchLocation+"','"+Pincode+"','"+BranchAddress+"','"+PhoneNo+"')";
			System.out.println(Query);
			String Query1 = "Insert into login values('"+DealerName+"','"+DealerName+"','"+Auth+"') ";
			System.out.println("-->"+Query1);
			String Query2 = "update dealershiprequests set Status='Granted' where RequestID='"+RequestID+"'";
			System.out.println("-->"+Query2);

			stmt.addBatch(Query);
			stmt.addBatch(Query1);
			stmt.addBatch(Query2);
			int[] result = stmt.executeBatch();
			boolean successFlag = false;
			for(int i=0;i<result.length;i++){
				if(result[i]<1)
				{
					System.out.println("result[i]-->"+result[i]);
					successFlag = false;
					break;
				}else{
					successFlag = true;
				}
			}
			if( successFlag == true)
			{
				con.commit();
				%><h6 align=center>Branch details added sucessfully</h6><%
			}
			else{
				con.rollback();
				%><h6 align=center>Error in updating..please try again</h6><% 
			}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			%><%%><%
		}
	
%>
</BODY>
