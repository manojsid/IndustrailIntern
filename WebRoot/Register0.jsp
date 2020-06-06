<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>

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
		function ChkEmailField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9\_\.]{4,25})$/;
			if(!(pattern.test(val)==true)){alert("Please enter valid email for "+T);return false;}
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
			if(ChkMandatoryField(frm.UserId,'UserId')==false) return false;
			if(ChkAlphaField(frm.UserId,'UserId')==false) return false;
			if(ChkMandatoryField(frm.Password,'Password')==false) return false;
			if(ChkAlphaNumericField(frm.Password,'Password')==false) return false;
			if(ChkMandatoryField(frm.CompanyName,'CompanyName')==false) return false;
			//if(ChkAlphaNumericField(frm.CompanyName,'CompanyName')==false) return false;
			if(ChkMandatoryField(frm.Address,'Address')==false) return false;
			//if(ChkAlphaNumericField(frm.Address,'Address')==false) return false;
			if(ChkMandatoryField(frm.CompanyCode,'CompanyCode')==false) return false;
			if(ChkAlphaNumericField(frm.CompanyCode,'CompanyCode')==false) return false;
		}
	</script>
	</HEAD>
	<Body class=SC>
	<H3 align=center>Corporate Registration</H3>
	<FORM ACTION="Register1.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%" class="notepad">

		<TR class=row_title>
				<TH align="center" colspan=2>Registration</TH>
		</TR>
		<TR class=row_odd>
				<TH align="left">User Id<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='UserId' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Password<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=password name='Password' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Company Name<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='CompanyName' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Address<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=Address></textarea></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Company Code<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='CompanyCode' value=''></TD>
		</TR>
		<TR>
			<TH><INPUT TYPE="submit" value='Submit'></TH>
			<TH><INPUT TYPE="reset" value='Clear'></TH>
		</TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

