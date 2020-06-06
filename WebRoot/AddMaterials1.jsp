<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

<HEAD>
	<TITLE>Material Particulars</TITLE>

	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
<!--
function sendInfo(txtVal,txt1Val,txt2Val,txt3Val)
{
		var txt = window.opener.document.forms(0).MaterialDescription;
		txt.value = txtVal;
		var txt1 = window.opener.document.forms(0).NoOfItems;
		txt1.value = txt1Val;
		var txt2 = window.opener.document.forms(0).Category;
		txt2.value = txt2Val;
		var txt3 = window.opener.document.forms(0).ShipmentCharges;
		txt3.value = txt3Val;
		alert("Material Particulars saved successfully");
		window.close();
}

//-->
</SCRIPT>
</HEAD>
<BODY class=SC>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String MaterialID ="";	
	MyFunctions MF = new MyFunctions();
	MaterialID= MF.genNextID("materialparticulars","MaterialID","M000");
	String CCN = "1";	
	String MaterialDescription = request.getParameter("MaterialDescription");
	String NoOfItems = request.getParameter("NoOfItems");	
	String TotalWeight = request.getParameter("TotalWeight");	
	String Category = request.getParameter("Category");	
	String ShipmentCharges = request.getParameter("ShipmentCharges");
	String CorporateId = request.getParameter("CorporateId");
	//Setting MaterialID in to session
	session.setAttribute("MaterialID",MaterialID);
	try{
			
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into materialparticulars values('"+MaterialID+"','"+CCN+"','"+MaterialDescription+"','"+NoOfItems+"','"+TotalWeight+"','"+Category+"','"+ShipmentCharges+"','"+CorporateId+"')";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%>
				<script>
				  sendInfo('<%=MaterialDescription%>','<%=NoOfItems%>','<%=Category%>','<%=ShipmentCharges%>');	
				</script>
				<!--<h3 align=center>Inserted into database sucessfully</h3>
				<center><input type=button value=close onclick=""></center>-->
				<%

			}
			else{
				%><h3 align=center>Error in updating..please try again</h3><% 
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
