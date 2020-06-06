<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%String BranchID=request.getParameter("BranchID");
session.setAttribute("BranchID",BranchID);%>

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
			if(ChkMandatoryField(frm.CCN,'CCN')==false) return false;
			if(ChkMandatoryField(frm.BranchName,'BranchName')==false) return false;
			if(ChkMandatoryField(frm.ShipperName,'ShipperName')==false) return false;
			if(ChkMandatoryField(frm.PhoneNo,'PhoneNo')==false) return false;
			if(ChkNumField(frm.PhoneNo,'PhoneNo')==false) return false;
			if(ChkMandatoryField(frm.SenderAddress,'SenderAddress')==false) return false;
			if(ChkMandatoryField(frm.ReceiverName,'ReceiverName')==false) return false;
			if(ChkMandatoryField(frm.RecPhoneNo,'ReceiverPhoneNo')==false) return false;
			if(ChkNumField(frm.RecPhoneNo,'ReceiverPhoneNo')==false) return false;
			if(ChkMandatoryField(frm.RecAddress,'ReceiverAddress')==false) return false;
			if(ChkMandatoryField(frm.AssignedTo,'AssignedTo')==false) return false;
			if(ChkMandatoryField(frm.DispatcherID,'DispatcherID')==false) return false;
			if(ChkMandatoryField(frm.Status,'Status')==false) return false;
		}
	</script>
	</HEAD>
	<Body class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Add Dispatches </FONT></B>
<A HREF="ViewDispatches1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewDispatches" src="Images/ViewDispatches0.jpg" onmouseover="document['ViewDispatches'].src='Images/ViewDispatches1.jpg'" onmouseout="document['ViewDispatches'].src='Images/ViewDispatches0.jpg'" ></A>
<HR>
	<FORM ACTION="AddDispatches1.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">
		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Add Dispatches </CENTER></B></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">CCN<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='CCN' value=''size=6 readonly><input type="button" ID='BItem' value="GetDetails" onclick="fnEmpPopUp('ConsignmentsDetails.jsp',300,300)"></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Branch Name<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BranchName' value='' readonly></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">ShipperName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='ShipperName' value='' readonly></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Phone No<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='PhoneNo' value='' readonly></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Sender Address<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=SenderAddress readonly></textarea></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Receiver Name<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='ReceiverName' value='' readonly></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Receiver PhoneNo<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='RecPhoneNo' value='' readonly></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Receiver Address<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=RecAddress readonly></textarea></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Assigned To<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='AssignedTo' value=''size=6 readonly><input type="button" ID='BItem' value="GetDetails" onclick="fnEmpPopUp('ListEmployees.jsp',300,300)"></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Dispatcher ID<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DispatcherID' value='' readonly></TD>
		</TR>
		
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

