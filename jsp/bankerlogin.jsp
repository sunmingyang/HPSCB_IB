<%@ include file="/common/Include.jsp" %>
<%
 int errorcount=0;
%>
<tiles:insert page="/common/newBankerSiteLayout.jsp" flush="true">
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="menu" value="/common/login_leftHyperlink.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="page_header" type="String" >							
<bean:message bundle="hindi" key="7007" />
</tiles:put> 
<tiles:put name="content" type="String">

<script language="JavaScript" src="/jsp/scripts/Banker.js"></script>
<body onload="fill()" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" bgcolor="#FFFFFF" link="#00AADD" vlink="#FF9933" background="" >
<html:form action="/jsp/TransactionAction" styleId="banker" >
<table width="100%" cellpadding="0" cellspacing="0" >
<br><br><tr></tr>

	<tr> 
		<td valign="middle" align=left>
															
			<table  cellpadding="0" cellspacing="0" BORDER=0  bordercolor="#E0E0E0" align=center> 
				<tr>
				<td >
						<table  cellpadding="0" cellspacing="0" BORDER=1 width="400"  bordercolor="#E0E0E0" height=100%  >
							<tr> 
								<td > 
									<table cellpadding="0"cellspacing="7"  bgcolor="rgb(235,235,235)"  border=0  height=100% width=100% >
										<tr> 
											<td colspan="3" align="center"  class="tableHeader">
											
											 HPSCB  Banker Login 
											</td>
										</tr>
										<tr> 
											<td  class="tableRowText" width="85"> <bean:message bundle="<%=lang%>" key= "603"/> : 
											</td>
											<td width="100">
											   <html:text property="userId" styleId="userId" onkeypress="isValidNumAlpha()" style="Text-Transform:uppercase;" tabindex="1" />
									        </td>
											
										</tr>
										<tr> 
											<td class="tableRowText"> <bean:message bundle="<%=lang%>" key= "100"/> : 
											</td>
											<td><html:password   property="password" styleId="password " size="20"  tabindex="2" maxlength="15" />
											</td>
										</tr>									
										<tr> 
									<td></td>
											<td colspan=3 > 
											    <input type="Button" value="Login"  onclick="authenticationvalid()" tabindex="3">
											</td>
										</tr>
									
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td width="10">&nbsp;</td>
					<td>
										
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table>
		<tr>
			<td align="left" valign="bottom"><div id="errorhead" style="display:block;" align="left"><label align= "left"><u><font color='<%=errorColor%>'><bean:message bundle="<%=lang%>" key="286"/></u></font></label> </div></td>
		</tr>
		<tr>
				<td><div id="diverrmessage" style="display:block">
				<select name="errormessage"id="errormessage" size="2" style="background-color:ActiveBorder;COLOR:'<%=errorColor%>';FONT-SIZE:11px; WIDTH:700px;" >
		<logic:messagesPresent property="errors" ><option value="errors"><%=++errorcount%>.&nbsp;
		<html:errors property="errors"/></option> </logic:messagesPresent>

	 </select></div></td></tr>
</table>
<br><br><br>
</html:form>

</body>

</tiles:put>
</tiles:insert>
