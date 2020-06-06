<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.couriersystem.MyFunctions"%>
<%			String Condition = "BranchAddress";
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
			if(ChkMandatoryField(frm.ShipperName,'ShipperName')==false) return false;
			if(ChkMandatoryField(frm.ShipperAddress,'Shipper Address')==false) return false;
			if(ChkMandatoryField(frm.PhoneNo,'PhoneNo')==false) return false;
			if(ChkMandatoryField(frm.MaterialDescription,'MaterialDescription')==false) return false;
			if(ChkMandatoryField(frm.NoOfItems,'NoOfItems')==false) return false;
			if(ChkMandatoryField(frm.BranchID,'BranchID')==false) return false;
			if(ChkMandatoryField(frm.BookedAtBranch,'BookedAtBranch')==false) return false;
			if(ChkMandatoryField(frm.BranchLocation,'BranchLocation')==false) return false;
			if(ChkMandatoryField(frm.DateOfBooking,'DateOfBooking')==false) return false;
			if(ChkDateField(frm.DateOfBooking,'DateOfBooking')==false) return false;
			if(ChkMandatoryField(frm.Destination,'Destination')==false) return false;
			if(ChkMandatoryField(frm.ReceiverName,'ReceiverName')==false) return false;
			if(ChkMandatoryField(frm.RecAddress,'Receiver Address')==false) return false;
			if(ChkMandatoryField(frm.RecPhoneNo,'Receiver PhoneNo')==false) return false;
			if(ChkMandatoryField(frm.Category,'Category')==false) return false;
			if(ChkMandatoryField(frm.ShipmentCharges,'ShipmentCharges')==false) return false;
			
		}
	</script>
	</HEAD>
	<Body class=SC>
	<HR>
	<B><FONT COLOR="#B70226" face='verdana'>Consignment Details</FONT></B>
	<A HREF="ViewConsignments0.jsp" target="ResultFrame" ><img align=right border="0" name="ViewConsignments" src="Images/ViewConsignments0.jpg" onmouseover="document['ViewConsignments'].src='Images/ViewConsignments1.jpg'" onmouseout="document['ViewConsignments'].src='Images/ViewConsignments0.jpg'" ></A>
	<HR>
	<FORM ACTION="Consignment1.jsp" onsubmit="return validate()">
	<TABLE align=center width="50%">
		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Add Consignment Details </CENTER></B></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">ShipperName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='ShipperName' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">ShipperAddress<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name='ShipperAddress'></textarea></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">PhoneNo<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='PhoneNo' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">MaterialDescription<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='MaterialDescription' size=8 value=''readonly><input type="button" ID='BItem' value="AddDetails" onclick="fnEmpPopUp('AddMaterials0.jsp',300,300)"></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">NoOfItems<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='NoOfItems' value='' readonly></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">BranchID<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BranchID' value=''readonly><input type="button" ID='BItem' value="..." onclick="fnEmpPopUp('ListBranchDetails.jsp',300,300)"></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">BookedAtBranch<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BookedAtBranch' value='' readonly></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">BranchLocation<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BranchLocation' value='' readonly></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">DateOfBooking<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='DateOfBooking' value=''><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR class=row_even>
			<TH align="left">Destination<FONT COLOR="red">*</FONT></TH>
			<TD><SELECT NAME="<%=Condition%>">
			<OPTION >Select</OPTION>
		
<%
	try{
			Connection con=null;
			ResultSet rs=null;
			Statement stmt=null;
			String[] ConValues = new String[2000];
			int ConCount=0,i=0;
			String Query1="";
			con = com.couriersystem.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			if(Condition.trim().equalsIgnoreCase("undefined")){
				System.out.println("in if");
				Query1 = "Select * from branches";
			}
			else{
				System.out.println("in else");
				Query1 = "Select "+Condition+" from branches";
			}
			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			System.out.println(rs);
			int rCount=0;
				while(rs.next()){
					String x = rs.getString(1);
					ConValues[i]=x;
					%><OPTION><%=ConValues[i]%></OPTION><%
					i++;
				}
		}catch(Exception e){%><%=e%><%}
%>		
	</select>
		<TR class=row_odd>
				<TH align="left">ReceiverName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='ReceiverName' value=''></TD>
		</TR>
		<TR class=row_even>
				<TH align="left">ReceiverAddress<FONT COLOR="red">*</FONT></TH>
				<TD><textarea name='RecAddress'></textarea></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">ReceiverPhoneNo<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='RecPhoneNo' value=''></TD>
		</TR>
		
		<TR class=row_even>
				<TH align="left">Category<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='Category' value='' readonly></TD>
		</TR>
		<TR class=row_odd>
				<TH align="left">ShipmentCharges<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='ShipmentCharges' value='' readonly></TD>
		</TR>
		
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

