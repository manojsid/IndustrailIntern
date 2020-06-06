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
	<th align=left colspan =2> <B>Corporate Menu</B></th>
	<TR>
		<TD><A HREF="Result.html" target="ResultFrame"><img border="0" name="Home" src="Images/Home1.jpg" onmouseover="document['Home'].src='Images/Home2.jpg'" onmouseout="document['Home'].src='Images/Home1.jpg'" ></A></TD>
			
		<TD><A HREF="GetCorporateId.jsp" target="ResultFrame"><img border="0" name="GetCorporateID" src="Images/GetCorporateID1.jpg" onmouseover="document['GetCorporateID'].src='Images/GetCorporateID2.jpg'" onmouseout="document['GetCorporateID'].src='Images/GetCorporateID1.jpg'" Alt='Get CorporateID'></A></TD>

		<TD><A HREF="ConsReport0.jsp" target="ResultFrame"><img border="0" name="FrequencyReport" src="Images/FrequencyReport1.jpg" onmouseover="document['FrequencyReport'].src='Images/FrequencyReport2.jpg'" onmouseout="document['FrequencyReport'].src='Images/FrequencyReport1.jpg'" Alt='FrequencyReport'></A></TD>

		<TD><A HREF="Logout.jsp" target="_top"><img border="0" name="Logout" src="Images/Logout0.jpg" onmouseover="document['Logout'].src='Images/Logout1.jpg'" onmouseout="document['Logout'].src='Images/Logout0.jpg'" ></A></TD>
        
	</TR>
	</TABLE>

</BODY>
</HTML>
