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
<FORM NAME="LOGIN" ACTION="ViewEmploys.jsp" onsubmit="return validate()">
<HR>
<B><FONT COLOR="#B70226" face='verdana'>View Employees</FONT></B>
<A HREF="ViewBranches1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewBranch" src="Images/ViewBranches0.jpg" onmouseover="document['ViewBranch'].src='Images/ViewBranches1.jpg'" onmouseout="document['ViewBranch'].src='Images/ViewBranches0.jpg'" ></A>
<A HREF="AddEmployee0.jsp" target="ResultFrame" ><img align=right border="0" name="AddEmployee" src="Images/AddEmployee0.jpg" onmouseover="document['AddEmployee'].src='Images/AddEmployee1.jpg'" onmouseout="document['AddEmployee'].src='Images/AddEmployee0.jpg'" ></A>
	<HR>	
<TABLE align=center width="50%" >
<br><br>
	<TR class="row_title">
			<TD colspan=6 align=center><B><CENTER>View Employees </CENTER></B></TD>
	</TR>
	<TR>
	<TD class=row_odd align=center ><B>BranchID</B></TD>
	<TD class=row_odd><input TYPE="text" id = "BranchID" name="BranchID"> 

	<TD class=row_odd align=center >
		<INPUT class= "WinButton" TYPE=submit name=submit value="Go">
	</TD>
	<Td align=center>
		<TD class=row_odd><FONT COLOR="#9E9E9E">Enter your BranchID to view employees details<br>
		</TD>
</TR>

</TABLE>
</FORM>
</BODY>
</HTML>
