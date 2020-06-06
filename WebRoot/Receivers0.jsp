
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
    <LINK href="styles.css" type="text/css" rel="stylesheet">

<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);
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

</head>

<BODY CLASS="SC" >
<FORM NAME="LOGIN" ACTION="AddReceivers0.jsp" onsubmit="return validate()">
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Add Receivers Details </FONT></B>
<A HREF="ViewReceivers1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewReceivers" src="Images/ViewReceivers0.jpg" onmouseover="document['ViewReceivers'].src='Images/ViewReceivers1.jpg'" onmouseout="document['ViewReceivers'].src='Images/ViewReceivers0.jpg'" ></A>
<HR>
<br><br>
<TABLE align=center width="50%" >

	<TR class="row_title">
			<TD colspan=6 align=center><B><CENTER>Add Receivers Details </CENTER></B></TD>
	</TR>
	<TR>
	<TD class=row_odd align=center ><B>BranchID</B></TD>
	<TD class=row_odd><input TYPE="text" id = "BranchID" name="BranchID"> 
	
	<TD class=row_odd align=center >
		<INPUT class= "WinButton" TYPE=submit name=submit value="Go">
	</TD>
	<Td align=center>
		<TD class=row_odd><FONT COLOR="#9E9E9E">Enter your BranchID to Add Receivers details<br>
		</TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>
