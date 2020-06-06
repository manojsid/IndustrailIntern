<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>
<%String CCN=request.getParameter("CCN");
System.out.println(CCN);
%>
<head>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

</head>

<BODY CLASS="Sub" >
<FORM NAME="Document" >
<B><FONT COLOR="#B70226" face='verdana'>Document Tracking</FONT></B>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	
	try{
			
		con = com.couriersystem.ConnectionPool.getConnection();
		stmt =  con.createStatement();
		String Query = "Select * from consignmentbooking where CCN='"+CCN+"' ";
		System.out.println(Query);
		rs = stmt.executeQuery(Query);
		%>
		<table align="center" width="80%">
		<%
		int rCount=0;
		while(rs.next())
		{
		CCN=rs.getString(2);
		String ShipperName=rs.getString(3);
		String ReceiverName=rs.getString(13);
		String Status=rs.getString(18);
		String MaterialDescription=rs.getString(6);
		%>
		<tr class= "row_title">
		<th align="center" >Document Tracking</th>
		<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
		<td ><%=ShipperName%>
		is  sending <%=MaterialDescription%> to <%=ReceiverName%></td>
		</tr>	
		<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
		<td><B><FONT COLOR="#FF0000">Status:</FONT></B><%=Status%></td>
		</tr>	
		<%
			rCount++;
		}
		if( rCount == 0)	{%><h5 align=center>Sorry No records Found</h5><% }
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
</table>
<a href="DocumentTracking.jsp">FindAnother</a>

</BODY>
</HTML>