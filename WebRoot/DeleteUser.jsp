<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC=""></script>


</HEAD>
<BODY class=SC>
<h2></h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			con=(Connection)session.getAttribute("connection");
			stmt =  con.createStatement();
			String Query = "Select * from login order by `userid`";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notebook>
							<tr class=row_title>
							<th class=row_title>UserID</th><th class=row_title>Password</th><th class=row_title>Auth</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
		}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


