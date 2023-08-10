<%@ include file="/common/Include.jsp" %>
 <script language="JavaScript" src="/jsp/scripts/chng_pass.js"></script>

<%
	String userName =null;
	if(session.getAttribute("user")!=null)
		userName = (String)session.getAttribute("user");
	String custRole=(String)session.getAttribute("custRole");
%>

<script>

function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=usechange","child", bar);
}
function checkusr()
{
	if(document.getElementById("newusrid").value=="")
	{
		alert("Please Fill New Userid");
		document.getElementById("newusrid").focus();
		return false;
	}
	document.forms[0].action="/jsp/login.do?action=userIdChange";
	document.getElementById("buttonflag").value="avl";
	document.forms[0].submit();

}
function submitpage()
{ // addition by abhishek begins
	if(document.getElementById("newusrid").value=="")
	{
		alert("Please Fill New Userid");
		document.getElementById("newusrid").focus();
		return false;
	}
	// addition by abhishek ends

	document.forms[0].action="/jsp/login.do?action=userIdChange";
	document.getElementById("buttonflag").value="ok";
	document.forms[0].submit();
}
function goback()
{
document.forms[0].action="<%=request.getContextPath()%>/navigate.do?action=executeOpen&src=useridchange&dest=back";
	document.forms[0].submit();

}

</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Userid Change"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=set"/>
<tiles:put name="page_header" type="String">
		<font color="#99FF00"><b><%if(userName!=null) out.print(userName);%>!</b></font> &nbsp;&nbsp;&nbsp;UserId Change 
</tiles:put>
<tiles:put name="menu" value="/common/user_left.jsp?src=set"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<html:form action= "/jsp/login">
<div style="text-align:left;vertical-align:center;height:250;border:Solid 0 black">
<br><br>
<% if(custRole.equals("C") || custRole.equals("A")) { %>

<div id="diverrmessage" class="normalHeadText">
			<font color="green">
				<logic:messagesPresent property="availableusrid">
					User Id Available
				</logic:messagesPresent>
				<logic:messagesPresent property="useridchanged">
					<script>
					alert("User Id Changed Successfully \n Kindly Login Again.");
					document.forms[0].action="/jsp/login.do?action=ibUsrLogout";
					document.forms[0].submit();
					</script>
				</logic:messagesPresent>
				</font>
				<font color="red">
				<logic:messagesPresent property="notavailable">
					User Id not Available Choose Different
				</logic:messagesPresent>
				<logic:messagesPresent property="invalidusr">
					Invalid User
				</logic:messagesPresent>
				<logic:messagesPresent property="error">
					Fatal Error
				</logic:messagesPresent>
				</font>
				
			</div>
<table width="575" cellpadding="0" cellspacing="0"  class="miniStmtBackBorder">
	<tr class="userIdhangeBack">
<!-- 		<td class="useridchangeimage" >&nbsp;</td> -->
		<td style="padding-left:85px"  > 
		
		<table align="right" border=0 bordercolor="#E0E0E0" cellspacing=7 cellpadding=0>
		<tr >
			
			<td class="normalHeadText" align="right" >
				User Id :
			</td>
			<td align="left" >
				<html:text property="oldusrid" onkeypress="isValidNumAlpha()" maxlength="20" />
			</td>
		</tr>
		
		<tr>
			<td class="normalHeadText" align="right" >
			Password :
			</td>
			<td align="left">
				<html:password property="password"/>
			</td>
		</tr>
		<tr>
			<td class="normalHeadText" align="right" >
			New User Id :
			</td>
			<td align="left">
				<html:text property="newusrid" onkeypress="isValidNumAlpha()" maxlength="20" />
				<input type="button" value="Check Availability" name="chkusrid" onclick="checkusr()" />
				<html:hidden property="buttonflag"/>
			</td>
		</tr>
		<tr>

			<td></td>
						<td align="left" >
				<!-- <input type="button" name="back" value="Back To Menu" onclick="goback()" class="button"> -->
				<input type="Button" name="ok" style="width:100px;" value="    OK   " onclick="submitpage()" >
<!-- 				<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " type="button" tabindex="5" style="width:100px" onclick="helpopen()"/> -->
			</td>
		</tr>
		
	</table>	
			
			<div id="diverrmessage" class="normalHeadText">
			<font color="green">
				<logic:messagesPresent property="availableusrid">
					User Id Available
				</logic:messagesPresent>
				<logic:messagesPresent property="useridchanged">
					User Id Changed Successfully
				</logic:messagesPresent>
				</font>
				<font color="red">
				<logic:messagesPresent property="notavailable">
					User Id not Available Choose Different
				</logic:messagesPresent>
				<logic:messagesPresent property="invalidusr">
					Invalid User
				</logic:messagesPresent>
				<logic:messagesPresent property="error">
					Fatal Error
				</logic:messagesPresent>
				</font>

			</div>
			

	
	</td>
	</tr>
</table>
</div>
<%} %>
</html:form>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
</tiles:insert>