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
			if(ChkMandatoryField(frm.Pincode,'PinCode')==false) return false;
			return true;
		}
//-->
</SCRIPT>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

</head>

<BODY CLASS="Sub" >
<FORM NAME="LOGIN" ACTION="LocationFinder.jsp" onsubmit="return validate()">

<B><FONT COLOR="#B70226" face='verdana'>Location Finder</FONT></B>

<TABLE class="notepad" align=center >
<br>
<TR class="row_title"  ALIGN="center" COLSPAN="2"><TH>Location Finder</TH>	
</TR>
<TR>
	<TD class=row_even align=center ><B>PinCode</B></TD>
	<TD class=row_even><input TYPE="text" id = "Pincode" name="Pincode" size="10" maxlength="20"> 

	<TD class=row_even align=center >
		<INPUT class= "WinButton" TYPE=submit name=submit value="Go">
	</TD>
	<Td align=center>
		<TD class=row_even><FONT COLOR="#9E9E9E">Enter your Pincode to find our nearest office<br>
		</TD>
</TR>

</TABLE>
</FORM>
</BODY>
</HTML>
