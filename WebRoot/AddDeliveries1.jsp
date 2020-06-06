<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
	<HR>
	<B><FONT COLOR="#B70226" face='verdana'>Add Deliveries </FONT></B>
	<A HREF="ViewDeliveries.jsp" target="ResultFrame" ><img align=right border="0" name="ViewDeliveries" src="Images/ViewDeliveries0.jpg" onmouseover="document['ViewDeliveries'].src='Images/ViewDeliveries1.jpg'" onmouseout="document['ViewDeliveries'].src='Images/ViewDeliveries0.jpg'" ></A>
	<HR>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String DeliveryID= "";
	MyFunctions MF = new MyFunctions();
	DeliveryID= MF.genNextID("deliveries","DeliveryID","D000");
	String CCN = request.getParameter("CCN");	
	String BookedAtBranch = request.getParameter("BookedAtBranch");	
	String ShipperName = request.getParameter("ShipperName");	
	String DeliveredAtBranch = request.getParameter("DeliveredAtBranch");
	String DealerName = request.getParameter("DealerName");	
	String DateOfDelivery = request.getParameter("DateOfDelivery");	
	String Status ="Delivered";	
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			con.setAutoCommit(false);
			String Query = "Insert into deliveries values('"+DeliveryID+"','"+CCN+"','"+BookedAtBranch+"','"+ShipperName+"','"+DeliveredAtBranch+"','"+DealerName+"','"+DateOfDelivery+"','"+Status+"')";
			String Query1 = "Update consignmentbooking set Status='Delivered to "+DeliveredAtBranch+" Branch' where CCN = '"+CCN+"'";
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
				%><h6 align=center>Consignment Delivered sucessfully</h6><%
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
