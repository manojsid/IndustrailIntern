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

	<TABLE align=left>
	<th align=left colspan =2> <B>Admin Menu</B></th>
	<TR>
		<TD><A HREF="Result.html" target="ResultFrame"><img border="0" name="Home" src="Images/Home1.jpg" onmouseover="document['Home'].src='Images/Home2.jpg'" onmouseout="document['Home'].src='Images/Home1.jpg'" ></A></TD>
			
		<TD><A HREF="AddRequest0.jsp" target="ResultFrame"><img border="0" name="DealerShipRequest" src="Images/AddRequest1.jpg" onmouseover="document['DealerShipRequest'].src='Images/AddRequest2.jpg'" onmouseout="document['DealerShipRequest'].src='Images/AddRequest1.jpg'" ></A></TD>

		<TD><A HREF="AddBranch0.jsp" target="ResultFrame"><img border="0" name="Branch" src="Images/AddBranch1.jpg" onmouseover="document['Branch'].src='Images/AddBranch0.jpg'" onmouseout="document['Branch'].src='Images/AddBranch1.jpg'" ></A></TD>

		<TD><A HREF="Logout.jsp" target="_top"><img border="0" name="Logout" src="Images/Logout0.jpg" onmouseover="document['Logout'].src='Images/Logout1.jpg'" onmouseout="document['Logout'].src='Images/Logout0.jpg'" ></A></TD>
        
	</TR>
	</TABLE>

</BODY>
</HTML>
