 <HTML>
    <HEAD>
	<TITLE>Material Particulars</TITLE>
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
		{	calcCharge();
			var frm = document.forms(0);
			if(ChkMandatoryField(frm.MaterialDescription,'MaterialDescription')==false) return false;
			if(ChkMandatoryField(frm.NoOfItems,'NoOfItems')==false) return false;
			if(ChkMandatoryField(frm.TotalWeight,'TotalWeight')==false) return false;
			if(ChkNumField(frm.TotalWeight,'TotalWeight')==false) return false;
			if(ChkMandatoryField(frm.Category,'Category')==false) return false;
			if(ChkMandatoryField(frm.ShipmentCharges,'ShipmentCharges')==false) return false;
			if(ChkNumField(frm.TotalWeight,'TotalWeight')==false) return false;

		}
	function calcCharge(){
			F = document.forms(0);
			I = parseInt(F.NoOfItems.value);
			T = parseInt(F.TotalWeight.value);
			cat=F.Category.value;
			cid=F.CorporateId.value;
			if(cat=="Speed")
			{
				R=50;
				//alert(R);
			
			}
			else if(cat=="Normal")
			{
				R=40;
				//alert(R);
			}
			else if(cat=="Special")
			{
				R=45;
				//alert(R);
			}
			Chrg = (T/1000)*R;
			if(cid.indexOf("CID00")>-1){
				Chrg = Chrg * 0.8;
			}
			Chrg = Math.round(Chrg);
			alert(Chrg);
			F.ShipmentCharges.value =Chrg;
			
		}
	</script>
	</HEAD>
	<Body class=SC>
	<FORM ACTION="AddMaterials1.jsp" onsubmit="return validate()">
	<TABLE align=center width="80%">

		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Add Material details </CENTER></B></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Material Description<FONT COLOR="red">*</FONT></TH>
				<TD><select name='MaterialDescription'>
				<option value="Documents">Documents</option>
				<option value="Goods">Goods</option>
				<option value="SpecialItems">SpecialItems</option></select></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">No Of Items<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='NoOfItems' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Total Weight<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='TotalWeight' value=''>inGrams</TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Category<FONT COLOR="red">*</FONT></TH>
				<TD><select name='Category'>
				<option value="Speed">Speed</option>
				<option value="Normal">Normal</option>
				<option value="Special">Special</option></select></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Corporate Id</TH>
				<TD><Input type=text name='CorporateId' value='0'></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">Shipment Charges<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='ShipmentCharges' value='' readonly></TD>
		</TR>
		
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

