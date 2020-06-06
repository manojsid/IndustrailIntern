<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Add Dispatches </FONT></B>
<A HREF="ViewDispatches1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewDispatches" src="Images/ViewDispatches0.jpg" onmouseover="document['ViewDispatches'].src='Images/ViewDispatches1.jpg'" onmouseout="document['ViewDispatches'].src='Images/ViewDispatches0.jpg'" ></A>
<HR>
<br><br>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String DispatchID ="";
	MyFunctions MF = new MyFunctions();
	DispatchID= MF.genNextID("dispatches","DispatchID","D000");
	String CCN = request.getParameter("CCN");	
	String BranchName = request.getParameter("BranchName");	
	String ShipperName = request.getParameter("ShipperName");
	String PhoneNo = request.getParameter("PhoneNo");	
	String SenderAddress = request.getParameter("SenderAddress");
	
	String ReceiverName = request.getParameter("ReceiverName");	
	String RecPhoneNo = request.getParameter("RecPhoneNo");	
	String RecAddress = request.getParameter("RecAddress");	
	String AssignedTo = request.getParameter("AssignedTo");	
	String DispatcherID = request.getParameter("DispatcherID");	
	String Status ="Dispatched";	
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			con.setAutoCommit(false);
			stmt =  con.createStatement();
			String Query = "Insert into dispatches values('"+DispatchID+"','"+CCN+"','"+BranchName+"','"+ShipperName+"',"+PhoneNo+",'"+SenderAddress+"','"+ReceiverName+"',"+RecPhoneNo+",'"+RecAddress+"','"+AssignedTo+"','"+DispatcherID+"','"+Status+"')";
			System.out.println("-->"+Query);
			String Query1 = "Update consignmentbooking set Status='Consignment Dispatched by "+AssignedTo+"' where CCN = '"+CCN+"'";
			System.out.println("-->"+Query1);
			stmt.addBatch(Query);
			stmt.addBatch(Query1);
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
				%><h6 align=center>Consignment booked sucessfully</h6><%
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
			%><%=e%><%
		}
	
%>
</BODY>
