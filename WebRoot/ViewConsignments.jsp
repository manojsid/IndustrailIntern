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
	<B><FONT COLOR="#B70226" face='verdana'>View Consignments Details</FONT></B>
	<A HREF="Consignment0.jsp" target="ResultFrame" ><img align=right border="0" name="BookConsignments" src="Images/BookConsignments0.jpg" onmouseover="document['BookConsignments'].src='Images/BookConsignments1.jpg'" onmouseout="document['BookConsignments'].src='Images/BookConsignments0.jpg'" ></A>
	<HR>
	<br><br>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from consignmentbooking Where Status='Booked' and BranchID='"+BranchID+"'";
			rs = stmt.executeQuery(Query);
			%>
			<table align="center" width="60%">
			<tr class=row_title ><th align="center" colspan=4>
                        View Consignment details</th>
			</tr>
			<%
			int rCount=0;
			while(rs.next())
			{
					%>
			<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<th align="left" >BookingID</th> <td><%=rs.getString(1)%></td>
			<th align="left">CCN</th>
			<td><%=rs.getString(2)%></td>

			</tr><tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
		
			<th align="left" >ShipperName</th>
			<td><%=rs.getString(3)%></td>
			<th align="left">PhoneNo</th>
			<td><%=rs.getString(5)%></td></tr>
			<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<th align="left" >ShipperAddress</th>
			<td colspan=3><%=rs.getString(4)%></td>
			<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<th align="left">MaterialDescription</th>
			<td><%=rs.getString(6)%></td>
			<th align="left">NoOfItems</th>
			<td><%=rs.getString(7)%></td></tr>

			<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<th align="left">BranchID</th>
			<td><%=rs.getString(8)%></td>
			<th align="left">BookedAtBranch</th>
			<td><%=rs.getString(9)%></td></tr>	

			<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<th align="left">BranchLocation</th>
			<td><%=rs.getString(10)%></td>
			<th align="left">DateOfBooking</th>
			<td><%=rs.getString(11)%></td></tr>

			

			<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<th align="left">Destination</th>
			<td colspan=3><%=rs.getString(12)%></td></tr>
			
			
			<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<th align="left">ReceiverName</th>
			<td><%=rs.getString(13)%></td>
			<th align="left">ReceiverPhoneNo</th>
			<td><%=rs.getString(15)%></td></tr>
			<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<th align="left">ReceiverAddress</th>
			<td colspan=3><%=rs.getString(14)%></td></tr>
			<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
			<th align="left">Category</th>
			<td><%=rs.getString(16)%></td>
			<th align="left">ShipmentCharges</th>
			<td>Rs.<%=rs.getString(17)%></td></tr>
			</tr>
			<tr><tH colspan=4><HR></tH></tr>
			<%
			rCount++;
			}
			if( rCount == 0)	{%><tr class="row_even"><td  colspan=7 align=center>Sorry No records Found</td></tr><%}
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


