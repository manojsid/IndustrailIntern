<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<head>
<SCRIPT LANGUAGE="JavaScript">
<!--

function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
function validate()
		{
			var frm = document.forms(0);
			if(ChkMandatoryField(frm.CCN,'CCN')==false) return false;
		}
//-->
</SCRIPT>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

</head>

<BODY CLASS="Sub" >
<FORM NAME="LOGIN" ACTION="DocumentTracking1.jsp" onsubmit="return validate()" >
<B><FONT COLOR="#B70226" face='verdana'>Tracking</FONT></B>
<TABLE class="notepad" align=center >
<br>
<TR class="row_title"  ALIGN="center" COLSPAN="2"><TH>Document Tracking</TH>	
</TR>
<TR>
	<TD class=row_even align=center ><B>CCN</B></TD>
	<TD class=row_even><input TYPE="text" id = "CCN" name="CCN" size="10" maxlength="20"> 

	<TD class=row_even align=center >
		<INPUT class= "WinButton" TYPE=submit name=submit value="Go">
	</TD>
	<Td align=center>
		<TD class=row_even><FONT COLOR="#9E9E9E">Enter your courier consignment number for tracking<br>
		</TD>
</TR>

</TABLE>
</FORM>
</BODY>
</HTML>
