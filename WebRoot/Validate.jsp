<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="Sess">
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String UserID = request.getParameter("UserID");	
	String Password = request.getParameter("Password");	
	String Auth = request.getParameter("Auth");
	System.out.println("Auth"+Auth);

	int flag=0;
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select * from login where UserID = '"+UserID+"' and Password='"+Password+"' and Auth='"+Auth+"'";
			rs = stmt.executeQuery(Query);
			if(rs.next())	
			{
  			 session.setAttribute("userr",UserID);
			 session.setAttribute("auth",new Integer(Auth));
	        	 flag=1;
			 if(Auth.equals("0")){
				//Show Admin Menu
				%>
				  <jsp:forward page="AdminMenu.jsp"/>
				<%
			 }else if(Auth.equals("1")){
				//Show Dealer Menu
				%>
				  <jsp:forward page="DealersMenu.jsp"/>
				<%
			 }else if(Auth.equals("2")){
				//Show Dealer Menu
				%>
				  <jsp:forward page="CorporateMenu.jsp"/>
				<%
			 }
			}
			else
			{
			 flag=0;
			 
			 %>
				  <jsp:forward page="Login.jsp">
					<jsp:param name="ErrCode" value="1"/>
				  </jsp:forward>
			 <%
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
