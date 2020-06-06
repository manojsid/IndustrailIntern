<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<head>
 <script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
function validate()
		{
			var frm = document.forms(0);
			if(ChkMandatoryField(frm.BranchID,'BranchID')==false) return false;
		}
//-->
</SCRIPT>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

</head>

<BODY CLASS="SC" >
<FORM NAME="LOGIN" ACTION="ViewDispatches.jsp" onsubmit="return validate()">
<HR>
<B><FONT COLOR="#B70226" face='verdana'>View Dispatches </FONT></B>
<A HREF="Dispatches0.jsp" target="ResultFrame" ><img align=right border="0" name="AddDispatches" src="Images/AddDispatches0.jpg" onmouseover="document['AddDispatches'].src='Images/AddDispatches1.jpg'" onmouseout="document['AddDispatches'].src='Images/AddDispatches0.jpg'" ></A>
<HR>
<br><br>
<TABLE align=center width="50%" >

	<TR class="row_title">
			<TD colspan=6 align=center><B><CENTER>View Dispatches </CENTER></B></TD>
	</TR>
	<TR>
	<TD class=row_odd align=center ><B>BranchID</B></TD>
	<TD class=row_odd><input TYPE="text" id = "BranchID" name="BranchID"> 
	
	<TD class=row_odd align=center >
		<INPUT class= "WinButton" TYPE=submit name=submit value="Go">
	</TD>
	<Td align=center>
		<TD class=row_odd><FONT COLOR="#9E9E9E">Enter your BranchID to View Dispatches details<br>
		</TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>
