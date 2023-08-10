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
	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=rejectprint","child", bar);
}
function reject()
{
	if(document.getElementById("userid").value=="")
	{
		alert("Please Enter the User ID");
		document.getElementById("userid").focus();
		return false;
	}
	document.forms[0].action="/accforib/activate.do?action=rejectPasswordPrint";
	document.forms[0].submit();
}
function loadfun()
{
	
	//if(document.getElementById("flag").value=="reprint")
//	{
//		alert("11111");
	//	document.getElementById("second").style.display="block";
	//	document.getElementById("first").style.display="none";
//	}
//	else
//	{
//		alert(22222);
	//	document.getElementById("second").style.display="none";
//		document.getElementById("first").style.display="block";
		
//	}

}
function printlater()
{
	//document.forms[0].action="/navigate.do?action=executeOpen&src=unlock&dest=back";
	document.forms[0].action="/openaction.do?src=reprintpass";
	document.forms[0].submit();
}
function print()
{
	document.forms[0].action="/accforib/activate.do?action=rePasswordPrint";
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
<body onload="loadfun()" >

<html:form action= "/accforib/activate">
	<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > User Operation >> Password Print </td>
	</tr>
	<tr>
		<td align="center">

			<div id="diverrmessage">
				<logic:messagesPresent property="save">
						<font color="Green" face="verdana"><html:errors property="save"/></font>
					</logic:messagesPresent>
				
				
					<logic:messagesPresent property="invaliduser">
						<font color="Red" face="verdana"><html:errors property="invaliduser"/></font>
					</logic:messagesPresent>
			</div>
			
			<%
			if(request.getAttribute("flag")==null)
			{%>
			<table>
				<tr>
					<td class="normalText">
						Enter User Id whose password is not Printed&nbsp;&nbsp;&nbsp;
					</td>
					<td>
						:&nbsp;<html:text property="userid"/>
						<html:hidden property="flag"/>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" onclick="reject()" value=" Pasword Print" >
						<input   value="<bean:message bundle='<%=lang%>' key='33'/> " 
						type="button" tabindex="5" onclick="helpopen()">
					</td>
				</tr>
			</table>
			<%
			}
			else{%>
			
			<table>
				<tr>
					<td>
						<input type="button" onclick="print()" value="Print Now">
					</td>
					<td>
						<input type="button" onclick="printlater()" value="Print Later" >
					</td>
				</tr>
			</table>
		<%}%>
</td>
</tr>
</table>
</html:form>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>