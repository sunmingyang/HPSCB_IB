<%@ include file="/common/Include.jsp"%>
<%@ page import="easycbs.hotkey.actionform.EMICalculateForm"%>

<script language="javascript" src="/hotkey/HotKey.js"></script>
<script language="javascript" src="/hotkey/EMICalculator.js"></script>
<script>


function fillData() {
	//alert("load body");
	if(document.getElementById("instPayPeriod").value=="X")
	{
		//alert("1");
		document.getElementById("divSI").style.display="block";
		document.getElementById("divGen").style.display="none";
		if(document.getElementById("divAmtThree").value!="0")
		{
			document.getElementById("divThird1").style.display="block";
			document.getElementById("divThird2").style.display="block";
			document.getElementById("divThird3").style.display="block";
		}
		else
		{
			document.getElementById("divThird1").style.display="none";
			document.getElementById("divThird2").style.display="none";
			document.getElementById("divThird3").style.display="none";
		}
	}
	else
	{
		document.getElementById("divSI").style.display="none";
		document.getElementById("divGen").style.display="block";
		document.getElementById("divThird1").style.display="none";
		document.getElementById("divThird2").style.display="none";
		document.getElementById("divThird3").style.display="none";
	}
	try {
		if(!isNull("EMICalForm","installment"))
		{
			//alert("Install Empty");
			if(document.getElementById("roi").value=="F"){
				forROI();
			//	alert("1111");
			}
		}
		else
		{
			//alert("Install Not Empty");
			document.getElementById("totLoan").focus();
		}
	} catch (Error){
		document.getElementById("totLoan").focus();
	}
	//alert("exit");
}


</script>
 <tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Calculator"/>
<tiles:put name="page_header" type="String" >
EMI Calculator
</tiles:put>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="content" type="String">
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
			<td class="tbl_heading">EMI Calculators</td></tr><tr><td>&nbsp;</td>
		</tr>
		<tr>
			<td> 
<html>
<head>
</head>
<BODY onLoad="fillData()" align="center">

<html:form action="/hotkey/EMICalc" onsubmit = "return emiCalc()"> 
<center><font size="3"><u>EMI Calculator</u></font></center>

<table border="0" align="center">
<TR>
	<!-- Total Loan Amount-->
	<TD >
		<bean:message bundle="<%=lang%>" key="975"/>
	</TD>
	<td>
		<html:text property="totLoan" styleId="totLoan" maxlength="24" size="20" onblur="totLoanAmtOld()" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)"/>
	</td>
	<!-- Total Installment-->
	<TD >
		<bean:message bundle="<%=lang%>" key="1313"/>
	</TD>
	<td>
		<html:text property="totInst" styleId="totInst" size="10" maxlength="3" style="TEXT-ALIGN:right" onkeypress="isValidAmount(event,this)"/>
	</td>
</TR>
<tr>
	<!--Noraml Rate-->
	<td nowrap>
		<bean:message bundle="<%=lang%>" key="687"/>
	</td>
	<!--Fixed / Variable-->
	<td colspan = "3" >
<!-- 			<fieldset style="width:230px; padding:5px; height: 10px;" >
				<bean:message bundle="<%=lang%>" key= "5242"/>
				<html:radio property = "roi" value = "F" styleId = "roiF" onclick="fixed()"/>
				<bean:message bundle="<%=lang%>" key= "637"/>
				<html:radio property = "roi" value = "V" styleId = "roiV" onclick="variable()"/>
			</fieldSet>
 -->	
	<html:select property="roi" onblur="fixvar()">
		<html:option value="F">
			<bean:message bundle="<%=lang%>" key= "5242"/>
		</html:option>
		<html:option value="V">
			<bean:message bundle="<%=lang%>" key= "637"/>
		</html:option>
	</html:select>
	</td>
</tr>
<tr>
<!--Advance Installment-->
	<td>
		<bean:message bundle="<%=lang%>" key="5435"/>
	</td>
	<td>
		<html:text property="advInst" styleId="advInst" size="20" maxlength="24" style="TEXT-ALIGN:right" onblur="advInstallment()" onkeypress="isValidAmount(event,this)" />
	</td>
	
