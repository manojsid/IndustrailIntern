<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Image/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Consignment Details</FONT></B>
<A HREF="ViewConsignments0.jsp" target="ResultFrame" ><img align=right border="0" name="ViewConsignments" src="Images/ViewConsignments0.jpg" onmouseover="document['ViewConsignments'].src='Images/ViewConsignments1.jpg'" onmouseout="document['ViewConsignments'].src='Images/ViewConsignments0.jpg'" ></A>
<HR>
	
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String BookingID ="";
	MyFunctions MF = new MyFunctions();
	BookingID= MF.genNextID("consignmentbooking","BookingID","CB000");
	String CCN ="";	
	CCN= MF.genNextID("consignmentbooking","CCN","9990");
	String MaterialID = (String)session.getAttribute("MaterialID");
	String ShipperName = request.getParameter("ShipperName");	
	String ShipperAddress = request.getParameter("ShipperAddress");
	String PhoneNo = request.getParameter("PhoneNo");	
	String MaterialDescription = request.getParameter("MaterialDescription");	
	String NoOfItems = request.getParameter("NoOfItems");	
	String BranchID = request.getParameter("BranchID");	
	String BookedAtBranch = request.getParameter("BookedAtBranch");
	String BranchLocation = request.getParameter("BranchLocation");	
	String DateOfBooking = request.getParameter("DateOfBooking");	
	String Destination = request.getParameter("BranchAddress");	
	String ReceiverName = request.getParameter("ReceiverName");	
	String RecAddress = request.getParameter("RecAddress");	
	String RecPhoneNo = request.getParameter("RecPhoneNo");	
	String Category = request.getParameter("Category");	
	String ShipmentCharges = request.getParameter("ShipmentCharges");	
	String Status ="Booked";	
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			
			con.setAutoCommit(false);
			
			stmt =  con.createStatement();
			String Query = "Insert into consignmentbooking values('"+BookingID+"','"+CCN+"','"+ShipperName+"','"+ShipperAddress+"','"+PhoneNo+"','"+MaterialDescription+"','"+NoOfItems+"','"+BranchID+"','"+BookedAtBranch+"','"+BranchLocation+"','"+DateOfBooking+"','"+Destination+"','"+ReceiverName+"','"+RecAddress+"','"+RecPhoneNo+"','"+Category+"','"+ShipmentCharges+"','"+Status+"')";
			System.out.println("-->"+Query);
			String Query1 = "Update MaterialParticulars set CCN='"+CCN+"' where MaterialID = '"+MaterialID+"'";
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
