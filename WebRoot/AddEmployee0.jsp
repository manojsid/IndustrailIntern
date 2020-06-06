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
			if(ChkMandatoryField(frm.EmpID,'EmpID')==false) return false;
			if(ChkMandatoryField(frm.EmployeeName,'EmployeeName')==false) return false;
			if(ChkMandatoryField(frm.Role,'Role')==false) return false;
			if(ChkMandatoryField(frm.BranchID,'BranchID')==false) return false;
			if(ChkMandatoryField(frm.BranchName,'BranchName')==false) return false;
			if(ChkMandatoryField(frm.BranchLocation,'BranchLocation')==false) return false;
			if(ChkMandatoryField(frm.DateOfJoin,'DateOfJoin')==false) return false;
			if(ChkDateField(frm.DateOfJoin,'DateOfJoin')==false) return false;
			if(ChkMandatoryField(frm.Salary,'Salary')==false) return false;
			if(ChkNumField(frm.Salary,'Salary')==false) return false;
		}
	</script>
	</HEAD>
	<Body class=SC>
	<HR>
	<B><FONT COLOR="#B70226" face='verdana'>Add Employ Details</FONT></B>
	<A HREF="ViewBranches1.jsp" target="ResultFrame" ><img align=right border="0" name="ViewBranch" src="Images/ViewBranches0.jpg" onmouseover="document['ViewBranch'].src='Images/ViewBranches1.jpg'" onmouseout="document['ViewBranch'].src='Images/ViewBranches0.jpg'" ></A>
	<A HREF="ViewEmploy0.jsp" target="ResultFrame" ><img align=right border="0" name="ViewEmployee" src="Images/ViewEmployee0.jpg" onmouseover="document['ViewEmployee'].src='Images/ViewEmployee1.jpg'" onmouseout="document['ViewEmployee'].src='Images/ViewEmployee0.jpg'" ></A>
	<A HREF="AddDealerShipRequest0.jsp" target="ResultFrame" ><img align=right border="0" name="PlaceRequest" src="Images/PlaceRequest0.jpg" onmouseover="document['PlaceRequest'].src='Images/PlaceRequest1.jpg'" onmouseout="document['PlaceRequest'].src='Images/PlaceRequest0.jpg'" ></A>
	<HR>
	<br><br>
	<FORM ACTION="AddEmployee1.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">
		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Add Employ Details </CENTER></B></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">EmployeeName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='EmployeeName' value=''></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Role<FONT COLOR="red">*</FONT></TH>
				<TD><select name='Role'>
				<option value="DeliveryBoy">DeliveryBoy</option>
				<option value="SubDealer">SubDealer</option>
				<option value="Clerk">Clerk</option></select></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">BranchID<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BranchID' value=''readonly><input type="button" ID='BItem' value="..." onclick="fnEmpPopUp('ListBranches.jsp',300,300)"></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">BranchName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BranchName' value=''readonly></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">BranchLocation<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BranchLocation' value='' readonly></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">DateOfJoin<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DateOfJoin' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">Salary<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='Salary' value=''></TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