</tr>
<tr>
	<td>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</td>
	<!--Rate Slabs-->
	<td colspan="3" rowspan="5">
		<fieldset style="width:270px; padding:5px; height: 10px;">
			<legend align="right">
				<b><bean:message bundle="<%=lang%>" key= "688"/></b>
			</legend>
			<table>
				<tr>
				<td nowrap><bean:message bundle="<%=lang%>" key= "689"/></td>
				<td><html:text property="firstSlab" styleId="firstSlab" size="15" onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></td>
				<td><html:text property="firstRate" styleId="firstRate" size="6" onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></td>
				</tr>
				<tr>
				<td nowrap><bean:message bundle="<%=lang%>" key= "690"/></TD>
				<td><html:text property="secondSlab" styleId="secondSlab" size="15" onblur="slabTwo()" onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></TD>
				<td><html:text property="secondRate" styleId="secondRate" size="6" onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></td>
				</tr>
				<tr>
				<td nowrap><bean:message bundle="<%=lang%>" key= "691"/></TD>
				<td><html:text property="thirdSlab" styleId="thirdSlab" size="15" onblur="slabThree()" onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></TD>
				<td><html:text property="thirdRate" styleId="thirdRate" size="6" onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></td>
				</tr>
				<tr>
				<td nowrap><bean:message bundle="<%=lang%>" key= "692"/></TD>
				<td><html:text property="fourthSlab" styleId="fourthSlab" size="15" onblur="slabFour()" onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></TD>
				<td><html:text property="fourthRate" styleId="fourthRate" size="6" onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></td>
				</tr>
				<tr>
				<td nowrap><bean:message bundle="<%=lang%>" key= "693"/></TD>
				<td><html:text property="fifthSlab" styleId="fifthSlab" size="15" onblur="slabFive()" onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></TD>
				<td><html:text property="fifthRate" styleId="fifthRate" size="6"  onkeypress="isValidAmount(event,this)" style="TEXT-ALIGN:right"/></td>
				</tr>
				</table>
		</fieldSet>
	</td>
	
</tr>
</table>



<table align="center">
<tr>
	<!--Interest Period-->
	<td nowrap><bean:message bundle="<%=lang%>" key= "2321"/></td>
	<td colspan="3"><html:select property="instPayPeriod" styleId="instPayPeriod" style="width:240" onblur="instPayPrd()">
					<html:option value ="M" ><bean:message bundle="<%= lang %>" key="3980"/></html:option>
					<html:option value ="Q" ><bean:message bundle="<%= lang %>" key="6072"/></html:option>
					<html:option value ="H" ><bean:message bundle="<%= lang %>" key="6125"/></html:option>
					<html:option value ="Y" ><bean:message bundle="<%= lang %>" key="6126"/></html:option>
					<html:option value ="X" ><bean:message bundle="<%= lang %>" key="6398"/></html:option>
				</html:select>
	</td>
</tr>
</table>




<div id="divGen" style="display:block">
<table align="center">
<tr>
	<!--Interest Posting-->
	<td nowrap><bean:message bundle="<%=lang%>" key= "461"/></td>
	<td colspan="3"><html:select property="instPosting" styleId="instPosting" style="width:120">
					<html:option value ="M" ><bean:message bundle="<%= lang %>" key="3980"/></html:option>
					<html:option value ="Q" ><bean:message bundle="<%= lang %>" key="6072"/></html:option>
					<html:option value ="S" ><bean:message bundle="<%= lang %>" key="2710"/></html:option>
			</html:select>
	</td>
</tr>
<tr>
	<!--Checkbox for Int.Calc with Interest-->
	<td nowrap>Interest to be Calculated with Interest</td>
	<td colspan="3">
		<html:checkbox property = "intWithInt" styleId = "intWithInt" value="I"/>
	</td>
</tr>
<tr>
	<!--Checkox for EMI Subsidy-->
	<td nowrap>
		<bean:message bundle="<%=lang%>" key= "3552"/>
	</td>
	<td colspan="3">
		<html:checkbox property = "emiWithSub" styleId = "emiWithSub" value="S" onblur="emiSI()"/>
	</td>
</tr>
<tr>
	<!--Installment-->
	<td nowrap>
		<bean:message bundle="<%=lang%>" key= "2720"/>
	</td>
	<td>
		<html:text property="installment" styleId="installment" size="25" readonly="true"/>
	</TD>
	<!--EMI-->
	<td ><html:button property="EMI"  styleId="EMI" styleClass="Button" onclick="EmiCal()"> 
			<bean:message bundle= "<%=lang%>" key= "2104"/> 
		</html:button>
	</td>
</tr>
</table>
</div>




