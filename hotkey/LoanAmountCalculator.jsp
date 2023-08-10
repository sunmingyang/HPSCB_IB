<%@ include file = "/common/Include.jsp" %>

<script language="javascript" src="/hotkey/HotKey.js">
</script>
<script language="javascript" src="/hotkey/LoanAmountCalculator.js">
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Calculator"/>
<tiles:put name="page_header" type="String" >
Loan Amount Calculator</tiles:put>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="content" type="String">
<body onLoad = "alert('onload')" 
	onkeypress = "escapeKey(event)">
<!-- makeScrollableTable('sheet', true, '120'),  -->
<br>
<br>
<table width=527>
	<tr>
		<td align=right><input type="button" onClick="back_req()" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
		</td>
	</tr>
</table>
<table border="1" bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
	<tr>
		<td>
		<table width=527 cellpadding="0" cellspacing="0">
		<tr>
			<td class="tbl_heading">Loan Amount  Calculators</td></tr><tr><td>&nbsp;</td>
		</tr>
		<tr>
			<td>

<form>
<table>
	<tr>
		<TD nowrap align = left>
			<!--Interest Rate-->
			<bean:message bundle ="<%=lang%>" key = "560" />
		</TD>
		<TD align = left>
			<input type = "text" value = ".00" name = "interestRate"
				style = "text-align:right" tabindex = 0 maxlength = 6
				onkeypress = "isValidAmount(event, this)">
		</TD>
	</tr>
</table>
<BR>
<center>
<table cellspacing = 0 cellpadding = 0>
	<tr>
		<td>
		<input type = button style="background-image:url('/images/First.gif');
			width=25px;height=25px" class = "Button" onclick = "firstRow()">
		</td>
		<td>
		<input type = button style="background-image:url('/images/Previous.gif');
			width=25px;height=25px" class = "Button" onclick = "previousRow()">
		</td>
		<td>
		<input type = button style="background-image:url('/images/Next.gif');
			width=25px;height=25px" class = "Button" onclick = "nextRow()">
		</td>
		<td>
		<input type = button style="background-image:url('/images/Last.gif');
			width=25px;height=25px" class = "Button" onclick = "lastRow()">
		</td>
		<td>
		<input type = button style="background-image:url('/images/Insert.gif');
			width=25px;height=25px" class = "Button" tabindex = 7 onclick = "addNewRow()"
			name = "insert" id = "insert">
		</td>
		<td>
		<input type = button style="background-image:url('/images/Delete.gif');
			width=25px;height=25px" class = "Button" tabindex = 3 name = "delete"
			onclick = "deleteRow()" id = "delete" disabled>
		</td>
		<td>
			<input type = "text" name = "statusText" value = "" tabindex = "-1"
				style="background-color:#AEAEAE;width=75px;height=25px;font-weight:bold;
				text-align:center" readonly id = "statusText">
		</td>
	</tr>
</table>
</center>
<TABLE border = 0 cellspacing = 2 cellspacing = 2 width = "100%"
	align="center" id = "sheet" bgColor = "white">
<thead>

	
	<TR>
		<!--Line 2-->
		<TH nowrap>
			<!-- Installment Amount -->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle ="<%=lang%>" key = "5836" />', '/');
				document.write(sResult[1]);
			</script>
		</TH>
		<TH nowrap>
			<!-- No of Installment -->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle ="<%=lang%>" key = "2719" />', '/');
				document.write(sResult[1]);
			</script>
		</TH>
		
		<TH nowrap>
			<!--Inst Payment Period-->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle="<%=lang%>" key= "2321"/>', '/');
				document.write(sResult[1]);
			</script>
		</TH>

		<TH nowrap>
			<!--Calculate Loan Amount-->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle="<%=lang%>" key= "5080"/>', 
				'/');
				document.write(sResult[1]);
			</script>
		</TH>

		<TH nowrap>
			<!--Loan Amount-->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle="<%=lang%>" key= "2957"/>', '/');
				document.write(sResult[1]);
			</script>
		</TH>
	</TR>
</thead>
<tbody id = "bodyLoan">
<tr>
<td colspan="5">
<HR>
</td>
</tr>
</tbody>
<tfoot>
<TR bgColor = "#9D9D9D">
	<TH nowrap align = center colspan = 5>
	</TH>
</TR>
</tfoot>
</table>
</form>
</body>
</table>
</table>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert >

<script>
function showMessage(code) {
	switch(code){
		case 683:
			alert("<bean:message bundle='<%=errorLang%>' key= '683'/>");
			break;
		case 53:
			alert("<bean:message bundle='<%=errorLang%>' key= '53'/>");
			break;
		case 1668:
			alert("<bean:message bundle='<%=errorLang%>' key= '1668'/>");
			break;
	}
}
addNewRow();
</script>
