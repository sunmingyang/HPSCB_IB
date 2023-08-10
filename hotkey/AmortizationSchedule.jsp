<%@ include file="/common/Include.jsp"%>

<script language="javascript" src="/hotkey/HotKey.js"></script>
<script language="javascript" src="/hotkey/EMICalculator.js"></script>
<script>
function fillData()
{
	makeScrollableTable('InfoSheet',false,'auto')
}
</script>

<table border="1" align="center" bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
	<tr>
		<td>
		<table width=300 cellpadding="0" cellspacing="0">
		<tr>
			<td class="tbl_heading" align="center">Amortization Shedule</td></tr><tr><td>&nbsp;</td>
		</tr>
		<tr>
			<td>

<BODY onLoad="fillData()" onkeypress = "escapeKey(event)" >
<html:form action="/hotkey/AmortSchedule.do?action=executeOpen">


<br>
<fieldset style="width:662px">
<table border=0 bgcolor="white">

<tr>
	
	<!--Amount of Loan-->
	<td nowrap>
		<b>Amount of Loan</b>
	</td>
	<td colspan="5">
		<b>:</b> <bean:write name = "AmortizationSchdForm" property = "loanAmount"/>
	</td>
</tr>
<tr>
	
	<td >
		<bean:write name = "AmortizationSchdForm" property = "addressHDtl"/>
	</TD>
	<td colspan="2">
		<bean:write name = "AmortizationSchdForm" property = "addressELoc"/>
	</TD>
	<td>
		<bean:write name = "AmortizationSchdForm" property = "addressECity"/>
	</TD>
</tr>
<tr>
	<!--Date of Advance-->
	<td nowrap>
		<b>Date of Advance</b>
	</td>
	<td>
		<b>:</b> <bean:write name = "AmortizationSchdForm" property = "dateOfAdv"/>
	</TD>
	<td>
		<b>Repayable Months</b>
	</TD>
	<td colspan="5">
		<b>:</b> <bean:write name = "AmortizationSchdForm" property = "repayMonth"/>
	</TD>
</tr>
<tr>
	<td>
		<b>Beginning From</b>
	</td>
	<td>
		<b>:</b> <bean:write name = "AmortizationSchdForm" property = "beginFrom"/>
	</TD>
	<td>
		<b>Rate of Interest</b>
	</td>
	<td>
		<b>:</b> <bean:write name = "AmortizationSchdForm" property = "rateOfInt"/>
	</TD>
</tr>
</table>
</fieldset>
<TABLE border = 0 cellspacing = 2 cellspacing = 2 
	 width = "90%" id = "InfoSheet" bgColor = "white">
	<thead>
		<TR>
			<TH nowrap><BR>
				<!--EMI No.-->
				EMI No.
			</TH>
			<TH nowrap><BR>
				<!--Installment Date-->
				Inst. Date
			</TH>

			<TH nowrap><BR>
				<!--EMI Amount-->
				EMI Amount
			</TH>

			<TH nowrap><BR>
				<!--Interest-->
				Interest
			</TH>

			<TH nowrap><BR>
				<!--Principal Amount-->
				Principal
			</TH>

			<TH nowrap><BR>
				<!--Outstanding Principal-->
				Outstanding Principal
			</TH>
			<TH nowrap><BR>
				<!--Outstanding Interest-->
				Outstanding Interest
			</TH>
		</TR>
	</thead>
	<tbody>
		<logic:empty name = "AmortizationSchdForm" scope = "request" property = "collection">
		<TR>
			<TD colspan = 7>
			</TD>
		</TR>
	</logic:empty>
	<logic:notEmpty name = "AmortizationSchdForm" scope = "request" property = "collection">
		<logic:iterate id = "data" name = "AmortizationSchdForm" 
			scope = "request" property = "collection">
			<TR>
				<TD align = center>
					<bean:write name = "data" property = "emiNo"/>
				</TD>
				<TD align = center>
					<bean:write name = "data" property = "instDate"/>
				</TD>
				<TD align = right>
					<bean:write name = "data" property = "emiAmount"/>
				</TD>
				<TD align = right>
					<bean:write name = "data" property = "interestAmt"/>
				</TD>
				<TD align = right>
					<bean:write name = "data" property = "principalAmt"/>
				</TD>
				<TD align = right>
					<bean:write name = "data" property = "outstandingPrc"/>
				</TD>
				<TD align = right>
					<bean:write name = "data" property = "outstandingInt"/>
				</TD>
			</TR>
		</logic:iterate>
	</logic:notEmpty>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="3" align="right">
				<b>Total</b>
			</td>
			<td align="right">
				<b><bean:write name = "AmortizationSchdForm" property = "interestTot"/></b>
			</td>
			<td align="right">
				<b><bean:write name = "AmortizationSchdForm" property = "principalTot"/></b>
			</td>
			<td colspan="2">
			</td>
		</tr>
	</tfoot>
</table>
<hr>
<div id="prn" style="display:block">
	<table width="100%">
		<tr align="center">
			<td  colspan="3">
				<!--OK-->
				<html:button property="print" onclick="printing()" styleId="EMI" styleClass="Button"> 
					<bean:message bundle= "<%=lang%>" key= "130"/>
				</html:button>
			
			 <input type="button" onClick="back_amor()" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
			 </td>
		</tr>
		<tr></tr>
		<tr>
			<td><b>In the last installment a few amount may remains due to rounding off EMI</b></td>
		</tr>
		<tr>
			<td><b>It will not take care of Subsidy and slab wise interest Rate</b></td>
		</tr>
	</table>
</div>

</html:form>
<script>
function showMessage(code){
	switch(code){
		case 2475:
			alert("<bean:message bundle = '<%=errorLang%>' key = '2475'/>");
			break;
		case 53:
			alert("<bean:message bundle = '<%=errorLang%>' key = '53'/>");
			break;
	}
}
</script>
</body>


