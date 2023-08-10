<%@ include file = "/common/Include.jsp"%>

<script type="text/javascript" src="/BancMate/account/acopen/script/acOpenCommon.js"></script>
<script type="text/javascript" src="/BancMate/account/acopen/script/rdDetail.js"></script>
<script>
		var gCalDate=changeDate('<%=bancDate%>');  
		var brncode='<%=branchCode%>';
		
	function fillData()
	{
		//fillCheckUncheckDetail();
		
	}
</script>

<html>
<tiles:insert page="/account/acopen/AcOpenLayout.jsp" flush="true">
<tiles:put name="title" value="General Detail"/>
<tiles:put name="header" value="/account/acopen/acOpenCommon.jsp"/>  
<tiles:put name="titleName">
		<bean:message bundle='<%=lang%>' key='2059'/>
</tiles:put>
<tiles:put name="content" type="String">    

<body onload="fillData(),setFocus()" onkeypress = "escapeKey(event)" >
	<html:form action="/account/acopen/acOpenRdDetail">
	 

		<table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr><td  colspan="3">&nbsp;</td></tr>
		 
			<tr> 
				<td>
					<logic:messagesPresent property="dagnName" ><font class = ErrorColor></logic:messagesPresent>
						<bean:message bundle="<%=lang%>" key="2057"/>
					<logic:messagesPresent property="dagnName" ></font></logic:messagesPresent>
				</td>
				<td nowrap colspan="2">
					<html:text property="rdagnName" styleId ="rdagnName"  size="10" /> 
					<input type="button" class="button" name="btnRdAgnName" Id="btnRdAgnName" 
					onclick="openHelpPanel('rdagnName','rdagnNameKid','rdagnNameLabel','RdAgentMaster')" 
					style="background-image: url('/BancMate/images/TRFFC01.jpg');width:20px;"/> 
					<html:text property="rdagnNameLabel" styleId="rdagnNameLabel" styleClass="labelText" size="30" readonly="true" tabindex="-1"/> 
					<html:hidden property="rdagnNameKid" styleId="rdagnNameKid"/>
				</td>
			</tr>

			<tr> 
				<td>
					<logic:messagesPresent property="dSchName" ><font class = ErrorColor></logic:messagesPresent>
						<bean:message bundle="<%=lang%>" key="2411"/>
					<logic:messagesPresent property="dSchName" ></font></logic:messagesPresent>
				</td>
				<td nowrap colspan="2">
					<html:text property="rdSchName" styleId ="rdSchName"  size="10" /> 
					<input type="button" class="button" name="btnRdAchName" Id="btnRdSchName" 
					onclick="openHelpPanel('rdSchName','rdSchNameKid','rdSchNameLabel','RdSchemeType')" 
					style="background-image: url('/BancMate/images/TRFFC01.jpg');width:20px;"/> 
					<html:text property="rdSchNameLabel" styleId="rdSchNameLabel" styleClass="labelText" size="30" readonly="true" tabindex="-1"/> 
					<html:hidden property="rdSchNameKid" styleId="rdSchNameKid"/>
				</td>
			</tr>

			<tr> 
				<td ><bean:message bundle='<%=lang%>' key='448'/> </td>
				<td > <html:text property="rdperiodYY" styleId="rdperiodYY" size="6" onchange="getRdDetail('rdAmount')"/> 
					  <bean:message bundle='<%=lang%>' key='449'/>&nbsp;&nbsp 
				</td>
				<td> <html:text property="rdperiodMM" styleId="rdperiodMM" size="6" onchange="getRdDetail('rdAmount')" />	
					 <bean:message bundle='<%=lang%>' key='1809'/>&nbsp;&nbsp
				</td>
				<td> <html:text property="rdperiodDD" styleId="rdperiodDD" size="6" readonly="true" tabindex="-1" styleClass="textDisable" />	
					 <bean:message bundle='<%=lang%>' key='450' />&nbsp;&nbsp
				</td>
			</tr>
			<tr><td  colspan="3">&nbsp;</td></tr>
			  
			</table>		
	
			  
			 <center>
			<fieldset style="width:600px;padding:0px; height:0px;">
			<legend></legend>
			 
			<table >
			
			
			<tr> 
				<td > <bean:message bundle='<%=lang%>' key='39'/> </td>
				<td> <html:text property="rdAmount" styleId="rdAmount" size="20" onblur="getRdDetail('rdAmount')"/> </td>
				<td> <div id="matAmtLbl" style="display:block"> <bean:message bundle='<%=lang%>' key='807'/> </div></td>
				<td> <div id="matAmtTxt" style="display:block"> <html:text property="rdmaturityAmount" styleId="rdMaturityAmount" size="20" readonly="true" tabindex="-1" styleClass="textDisable"/> </div></td>
		   </tr>

			<tr> 
			  <td> <bean:message bundle='<%=lang%>' key='2337'/> </td>
			  <td > <html:text property="rdintRate" onchange="getRdDetail('rdAmount')" styleId="rdintRate" size="20"  tabindex="-1" /></td>
			  <td > <bean:message bundle='<%=lang%>' key='454'/> </td>
			  <td > <html:text property="rdMatDate" styleId="RDMatDate" size="20" readonly="true" tabindex="-1" styleClass="textDisable" /> </td>
			</tr>
			
			</table>
			</fieldset>
			<center>
			
			<table width="99%"  align="center">
			<tr><td  colspan="3">&nbsp;</td></tr>

				  <tr> 
					<td colspan="3"> <hr class="HeaderLabelAcOpen" size="2"> </td>
				  </tr>

				  <tr> 
					<td colspan="3" align="center">
					<INPUT TYPE="button" class="button" value="<bean:message bundle='<%=lang%>' key='86'/>" onclick="submitRdDetail('ok')" name="ok" id="ok"/>
					<INPUT TYPE="button" class="button" value="<bean:message bundle='<%=lang%>' key='87'/>" onclick="submitRdDetail('cancel')" name="cancel" onblur="javascript:try{ document.getElementById('rdagnName').focus()}catch (Error){}"/>        	          
					</td>
				  </tr>

			</table>

