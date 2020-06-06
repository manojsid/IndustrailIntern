<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,com.couriersystem.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<PRE>
<BODY class=SC>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String UserId = (String)session.getAttribute("userr");
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from CorporateMaster where UserId='"+UserId+"'";
			rs = stmt.executeQuery(Query);
			int rCount=0;
			if(rs.next())
			{
			%>
			<BR><BR>
			<P align=center>
			 <FONT SIZE="2" COLOR="green" face='Georgia'>Dear <FONT COLOR="Blue"><B><%=rs.getString(4)%></B></FONT> your Corporate Id is <FONT COLOR="Red"><B><U>(<%=rs.getString(1)%>).</U></B></FONT> <BR><BR>Please provide this Corporate Id in  your transactions to avail attractive discounts.</FONT>
			</P>
			<%
			rCount++;
			}
			if( rCount == 0){%><BR><BR>
			<P align=center>
			 <FONT SIZE="2" COLOR="red" face='Georgia'>Error: Request Administrator to generate new Id</FONT>
			</P><% }
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

</PRE>