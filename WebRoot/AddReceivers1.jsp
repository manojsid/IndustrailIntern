<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Add Receivers </FONT></B>
<A HREF="ViewReceivers1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewReceivers" src="Images/ViewReceivers0.jpg" onmouseover="document['ViewReceivers'].src='Images/ViewReceivers1.jpg'" onmouseout="document['ViewReceivers'].src='Images/ViewReceivers0.jpg'" ></A>
<HR>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String ReceiversID ="";	
	MyFunctions MF = new MyFunctions();
	ReceiversID= MF.genNextID("receivers","ReceiversID","D000");
	String CCN = request.getParameter("CCN");	
	String ReceiversName = request.getParameter("ReceiversName");
	String ReceiversPhoneNo = request.getParameter("ReceiversPhoneNo");
	String BookedAt = request.getParameter("BookedAt");	
	String MaterialDescription = request.getParameter("MaterialDescription");	
	String NoOfItems = request.getParameter("NoOfItems");
	String DateOfReceive = request.getParameter("DateOfReceive");	
	String NameOfReceiver = request.getParameter("NameOfReceiver");	
	String Relation = request.getParameter("Relation");	
	String DispatcherName = request.getParameter("DispatcherName");	
	String DispatcherID = request.getParameter("DispatcherID");	
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			con.setAutoCommit(false);
			stmt =  con.createStatement();
	
			String Query = "Insert into receivers values('"+ReceiversID+"','"+CCN+"','"+ReceiversName+"','"+ReceiversPhoneNo+"','"+BookedAt+"','"+MaterialDescription+"','"+NoOfItems+"','"+DateOfReceive+"','"+NameOfReceiver+"','"+Relation+"','"+DispatcherName+"','"+DispatcherID+"')";
			System.out.println("-->"+Query);
			String Query1 = "Update consignmentbooking set Status='Consignment Received by "+NameOfReceiver+" Relation:"+Relation+"' where CCN = '"+CCN+"'";
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
