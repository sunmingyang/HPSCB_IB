<%@ include file="/common/Include.jsp" %>
<%
	String AdminName=(String)session.getAttribute("AdminName");
	String userlocklist[][]=null;
	String flag=null;
	if(session.getAttribute("userlocklist")!=null){
		userlocklist=(String[][])session.getAttribute("userlocklist");
}
%>

<script>
function printlater()
{	
	document.forms[0].action="/navigate.do?action=executeOpen&src=unlock&dest=back";
	document.forms[0].submit();
}
function Print() 
{
	//disabledControlsOnAction(document.forms[0]);
	var bar = "width=400,height=400,left=1000, top=1000, scrollbars=no";
	var win = open("/jsp/PrintUSerNamePassword.jsp","child", bar);
	//window.location.href="/jsp/PrintUSerNamePassword.jsp";
}
function backpage()
{
	// document.forms[0].action="/navigate.do?action=executeOpen&src=unlock&dest=back"; 
	document.forms[0].action="/openaction.do?src=reprintpass";
	document.forms[0].submit();
}
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>

</tiles:put>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=zoRoMasterEntry"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=rejPasswdPrinting&src=userOperation"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<html:form action= "/accforib/activate">
<body >
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > User Operation >> Re Print Password </td>
	</tr>
	<tr>
		<td align="center">
	<br>
	<br>
	<div id="first">
	<table>
		<tr>
			<td class="heading">
					Click on Printer Image to Print User Id and Password :
			</td>
			<td >
					<img src="../images/printer.gif" alt="Print User id and Password" style="cursor:hand"
					onClick="Print()">
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" name="back"  value="Back" onclick="backpage()" /> 
			</td>
		</tr>
	</table>
	</div>
	<div id="diverrmessage">
				<font color="Green">
					<logic:messagesPresent property="save">
						<html:errors property="save"/>
					</logic:messagesPresent>
				</font>
				<font color="Red">
					<logic:messagesPresent property="NoRecord">
						No User is Locked
					</logic:messagesPresent>
					<logic:messagesPresent property="invaliduser">
						<html:errors property="invaliduser"/>
					</logic:messagesPresent>
				</font>
	</div>
	</td>
</tr>
</table>
</body>
</html:form>
</tiles:put>
</tiles:insert>