<DIV id = "DivSubmit" class = "WarningTab" 
	style = "display:none;FONT-SIZE: 8pt;HEIGHT:20px" >
<MARQUEE>
	<!--Plz wait While ...-->
	<B><bean:message bundle="<%=lang%>" key= "1179"/></B>
</MARQUEE>
</DIV>

<DIV id = "DivHotKey" style = "display:block;">
<script>
	var ind = 0;
	<html:messages id = "Errors" property = "dSchName" bundle='<%=errorLang%>'>
		errorArrayValue[ind] = "rdSchName";
		errorArrayText[ind] = '<bean:write name = "Errors" />';
		ind = ind + 1;
	</html:messages>

	<html:messages id = "Errors" property = "dagnName" bundle='<%=errorLang%>'>
		errorArrayValue[ind] = "rdagnName";
		errorArrayText[ind] = '<bean:write name = "Errors" />';
		ind = ind + 1;
	</html:messages>

	<html:messages id = "Errors" property = "oControl" bundle='<%=errorLang%>'>
		errorArrayValue[ind] = "noControl";
		errorArrayText[ind] = '<bean:write name = "Errors" />';
		ind = ind + 1;
	</html:messages>
	
	showErrorTab();
</script>
</DIV>
	<html:hidden property="focus" styleId="focus"/>
	<html:hidden property="mode" styleId="mode"/>
	<html:hidden property="totalPeriodhdd" styleId="totalPeriodhdd" /> 
	<html:hidden property="sappPeriod" styleId="sappPeriod"/>
	<html:hidden property="sdepamt" styleId="sdepamt"/>
	<html:hidden property="sdepprd" styleId="sdepprd"/>
	<html:hidden property="sintpay" styleId="sintpay"/>
	<html:hidden property="sdecMultiAmout" styleId="sdecMultiAmout"/>
	<html:hidden property="sdecminamount" styleId="sdecminamount"/>
	<html:hidden property="sdecmaxamount" styleId="sdecmaxamount"/>		
	<html:hidden property="sdecmultiperiod" styleId="sdecmultiperiod"/>
	<html:hidden property="smultperiodType" styleId="smultperiodType"/>
	<html:hidden property="drdPRoi" styleId="drdPRoi"/>


	<logic:notEmpty name = "acOpenRdDetailForm" scope = "request" property = "disableControl">
	<logic:iterate id = "disableControl" name = "acOpenRdDetailForm" 
			scope = "request" property = "disableControl" type = "String">
	<script>
		document.getElementById('<bean:write name = "disableControl"/>').disabled=true;
	</script>
	</logic:iterate>
</logic:notEmpty>
	</html:form>
	<br><br><br><br><br><br>
</body> 
</html>
 </tiles:put>
</tiles:insert>