<div id="divSI" style="display:none">
<table bgcolor="white" width="" align="center">
	<tr>
		<TH nowrap>
			<!--Principal Amount-->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle ="<%=lang%>" key = "39" />','/');
				document.write(sResult[0]);
			</script>
		</TH>	
		<TH nowrap>
			<!--Principal Period-->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle ="<%=lang%>" key = "448" />','/');
				document.write(sResult[0]);
			</script>
		</TH>
		<TH nowrap>
			<!--Principal No.Of.Installments-->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle ="<%=lang%>" key = "972" />','/');
				document.write(sResult[0]);
			</script>
		</TH>
	</tr>
	<tr>
		<TH nowrap>
			<!--Principal Amount-->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle ="<%=lang%>" key = "39" />','/');
				document.write(sResult[1]);
			</script>
		</TH>	
		<TH nowrap>
			<!--Principal Period-->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle ="<%=lang%>" key = "448" />','/');
				document.write(sResult[1]);
			</script>
		</TH>
		<TH nowrap>
			<!--Principal No.Of.Installments -->
			<script>
				var sResult = new Array(2);
				sResult = splitString('<bean:message bundle ="<%=lang%>" key = "972" />','/');
				document.write(sResult[1]);
			</script>
		</TH>
	</tr>
	<tr><td colspan="3"></td></tr>
	<tr align="center">
		<td >
			<html:text property="divPrcAmt"  size="10" readonly="true"  style="TEXT-ALIGN:center"/>
		</td>
		<td>
			<html:text property="divPrcPeriod" size="10" value="Monthly" readonly="true" tabindex="-1"/>
		</td>
		<td>
			<html:text property="divPrcNoOfInst" size="20" onblur="prcNoOfInstall()"/>
		</td>
		<td>
			<input type="text" name="principal" id="principal" value="For Principal" size="20" tabindex="-1" readonly="true"/>
			<!--<label><b>For Principal</b></label>-->
		</td>
	</tr>
	<tr align="center">
		<td>
			<html:text property="divInstAmt"  size="10" readonly="true"  style="TEXT-ALIGN:center"/>
		</td>
		<td>
			<html:text property="divInstPeriod" size="10" value="Monthly" readonly="true" tabindex="-1"/>
		</td>
		<td>
			<html:text property="divInstNoOfInst" size="20" onblur="intNoOfInstall()"/>
		</td>
		<td>
			<input type="text" name="interest" id="interest" value="For Interest" size="20" tabindex="-1" readonly="true"/>
			<!--<label><b>For Interest</b></label>-->
		</td>
	</tr>
	<tr align="center">
			<td>
			<div id="divThird1" style="display:none">
				<html:text property="divAmtThree" size="10" readonly="true"  
						style="TEXT-ALIGN:center"/>
			</div>
			</td>
			<td>
			<div id="divThird2" style="display:none">
				<html:text property="divPeriodThree" size="10" value="Monthly" readonly="true" tabindex="-1"/>
			</div>
			</td>
			<td>
				<div id="divThird3" style="display:none">
					<html:text property="divNoOfInstThree" size="20" />
				</div>
			</td>
			<td>
				<label><b></b></label>
			</td>

	</tr>
</table>
</div>



<table align="center">
	<tr>
		<td colspan="4" align="center"><hr>
		
		</td>	
	</td>
	<tr>
		<td>
			<label style="BACKGROUND-COLOR:#EBDADC"><font color="black">Either Feed Disc. ROI or Select Int. Posting Qrtly. to Comply with RBI Guidelines</font>
			</label>
		</td>
	</tr>
	<tr><td colspan="4"></td></tr>
	<tr><td colspan="4"></td></tr>
</table>


<table align="center">
	<tr style = "CURSOR:HAND">
		<td colspan="2">
			<label style="BACKGROUND-COLOR:#EBDADC"><font color="black"></font></label>
			<input type="button" name="amort" value='<bean:message bundle="<%=lang%>" key= "5576"/>' onclick="amortSchd()" class="button">
	</td>
	<td>
	&nbsp;&nbsp;&nbsp;&nbsp;
	</td>
	<td colspan="2">
		<label style="BACKGROUND-COLOR:#EBDADC"><font color="black"></font></label>
		<input type="button" name="graduated" value='<bean:message bundle="<%=lang%>" key= "5577"/>' onclick="graduatedEMI()" class="button">

	</td>
			 <td align=right><input type="button" onClick="back_req()" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
		</td>
</tr>
</table>


</html:form>

</body>
</html>
</table>
</table>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert >
<script>
function showMessage(code){
	switch(code){
		case 227:
			alert("This amount should be more than previous amount");
			break;
		case 53:
			alert("Entries incomplete");
			break;
	}
}
</script>
