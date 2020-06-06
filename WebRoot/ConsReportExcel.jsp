<%@ page language="java" %>
<%@ page session="true" %>
<%@page contentType="application/vnd.ms-excel"%>
<%response.setHeader("Content-Disposition","attachment;filename=Report.xls");%>

<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
<Style>
	.row_title {
		FONT-SIZE: 8pt; BACKGROUND-COLOR: #999966 ;FONT-WEIGHT: bold; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
	.row_odd {
		FONT-SIZE: 8pt; BACKGROUND-COLOR: #c8c8c8 ;FONT-WEIGHT: normal; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
	.row_even {
		FONT-SIZE: 8pt; BACKGROUND-COLOR: #E8E8E8 ;FONT-WEIGHT: normal; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
	TABLE.notebook {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; WIDTH: 90%; BORDER-BOTTOM: 0px
	}
	Body.SC {
	     scrollbar-arrow-color:#00000;
	     scrollbar-base-color:#c8c8c8;
	     scrollbar-face-color:#e8e8e8;
	     scrollbar-darkshadow-color:#b8b8b8;
	 BACKGROUND-COLOR: #E8E8E8
	 FONT-WEIGHT: normal; FONT-SIZE: 10pt; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
</Style>
</HEAD>
<BODY class="SC">
<%
	Connection con=null;
	ResultSet rs=null,rs0=null;
	Statement stmt=null;
	String ToDate = request.getParameter("ToDate");
	String FromDate = request.getParameter("FromDate");
	String CorporateId="";
	String userid = (String)session.getAttribute("userr");
	System.out.println("userid="+userid);
	int TotalCharges = 0;
	int shCharges=0;
	try{
			
		con = com.couriersystem.ConnectionPool.getConnection();
		stmt =  con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		//stmt =  con.createStatement();
		String Query0 = "Select CorporateId from corporatemaster where userid='"+userid+"'";
		System.out.println("--"+Query0);
		rs0 = stmt.executeQuery(Query0);

		if(rs0.next())
		{
			CorporateId=rs0.getString(1);	
		}
		if(CorporateId!=null){
			String Query = "select A.CCN, A.ShipperName, A.ShipperAddress, B.MaterialDescription,B.NoOfItems,B.TotalWeight,A.BookedAtBranch,A.BranchLocation,A.DateOfBooking,A.Destination,A.ShipmentCharges,A.Status from consignmentbooking A, materialparticulars B where A.CCN=B.CCN and B.CorporateId='"+CorporateId+"' and A.DateOfBooking <= '"+ToDate+"' and A.DateOfBooking >= '"+FromDate+"'";
			
			System.out.println("--"+Query);
			rs = stmt.executeQuery(Query);
			%>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Consignments Booked during the period of  <U><%=FromDate%></U> to <U><%=ToDate%></U></FONT></B>
<HR><br><br><br>

			<table width="60%" border="1">
			<tr class="row_title">
			<th align="left">CCN</th>
			<th align="left">Shipper Name</th>
			<th align="left">Shipper Address</th>
			<th align="left">Material Description</th>
			<th align="left">No Of Items</th>
			<th align="left">Total Weight</th>
			<th align="left">Booked At Branch</th>
			<th align="left">Location</th>
			<th align="left">Booking Date</th>
			<th align="left">Destination</th>
			<th align="left">Shipment Charges</th>
			<th align="left">Status</th>	
			</tr>
			<%
			int rCount=0;
			while(rs.next())
			{
			String Charges = rs.getString(11);
			shCharges = Integer.parseInt(Charges);
			TotalCharges+=shCharges;
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
				<td><B><%=Charges%></B></td>
				<td><%=rs.getString(12)%></td>
			</tr>
			<%
				rCount++;
			}
			if( rCount == 0){
			%>
				<tr class="row_even"><td  colspan="7" align="center">No Bookings in the specified period</td></tr>
			<% 
			}else
			{
			%>
				</TABLE><BR><BR>
				<P align="left">
				<B>Total Charges</B>: <FONT  COLOR="red"><B><%=TotalCharges%></B></FONT>
				</P>
			<% 
			}
		//	rs.close();
		}else{
			%><B align="center"><FONT SIZE="2" COLOR="red">No Bookings in the specified period</FONT></B><%
		}
	//	rs0.close();
		stmt.close();
		con.close();
	}catch(Exception e){
		// rs.close();
		stmt.close();
		con.close();
		%><%=e%><%
	}
	
%>
</BODY>


