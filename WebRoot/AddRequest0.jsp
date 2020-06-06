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
			if(ChkMandatoryField(frm.ApplicantName,'ApplicantName')==false) return false;
			if(ChkAlphaField(frm.ApplicantName,'ApplicantName')==false) return false;
			if(ChkMandatoryField(frm.ApplicantAddress,'ApplicantAddress')==false) return false;
			if(ChkMandatoryField(frm.PhoneNo,'PhoneNo')==false) return false;
			if(ChkMandatoryField(frm.DateOfApply,'DateOfApply')==false) return false;
			if(ChkDateField(frm.DateOfApply,'DateOfApply')==false) return false;
			if(ChkMandatoryField(frm.AmountDeposited,'AmountDeposited')==false) return false;
			if(ChkNumField(frm.AmountDeposited,'AmountDeposited')==false) return false;
			if(ChkMandatoryField(frm.BranchLocation,'BranchLocation')==false) return false;
			if(ChkMandatoryField(frm.OfficeAddress,'OfficeAddress')==false) return false;
			if(ChkMandatoryField(frm.Pincode,'Pincode')==false) return false;
			
		}
	</script>
	</HEAD>
	<Body class=SC>
	<HR>
	<B><FONT COLOR="#B70226" face='verdana'>Place DealerShip Request</FONT></B>
	<A HREF="ViewRequests.jsp" target="ResultFrame" ><img align=right border="0" name="Edit" src="Images/ViewRequests0.jpg" onmouseover="document['Edit'].src='Images/ViewRequests1.jpg'" onmouseout="document['Edit'].src='Images/ViewRequests0.jpg'" ></A>
	<HR>
	<FORM ACTION="AddRequest1.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">
		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Add Request </CENTER></B></TD>
		</TR>
		<TR class=row_even>

				<TH align="left">ApplicantName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='ApplicantName' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">ApplicantAddress<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=ApplicantAddress></textarea></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">PhoneNo<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='PhoneNo' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">DateOfApply<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DateOfApply' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">AmountDeposited<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='AmountDeposited' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">BranchLocation<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BranchLocation' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">OfficeAddress<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=OfficeAddress></textarea></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Pincode<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name=Pincode></textarea></TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

