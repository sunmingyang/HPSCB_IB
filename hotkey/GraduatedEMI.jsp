<%@ include file="/common/Include.jsp"%>

<script language="javascript" src="/hotkey/HotKey.js"></script>
<script language="javascript" src="/hotkey/EMICalculator.js"></script>
<script>
function fillData() {
	//alert("value 1:: "+document.getElementById("totLoanAmt").value);
	//alert("value 2:: "+document.getElementById("totNoInst").value);
	//alert("value 3:: "+document.getElementById("roi").value);

	if((!isNull("GradEMIForm","totLoanAmt") && document.getElementById("totLoanAmt").value!="0") &&
		(!isNull("GradEMIForm","totNoInst") && document.getElementById("totNoInst").value!="0") &&
		(!isNull("GradEMIForm","roi") && document.getElementById("roi").value!="0"))
	{
		//alert("Not Empty");
		document.getElementById("totLoanAmt").readOnly=true;
		document.getElementById("totLoanAmt").className="TextDisable";
		document.getElementById("totNoInst").readOnly=true;
		document.getElementById("totNoInst").className="TextDisable";
		document.getElementById("roi").readOnly=true;
		document.getElementById("roi").className="TextDisable";
	//	document.forms[0].EMI.focus();
	}
	else{
		//alert("Empty");
		document.getElementById("totLoanAmt").value="0"
		document.getElementById("totNoInst").value="0"
		document.getElementById("roi").value="0"
		//showMessage(53);
		document.getElementById("totLoanAmt").focus();
	}

}
</script>

<html>
<head>
</head>


<html:form action="/hotkey/GraduatedEMI.do?action=executeEMI">
<table border="1" bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
	<tr>
		<td>
		<table width=227 cellpadding="0" cellspacing="0">
		<tr>
			<td class="tbl_heading">Graguated EMI</td></tr><tr><td>&nbsp;</td>
		</tr>
		<tr>
			<td>
<table>
<TR>
	<!-- Total Loan Amount-->
	<TD nowrap>
		<bean:message bundle="<%=lang%>" key="975"/>
	</TD>
	<td colspan="3">
		<html:text property="totLoanAmt" styleId="totLoanAmt" maxlength="24" size="20" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)" />
	</td>
</tr>
<tr>
	<!-- Total Installments-->
	<TD nowrap>
		<bean:message bundle="<%=lang%>" key="1313"/>
	</TD>
	<td colspan="3">
		<html:text property="totNoInst" styleId="totNoInst" size="20" maxlength="3" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)" />
	</td>
</TR>
<tr>
	<!--Rate of Interest-->
	<td nowrap>
		<bean:message bundle="<%=lang%>" key="685"/>
	</td>
	<td colspan = "3" >
			<html:text property="roi" styleId="roi" size="20" maxlength="3" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)" onblur="roiFocus()"/>
	</td>
</tr>
<tr>
	<!--EMI Installment-->
	<td nowrap>
		<bean:message bundle="<%=lang%>" key= "2104"/>
	</td>
	<td>
		<html:text property="emiInst" styleId="emiInst" size="20" readonly="true" style="TEXT-ALIGN:right"/>
	</TD>
	<!--EMI-->
	<td ><html:button property="EMI"  styleId="EMI" styleClass="Button" onclick="gradEMI()">
		<bean:message bundle= "<%=lang%>" key= "2104"/>
		</html:button>
	</td>
</tr>
</table>
<fieldset style="width:376px;height: 10px;">
<table width=327 cellpadding="0" cellspacing="0">
	<tr>
		<td class="tbl_heading">Graduated E.M.I</td></tr><tr><td>&nbsp;</td>
	</tr>
	<tr>
		<td>
	</tr>
<table>
</fieldset>
<table>
<!--1st EMI-->
<tr>
	<td>
		1st <bean:message bundle= "<%=lang%>" key = "2104"/>
	</td>
	<td>
		<html:text property="emiInstOne" styleId="emiInstOne" size="15" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)"/>
	</TD>
	<td>
		<bean:message bundle= "<%=lang%>" key = "5759"/>
	</td>
	<td>
		<html:text property="monthsOne" styleId="monthsOne" size="10" onblur="months1()" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)"/>
	</TD>
</tr>
<!--2nd EMI-->
<tr>
	<td>
		2nd <bean:message bundle= "<%=lang%>" key = "2104"/>
	</td>
	<td>
		<html:text property="emiInstTwo" styleId="emiInstTwo" size="15" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)"/>
	</TD>
	<td>
		<bean:message bundle= "<%=lang%>" key = "5759"/>
	</td>
	<td>
		<html:text property="monthsTwo" styleId="monthsTwo" size="10" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)" onblur="months2()"/>
	</TD>
</tr>
<!--3rd EMI-->
<tr>
	<td>
		3rd <bean:message bundle= "<%=lang%>" key = "2104"/>
	</td>
	<td>
		<html:text property="emiInstThree" styleId="emiInstThree" size="15" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)"/>
	</TD>
	<td>
		<bean:message bundle= "<%=lang%>" key = "5759"/>
	</td>
	<td>
		<html:text property="monthsThree" styleId="monthsThree" size="10" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)" onblur="months3()"/>
	</TD>
</tr>
</table>
<center>
<table>
	<tr>
		<td  colspan="3" align="center">
			<!--OK-->
			<html:button property="Back"  onclick="back_grad()" styleId="EMI" styleClass="Button"> 
			<bean:message bundle= "<%=lang%>" key= "86"/>
			</html:button>
		 </td>
	</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>

</center>
</html:form>
<script>
function showMessage(code){
	switch(code){
		case 2475:
			alert("Can't Enter Wrong Value");
			break;
		case 53:
			alert("Entries incomplete");
			break;
	}
}
</script>
</body>
</html>
