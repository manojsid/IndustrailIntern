<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>
<%! String ErrCode="0",LoginCode="A";%>

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
			if(ChkMandatoryField(frm.UserID,'UserID')==false) return false;
			if(ChkAlphaField(frm.UserID,'UserID')==false) return false;
			if(ChkMandatoryField(frm.Password,'Password')==false) return false;
			if(ChkAlphaNumericField(frm.Password,'Password')==false) return false;
			if(ChkMandatoryField(frm.Auth,'Auth')==false) return false;
		}
	</script>
	</HEAD>
	<Body Class='Sess'>
	<FORM ACTION="Validate.jsp" onsubmit="return validate()">
	<%
		ErrCode = request.getParameter("ErrCode");
		LoginCode = request.getParameter("LoginCode");	
		if(ErrCode!=null){
			if(ErrCode.equals("1")){
			  %><script>alert("Login failed..please try again");</script><%
			}
		}
	%>
	<TABLE align=center width="80%" class="notepad">
		<TR class="row_title">
		  <TH align="center" colspan=8>Login</TH>
		</TR>
		<TR>
		  <TD align="left"><FONT SIZE="1" COLOR="">User ID</FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><Input type=text name='UserID' value=''  size=8></TD>
		  <TD align="left"><FONT SIZE="1" COLOR="">Password<FONT COLOR="red">*</FONT></TD>
		  <TD><Input type=password name='Password' value='' size=8></TD>
  		  <TD align="left"><FONT SIZE="1" COLOR="">Login As<FONT COLOR="red">*</FONT></TD>
		  <TD><select name=Auth value='0'><option value=0>Administrator</option><option value=1>Dealer</option><option value=2>Corporate</option></select></TD>
		  <TD><INPUT TYPE="submit" value='Go'></TD>
  		  <TD><INPUT TYPE="Button" value='Back' onclick="location.replace('myMenu.jsp');"></TD>
		  <%if(LoginCode!=null && LoginCode.equals("C")==true){%>
		  <TD><A HREF="Register0.jsp" target="ResultFrame"><U><B>Register</B></U></A></TD>
		  <%}%>
	        </TR>
	</TABLE>
	</FORM>
	</BODY>

