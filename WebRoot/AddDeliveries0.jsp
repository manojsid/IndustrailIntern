
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%
String BranchID=request.getParameter("BranchID");
session.setAttribute("BranchID",BranchID);
String Destination="";

%>
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
			if(ChkMandatoryField(frm.BookedAtBranch,'BookedAtBranch')==false) return false;
			if(ChkMandatoryField(frm.ShipperName,'ShipperName')==false) return false;
			if(ChkMandatoryField(frm.DeliveredAtBranch,'DeliveredAtBranch')==false) return false;
			if(ChkMandatoryField(frm.DealerName,'DealerName')==false) return false;
			if(ChkMandatoryField(frm.DateOfDelivery,'DateOfDelivery')==false) return false;
			if(ChkDateField(frm.DateOfDelivery,'DateOfDelivery')==false) return false;
			if(ChkMandatoryField(frm.Status,'Status')==false) return false;
			
		}
	function Val()
	{
		var frm = document.forms(0);
		var DateOfDelivery = frm.DateOfDelivery;
		var DateOfBooking = frm.DateOfBooking;
		var rval = validatePeriod(DateOfBooking,DateOfDelivery);
		if(rval==false) {
			alert(" DateOfDelivery must exceed DateOfBooking"+DateOfBooking.value); 
			frm.DateOfDelivery.value="";
			return rval;
		}
	}
	function fnBookingDetails()
			{
		var frm = document.forms(0);
		var Destination = frm.Destination.value;
		if (Destination=='')
		{
			alert("Please Enter Destination to Proceed");
		}else
				{var URL = "GetBranchDetails.jsp?Destination="+Destination;
			fnEmpPopUp(URL,300,400);
			}
	}
	</script>
	</HEAD>
	<Body class=SC>
	<HR>
	<B><FONT COLOR="#B70226" face='verdana'>Add Deliveries </FONT></B>
	<A HREF="ViewDeliveries.jsp" target="ResultFrame" ><img align=right border="0" name="ViewDeliveries" src="Images/ViewDeliveries0.jpg" onmouseover="document['ViewDeliveries'].src='Images/ViewDeliveries1.jpg'" onmouseout="document['ViewDeliveries'].src='Images/ViewDeliveries0.jpg'" ></A>
	<HR>	<FORM ACTION="AddDeliveries1.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">
		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Add Deliveries </CENTER></B></TD>
		</TR>
		
		<TR class=row_even>
				<TH align="left">CCN<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='CCN' value='' size=6 readonly><input type="button" ID='BItem' value="GetDetails" onclick="fnEmpPopUp('ListConsignments.jsp',300,300)"></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">BookedAtBranch<FONT COLOR="red" readonly>*</FONT></TH>
				<TD><Input type=text name='BookedAtBranch' value=''></TD>
		</TR>
				<Input type=hidden name='Destination' value=''>
		<TR class=row_even>
				<TH align="left">ShipperName<FONT COLOR="red" readonly>*</FONT></TH>
				<TD><Input type=text name='ShipperName' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">DeliveredAtBranch<FONT COLOR="red" readonly>*</FONT></TH>
				<TD><Input type=text name='DeliveredAtBranch' value='' size=6><input type="button" ID='BItem' value="GetBranch" onclick="fnBookingDetails()"></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">DealerName<FONT COLOR="red" readonly>*</FONT></TH>
				<TD><Input type=text name='DealerName' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">DateOfDelivery<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DateOfDelivery' value='' readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this);Val()" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<Input type=hidden name='DateOfBooking' value=''>

		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

