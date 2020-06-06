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
	<TR>
		<TD><A HREF="Result.html" target="ResultFrame"><img border="0" name="Home" src="Images/Home1.jpg" onmouseover="document['Home'].src='Images/Home2.jpg'" onmouseout="document['Home'].src='Images/Home1.jpg'" ></A></TD>
		
		<TD><A HREF="Feedback.jsp" target="ResultFrame"><img border="0" name="Feedback" src="Images/FeedBack0.jpg" onmouseover="document['Feedback'].src='Images/FeedBack1.jpg'" onmouseout="document['Feedback'].src='Images/FeedBack0.jpg'" ></A></TD>

		<TD><A HREF="Login.jsp?LoginCode=D" target="MenuFrame"><img border="0" name="Dealers" src="Images/Dealers1.jpg" onmouseover="document['Dealers'].src='Images/Dealers0.jpg'" onmouseout="document['Dealers'].src='Images/Dealers1.jpg'" ></A></TD>
		
		<TD><A HREF="Login.jsp?LoginCode=A" target="MenuFrame"><img border="0" name="Admin" src="Images/Admin1.jpg" onmouseover="document['Admin'].src='Images/Admin0.jpg'" onmouseout="document['Admin'].src='Images/Admin1.jpg'" ></A></TD>

		<TD><A HREF="Login.jsp?LoginCode=C" target="MenuFrame"><img border="0" name="Corporate" src="Images/Corporate1.jpg" onmouseover="document['Corporate'].src='Images/Corporate0.jpg'" onmouseout="document['Corporate'].src='Images/Corporate1.jpg'" ></A></TD>

	</TR>
	</TABLE>

</BODY>
</HTML>
