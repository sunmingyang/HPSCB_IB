<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%
 int errorcount=0; 
%>
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
<tiles:insert page="/common/newBankerSiteLayout.jsp" flush="true">
<tiles:put name="title" value="Banker Transaction"/>
<tiles:put name="header" value="/common/header.jsp"/>

<tiles:put name="footer_jsp" value="/common/footer.jsp"/>

<tiles:put name="footerEnd_jsp" />

<tiles:put name="page_header" type="String"  >
<table align="center">
<tr>
<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
 
<td>
<font color="#99FF00" size='5' >
	<b>
	Banker Transaction Screen
	</b>
	</font>
	</td></tr></table>
</tiles:put>
<tiles:put name="content" type="String">
<script language="JavaScript" src="/jsp/scripts/Banker.js"></script>			
<body onload="filltransaction();">

<html:form action="/jsp/TransactionAction" styleId="transaction" >
<br>
<br> 
<br>
<table align="center" border="0"width=90% height="200" class="miniStmtBackBorder">
	<tr>
	<td class="userRequesttatusBack" width="100">&nbsp;</td>
		<td>
			<table align="center"  border="0" align="right" width="100%">
				<tr>
					  <td class="normalText">Transaction Type </td>
					  <td>&nbsp;</td>
					  <td align="left">:&nbsp;
					    <html:select property="tranType" styleId="tranType" style="width:140px;" tabindex="1" onchange="showHide(this.value)">
						   <html:option  value='D'>Deposit</html:option>
						   <html:option  value='W'> Withdrawal</html:option>
						</html:select>
					  </td>
				</tr>
				<tr>
					  <td class="normalText">A/C No</td>
					  <td>&nbsp;</td>
					  <td>:&nbsp;
				<html:text property="acno" styleId="acno" size="20" maxlength="16" tabindex="2"  onchange="getAcDetail()" onkeypress="isValidNumber()"  /> &nbsp;&nbsp;&nbsp;
					  </td>
			   </tr>
	           <tr>
			          <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;&nbsp;
		              <html:text property="acholder" styleId="acholder" readonly="true" tabindex="-1"   size="46" styleClass="LabelText" /></td>
    				  <html:hidden property="accKid" styleId="accKid" />
			  </tr>
		      <tr  >
			          <td id="td_balance1" class="normalText" >Acc. Bal.</td>
					  <td id="td_balance2">&nbsp;</td>
					  <td id="td_balance3" > :&nbsp;&nbsp;<html:text property="acc_bal" styleId="acc_bal" readonly="true" tabindex="-1"   size="20" styleClass="LabelText"  style="text-align:left;" />	
					  </td>
		    
			 </tr>
    			<tr>
					  <td class="normalText">Amount</td>
					  <td>&nbsp;</td>
					  <td>:&nbsp;
			              <html:text property="amount" styleId="amount" maxlength="15" onkeypress="isValidNumberNew()" tabindex="3" style="text-align:right;"/>
		     		 </td>
				</tr>
				
				<tr>
					<td class="normalText">Narration<td>&nbsp;
					<td>:&nbsp;
				          <html:text property="eNarration" styleId="eNarration"  tabindex="4" size="40"  /></td>
					</td>
				</tr>
		 </table>
	</td>
  </tr>
</table>

<table>  
			<tr>
						<td colspan="3" align="center">
								<input type="button" value="Submit" onclick="submitTransaction()" tabindex="4">
						</td>
						<td colspan="5">
								<input type="button" value="Logout"  tabindex="5" onclick="closeWindow('Are you Sure you want to logout')">
						</td>
			</tr>
</table>
<br>

	<table>
				<tr>
					<td align="left" valign="bottom">
					<div id="errorhead" style="display:block;" align="left"><label align= "left"><u><font color='<%=errorColor%>'><bean:message bundle="<%=lang%>" key="286"/></u></font></label> </div>
					</td>
				</tr>
			<tr>
				<td>
				<div id="diverrmessage" style="display:block">
					<select name="errormessage"id="errormessage" size="2" style="background-color:ActiveBorder;COLOR:'<%=errorColor%>';FONT-SIZE:11px; WIDTH:700px;" >
					<logic:messagesPresent property="errors" ><option value="errors"><%=++errorcount%>.&nbsp;
					<html:errors property="errors"/></option> </logic:messagesPresent>

					</select>
			   </div>
			   </td>
		   </tr>
	</table>
	 </html:form>
</body>
</tiles:put>


</tiles:insert>

