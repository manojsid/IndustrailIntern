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
			if(ChkMandatoryField(frm.ReceiversName,'ReceiversName')==false) return false;
			if(ChkMandatoryField(frm.ReceiversPhoneNo,'ReceiversPhoneNo')==false) return false;
			if(ChkMandatoryField(frm.BookedAt,'BookedAt')==false) return false;
			if(ChkMandatoryField(frm.MaterialDescription,'MaterialDescription')==false) return false;
			if(ChkMandatoryField(frm.NoOfItems,'NoOfItems')==false) return false;
			if(ChkMandatoryField(frm.DateOfReceive,'DateOfReceive')==false) return false;
			if(ChkMandatoryField(frm.NameOfReceiver,'NameOfReceiver')==false) return false;
			if(ChkMandatoryField(frm.Relation,'Relation')==false) return false;
			if(ChkMandatoryField(frm.DispatcherName,'DispatcherName')==false) return false;
			if(ChkMandatoryField(frm.DispatcherID,'DispatcherID')==false) return false;
		}
	function Val()
	{
		var frm = document.forms(0);
		var DateOfReceive = frm.DateOfReceive;
		var DateOfBooking = frm.DateOfBooking;
		var rval = validatePeriod(DateOfBooking,DateOfReceive);
		if(rval==false) {
			alert(" DateOfReceive must exceed DateOfBooking"+DateOfBooking.value); 
			frm.DateOfReceive.value="";
			return rval;
		}
	}
	function fnBookingDetails()
			{
		var frm = document.forms(0);
		var CCN = frm.CCN.value;
		if (CCN=='')
		{
			alert("Please Enter CCN to Proceed");
		}else
				{var URL = "GetMaterials.jsp?CCN="+CCN;
			fnEmpPopUp(URL,300,400);
			}
	}
	</script>
	</HEAD>
	<Body class=SC>
	<Body class=SC>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Add Receivers </FONT></B>
<A HREF="ViewReceivers1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewReceivers" src="Images/ViewReceivers0.jpg" onmouseover="document['ViewReceivers'].src='Images/ViewReceivers1.jpg'" onmouseout="document['ViewReceivers'].src='Images/ViewReceivers0.jpg'" ></A>
<HR>	<FORM ACTION="AddReceivers1.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">
		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Add Receivers  </CENTER></B></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">CCN<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='CCN' value=''size=6 readonly><input type="button" ID='BItem' value="GetDetails" onclick="fnEmpPopUp('GetConsignments.jsp',300,300)"></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">ReceiversName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='ReceiversName' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">ReceiversPhoneNo<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='ReceiversPhoneNo' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">BookedAt<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BookedAt' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">MaterialDescription<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='MaterialDescription' value=''size=8><input type="button" ID='BItem' value="GetInfo" onclick="fnBookingDetails()"></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">NoOfItems<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='NoOfItems' value=''></TD>
		</TR>
		<Input type=hidden name='DateOfBooking' value=''>
		<TR class=row_even>
				<TH align="left">DateOfReceive<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DateOfReceive' value='' readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this);Val()" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">NameOfReceiver<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='NameOfReceiver' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Relation<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='Relation' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">DispatcherName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DispatcherName' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">DispatcherID<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DispatcherID' value=''></TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

