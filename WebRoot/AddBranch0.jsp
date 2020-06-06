<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:directive.page import="com.couriersystem.MyFunctions;"/>
<%			String Condition = "RequestID";
%>
<HTML>
    <HEAD>

    <script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

    <LINK href="styles.css" type="text/css" rel="stylesheet">
    <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
    <script LANGUAGE="Javascript" >
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function ChkAlphaNumericField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter alphabets or numbers for "+T);return false;}
		}
		function ChkAlphaField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z ]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter text for "+T);return false;}
		}
		function ChkDateField(F,T)
		{
			var val = F.value;
		    var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		    if(!(pattern.test(val)==true)){alert("Please enter valid date format (yyyy-mm-dd) for "+T);return false;}
		}
		function validate()
		{
			var frm = document.forms(0);
			if(ChkMandatoryField(frm.RequestID,'RequestID')==false) return false;
			if(ChkMandatoryField(frm.DealerName,'DealerName')==false) return false;
			if(ChkMandatoryField(frm.BranchName,'BranchName')==false) return false;
			if(ChkMandatoryField(frm.BranchLocation,'BranchLocation')==false) return false;
			if(ChkMandatoryField(frm.PinCode,'PinCode')==false) return false;
			if(ChkMandatoryField(frm.BranchAddress,'Branch Address')==false) return false;
			if(ChkMandatoryField(frm.PhoneNo,'PhoneNo')==false) return false;
		}
	</script>
	</HEAD>
	<Body class=SC>
	<HR>
	<B><FONT COLOR="#B70226" face='verdana'>Add Branch Details</FONT></B>
	<A HREF="ViewBranches.jsp" target="ResultFrame" ><img align=right border="0" name="Edit" src="Images/ViewBranches0.jpg" onmouseover="document['Edit'].src='Images/ViewBranches1.jpg'" onmouseout="document['Edit'].src='Images/ViewBranches0.jpg'" ></A>
	<HR>
	<FORM ACTION="AddBranch1.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">

		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Add Branch </CENTER></B></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">RequestID<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='RequestID' value=''readonly><input type="button" ID='BItem' value="..." onclick="fnEmpPopUp('ListRequests.jsp',300,300)"></TD>
		</TR>
		
		<TR class=row_odd>
				<TH align="left">DealerName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DealerName' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">BranchName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BranchName' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">BranchLocation<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BranchLocation' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Pincode<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='Pincode' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">BranchAddress<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=BranchAddress></textarea></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">PhoneNo<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='PhoneNo' value=''></TD>
		</TR>
		<Input type=hidden name='DateOfApply' value=''>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

