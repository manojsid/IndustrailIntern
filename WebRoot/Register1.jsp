
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class=SC>
<h3 align=center>Corporate Registration</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String UserId = request.getParameter("UserId");	
	String Password = request.getParameter("Password");	
	String CompanyName = request.getParameter("CompanyName");	
	String Address = request.getParameter("Address");	
	String CompanyCode = request.getParameter("CompanyCode");
	String CorporateId = "";
	MyFunctions MF = new MyFunctions();
	CorporateId= MF.genNextID("corporatemaster","CorporateId","CID00");
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			con.setAutoCommit(false);
			stmt =  con.createStatement();
			String Query = "Insert into CorporateMaster values('"+CorporateId+"','"+UserId+"','"+Password+"','"+CompanyName+"','"+Address+"','"+CompanyCode+"','1')";
			String Query2 = "Insert into Login values('"+UserId+"','"+Password+"',2)";
			stmt.addBatch(Query);
			stmt.addBatch(Query2);
			int[] result = stmt.executeBatch();
			boolean successFlag = false;
			for(int i=0;i<result.length;i++){
				if(result[i]<1)
				{
					successFlag = false;
					break;
				}else{
					successFlag = true;
				}
			}
			if( successFlag == true)
			{
				con.commit();
				%><BR><BR>
				<P align=center>
					<FONT SIZE="2" COLOR="green" face='Georgia'>Your company has been registered successfully.<BR><BR> Please provide this Corporate Id <FONT COLOR="Red"><B><U>(<%=CorporateId%>)</U></B></FONT> in  your transactions to avail attractive discounts. </FONT>
				</P>
				
				<%
			}
			else{
				con.rollback();
				%><BR><BR>
				<P align=center>
					<FONT SIZE="2" COLOR="green" face='Georgia'>Error:please try again</FONT>
				</P>
				<% 
			}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			%><BR><BR>
				<P align=center>
					<FONT SIZE="2" COLOR="green" face='Georgia'>Error: User Name not available please try again</FONT>
				</P><%
		}
	
%>
</BODY>

