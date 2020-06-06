<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<HTML>
<HEAD>
<TITLE> Frequency Report</TITLE>
	<LINK href="styles.css" type="text/css" rel="stylesheet">


<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
<script language="Javascript" src="Images/validate.js"></script>
</HEAD>

<BODY class=SC>
<br><br>
<HR>
<B><FONT COLOR="#B70226" face='verdana'>Consignments Report</FONT></B>
<HR>
<center>
<form name=calform action="ConsReport.jsp" onsubmit="return validatePeriod(FromDate,ToDate)" >
<Table class=notepad>
<TR class="row_odd">
<TH>From</TH>
<TD>
<input type=text name="FromDate" size=15><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
</TD>
</TR>
<TR class="row_odd">
<TH>To</TH>
<TD>
<input type=text name="ToDate" size=15><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" >
</TD>
<TR>
<TD align=center><INPUT TYPE="submit" id=SUB Value="Get Results" ></TD>
<TD align=center><INPUT id='RES' TYPE="RESET" onclick="location.reload()"></TD>
</TR>
</TABLE>
</form>
</center>

