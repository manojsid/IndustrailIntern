<HTML>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%@ page session="true" %>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
<!--
	function setAction(URL,Obj){
		var f = document.forms(0);
		var ParamsList = "?";
		Obj.target='ResultFrame';
		Obj.href=URL+ParamsList;
	}
//-->
</SCRIPT>
<head>
<body Class='Sess'>
	<TABLE align=right>
	<th align=left colspan=2> <B>Dealers Menu</B></th>

	<TR>
		<TD><A HREF="Result.html" target="ResultFrame"><img border="0" name="Home" src="Images/Home00.jpg" onmouseover="document['Home'].src='Images/Home01.jpg'" onmouseout="document['Home'].src='Images/Home00.jpg'" ></A></TD>

		<TD><A HREF="ViewBranches1.jsp" target="ResultFrame"><img border="0" name="ViewBranch" src="Images/BranchDetails1.jpg" onmouseover="document['ViewBranch'].src='Images/BranchDetails0.jpg'" onmouseout="document['ViewBranch'].src='Images/BranchDetails1.jpg'" ></A></TD>

		<TD><A HREF="Consignment0.jsp" target="ResultFrame"><img border="0" name="Feedback" src="Images/Consignment1.jpg" onmouseover="document['Feedback'].src='Images/Consignment0.jpg'" onmouseout="document['Feedback'].src='Images/Consignment1.jpg'" ></A></TD>

		<TD><A HREF="Deliveries0.jsp" target="ResultFrame"><img border="0" name="Dealers" src="Images/Deliveries1.jpg" onmouseover="document['Dealers'].src='Images/Deliveries0.jpg'" onmouseout="document['Dealers'].src='Images/Deliveries1.jpg'" ></A></TD>
		
		<TD><A HREF="Dispatches0.jsp" target="ResultFrame"><img border="0" name="Dispatches" src="Images/Dispatches1.jpg" onmouseover="document['Dispatches'].src='Images/Dispatches0.jpg'" onmouseout="document['Dispatches'].src='Images/Dispatches1.jpg'" ></A></TD>

		<TD><A HREF="Receivers0.jsp" target="ResultFrame"><img border="0" name="Receivers" src="Images/Receivers1.jpg" onmouseover="document['Receivers'].src='Images/Receivers0.jpg'" onmouseout="document['Receivers'].src='Images/Receivers1.jpg'" ></A></TD>

		<TD><A HREF="Logout.jsp" target="_top"><img border="0" name="Logout" src="Images/Logout01.jpg" onmouseover="document['Logout'].src='Images/Logout2.jpg'" onmouseout="document['Logout'].src='Images/Logout01.jpg'" ></A></TD>
        
	</TR>
	</TABLE>

</BODY>
</HTML>
