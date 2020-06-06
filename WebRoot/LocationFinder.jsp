<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>
<%String Pincode=request.getParameter("Pincode");
System.out.println(Pincode);
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
<B><FONT COLOR="#B70226" face='verdana'>Location Finder</FONT></B>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	
	try{
			
		con = com.couriersystem.ConnectionPool.getConnection();
		stmt =  con.createStatement();
		String Query = " select * from branches where Pincode='"+Pincode+"'";
		System.out.println(Query);
		rs = stmt.executeQuery(Query);
		%>
		<table align="center" width="80%">
		<%
		int rCount=0;
		while(rs.next())
		{
		
		String DealerName=rs.getString(3);
		String BranchName=rs.getString(4);
		String BranchLocation=rs.getString(5);
		Pincode=rs.getString(6);
		String BranchAddress=rs.getString(7);
		String PhoneNo=rs.getString(8);
		
		%>
		<tr class= "row_title">
		<th align="center" >Location Finder</th>
		<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
		<td > Dear Customer Branch is There in <%=BranchLocation%></td>
		</tr>
		<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
		<td><B><FONT COLOR="#FF0000">Branch Name: </FONT></B><%=BranchName%></td>
		</tr>	
		<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
		<td><B><FONT COLOR="#FF0000">Branch Address: </FONT></B><%=BranchAddress%></td>
		</tr>
		<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
		<td><B><FONT COLOR="#FF0000">Phone No: </FONT></B><%=PhoneNo%></td>
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
<a href="LocationFinder1.jsp">Find Another Location</a>

</BODY>
</HTML>